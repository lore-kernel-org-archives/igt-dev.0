Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD4CC27C4F
	for <igt-dev@archiver.kernel.org>; Sun, 23 Jun 2024 16:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5E010E094;
	Sun, 23 Jun 2024 16:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZszUGqWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCC110E094
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Jun 2024 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719160007; x=1750696007;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=LdSWMzvSrGC7OYjBPQ7DCjtCgbIJNHP/9oYiTESi+0E=;
 b=ZszUGqWvmAT9m9DJUw+TFxdGFzQW0qpPCiL14GSlxh+zJoVkrWelngCh
 R2Yg/yJBfLYLCnWBzTjsuxsbc1PlW56esndz4hafTowLr0bagUAsjjUMz
 Da9T4dVfA8ia2szp1eJpXbWcV+zVHcHskliF8tzc0ZRCJC+BaZvvWGzk2
 NYrQKi+yTGb0yo5revNME4GSQaBaZEbjkVEPSKupua11iWuTHz23o0Tjd
 qlQgtwPdU4ro5MDfQfa5NWv9GAVVdBYxljx2t0g1tTNWCJXvKhCBWntOF
 NxkPWW4LdyfhgvgyjTvFOuOWDovzD54+S1LrQOC2Me5r0AdkUxcUP8BOk g==;
X-CSE-ConnectionGUID: VxCG1ILcT5+EvS/CTzlx+A==
X-CSE-MsgGUID: Ajy15c1uSc6gGw4eFtRhNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16276181"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; d="scan'208,217";a="16276181"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2024 09:26:46 -0700
X-CSE-ConnectionGUID: nfrODPV4RPuGzuEG0KnQVA==
X-CSE-MsgGUID: aNeTrYl9TYG6SB0HT+fIgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; d="scan'208,217";a="80596981"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.136.84])
 ([10.247.136.84])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2024 09:26:45 -0700
Content-Type: multipart/alternative;
 boundary="------------ZBjHvyxV0eSrafyKxsxbd5Jq"
Message-ID: <47445b1a-b9f2-4f9a-97b9-ef42d1caf21f@intel.com>
Date: Sun, 23 Jun 2024 21:56:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] tests/kms_bw: add subtest for only connected outputs
To: igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
References: <20240619080408.1161329-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240619080408.1161329-2-kunal1.joshi@intel.com>
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
--------------ZBjHvyxV0eSrafyKxsxbd5Jq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Aurabindo, Thanks for reviewing, had done some minor changes after 
this was rb'ed, can you please ack those? Thanks and Regards Kunal Joshi

On 6/19/2024 1:34 PM, Kunal Joshi wrote:
> forcing DP connector doesn't work well and tests are skipping
> with unsupported mode, add new test which runs test on connected
> outputs only.
>
> v2: added debug print for better clarity of skips on unsupported mode
>
> v3: added new line in info
>      moved skip after test_init
>      updated test_init logic based on physical flag
>
> Cc: Aurabindo Pillai<aurabindo.pillai@amd.com>
> Signed-off-by: Kunal Joshi<kunal1.joshi@intel.com>
> Reviewed-by: Aurabindo Pillai<aurabindo.pillai@amd.com>
> ---
>   tests/kms_bw.c | 48 +++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 39 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 05f7e79ad..2c42acbdc 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -48,6 +48,19 @@
>    * @2560x1440p:       2560x1440 resolution
>    * @3840x2160p:       3840x2160 resolution
>    * @2160x1440p:       2160x1440 resolution
> + *
> + * SUBTEST: connected-linear-tiling-%d-displays-%s
> + * Description: bw test with %arg[2]
> + *
> + * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
> + *
> + * arg[2]:
> + *
> + * @1920x1080p:       1920x1080 resolution
> + * @2560x1440p:       2560x1440 resolution
> + * @3840x2160p:       3840x2160 resolution
> + * @2160x1440p:       2160x1440 resolution
> + *
>    */
>   
>   /* Common test data. */
> @@ -55,6 +68,7 @@ typedef struct data {
>           igt_display_t display;
>           igt_plane_t *primary[IGT_MAX_PIPES];
>           igt_output_t *output[IGT_MAX_PIPES];
> +	igt_output_t *connected_output[IGT_MAX_PIPES];
>           igt_pipe_t *pipe[IGT_MAX_PIPES];
>           igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
>           drmModeModeInfo mode[IGT_MAX_PIPES];
> @@ -62,6 +76,7 @@ typedef struct data {
>           int w[IGT_MAX_PIPES];
>           int h[IGT_MAX_PIPES];
>           int fd;
> +	int connected_outputs;
>   } data_t;
>   
>   static drmModeModeInfo test_mode[] = {
> @@ -103,11 +118,12 @@ static drmModeModeInfo test_mode[] = {
>   
>   };
>   
> -static void test_init(data_t *data)
> +static void test_init(data_t *data, bool physical)
>   {
>   	igt_display_t *display = &data->display;
>   	int i, max_pipes = display->n_pipes;
>   	igt_output_t *output;
> +	data->connected_outputs = 0;
>   
>   	for_each_pipe(display, i) {
>   		data->pipe_id[i] = i;
> @@ -120,16 +136,16 @@ static void test_init(data_t *data)
>   	}
>   
>   	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
> -		if (!data->pipe[i])
> +		if (!data->pipe[i] && !physical)
>   			continue;
>   
>   		output = &display->outputs[i];
> -
>   		data->output[i] = output;
>   
>   		/* Only allow physically connected displays for the tests. */
>   		if (!igt_output_is_connected(output))
>   			continue;
> +		data->connected_output[data->connected_outputs++] = output;
>   
>   		igt_assert(kmstest_get_connector_default_mode(
>   			data->fd, output->config.connector, &data->mode[i]));
> @@ -173,7 +189,7 @@ static void force_output_mode(data_t *d, igt_output_t *output,
>   	igt_output_override_mode(output, mode);
>   }
>   
> -static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
> +static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode, bool physical) {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	struct igt_fb buffer[IGT_MAX_PIPES];
> @@ -189,11 +205,14 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	igt_skip_on_f(pipe >= num_pipes,
>                         "ASIC does not have %d pipes\n", pipe);
>   
> -	test_init(data);
> +	test_init(data, physical);
> +
> +	igt_skip_on_f(physical && pipe >= data->connected_outputs,
> +		      "Only %d connected need %d connected\n",data->connected_outputs, pipe+1);
>   
>   	/* create buffers */
>   	for (i = 0; i <= pipe; i++) {
> -		output = data->output[i];
> +		output = physical ? data->connected_output[i] : data->output[i];
>   		if (!output) {
>   			continue;
>   		}
> @@ -208,6 +227,8 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   		igt_output_set_pipe(output, i);
>   
>   		igt_plane_set_fb(data->primary[i], &buffer[i]);
> +		igt_info("Assigning pipe %s to output %s with mode %s\n",
> +			 kmstest_pipe_name(i), igt_output_name(output), mode->name);
>   	}
>   
>   	ret = igt_display_try_commit_atomic(display,
> @@ -219,7 +240,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
>   	for (i = 0; i <= pipe; i++) {
> -		output = data->output[i];
> +		output = physical ? data->connected_output[i] : data->output[i];
>   		if (!output) {
>   			continue;
>   		}
> @@ -230,7 +251,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	}
>   
>   	for (i = pipe; i >= 0; i--) {
> -		output = data->output[i];
> +		output = physical ? data->connected_output[i] : data->output[i];
>   		if (!output)
>   			continue;
>   
> @@ -265,10 +286,19 @@ igt_main
>   		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
>   			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
>   			      test_mode[j].name)
> -			run_test_linear_tiling(&data, i, &test_mode[j]);
> +			run_test_linear_tiling(&data, i, &test_mode[j], false);
>   		}
>   	}
>   
> +        for (i = 0; i < IGT_MAX_PIPES; i++) {
> +                for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
> +                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", i+1,
> +                              test_mode[j].name)
> +                        run_test_linear_tiling(&data, i, &test_mode[j], true);
> +                }
> +        }
> +
> +
>   	igt_fixture
>   	{
>   		igt_display_fini(&data.display);
--------------ZBjHvyxV0eSrafyKxsxbd5Jq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello <span style="white-space: pre-wrap">Aurabindo,

Thanks for reviewing, had done some minor changes
after this was rb'ed, can you please ack those?

Thanks and Regards
Kunal Joshi
</span></p>
    <div class="moz-cite-prefix">On 6/19/2024 1:34 PM, Kunal Joshi
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">forcing DP connector doesn't work well and tests are skipping
with unsupported mode, add new test which runs test on connected
outputs only.

v2: added debug print for better clarity of skips on unsupported mode

v3: added new line in info
    moved skip after test_init
    updated test_init logic based on physical flag

Cc: Aurabindo Pillai <a class="moz-txt-link-rfc2396E" href="mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a>
Signed-off-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Reviewed-by: Aurabindo Pillai <a class="moz-txt-link-rfc2396E" href="mailto:aurabindo.pillai@amd.com">&lt;aurabindo.pillai@amd.com&gt;</a>
---
 tests/kms_bw.c | 48 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 05f7e79ad..2c42acbdc 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -48,6 +48,19 @@
  * @2560x1440p:       2560x1440 resolution
  * @3840x2160p:       3840x2160 resolution
  * @2160x1440p:       2160x1440 resolution
+ *
+ * SUBTEST: connected-linear-tiling-%d-displays-%s
+ * Description: bw test with %arg[2]
+ *
+ * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
+ *
+ * arg[2]:
+ *
+ * @1920x1080p:       1920x1080 resolution
+ * @2560x1440p:       2560x1440 resolution
+ * @3840x2160p:       3840x2160 resolution
+ * @2160x1440p:       2160x1440 resolution
+ *
  */
 
 /* Common test data. */
@@ -55,6 +68,7 @@ typedef struct data {
         igt_display_t display;
         igt_plane_t *primary[IGT_MAX_PIPES];
         igt_output_t *output[IGT_MAX_PIPES];
+	igt_output_t *connected_output[IGT_MAX_PIPES];
         igt_pipe_t *pipe[IGT_MAX_PIPES];
         igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
         drmModeModeInfo mode[IGT_MAX_PIPES];
@@ -62,6 +76,7 @@ typedef struct data {
         int w[IGT_MAX_PIPES];
         int h[IGT_MAX_PIPES];
         int fd;
+	int connected_outputs;
 } data_t;
 
 static drmModeModeInfo test_mode[] = {
@@ -103,11 +118,12 @@ static drmModeModeInfo test_mode[] = {
 
 };
 
-static void test_init(data_t *data)
+static void test_init(data_t *data, bool physical)
 {
 	igt_display_t *display = &amp;data-&gt;display;
 	int i, max_pipes = display-&gt;n_pipes;
 	igt_output_t *output;
+	data-&gt;connected_outputs = 0;
 
 	for_each_pipe(display, i) {
 		data-&gt;pipe_id[i] = i;
@@ -120,16 +136,16 @@ static void test_init(data_t *data)
 	}
 
 	for (i = 0; i &lt; display-&gt;n_outputs &amp;&amp; i &lt; max_pipes; i++) {
-		if (!data-&gt;pipe[i])
+		if (!data-&gt;pipe[i] &amp;&amp; !physical)
 			continue;
 
 		output = &amp;display-&gt;outputs[i];
-
 		data-&gt;output[i] = output;
 
 		/* Only allow physically connected displays for the tests. */
 		if (!igt_output_is_connected(output))
 			continue;
+		data-&gt;connected_output[data-&gt;connected_outputs++] = output;
 
 		igt_assert(kmstest_get_connector_default_mode(
 			data-&gt;fd, output-&gt;config.connector, &amp;data-&gt;mode[i]));
@@ -173,7 +189,7 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 	igt_output_override_mode(output, mode);
 }
 
-static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
+static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode, bool physical) {
 	igt_display_t *display = &amp;data-&gt;display;
 	igt_output_t *output;
 	struct igt_fb buffer[IGT_MAX_PIPES];
@@ -189,11 +205,14 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	igt_skip_on_f(pipe &gt;= num_pipes,
                       "ASIC does not have %d pipes\n", pipe);
 
-	test_init(data);
+	test_init(data, physical);
+
+	igt_skip_on_f(physical &amp;&amp; pipe &gt;= data-&gt;connected_outputs,
+		      "Only %d connected need %d connected\n",data-&gt;connected_outputs, pipe+1);
 
 	/* create buffers */
 	for (i = 0; i &lt;= pipe; i++) {
-		output = data-&gt;output[i];
+		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
 		if (!output) {
 			continue;
 		}
@@ -208,6 +227,8 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 		igt_output_set_pipe(output, i);
 
 		igt_plane_set_fb(data-&gt;primary[i], &amp;buffer[i]);
+		igt_info("Assigning pipe %s to output %s with mode %s\n",
+			 kmstest_pipe_name(i), igt_output_name(output), mode-&gt;name);
 	}
 
 	ret = igt_display_try_commit_atomic(display,
@@ -219,7 +240,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	for (i = 0; i &lt;= pipe; i++) {
-		output = data-&gt;output[i];
+		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
 		if (!output) {
 			continue;
 		}
@@ -230,7 +251,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	}
 
 	for (i = pipe; i &gt;= 0; i--) {
-		output = data-&gt;output[i];
+		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
 		if (!output)
 			continue;
 
@@ -265,10 +286,19 @@ igt_main
 		for (j = 0; j &lt; ARRAY_SIZE(test_mode); j++) {
 			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
 			      test_mode[j].name)
-			run_test_linear_tiling(&amp;data, i, &amp;test_mode[j]);
+			run_test_linear_tiling(&amp;data, i, &amp;test_mode[j], false);
 		}
 	}
 
+        for (i = 0; i &lt; IGT_MAX_PIPES; i++) {
+                for (j = 0; j &lt; ARRAY_SIZE(test_mode); j++) {
+                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", i+1,
+                              test_mode[j].name)
+                        run_test_linear_tiling(&amp;data, i, &amp;test_mode[j], true);
+                }
+        }
+
+
 	igt_fixture
 	{
 		igt_display_fini(&amp;data.display);
</pre>
    </blockquote>
  </body>
</html>

--------------ZBjHvyxV0eSrafyKxsxbd5Jq--
