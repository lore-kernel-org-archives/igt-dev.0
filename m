Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F31C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 12:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518CC10E0AA;
	Wed,  7 Aug 2024 12:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Az51AeRR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2BD10E0AA
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723033593; x=1754569593;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=oVLfQmNnS8RM2p79uoErcZ+MCqqx6eHmtWwWiBtrDgo=;
 b=Az51AeRRmjRLRZ6NcchaKEjsdXG3MF8+UFZAh1pdKlQOQQvzeaHgS8dY
 +8Bb4a1S6vhNLfujz+0qwhTrX/zYZ6kVqpADpWdAgTZvXRSJvybubvi7Y
 RHV7JB7URgnrZcQACIWFi0uMZKLwzDQkHMKShAc0izX4NiNszXkKEYyXn
 eSiLQXagrXUK/fhkqPQfVBEv1Feqqs8URgcpbr/hmH1X8F/wd++g+A+FA
 Pie2OVrrDpAQnL2J9eF2DJ2W7rXcUy3u+BKFvoXarR4uHwHsTUqZBKpG9
 +6Y9wnZqq/drEoHc6bzbhPrUx0jiwNbovbohz1rL5fmUE28zIizfx8REe g==;
X-CSE-ConnectionGUID: bPxbF9p4QK6HDSxoUjl1tw==
X-CSE-MsgGUID: Sq5Q/cNgTGyxX97JGeuhPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24009443"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208,217";a="24009443"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 05:26:32 -0700
X-CSE-ConnectionGUID: 7vp2sATDTN+VN7BWNzZong==
X-CSE-MsgGUID: t7GD/sliQI2YceLQoRoETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208,217";a="87506038"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 05:26:30 -0700
Content-Type: multipart/alternative;
 boundary="------------xVx6TnxuZDTltGmz94f9Lf9M"
Message-ID: <7f2bb771-02f8-47c8-9244-f71c624a0ac0@intel.com>
Date: Wed, 7 Aug 2024 14:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 7/8] tests/core_hotunplug: Check health once
 after subtest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
 <20240805143713.76034-8-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240805143713.76034-8-kamil.konieczny@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------xVx6TnxuZDTltGmz94f9Lf9M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05.08.2024 16:37, Kamil Konieczny wrote:
> Currently health checks and recovery are performed in fixtures
> outside of subtest and even without any subtest running. Whats
> more, after one subtest fail, all other checks will fail and
> will print quite a few logs.
>
> Lets try to lower number of checks to those really needed and
> do them only once per fixture, which should make reading logs
> easier.
>
> v2: drop new var from test priv structure, update subject and
>    description, change second macro parameter name to 'y'
>
> Signed-off-by: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> ---
>   tests/core_hotunplug.c | 108 +++++++++++++++++++++++++----------------
>   1 file changed, 67 insertions(+), 41 deletions(-)
>
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 7f17f4423..51edee985 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -84,6 +84,9 @@
>   
>   IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
>   
> +#define ACTION_RECOVER		(1 << 0)
> +#define ACTION_POST_CHECK	(1 << 1)
> +

Not used anymore.

>   struct hotunplug {
>   	struct {
>   		int drm;
> @@ -515,7 +518,6 @@ static void recover(struct hotunplug *priv)
>   	bool late_close = priv->fd.drm >= 0;
>   
>   	cleanup(priv);
> -
>   	if (!priv->failure && late_close)
>   		igt_ignore_warn(healthcheck(priv, false));
>   
> @@ -671,6 +673,19 @@ static void hotreplug_lateclose(struct hotunplug *priv)
>   }
>   
>   /* Main */
> +#define RECOVER(x) igt_fixture { \
> +		if (x) { \
> +			x = false; \

Do we need this assignment?

> +			recover(&priv); \
> +		} \
> +	}
> +
> +#define POST_CHECK(y) igt_fixture { \
> +		if (y) { \
> +			y = false; \
ditto
> +			post_healthcheck(&priv); \
> +		} \
> +	}
>   
>   igt_main
>   {
> @@ -682,6 +697,8 @@ igt_main
>   		.snd_driver	= NULL,
>   		.chipset	= DRIVER_ANY,
>   	};
> +	bool needs_recover = false;
> +	bool needs_post_check = false;
>   
>   	igt_fixture {
>   		int fd_drm;
> @@ -717,100 +734,109 @@ igt_main
>   
>   	igt_subtest_group {
>   		igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed, then rebound");
> -		igt_subtest("unbind-rebind")
> +		igt_subtest("unbind-rebind") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			unbind_rebind(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK(needs_post_check);

Why recover is in subtest_group and post_check outside, here and below?
Why not call explicitly recover/post_check after every test, ex:
igt_subtest("unbind-rebind") {
      unbind_rebind(&priv);
      recover(..);
      post_check();
}
Or even call recover/post_check from inside unbind_rebind ?

This dance with extra vars and checks seems strange.

IIRC I have proposed previously to embed recover/post_check into 
cleanup, which should be called after every test.
And recover/post_check could be conditionally called based on some flags 
present in priv.

Regards
Andrzej

>   
>   	igt_subtest_group {
>   		igt_describe("Check if a device believed to be closed can be cleanly unplugged, then restored");
> -		igt_subtest("unplug-rescan")
> +		igt_subtest("unplug-rescan") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			unplug_rescan(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK(needs_post_check);
>   
>   	igt_subtest_group {
>   		igt_describe("Check if the driver can be cleanly unbound from an open device, then released and rebound");
> -		igt_subtest("hotunbind-rebind")
> +		igt_subtest("hotunbind-rebind") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			hotunbind_rebind(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK(needs_post_check);
>   
>   	igt_subtest_group {
>   		igt_describe("Check if an open device can be cleanly unplugged, then released and restored");
> -		igt_subtest("hotunplug-rescan")
> +		igt_subtest("hotunplug-rescan") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			hotunplug_rescan(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK(needs_post_check);
>   
>   	igt_subtest_group {
>   		igt_describe("Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance");
> -		igt_subtest("hotrebind")
> +		igt_subtest("hotrebind") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			hotrebind(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK(needs_post_check);
>   
>   	igt_subtest_group {
>   		igt_describe("Check if a hot unplugged and still open device can be cleanly restored");
> -		igt_subtest("hotreplug")
> +		igt_subtest("hotreplug") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			hotreplug(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK(needs_post_check);
>   
>   	igt_subtest_group {
>   		igt_describe("Check if a hot unbound driver instance still open after hot rebind can be cleanly released");
> -		igt_subtest("hotrebind-lateclose")
> +		igt_subtest("hotrebind-lateclose") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			hotrebind_lateclose(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
> -	igt_fixture
> -		post_healthcheck(&priv);
> +	POST_CHECK(needs_post_check);
>   
>   	igt_subtest_group {
>   		igt_describe("Check if an instance of a still open while hot replugged device can be cleanly released");
> -		igt_subtest("hotreplug-lateclose")
> +		igt_subtest("hotreplug-lateclose") {
> +			needs_recover = true;
> +			needs_post_check = true;
>   			hotreplug_lateclose(&priv);
> +		}
>   
> -		igt_fixture
> -			recover(&priv);
> +		RECOVER(needs_recover);
>   	}
>   
>   	igt_fixture {
> -		post_healthcheck(&priv);
> -
> +		if (needs_post_check)
> +			post_healthcheck(&priv);
>   		igt_ignore_warn(close(priv.fd.sysfs_bus));
>   		igt_ignore_warn(close(priv.fd.sysfs_drv));
>   	}

--------------xVx6TnxuZDTltGmz94f9Lf9M
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body wd-tech="true" spellcheck="false">
    <br>
    <br>
    <div class="moz-cite-prefix">On 05.08.2024 16:37, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240805143713.76034-8-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Currently health checks and recovery are performed in fixtures
outside of subtest and even without any subtest running. Whats
more, after one subtest fail, all other checks will fail and
will print quite a few logs.

Lets try to lower number of checks to those really needed and
do them only once per fixture, which should make reading logs
easier.

v2: drop new var from test priv structure, update subject and
  description, change second macro parameter name to 'y'

Signed-off-by: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
---
 tests/core_hotunplug.c | 108 +++++++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 41 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7f17f4423..51edee985 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -84,6 +84,9 @@
 
 IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
 
+#define ACTION_RECOVER		(1 &lt;&lt; 0)
+#define ACTION_POST_CHECK	(1 &lt;&lt; 1)
+</pre>
    </blockquote>
    <br>
    Not used anymore.<br>
    <br>
    <blockquote type="cite"
      cite="mid:20240805143713.76034-8-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
 struct hotunplug {
 	struct {
 		int drm;
@@ -515,7 +518,6 @@ static void recover(struct hotunplug *priv)
 	bool late_close = priv-&gt;fd.drm &gt;= 0;
 
 	cleanup(priv);
-
 	if (!priv-&gt;failure &amp;&amp; late_close)
 		igt_ignore_warn(healthcheck(priv, false));
 
@@ -671,6 +673,19 @@ static void hotreplug_lateclose(struct hotunplug *priv)
 }
 
 /* Main */
+#define RECOVER(x) igt_fixture { \
+		if (x) { \
+			x = false; \</pre>
    </blockquote>
    <br>
    Do we need this assignment?<br>
    <br>
    <blockquote type="cite"
      cite="mid:20240805143713.76034-8-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
+			recover(&amp;priv); \
+		} \
+	}
+
+#define POST_CHECK(y) igt_fixture { \
+		if (y) { \
+			y = false; \</pre>
    </blockquote>
    ditto<br>
    <blockquote type="cite"
      cite="mid:20240805143713.76034-8-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
+			post_healthcheck(&amp;priv); \
+		} \
+	}
 
 igt_main
 {
@@ -682,6 +697,8 @@ igt_main
 		.snd_driver	= NULL,
 		.chipset	= DRIVER_ANY,
 	};
+	bool needs_recover = false;
+	bool needs_post_check = false;
 
 	igt_fixture {
 		int fd_drm;
@@ -717,100 +734,109 @@ igt_main
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly unbound from a device believed to be closed, then rebound");
-		igt_subtest("unbind-rebind")
+		igt_subtest("unbind-rebind") {
+			needs_recover = true;
+			needs_post_check = true;</pre>
    </blockquote>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:20240805143713.76034-8-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap=""> 			unbind_rebind(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&amp;priv);
+	POST_CHECK(needs_post_check);</pre>
    </blockquote>
    <br>
    Why recover is in subtest_group and post_check outside, here and
    below?<br>
    Why not call explicitly recover/post_check after every test, ex:<br>
    igt_subtest("unbind-rebind") {<br>
         unbind_rebind(&amp;priv);<br>
         recover(..);<br>
         post_check();<br>
    }<br>
    Or even call recover/post_check from inside unbind_rebind ?<br>
    <br>
    This dance with extra vars and checks seems strange.<br>
    <br>
    IIRC I have proposed previously to embed recover/post_check into
    cleanup, which should be called after every test.<br>
    And recover/post_check could be conditionally called based on some
    flags present in priv.<br>
    <br>
    Regards<br>
    Andrzej<br>
    <br>
    <blockquote type="cite"
      cite="mid:20240805143713.76034-8-kamil.konieczny@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	igt_subtest_group {
 		igt_describe("Check if a device believed to be closed can be cleanly unplugged, then restored");
-		igt_subtest("unplug-rescan")
+		igt_subtest("unplug-rescan") {
+			needs_recover = true;
+			needs_post_check = true;
 			unplug_rescan(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&amp;priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly unbound from an open device, then released and rebound");
-		igt_subtest("hotunbind-rebind")
+		igt_subtest("hotunbind-rebind") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotunbind_rebind(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&amp;priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if an open device can be cleanly unplugged, then released and restored");
-		igt_subtest("hotunplug-rescan")
+		igt_subtest("hotunplug-rescan") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotunplug_rescan(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&amp;priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance");
-		igt_subtest("hotrebind")
+		igt_subtest("hotrebind") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotrebind(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&amp;priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if a hot unplugged and still open device can be cleanly restored");
-		igt_subtest("hotreplug")
+		igt_subtest("hotreplug") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotreplug(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&amp;priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if a hot unbound driver instance still open after hot rebind can be cleanly released");
-		igt_subtest("hotrebind-lateclose")
+		igt_subtest("hotrebind-lateclose") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotrebind_lateclose(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
-	igt_fixture
-		post_healthcheck(&amp;priv);
+	POST_CHECK(needs_post_check);
 
 	igt_subtest_group {
 		igt_describe("Check if an instance of a still open while hot replugged device can be cleanly released");
-		igt_subtest("hotreplug-lateclose")
+		igt_subtest("hotreplug-lateclose") {
+			needs_recover = true;
+			needs_post_check = true;
 			hotreplug_lateclose(&amp;priv);
+		}
 
-		igt_fixture
-			recover(&amp;priv);
+		RECOVER(needs_recover);
 	}
 
 	igt_fixture {
-		post_healthcheck(&amp;priv);
-
+		if (needs_post_check)
+			post_healthcheck(&amp;priv);
 		igt_ignore_warn(close(priv.fd.sysfs_bus));
 		igt_ignore_warn(close(priv.fd.sysfs_drv));
 	}
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------xVx6TnxuZDTltGmz94f9Lf9M--
