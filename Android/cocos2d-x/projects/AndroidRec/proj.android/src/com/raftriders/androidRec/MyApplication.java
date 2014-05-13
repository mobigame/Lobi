package com.raftriders.androidRec;

import com.kayac.lobi.ranking.sdk.NakamapRanking;
import com.kayac.lobi.ranking.sdk.model.Configuration;
import android.app.Application;

public class MyApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        // SDK の初期化
        // RankingSDKとRecSDKは統合されたため、
        // RankingSDKの初期化を行うことで、RecSDKの初期化も行われます。
        NakamapRanking.sharedInstance().setContext(this);
        Configuration.currentConfiguration().setCliendId("f92bd261db0bf4a1cf277fcee37d26d07d1e06ec");
    }
}

