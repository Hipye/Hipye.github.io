# Leaning Android-studio


/////////////////
<!--more-->
## 线性布局
```java
<LinearLayout
    android:id="@+id/xmxkbuju_1"
    android:layout_width="200dp"      ## 宽度
    android:layout_height="200dp"     ## 高度
    android:orientation="vertical"
    android:background="#000000"
    android:paddingRight="20dp"
    android:paddingLeft="20dp"
    android:paddingTop="50dp"
    android:paddingBottom="10dp"
    android:layout_marginBottom="20dp"  ## 表示和下一个控件的距离
    >

     <View
         android:layout_width="match_parent"
         android:layout_height="match_parent"
         android:background="#ff0033" />

</LinearLayout>

<LinearLayout
    android:layout_width="match_parent"
    android:layout_height="200dp"
    android:layout_marginLeft="15dp"
    android:layout_marginRight="15dp"
    android:background="#0066FF"
    android:orientation="horizontal"
    >
    <!--gravity控件居中-->
    <View
        android:layout_width="150dp"
        android:layout_height="match_parent"
        android:background="#000000"
        android:layout_weight="1"/>
    <View
        android:layout_width="150dp"
        android:layout_height="match_parent"
        android:background="#FF0033"
        android:layout_weight="1"/>  ## layout_weight 代表权重所占的比例
</LinearLayout>
```

---
## 相对布局
```java
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">
    <!--tools:context=".MainActivity">-->
    <View
        android:id="@+id/lqljksjm"
        android:layout_width="100dp"
        android:layout_height="100dp"
        android:background="#000000" />
        <!--android:id="@+id/lqljksjm"  ## 命名一个新ID-->
        <!--android:layout_alignParentBottom="true"  ## 底部对齐-->
        <!--android:layout_alignParentRight="true"   ## 底部靠右对齐-->
    <View
        android:id="@+id/lqljksjm_2"
        android:layout_width="100dp"
        android:layout_height="100dp"
        android:background="#FF0033"
        android:layout_below="@id/lqljksjm" />
        <!--android:layout_toRightOf="@id/lqljksjm"  ## 与上一个控件右边对齐-->
        <!--android:layout_below="@id/lqljksjm"      ##与上一个控件底部对齐-->

    <LinearLayout
        android:id="@+id/xmxkbuju_1"
        android:layout_width="match_parent"
        android:layout_height="200dp"
        android:layout_below="@id/lqljksjm_2"
        android:layout_alignParentStart="true"
        android:layout_marginTop="2dp"
        android:background="#0066FF"
        android:orientation="horizontal"
        android:padding="15dp">

        <View
            android:layout_width="100dp"
            android:layout_height="match_parent"
            android:background="#FF0033" />

        <RelativeLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:background="#000000"
            android:padding="15dp">
            <!--padding代表在距离下一个控件有一定的边距-->

            <View
                android:id="@+id/lqljksjm_3"
                android:layout_width="100dp"
                android:layout_height="match_parent"
                android:background="#FF9900" />

            <View
                android:id="@+id/lqljksjm_4"
                android:layout_width="100dp"
                android:layout_height="match_parent"
                android:layout_marginLeft="10dp"
                android:layout_toRightOf="@+id/lqljksjm_3"
                android:background="#FF9900" />
            <!--android:layout_marginLeft="10dp"  ## 表示与对齐的控件相差10个dp-->
            <!--android:layout_toRightOf="@+id/lqljksjm_3"  ## 表示与lqljksjm这个控件对齐-->
                

        </RelativeLayout>


    </LinearLayout>


</RelativeLayout>

```

---
## Textview控件

首先必须在主活动界面`MainActivity`声明一个Button控件`mwfziyulj1`
```java
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    private Button mwfziyulj1;
//    声明这个wfziyulj1组件  alt + 回车

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mwfziyulj1 = findViewById(R.id.btn_txtview);
//    声明这个组件并找activity_main.  xml中从到这个组件
        mwfziyulj1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//    跳到展示文字预览的界面  注意每个括弧里的的展示
                Intent intent = new Intent(MainActivity.this,wfziyuljActivity.class);
                startActivity(intent);
            }
        });

    }
}

```
然后再主活动界面的xml文件里`activity_main.xml`声明Button控件及新建id
```java
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical"
        >
        <!--tools:context=".MainActivity">-->
        <Button
            android:id="@+id/btn_txtview"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="文字预览"
            android:textColor="@color/hwse"
            android:textSize="24sp"/>

</LinearLayout>
```

然后再new一个Activity `wfziyuljActivity`

```java
import android.graphics.Paint;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.Html;
import android.widget.TextView;

public class wfziyuljActivity extends AppCompatActivity {

    private TextView mTv5;
    private TextView mTv6,mtv7;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_wfziyulj);
        mTv5 = findViewById(R.id.tv_5);
        mTv5.getPaint().setFlags(Paint.STRIKE_THRU_TEXT_FLAG);//中划线
        mTv5.getPaint().setAntiAlias(true);//消除锯齿

        mTv6 = findViewById(R.id.tv_6);
        mTv6.getPaint().setFlags(Paint.UNDERLINE_TEXT_FLAG);//给文字添加下划线

        mtv7 = findViewById(R.id.tv_7);
        mtv7.setText(Html.fromHtml("<u>文字预览界面"));
    }
}
```
并在xml文件里声明各个TextView控件的各个属性
```java
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".wfziyuljActivity"
    android:orientation="vertical">
    <!--必须加这个属性表示垂直方向-->
    <TextView
        android:id="@+id/tv_2"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/uitu_ceui"
        android:textColor="@color/hwse"
        android:textSize="25sp"/>
    <!--android:text=  ## 这个可是引用/values目录下strings.xml文件里自定义的文本也可以不用@直接输入想要的文本-->
    <!--android:textColor=  ## 这个是设置字体颜色-->
    <!--android:textSize=   ## 字体大小-->
    <TextView
        android:id="@+id/tv_3"
        android:layout_width="100dp"
        android:layout_height="wrap_content"
        android:maxLines="1"
        android:ellipsize="end"
        android:text="@string/uitu_ceui2"
        android:textColor="@color/hwse"
        android:textSize="25sp"
        android:layout_marginTop="5dp"
        />
    <!--android:maxLines="1"     ## 限制最大的行数为1行-->
    <!--android:ellipsize="end"  ## 未显示的文字显示为...-->
    <!--android:layout_marginTop="10dp"  ## 调整和与上一个组件差距为10dp-->
    <TextView
        android:id="@+id/tv_4"
        android:text="筛选"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="10dp"
        android:textSize="25dp"
        android:textColor="@color/hwse"
        android:drawableRight="@drawable/seach"
        android:drawablePadding="5dp"/>
    <!--android:drawableRight= ##  引用图片-->
    <TextView
        android:id="@+id/tv_5"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="文字展示"
        android:textSize="25dp"
        android:textColor="@color/hwse"
        android:padding="5dp"
        android:layout_marginTop="5dp"/>
    <TextView
        android:id="@+id/tv_6"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="文字列举"
        android:textSize="25dp"
        android:textColor="@color/hwse"
        android:padding="5dp"
        android:layout_marginTop="10dp"/>
    <TextView
        android:id="@+id/tv_7"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="文字列举"
        android:textSize="25dp"
        android:textColor="@color/hwse"
        android:padding="5dp"
        android:layout_marginTop="5dp"/>
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="文字跑马灯预览 $ 文字跑马灯预览 $ 文字跑马灯预览 $ 文字跑马灯预览"
        android:textSize="25sp"
        android:textColor="@color/uglj"
        android:padding="10dp"
        android:singleLine="true"
        android:ellipsize="marquee"
        android:marqueeRepeatLimit="marquee_forever"
        android:focusable="true"
        android:focusableInTouchMode="true"/>
    <!--android:singleLine="true"  ## 设置为单线显示  因为如果是多行就显示不出跑马灯效果效果-->
    <!--ellipsize主要是处理当文字长度超过TextView可显示的长度的时候，系统的处理方式，ellipsize主要有以下几种值：-->
    <!--android:ellipsize=”start”—–省略号显示在开头 "...789"-->
    <!--android:ellipsize=”end”——省略号显示在结尾  "123..."-->
    <!--android:ellipsize=”middle”—-省略号显示在中间 "12...89"-->
    <!--android:ellipsize=”marquee”–以横向滚动方式显示(需获得当前焦点时)-->
    <!--android:ellipsize=”none”–&#45;&#45;不做任何处理(会将要显示的文字截断)-->

    <!--android:marqueeRepeatLimit="marquee_forever" 在ellipsize指定marquee的情况下，设置重复滚动的次数，当设置为 marquee_forever时表示无限次。-->
    <!--android:focusableInTouchMode="true" 是否在触摸模式下获得焦点。-->
    <!--android:focusable控件是否能够获取焦点-->

</LinearLayout>
```


