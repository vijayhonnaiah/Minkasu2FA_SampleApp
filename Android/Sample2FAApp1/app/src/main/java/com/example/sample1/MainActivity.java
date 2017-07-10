package com.example.sample1;

import android.app.Fragment;
import android.app.FragmentManager;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.util.Log;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;

import com.minkasu.android.twofa.enums.MinkasuOperationType;
import com.minkasu.android.twofa.sdk.Minkasu2faSDK;

import java.util.List;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener

{
    public static final String MERCHANT_CUSTOMER_ID = "C_1";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        hideItems();
    }

    @Override
    protected void onResume() {
        super.onResume();
        invalidateOptionsMenu();
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    public boolean onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        hideItems();
        return true;
    }

    private void hideItems() {
        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        Menu nav_Menu = navigationView.getMenu();

        //Gets the list of Operations that is available according to the state of Minkasu 2FA SDK.
        List<MinkasuOperationType> operationTypes =  Minkasu2faSDK.getMinkasuOperationTypes(getApplicationContext());

        nav_Menu.findItem(R.id.nav_change_pin).setVisible(false);
        nav_Menu.findItem(R.id.nav_enabledisablefinger).setVisible(false);

        for (int i = 0; i < operationTypes.size(); i++) {
            if (operationTypes.get(i) == MinkasuOperationType.CHANGE_PAYPIN) {
                nav_Menu.findItem(R.id.nav_change_pin).setVisible(true);
            } else if (operationTypes.get(i) == MinkasuOperationType.DISABLE_FINGERPRINT) {
                MenuItem item = nav_Menu.findItem(R.id.nav_enabledisablefinger).setVisible(true);
                item.setTitle(MinkasuOperationType.valueOf(MinkasuOperationType.DISABLE_FINGERPRINT));
            } else if (operationTypes.get(i) == MinkasuOperationType.ENABLE_FINGERPRINT) {
                MenuItem item = nav_Menu.findItem(R.id.nav_enabledisablefinger).setVisible(true);
                item.setTitle(MinkasuOperationType.valueOf(MinkasuOperationType.ENABLE_FINGERPRINT));
            }
        }

    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();
        Fragment fragment = null;
        String fragmentTag = "";
        if (id == R.id.nav_camera) {
        } else if (id == R.id.nav_reset) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(this);
            preferences.edit().clear().commit();
            preferences.edit().putBoolean("reset",true).commit();

            DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
            drawer.closeDrawer(GravityCompat.START);
            popAllFragmentsInStack();
        } else if (id == R.id.nav_auth_pay) {
            fragment = getAuthPayFragment();
            fragmentTag = "PayFragment";

            DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
            drawer.closeDrawer(GravityCompat.START);
            FragmentManager fragmentManager = getFragmentManager();

            popAllFragmentsInStack();
            fragmentManager.beginTransaction().replace(R.id.content_main, fragment,fragmentTag).commit();
        }


        if (id == R.id.nav_change_pin) {
            performMKSDKAction(MinkasuOperationType.CHANGE_PAYPIN);
            DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
            drawer.closeDrawer(GravityCompat.START);
            popAllFragmentsInStack();
        }else if (id == R.id.nav_enabledisablefinger) {
            performMKSDKAction(MinkasuOperationType.ENABLE_FINGERPRINT);
            DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
            drawer.closeDrawer(GravityCompat.START);
            popAllFragmentsInStack();
        }
        return true;
    }

    public void popAllFragmentsInStack() {

        FragmentManager fragmentManager = getFragmentManager();
        int stack_size_1 = fragmentManager.getBackStackEntryCount();
        for (int i = 0; i < stack_size_1; i++) {
            fragmentManager.popBackStackImmediate();
        }

        int stack_size_2 = fragmentManager.getBackStackEntryCount();

        Log.i("MinkasuSDKActivity", "PopAllFramgents: stack size changed from " + stack_size_1
                + " to  " + stack_size_2);

    }

    public Fragment getAuthPayFragment() {
        Bundle args = null;
        AuthPayFragment fragment =null;
        if (fragment == null) {
            fragment = new AuthPayFragment();
            args = new Bundle();
            fragment.setArguments(args);
        }
        return fragment;
    }

    public void performMKSDKAction (MinkasuOperationType operationType){
        Minkasu2faSDK minkasu2faSDKInstance = null;
        try {
            //Creating Minkasu 2FA SDK object to perform the selected menu action.
            minkasu2faSDKInstance = Minkasu2faSDK.create(MainActivity.this, operationType,MERCHANT_CUSTOMER_ID);
            minkasu2faSDKInstance.start();
        }
        catch(Exception e){
            Log.i("Exception",e.toString());
        }
    }
}
