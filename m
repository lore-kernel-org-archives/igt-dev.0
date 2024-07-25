Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AFFC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 09:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7635A10E03F;
	Thu, 25 Jul 2024 09:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvHatiDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C11810E03F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721898723; x=1753434723;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=MWB5emv6YchkItSh8BLTqlQGXr684YJpkzkpUo14ItA=;
 b=MvHatiDcMELjJw1lGpLpDlhPB4+VUwJlby7z5R/ilsKfQehmp52DZ7WB
 jE7tToOudBJrRvprqEOSQ7RQo8g54EAy1CxZt0qO54hzvI0XILdRFe1lm
 cfuM4wg6I/sO1m1jv/rPPjtdtXC+3RecXDzCCYrsEzDzZb7QyX28BBFm3
 bifb40W+uEKcKc3j/r1K5xVNehoFtFWFpgMvWqUVyJLJLBM2i7u7RNS7k
 /J8DkH5oC8uDlClsgTWTbXDSmFmy/B05wBn/Eh7Lo7xxgD5POQas7g9DY
 rKoBe+kD4iAXc+LQhwy2eLOxeNeOIm1BNapSSr3rUHQ3zkRk3vM3YgdNR A==;
X-CSE-ConnectionGUID: Q5r1HgB3QDCDooo6mwOqtw==
X-CSE-MsgGUID: foYgyCYORIyu17na4DgXHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19315352"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208,217";a="19315352"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 02:12:02 -0700
X-CSE-ConnectionGUID: aW96bPWEQaurUta9zN8kWg==
X-CSE-MsgGUID: 9xHg8MGHSgylkXsnP+1Uaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208,217";a="76078593"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.250.237])
 ([10.247.250.237])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 02:12:00 -0700
Content-Type: multipart/alternative;
 boundary="------------pw5XUq735tiUhb3lQ07ahXed"
Message-ID: <194ccdf6-001f-4e98-8518-aefe70c92510@intel.com>
Date: Thu, 25 Jul 2024 14:41:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,2/2] tests/kms_vrr: Add new test to validate LOBF
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com
References: <20240723042850.2651902-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240723042850.2651902-3-jeevan.b@intel.com>
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
--------------pw5XUq735tiUhb3lQ07ahXed
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jeevan,

On 7/23/2024 9:58 AM, Jeevan B wrote:
> Validate pseudo static refresh rate changes in the VRR with
> fixed refresh rate framework for non-psr scenarios.
>
> v2: Add PR check.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 56 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 7e8885f16..d45d38657 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -31,12 +31,18 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_psr.h"
>   #include "i915/intel_drrs.h"
>   #include "sw_sync.h"
>   #include <fcntl.h>
>   #include <signal.h>
>   
>   /**
> + * SUBTEST: lobf
> + * Description: Test to validate link-off between active frames in non-psr
> + *              operation
> + * Functionality: LOBF
> + *
>    * SUBTEST: cmrr
>    * Description: Test to validate the content rate to exactly match with the
>    * 		requested rate without any frame drops.
> @@ -106,7 +112,8 @@ enum {
>   	TEST_FASTSET = 1 << 7,
>   	TEST_MAXMIN = 1 << 8,
>   	TEST_CMRR = 1 << 9,
> -	TEST_NEGATIVE = 1 << 10,
> +	TEST_LINK_OFF = 1 << 10,
> +	TEST_NEGATIVE = 1 << 11,
>   };
>   
>   enum {
> @@ -129,6 +136,7 @@ typedef struct vtest_ns {
>   typedef struct data {
>   	igt_display_t display;
>   	int drm_fd;
> +	int debugfs_fd;
>   	igt_plane_t *primary;
>   	igt_fb_t fb[2];
>   	range_t range;
> @@ -784,6 +792,44 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	}
>   }
>   
> +static void
> +test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	bool change_mode = false;
> +	time_t startTime = time(NULL);
> +	time_t secs = 4, change_time = 3;
> +	igt_plane_t *primary;
> +	drmModeModeInfo mode = *igt_output_get_mode(output);
> +
> +	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
> +		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
> +
> +	igt_require(output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP);
> +	igt_require(!igt_get_i915_edp_lobf_status(data->drm_fd, output->name));
> +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
> +		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1, 1, 1, &data->fb[0]);
> +
> +	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +
> +	while (time(NULL) - startTime < secs) {
> +		igt_plane_set_fb(primary, &data->fb[0]);
> +		igt_display_commit(&data->display);
> +		if (!change_mode && time(NULL) - startTime >= change_time) {
> +			igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
> +			change_time = true;
> +		}
> +	}
>
> Consider we have very less difference between LOW_RR and HIGH_RR,
> Will we still get sufficienct extended vblank to always turn the link off?
>
> @Animesh can you also clarify here if we somehow can know exact time required to do link off?
>
> +
> +	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> +		     "LOBF not enabled\n");
> +}
> +
>   static void
>   test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
> @@ -973,6 +1019,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   {
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>   
>   		kmstest_set_vt_graphics_mode();
>   
> @@ -1030,13 +1077,20 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>   			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   
> -		igt_describe("Test to validate the the content rate exactly match with the "
> +		igt_describe("Test to validate the content rate exactly match with the "
>   			     "requested rate without any frame drops.");
>   		igt_subtest_with_dynamic("cmrr") {
>   			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
>   
>   			run_vrr_test(&data, test_cmrr, TEST_CMRR);
>   		}
> +		igt_describe("Test to validate the link-off between active frames in "
> +			     "non-PSR operation.");
> +		igt_subtest_with_dynamic("lobf") {
> +			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
> +
> +			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
> +		}
>   	}
>   
>   	igt_fixture {
Thanks and Regards
Kunal Joshi
--------------pw5XUq735tiUhb3lQ07ahXed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Jeevan,<br>
    </p>
    <div class="moz-cite-prefix">On 7/23/2024 9:58 AM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Validate pseudo static refresh rate changes in the VRR with
fixed refresh rate framework for non-psr scenarios.

v2: Add PR check.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_vrr.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7e8885f16..d45d38657 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -31,12 +31,18 @@
  */
 
 #include "igt.h"
+#include "igt_psr.h"
 #include "i915/intel_drrs.h"
 #include "sw_sync.h"
 #include &lt;fcntl.h&gt;
 #include &lt;signal.h&gt;
 
 /**
+ * SUBTEST: lobf
+ * Description: Test to validate link-off between active frames in non-psr
+ *              operation
+ * Functionality: LOBF
+ *
  * SUBTEST: cmrr
  * Description: Test to validate the content rate to exactly match with the
  * 		requested rate without any frame drops.
@@ -106,7 +112,8 @@ enum {
 	TEST_FASTSET = 1 &lt;&lt; 7,
 	TEST_MAXMIN = 1 &lt;&lt; 8,
 	TEST_CMRR = 1 &lt;&lt; 9,
-	TEST_NEGATIVE = 1 &lt;&lt; 10,
+	TEST_LINK_OFF = 1 &lt;&lt; 10,
+	TEST_NEGATIVE = 1 &lt;&lt; 11,
 };
 
 enum {
@@ -129,6 +136,7 @@ typedef struct vtest_ns {
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
+	int debugfs_fd;
 	igt_plane_t *primary;
 	igt_fb_t fb[2];
 	range_t range;
@@ -784,6 +792,44 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
+static void
+test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	bool change_mode = false;
+	time_t startTime = time(NULL);
+	time_t secs = 4, change_time = 3;
+	igt_plane_t *primary;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+
+	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
+		 output-&gt;name, kmstest_pipe_name(pipe), data-&gt;range.min, data-&gt;range.max);
+
+	igt_require(output-&gt;config.connector-&gt;connector_type == DRM_MODE_CONNECTOR_eDP);
+	igt_require(!igt_get_i915_edp_lobf_status(data-&gt;drm_fd, output-&gt;name));
+	if (psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PSR_MODE_1, NULL) ||
+	    psr_sink_support(data-&gt;drm_fd, data-&gt;debugfs_fd, PR_MODE, NULL))
+		psr_disable(data-&gt;drm_fd, data-&gt;debugfs_fd, NULL);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_color_fb(data-&gt;drm_fd, mode.hdisplay, mode.vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1, 1, 1, &amp;data-&gt;fb[0]);
+
+	igt_output_override_mode(output, &amp;data-&gt;switch_modes[HIGH_RR_MODE]);
+
+	while (time(NULL) - startTime &lt; secs) {
+		igt_plane_set_fb(primary, &amp;data-&gt;fb[0]);
+		igt_display_commit(&amp;data-&gt;display);
+		if (!change_mode &amp;&amp; time(NULL) - startTime &gt;= change_time) {
+			igt_output_override_mode(output, &amp;data-&gt;switch_modes[LOW_RR_MODE]);
+			change_time = true;
+		}
+	}

Consider we have very less difference between LOW_RR and HIGH_RR,
Will we still get sufficienct extended vblank to always turn the link off?

@Animesh can you also clarify here if we somehow can know exact time required to do link off?

+
+	igt_assert_f(igt_get_i915_edp_lobf_status(data-&gt;drm_fd, output-&gt;name),
+		     "LOBF not enabled\n");
+}
+
 static void
 test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
@@ -973,6 +1019,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &amp;data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 
@@ -1030,13 +1077,20 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &amp;data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&amp;data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
-		igt_describe("Test to validate the the content rate exactly match with the "
+		igt_describe("Test to validate the content rate exactly match with the "
 			     "requested rate without any frame drops.");
 		igt_subtest_with_dynamic("cmrr") {
 			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) &gt;= 20);
 
 			run_vrr_test(&amp;data, test_cmrr, TEST_CMRR);
 		}
+		igt_describe("Test to validate the link-off between active frames in "
+			     "non-PSR operation.");
+		igt_subtest_with_dynamic("lobf") {
+			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) &gt;= 20);
+
+			run_vrr_test(&amp;data, test_lobf, TEST_LINK_OFF);
+		}
 	}
 
 	igt_fixture {</pre>
    </blockquote>
    Thanks and Regards<br>
    Kunal Joshi<span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------pw5XUq735tiUhb3lQ07ahXed--
