Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AEED1037A
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 04:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7260F10E50D;
	Wed, 26 Nov 2025 04:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m54ltgar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E2110E50D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 04:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764131962; x=1795667962;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=n6lqeih6B4mgXlJFdDMkJYBcQZVp1H3610yCVa/PdoQ=;
 b=m54ltgarEoR01RO6YPScluks5Rktoe9kc5JCCswZhGdeTAlfIcnJJnwG
 4dBd/re/sN+SsLauq3R7AKzNQGO1V+Z8V5q1FUWHxq18SPz3VieF/9yeB
 En3xVS1EQqfCgWWvHBmcwhOYWZHQQbrv3H2X+bzin/rsl0Tg38YanWiQ0
 slMr/i0C0NeCwyfKzn0+2INi5LGAAIMXpblHtU6G2pR6L5RxrV12oOJK+
 yBLMOsk3sXEgh8zl9N5lKNxyQoqK2RfSOB7Z7CFgkP86er7e7Ss6CqiJx
 bTsR1EGtqUfhBWXK3yBs0YTQQhnlTr4YHis1HyimieRgw3AnCHMnZ3WIS w==;
X-CSE-ConnectionGUID: ufX7xX5PRue6ctfvbN8YOw==
X-CSE-MsgGUID: nhXPtnjkRNWTFHq0vJAZMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83552593"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208,217";a="83552593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 20:39:22 -0800
X-CSE-ConnectionGUID: HAxyQ/soQV+uLCfPAcZUSg==
X-CSE-MsgGUID: IiyNIif6TrKmArsuMvW6Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
 d="scan'208,217";a="197948228"
Received: from usiddi-mobl.gar.corp.intel.com (HELO [10.247.180.133])
 ([10.247.180.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 20:39:20 -0800
Content-Type: multipart/alternative;
 boundary="------------DVY76xz40Feo1NJhvThNh760"
Message-ID: <d981b68a-2a14-48bd-a198-6797a7b96921@intel.com>
Date: Wed, 26 Nov 2025 10:09:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7 residency
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251125134233.33376-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251125134233.33376-1-mohammed.thasleem@intel.com>
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
--------------DVY76xz40Feo1NJhvThNh760
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Thasleem,

On 25-11-2025 19:12, Mohammed Thasleem wrote:
> This test validates the dgfx Package G7 residency.
>
> v2: Move igt display reset outside loop. (Jeevan)
>      Add G7 residency check before test execution. (Jeevan)
>      Add 4k@144hz supported mode for G7 validation.
> v3: Rename set_output function name. (Kunal)
>      Move all calling functions from igt subset to test_package_g7. (Kunal)
>
> Signed-off-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_rpm.c | 145 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 144 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 1610404ff..9d948047b 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -131,6 +131,9 @@
>    *
>    * SUBTEST: system-suspend-idle
>    * Description: Validate suspend-to-idle (S0ix) functionality.
> + *
> + * SUBTEST: package-g7
> + * Description: Validate the package-g7 residency.
>    */
>   
>   #define MSR_PC8_RES	0x630
> @@ -146,6 +149,8 @@
>   #define STRIDE (WIDTH)
>   #define SIZE (HEIGHT * STRIDE)
>   
> +#define G7_RES_TIMEOUT 30000
> +
>   enum pc8_status {
>   	PC8_ENABLED,
>   	PC8_DISABLED
> @@ -163,6 +168,14 @@ enum plane_type {
>   	PLANE_CURSOR,
>   };
>   
> +static const struct {
> +	int w, h, hz;
> +	const char *name;
> +} prefers_mode[] = {
> +	{7680, 4320, 60,  "8K@60"},
> +	{3840, 2160, 144, "4K@144"},
> +};
> +
>   /* Wait flags */
>   #define DONT_WAIT	0
>   #define WAIT_STATUS	1
> @@ -181,7 +194,10 @@ struct mode_set_data {
>   	drmModeConnectorPtr connectors[MAX_CONNECTORS];
>   	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
>   	igt_display_t display;
> -
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	struct igt_fb fb_white;
>   	uint32_t devid;
>   	int fw_fd;
>   };
> @@ -1576,6 +1592,131 @@ static void pm_test_caching(void)
>   	gem_close(drm_fd, handle);
>   }
>   
> +static void set_prefered_mode(void)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +	bool mode_found = false;
> +	drmModeModeInfo *mode = NULL;
> +	drmModeConnectorPtr connector = NULL;
> +	igt_display_t *display = &ms_data.display;
> +
> +	igt_display_reset(display);
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		connector = output->config.connector;
> +
> +		if (connector->connection != DRM_MODE_CONNECTED)
> +			continue;
> +
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +

> +		for (int i = 0; i < output->config.connector->count_modes && !mode_found; i++) {
> +			mode = &output->config.connector->modes[i];
> +
> +			for (int j = 0; j < ARRAY_SIZE(prefers_mode); j++) {
> +				if (mode->hdisplay == prefers_mode[j].w &&
> +					mode->vdisplay == prefers_mode[j].h &&
> +					mode->vrefresh == prefers_mode[j].hz) {
> +
> +					igt_output_override_mode(output, mode);
> +					ms_data.output = output;
> +					ms_data.mode = igt_output_get_mode(output);
> +					ms_data.primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +					mode_found = true;
> +					break;
> +				}
> +			}
> +		}
> +		if (mode_found)
> +			break;
Move this to a function is_preferred_mode_present or something
if (is_preferred_mode_present(output,....)) {
mode_found = true;     break;
}
> +	}
> +
> +	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode on any connected output\n");
> +}
> +
> +static void setup_output_fb(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_create_color_fb(drm_fd,
> +			    ms_data.mode->hdisplay, ms_data.mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 1.0, 1.0,
> +			    &ms_data.fb_white);
> +	igt_plane_set_fb(ms_data.primary, &ms_data.fb_white);
> +
> +	igt_display_commit(&ms_data.display);
> +}
> +
> +static void has_g7_support(void)
> +{
> +	char buf[256];
> +
> +	igt_require_f(igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf)) >= 0 &&
> +		      strstr(buf, "Package G7"), "Package G7 is not supported\n");
> +}
> +
> +static uint64_t get_pkg_count(char *pkg_data)
> +{
> +	char *e;
> +	long long ret;
> +	char *s = strchr(pkg_data, ':');
> +
> +	igt_assert(s);
> +	s++;
> +	ret = strtol(s, &e, 10);
> +	igt_assert(((ret != LLONG_MIN && ret != LLONG_MAX) || errno != ERANGE) && e > s && *e == '\n' && ret >= 0);
> +
> +	return ret;
> +}
> +
> +static uint64_t read_g7(void)
> +{
> +	char buf[256];
> +	int ret;
> +	char *str;
> +
> +	ret = igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies file not present.\n");
> +
> +	str = strstr(buf, "Package G7");
> +	igt_skip_on_f(!str, "Package G7 is not supported.\n");
> +
> +	return get_pkg_count(str);
> +}
> +
> +static void test_g7(void)
> +{
> +	uint64_t prev_count = 0;
> +
> +	prev_count = read_g7();
> +	/* 30 sec timeout, based on trial statistics, is safe for G7 entry. */
> +	igt_assert_f(igt_wait(read_g7() > prev_count, G7_RES_TIMEOUT, 100),
> +		     "Package G7 residency is not achived\n");
> +}
> +
> +static void cleanup(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_output_override_mode(ms_data.output, NULL);
> +	igt_display_commit(&ms_data.display);
Why is this commit needed here?

Thanks and Regards
Kunal Joshi
> +	igt_remove_fb(drm_fd, &ms_data.fb_white);
> +}
> +
> +static void test_package_g7(void)
> +{
> +	has_g7_support();
> +	set_prefered_mode();
> +	setup_output_fb();
> +	test_g7();
> +	cleanup();
> +}
> +
>   int rounds = 10;
>   bool stay = false;
>   
> @@ -1703,6 +1844,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		gem_require_mappable_ggtt(drm_fd);
>   		pm_test_caching();
>   	}
> +	igt_subtest("package-g7")
> +		test_package_g7();
>   
>   	igt_fixture {
>   		teardown_environment();
--------------DVY76xz40Feo1NJhvThNh760
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Thasleem,<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 25-11-2025 19:12, Mohammed Thasleem
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">This test validates the dgfx Package G7 residency.

v2: Move igt display reset outside loop. (Jeevan)
    Add G7 residency check before test execution. (Jeevan)
    Add 4k@144hz supported mode for G7 validation.
v3: Rename set_output function name. (Kunal)
    Move all calling functions from igt subset to test_package_g7. (Kunal)

Signed-off-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
---
 tests/intel/kms_pm_rpm.c | 145 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 144 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 1610404ff..9d948047b 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -131,6 +131,9 @@
  *
  * SUBTEST: system-suspend-idle
  * Description: Validate suspend-to-idle (S0ix) functionality.
+ *
+ * SUBTEST: package-g7
+ * Description: Validate the package-g7 residency.
  */
 
 #define MSR_PC8_RES	0x630
@@ -146,6 +149,8 @@
 #define STRIDE (WIDTH)
 #define SIZE (HEIGHT * STRIDE)
 
+#define G7_RES_TIMEOUT 30000
+
 enum pc8_status {
 	PC8_ENABLED,
 	PC8_DISABLED
@@ -163,6 +168,14 @@ enum plane_type {
 	PLANE_CURSOR,
 };
 
+static const struct {
+	int w, h, hz;
+	const char *name;
+} prefers_mode[] = {
+	{7680, 4320, 60,  "8K@60"},
+	{3840, 2160, 144, "4K@144"},
+};
+
 /* Wait flags */
 #define DONT_WAIT	0
 #define WAIT_STATUS	1
@@ -181,7 +194,10 @@ struct mode_set_data {
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
 	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
 	igt_display_t display;
-
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	struct igt_fb fb_white;
 	uint32_t devid;
 	int fw_fd;
 };
@@ -1576,6 +1592,131 @@ static void pm_test_caching(void)
 	gem_close(drm_fd, handle);
 }
 
+static void set_prefered_mode(void)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+	bool mode_found = false;
+	drmModeModeInfo *mode = NULL;
+	drmModeConnectorPtr connector = NULL;
+	igt_display_t *display = &amp;ms_data.display;
+
+	igt_display_reset(display);
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		connector = output-&gt;config.connector;
+
+		if (connector-&gt;connection != DRM_MODE_CONNECTED)
+			continue;
+
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+</pre>
    </blockquote>
    <br>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+		for (int i = 0; i &lt; output-&gt;config.connector-&gt;count_modes &amp;&amp; !mode_found; i++) {
+			mode = &amp;output-&gt;config.connector-&gt;modes[i];
+
+			for (int j = 0; j &lt; ARRAY_SIZE(prefers_mode); j++) {
+				if (mode-&gt;hdisplay == prefers_mode[j].w &amp;&amp;
+					mode-&gt;vdisplay == prefers_mode[j].h &amp;&amp;
+					mode-&gt;vrefresh == prefers_mode[j].hz) {
+
+					igt_output_override_mode(output, mode);
+					ms_data.output = output;
+					ms_data.mode = igt_output_get_mode(output);
+					ms_data.primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+					mode_found = true;
+					break;
+				}
+			}
+		}
+		if (mode_found)
+			break;</pre>
    </blockquote>
    Move this to a function is_preferred_mode_present or something<br>
    if (is_preferred_mode_present(output,....)) {<br>
        <span style="white-space: pre-wrap">mode_found = true;
</span>    break;<br>
    }
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+	}
+
+	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode on any connected output\n");
+}
+
+static void setup_output_fb(void)
+{
+	igt_plane_set_fb(ms_data.primary, NULL);
+	igt_create_color_fb(drm_fd,
+			    ms_data.mode-&gt;hdisplay, ms_data.mode-&gt;vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    1.0, 1.0, 1.0,
+			    &amp;ms_data.fb_white);
+	igt_plane_set_fb(ms_data.primary, &amp;ms_data.fb_white);
+
+	igt_display_commit(&amp;ms_data.display);
+}
+
+static void has_g7_support(void)
+{
+	char buf[256];
+
+	igt_require_f(igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf)) &gt;= 0 &amp;&amp;
+		      strstr(buf, "Package G7"), "Package G7 is not supported\n");
+}
+
+static uint64_t get_pkg_count(char *pkg_data)
+{
+	char *e;
+	long long ret;
+	char *s = strchr(pkg_data, ':');
+
+	igt_assert(s);
+	s++;
+	ret = strtol(s, &amp;e, 10);
+	igt_assert(((ret != LLONG_MIN &amp;&amp; ret != LLONG_MAX) || errno != ERANGE) &amp;&amp; e &gt; s &amp;&amp; *e == '\n' &amp;&amp; ret &gt;= 0);
+
+	return ret;
+}
+
+static uint64_t read_g7(void)
+{
+	char buf[256];
+	int ret;
+	char *str;
+
+	ret = igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf, sizeof(buf));
+	igt_assert_f(ret &gt;= 0, "Debugfs dgfx_pkg_residencies file not present.\n");
+
+	str = strstr(buf, "Package G7");
+	igt_skip_on_f(!str, "Package G7 is not supported.\n");
+
+	return get_pkg_count(str);
+}
+
+static void test_g7(void)
+{
+	uint64_t prev_count = 0;
+
+	prev_count = read_g7();
+	/* 30 sec timeout, based on trial statistics, is safe for G7 entry. */
+	igt_assert_f(igt_wait(read_g7() &gt; prev_count, G7_RES_TIMEOUT, 100),
+		     "Package G7 residency is not achived\n");
+}
+
+static void cleanup(void)
+{
+	igt_plane_set_fb(ms_data.primary, NULL);
+	igt_output_override_mode(ms_data.output, NULL);
+	igt_display_commit(&amp;ms_data.display);</pre>
    </blockquote>
    Why is this commit needed here?<br>
    <br>
    Thanks and Regards<br>
    Kunal Joshi
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+	igt_remove_fb(drm_fd, &amp;ms_data.fb_white);
+}
+
+static void test_package_g7(void)
+{
+	has_g7_support();
+	set_prefered_mode();
+	setup_output_fb();
+	test_g7();
+	cleanup();
+}
+
 int rounds = 10;
 bool stay = false;
 
@@ -1703,6 +1844,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		gem_require_mappable_ggtt(drm_fd);
 		pm_test_caching();
 	}
+	igt_subtest("package-g7")
+		test_package_g7();
 
 	igt_fixture {
 		teardown_environment();
</pre>
    </blockquote>
  </body>
</html>

--------------DVY76xz40Feo1NJhvThNh760--
