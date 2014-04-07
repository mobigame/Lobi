package com.kayac.lobirankingsdksample.application;

import android.app.Application;

import com.kayac.lobi.ranking.sdk.NakamapRanking;
import com.kayac.lobi.ranking.sdk.model.Configuration;

public class SampleApplication extends Application {

	@Override
	public void onCreate() {
		super.onCreate();
		NakamapRanking.sharedInstance().setContext(this);
		Configuration.currentConfiguration().setCliendId("8550eef2e3eb415389d08689bda44ffb6a827b00");
		Configuration.currentConfiguration().setAccountBaseName("こぬこ");
	}
}
