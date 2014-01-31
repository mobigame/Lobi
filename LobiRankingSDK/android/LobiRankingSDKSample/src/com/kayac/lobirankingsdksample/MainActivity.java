package com.kayac.lobirankingsdksample;

import org.json.JSONObject;

import com.kayac.lobi.ranking.sdk.NakamapRanking;
import com.kayac.lobi.ranking.sdk.activity.RankingActivity;
import com.kayac.lobi.ranking.sdk.net.API;
import com.kayac.lobi.ranking.sdk.model.Ranking.CursorOrigin;
import com.kayac.lobi.ranking.sdk.model.Ranking.Range;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	}
	
    public void onClickSignupButton(View view){
    	final EditText editText = new EditText(this);
    	AlertDialog.Builder builder = new AlertDialog.Builder(this);
    	builder.setTitle("名前を入れてください");
        builder.setView(editText);
        builder.setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface arg0, int arg1) {
				arg0.dismiss();
			}
		});
        builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
			@Override
			public void onClick(final DialogInterface dialog, int arg1) {
				String name = editText.getText().toString();
				if(name == null || name.length() == 0){
					dialog.dismiss();
					return;
				}
				API.signupWithBaseName(name, new API.Callback() {
					@Override
					public void onResult(int code, JSONObject arg1) {
						if(code != API.Callback.SUCCESS){
							Log.d("LobiRankingSDK", "fail");
						}
						else{
							Log.d("LobiRankingSDK", "success");
						}
						runOnUiThread(new Runnable() {
							@Override
							public void run() {
								dialog.dismiss();
							}
						});
					}
				});
			}
		});
        builder.create().show();
    }
    
    public void onClickSendRankingButton(View view){
        if(! NakamapRanking.isReady()){
            Log.d("LogiRankingSDK", "アカウントが作成されていません");
            return;
        }
    	
    	final EditText editText = new EditText(this);
    	AlertDialog.Builder builder = new AlertDialog.Builder(this);
    	builder.setTitle("得点を入れてください");
        builder.setView(editText);
        builder.setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface arg0, int arg1) {
				arg0.dismiss();
			}
		});
        builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
			@Override
			public void onClick(final DialogInterface dialog, int arg1) {
				String score = editText.getText().toString();
				if(score == null || score.length() == 0){
					dialog.dismiss();
					return;
				}
				API.sendRanking("shippo", Long.parseLong(score), new API.Callback() {
					@Override
					public void onResult(int code, JSONObject arg1) {
						if(code != API.Callback.SUCCESS){
							Log.d("LobiRankingSDK", "fail");
						}
						else{
							Log.d("LobiRankingSDK", "success");
						}
						runOnUiThread(new Runnable() {
							@Override
							public void run() {
								dialog.dismiss();
							}
						});
					}
				});
			}
		});
        builder.create().show();
    }

    public void onClickGetRankingButton(View view){
        if(! NakamapRanking.isReady()){
            Log.d("LogiRankingSDK", "アカウントが作成されていません");
            return;
        }
        API.getRanking("shippo",
        			   Range.All,
        			   CursorOrigin.Top,
        			   1,
        			   10,
        			   new API.Callback() {
						@Override
						public void onResult(int code, JSONObject params) {
							if(code != API.Callback.SUCCESS){
								Log.d("LobiRankingSDK", "fail");
							}
							else{
								Log.d("LobiRankingSDK", "success");
								Log.d("LobiRankingSDK", params.toString());
							}
						}
					});
    }
    
    public void onClickGetRankingListButton(View view){
        if(! NakamapRanking.isReady()){
            Log.d("LogiRankingSDK", "アカウントが作成されていません");
            return;
        }
        API.getRankingList(Range.All,
        			   new API.Callback() {
						@Override
						public void onResult(int code, JSONObject params) {
							if(code != API.Callback.SUCCESS){
								Log.d("LobiRankingSDK", "fail");
							}
							else{
								Log.d("LobiRankingSDK", "success");
								Log.d("LobiRankingSDK", params.toString());
							}
						}
					});
    }
    
    public void onClickRankingButton(View view){
    	Intent intent = new Intent(this, RankingActivity.class);
    	intent.putExtra(RankingActivity.EXTRA_PAGE, RankingActivity.PAGE_RANKING_LIST);
    	startActivity(intent);    	
    }
    
    public void onClickRecommendButton(View view){
    	Intent intent = new Intent(this, RankingActivity.class);
    	intent.putExtra(RankingActivity.EXTRA_PAGE, RankingActivity.PAGE_AD_RECOMMEND);
    	startActivity(intent);    	
    }
    
}
