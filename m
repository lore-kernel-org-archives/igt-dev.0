Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84871F9D0C9
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 12:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3092288647;
	Tue, 14 Apr 2026 12:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QF94NU3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944D510E5A2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776170664; x=1807706664;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=G6Os0rQkYUvjVns8OPtIKmr5v1ZR6/IuIp96qhQB7ps=;
 b=QF94NU3Txwc0CMJFawhxdHyWN3nxaMo+uhSj2E53tvochCpYb6HLdLGL
 hakZYv9EbfN2XuiWOiFnCw0TYk9YDXnHynYG2uRCEWQPg5FlArvbgWv6f
 8IZ1wiu9paNkslFWxs0h/RDCV6oIt1XSNfa66prJP4W4ZbGYL64RmNGhH
 CSDT+mTCK8fnPERo8OnKhVUAwTAvthp6jUYP5YKF/29kY1oJNf1iiYG1p
 Yvrj6e9GTRkKRXIJuY/H3/FyJsT+8PFiNQRkL8uy0GsdbMv/Sxp3oOZe1
 eCDISPL1iIjMgsPD1coFcXetiKN89oXZguSkKvwVcqudNdKjVF1siE6Mk Q==;
X-CSE-ConnectionGUID: VgS3xgnUTMmwPAs6RSr/IA==
X-CSE-MsgGUID: 3KAy0ZdXQRWMDTfGmNzl/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77093406"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208,217";a="77093406"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:44:23 -0700
X-CSE-ConnectionGUID: qMuO6g7/RCWqyUCE597RfA==
X-CSE-MsgGUID: /f4i7+cLTVyWG3X6cGpr3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
 d="scan'208,217";a="253486096"
Received: from tpavanku-mobl.gar.corp.intel.com (HELO [10.247.189.116])
 ([10.247.189.116])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:44:21 -0700
Content-Type: multipart/alternative;
 boundary="------------beVV4dcShbwzgUTkXttzOrgp"
Message-ID: <cfb390ca-3f9f-4423-882b-d2e0661b9151@intel.com>
Date: Tue, 14 Apr 2026 18:14:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external panels
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20260407095234.1728691-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260407095234.1728691-1-karthik.b.s@intel.com>
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
--------------beVV4dcShbwzgUTkXttzOrgp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Karthik,

On 07-04-2026 15:22, Karthik B S wrote:
> Currently the test is rejecting all the outputs where the mode is not
> matching. This is leading to excessive skips on configs wherer the tests
> were passing previouly.
>
> Instead of this, use default mode for fixed mode panels if the required
> custom mode is not found. And use custom mode for external panels as
> these are allowed and have also been passing previously.
>
> Cc: Jason-JH Lin<jason-jh.lin@mediatek.com>
> Cc: Kunal Joshi<kunal1.joshi@intel.com>
> Signed-off-by: Karthik B S<karthik.b.s@intel.com>
> ---
>   tests/kms_bw.c | 57 ++++++++++++++++++++++++++++++++------------------
>   1 file changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 4df5c2cee..4a32ec811 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -186,14 +186,16 @@ static void force_output_mode(data_t *d, igt_output_t *output,
>   	igt_output_override_mode(output, mode);
>   }
>   
> -static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
> +/* Check if output has a matching mode and call it out if mode is being forced */
> +static void output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
Since the function is now void and purely informational, the name
output_mode_supported no longer reflects what it does. Consider renaming
>   {
>   	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *default_mode;
>   	int i;
>   
>   	/* Virtual/forced sinks support all modes */
>   	if (!igt_output_is_connected(output))
> -		return true;
> +		return;
>   
>   	for (i = 0; i < connector->count_modes; i++) {
>   		drmModeModeInfo *conn_mode = &connector->modes[i];
> @@ -204,26 +206,32 @@ static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *m
>   			igt_debug("Found matching mode for %dx%d@%dHz on %s\n",
>   				  mode->hdisplay, mode->vdisplay, mode->vrefresh,
>   				  igt_output_name(output));
> -			return true;
>   		}
>   	}
>   
> -	igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
> -		 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> -		 igt_output_name(output), connector->count_modes);
> -
> -	return false;
> +	if (output_is_internal_panel(output)) {
> +		default_mode = igt_output_get_mode(output);
> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes).\n"
> +			 "%s Default mode: %dx%d@%dHz\n",
> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +			 igt_output_name(output), connector->count_modes, igt_output_name(output),
> +			 default_mode->hdisplay, default_mode->vdisplay, default_mode->vrefresh);
> +	} else {
> +		igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes). Forcing mode.\n",
> +			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
> +			 igt_output_name(output), connector->count_modes);
> +	}
Previously the matching case returned immediately from inside the loop.
If that early return is removed without adding equivalent control flow,
then when a matching mode /is/found the function will still fall through
and print the "not supported" message afterward. In that case we would end
up logging both "Found matching mode" and "not supported" for the same
connector/mode pair.
>   }
>   
>   static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeInfo *mode, bool physical) {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> +	drmModeModeInfo fb_mode;
>   	struct igt_fb buffer[IGT_MAX_PIPES];
>   	igt_crc_t zero, captured[IGT_MAX_PIPES];
>   	int i = 0, num_pipes = 0;
>   	igt_crtc_t *crtc;
>   	int ret;
> -	bool has_supported_mode = false;
>   
>   	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
>   	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
> @@ -242,14 +250,26 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>   		crtc = data->crtc[i];
>   
>   		output = physical ? data->connected_output[i] : data->output[i];
> -		if (!output || !output_mode_supported(output, mode)) {
> +		if (!output)
>   			continue;
> -		}
>   
> -		force_output_mode(data, output, mode);
> +		output_mode_supported(output, mode);
> +
> +		/*
> +		 * On fixed mode panels trying to force a custom mode can lead to failures or
> +		 * implicit handling where the default mode is used even though custom mode is requested.
> +		 * To avoid this use default mode on fixed mode panels and
> +		 * use custom modes only on external panels.
> +		 */
> +		if (output_is_internal_panel(output)) {
> +			fb_mode = *igt_output_get_mode(output);
> +		} else {
> +			force_output_mode(data, output, mode);
> +			fb_mode = *mode;
> +		}
For internal panels, the subtest will always run at the panel's native mode
regardless of what mode the subtest requested. So a subtest meant to stress
e.g. 4K@60 bandwidth will actually run at whatever the native eDP resolution
is. The test will pass but it won't be validating the bandwidth scenario the
subtest name implies.

For internal panels where the requested custom mode is not natively 
supported,
instead of silently falling back to the default mode, skip that output 
for that
specific subtest (also prefer external panel first to reduce skip's),
since the bandwidth scenario cannot actually be exercised on that panel.

I know we are doing this so we eventually have less skip's, but someone 
who won't
know this fact may have false sense of coverage (i.e we tested 4x4k).

Other alternative would be changing test description to state test 
exercise's standard
modes on external panel with default mode internal if present. This 
scenario is more likely as user will
have internal panel running along with some external display's connected.

Thanks and Regards
Kunal Joshi
>   
> -		igt_create_color_fb(display->drm_fd, mode->hdisplay,
> -				    mode->vdisplay, DRM_FORMAT_XRGB8888,
> +		igt_create_color_fb(display->drm_fd, fb_mode.hdisplay,
> +				    fb_mode.vdisplay, DRM_FORMAT_XRGB8888,
>   				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
>   				    &buffer[i]);
>   
> @@ -258,10 +278,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>   		igt_plane_set_fb(data->primary[i], &buffer[i]);
>   		igt_info("Assigning pipe %s to output %s with mode %s\n",
>   			 igt_crtc_name(crtc), igt_output_name(output),
> -			 mode->name);
> -		has_supported_mode = true;
> +			 fb_mode.name);
>   	}
> -	igt_skip_on_f(!has_supported_mode, "Unsupported mode for all pipes\n");
>   
>   	ret = igt_display_try_commit_atomic(display,
>   					    DRM_MODE_ATOMIC_ALLOW_MODESET |
> @@ -273,9 +291,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>   
>   	for (i = 0; i < n_crtcs; i++) {
>   		output = physical ? data->connected_output[i] : data->output[i];
> -		if (!output || !output_mode_supported(output, mode)) {
> +		if (!output)
>   			continue;
> -		}
>   
>   		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
>   		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
> @@ -284,7 +301,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
>   
>   	for (i = n_crtcs - 1; i >= 0; i--) {
>   		output = physical ? data->connected_output[i] : data->output[i];
> -		if (!output || !output_mode_supported(output, mode))
> +		if (!output)
>   			continue;
>   
>   		igt_remove_fb(display->drm_fd, &buffer[i]);
--------------beVV4dcShbwzgUTkXttzOrgp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Karthik,<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 07-04-2026 15:22, Karthik B S wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
      <pre wrap="" class="moz-quote-pre">Currently the test is rejecting all the outputs where the mode is not
matching. This is leading to excessive skips on configs wherer the tests
were passing previouly.

Instead of this, use default mode for fixed mode panels if the required
custom mode is not found. And use custom mode for external panels as
these are allowed and have also been passing previously.

Cc: Jason-JH Lin <a class="moz-txt-link-rfc2396E" href="mailto:jason-jh.lin@mediatek.com">&lt;jason-jh.lin@mediatek.com&gt;</a>
Cc: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
Signed-off-by: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>
---
 tests/kms_bw.c | 57 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 4df5c2cee..4a32ec811 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -186,14 +186,16 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 	igt_output_override_mode(output, mode);
 }
 
-static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
+/* Check if output has a matching mode and call it out if mode is being forced */
+static void output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)</pre>
    </blockquote>
    Since the function is now void and purely informational, the name<br>
    output_mode_supported no longer reflects what it does. Consider
    renaming
    <blockquote type="cite"
      cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
      <pre wrap="" class="moz-quote-pre">
 {
 	drmModeConnector *connector = output-&gt;config.connector;
+	drmModeModeInfo *default_mode;
 	int i;
 
 	/* Virtual/forced sinks support all modes */
 	if (!igt_output_is_connected(output))
-		return true;
+		return;
 
 	for (i = 0; i &lt; connector-&gt;count_modes; i++) {
 		drmModeModeInfo *conn_mode = &amp;connector-&gt;modes[i];
@@ -204,26 +206,32 @@ static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *m
 			igt_debug("Found matching mode for %dx%d@%dHz on %s\n",
 				  mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
 				  igt_output_name(output));
-			return true;
 		}
 	}
 
-	igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
-		 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
-		 igt_output_name(output), connector-&gt;count_modes);
-
-	return false;
+	if (output_is_internal_panel(output)) {
+		default_mode = igt_output_get_mode(output);
+		igt_info(<a class="moz-txt-link-rfc2396E" href="mailto:Mode%dx%d@%dHznotsupportedby%s(has%dmodes).\n">"Mode %dx%d@%dHz not supported by %s (has %d modes).\n"</a>
+			 "%s Default mode: %dx%d@%dHz\n",
+			 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
+			 igt_output_name(output), connector-&gt;count_modes, igt_output_name(output),
+			 default_mode-&gt;hdisplay, default_mode-&gt;vdisplay, default_mode-&gt;vrefresh);
+	} else {
+		igt_info(<a class="moz-txt-link-rfc2396E" href="mailto:Mode%dx%d@%dHznotsupportedby%s(has%dmodes).Forcingmode.\n">"Mode %dx%d@%dHz not supported by %s (has %d modes). Forcing mode.\n"</a>,
+			 mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;vrefresh,
+			 igt_output_name(output), connector-&gt;count_modes);
+	}</pre>
    </blockquote>
    <span>Previously the matching case returned immediately from inside
      the loop.<br>
      If that early return is removed without adding equivalent control
      flow,<br>
      then when a matching mode </span><em><span>is</span></em><span>
      found the function will still fall through<br>
      and print the "not supported" message afterward. In that case we
      would end<br>
      up logging both "Found matching mode" and "not supported" for the
      same<br>
      connector/mode pair.</span>
    <blockquote type="cite"
      cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
      <pre wrap="" class="moz-quote-pre">
 }
 
 static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeInfo *mode, bool physical) {
 	igt_display_t *display = &amp;data-&gt;display;
 	igt_output_t *output;
+	drmModeModeInfo fb_mode;
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
 	int i = 0, num_pipes = 0;
 	igt_crtc_t *crtc;
 	int ret;
-	bool has_supported_mode = false;
 
 	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -242,14 +250,26 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 		crtc = data-&gt;crtc[i];
 
 		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
-		force_output_mode(data, output, mode);
+		output_mode_supported(output, mode);
+
+		/*
+		 * On fixed mode panels trying to force a custom mode can lead to failures or
+		 * implicit handling where the default mode is used even though custom mode is requested.
+		 * To avoid this use default mode on fixed mode panels and
+		 * use custom modes only on external panels.
+		 */
+		if (output_is_internal_panel(output)) {
+			fb_mode = *igt_output_get_mode(output);
+		} else {
+			force_output_mode(data, output, mode);
+			fb_mode = *mode;
+		}</pre>
    </blockquote>
    For internal panels, the subtest will always run at the panel's
    native mode<br>
    regardless of what mode the subtest requested. So a subtest meant to
    stress<br>
    e.g. 4K@60 bandwidth will actually run at whatever the native eDP
    resolution<br>
    is. The test will pass but it won't be validating the bandwidth
    scenario the<br>
    subtest name implies.<br>
    <br>
    For internal panels where the requested custom mode is not natively
    supported,<br>
    instead of silently falling back to the default mode, skip that
    output for that<br>
    specific subtest (also prefer external panel first to reduce
    skip's),<br>
    since the bandwidth scenario cannot actually be exercised on that
    panel.<br>
    <br>
    I know we are doing this so we eventually have less skip's, but
    someone who won't<br>
    know this fact may have false sense of coverage (i.e we tested
    4x4k).<br>
    <br>
    Other alternative would be changing test description to state test
    exercise's standard<br>
    modes on external panel with default mode internal if present. This
    scenario is more likely as user will<br>
    have internal panel running along with some external display's
    connected.<br>
    <br>
    Thanks and Regards<br>
    Kunal Joshi
    <blockquote type="cite"
      cite="mid:20260407095234.1728691-1-karthik.b.s@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
-		igt_create_color_fb(display-&gt;drm_fd, mode-&gt;hdisplay,
-				    mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
+		igt_create_color_fb(display-&gt;drm_fd, fb_mode.hdisplay,
+				    fb_mode.vdisplay, DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
 				    &amp;buffer[i]);
 
@@ -258,10 +278,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 		igt_plane_set_fb(data-&gt;primary[i], &amp;buffer[i]);
 		igt_info("Assigning pipe %s to output %s with mode %s\n",
 			 igt_crtc_name(crtc), igt_output_name(output),
-			 mode-&gt;name);
-		has_supported_mode = true;
+			 fb_mode.name);
 	}
-	igt_skip_on_f(!has_supported_mode, "Unsupported mode for all pipes\n");
 
 	ret = igt_display_try_commit_atomic(display,
 					    DRM_MODE_ATOMIC_ALLOW_MODESET |
@@ -273,9 +291,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = 0; i &lt; n_crtcs; i++) {
 		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
 		igt_pipe_crc_collect_crc(data-&gt;pipe_crc[i], &amp;captured[i]);
 		igt_assert_f(!igt_check_crc_equal(&amp;zero, &amp;captured[i]),
@@ -284,7 +301,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = n_crtcs - 1; i &gt;= 0; i--) {
 		output = physical ? data-&gt;connected_output[i] : data-&gt;output[i];
-		if (!output || !output_mode_supported(output, mode))
+		if (!output)
 			continue;
 
 		igt_remove_fb(display-&gt;drm_fd, &amp;buffer[i]);
</pre>
    </blockquote>
  </body>
</html>

--------------beVV4dcShbwzgUTkXttzOrgp--
