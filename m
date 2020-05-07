Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF22A6E02E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 06:15:49 +0000 (UTC)
References: <20200505132032.827-1-anshuman.gupta@intel.com>
 <20200505132032.827-7-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <ce57e944-255b-ab17-3974-f60d284fa90d@intel.com>
Date: Thu, 7 May 2020 11:45:43 +0530
MIME-Version: 1.0
In-Reply-To: <20200505132032.827-7-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v6 6/6] tests/i915_pm_rpm: lpsp/non-lpsp
 screen mode_set_data
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0705196194=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0705196194==
Content-Type: multipart/alternative;
 boundary="------------3193EECBDFAA10DB837745D8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3193EECBDFAA10DB837745D8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 05-05-2020 18:50, Anshuman Gupta wrote:
> Initialize the mode set params for lpsp/non-lpsp screen
> based upon their output lpsp capability instead
> of edp/non-edp output type.
>
> v2:
> - CI failures fixup.
> v3:
> - changes according to lib function igt_output_is_lpsp_capable
>    prefix chnaged to i915_output_is_lpsp_capable.
>
> Acked-by: Martin Peres <martin.peres@linux.intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Changes looks good to me.
Reviewed-by: Animesh Manna <animesh.manna@intel.com>

> ---
>   tests/i915/i915_pm_rpm.c | 53 +++++++++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 23 deletions(-)
>
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index fedef872..cb355a53 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -94,6 +94,7 @@ struct mode_set_data {
>   	drmModeResPtr res;
>   	drmModeConnectorPtr connectors[MAX_CONNECTORS];
>   	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
> +	igt_display_t display;
>   
>   	uint32_t devid;
>   };
> @@ -254,29 +255,29 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
>   {
>   	drmModeConnectorPtr connector = NULL;
>   	drmModeModeInfoPtr mode = NULL;
> +	igt_output_t *output = NULL;
> +	igt_display_t *display = &data->display;
>   
> -	if (!data->res)
> +	if (!data->res || !display)
>   		return false;
>   
> -	for (int i = 0; i < data->res->count_connectors; i++) {
> -		drmModeConnectorPtr c = data->connectors[i];
> +	for_each_connected_output(display, output) {
> +		drmModeConnectorPtr c = output->config.connector;
>   
>   		if (type == SCREEN_TYPE_LPSP &&
> -		    c->connector_type != DRM_MODE_CONNECTOR_eDP)
> +		     !i915_output_is_lpsp_capable(drm_fd, output))
>   			continue;
>   
>   		if (type == SCREEN_TYPE_NON_LPSP &&
> -		    c->connector_type == DRM_MODE_CONNECTOR_eDP)
> +		    i915_output_is_lpsp_capable(drm_fd, output))
>   			continue;
>   
> -		if (c->connection == DRM_MODE_CONNECTED && c->count_modes) {
> -			connector = c;
> -			mode = &c->modes[0];
> -			break;
> -		}
> +		connector = c;
> +		mode = igt_output_get_mode(output);
> +		break;
>   	}
>   
> -	if (!connector)
> +	if (!connector || !mode)
>   		return false;
>   
>   	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay,
> @@ -397,6 +398,7 @@ static void init_mode_set_data(struct mode_set_data *data)
>   		kmstest_set_vt_graphics_mode();
>   	}
>   
> +	igt_display_require(&data->display, drm_fd);
>   	data->devid = intel_get_drm_devid(drm_fd);
>   	init_modeset_cached_params(&ms_data);
>   }
> @@ -410,6 +412,8 @@ static void fini_mode_set_data(struct mode_set_data *data)
>   		}
>   		drmModeFreeResources(data->res);
>   	}
> +
> +	igt_display_fini(&data->display);
>   }
>   
>   static void get_drm_info(struct compare_data *data)
> @@ -760,7 +764,7 @@ static void dump_file(int dir, const char *filename)
>   	free(contents);
>   }
>   
> -static bool setup_environment(void)
> +static bool setup_environment(bool display_disabled)
>   {
>   	if (has_runtime_pm)
>   		goto out;
> @@ -772,7 +776,8 @@ static bool setup_environment(void)
>   	debugfs = igt_debugfs_dir(drm_fd);
>   	igt_require(debugfs != -1);
>   
> -	init_mode_set_data(&ms_data);
> +	if (!display_disabled)
> +		init_mode_set_data(&ms_data);
>   
>   	igt_pm_enable_sata_link_power_management();
>   
> @@ -785,13 +790,14 @@ static bool setup_environment(void)
>   	igt_require(igt_pm_dmc_loaded(debugfs));
>   
>   out:
> -	disable_all_screens(&ms_data);
> +	if (!display_disabled)
> +		disable_all_screens(&ms_data);
>   	dump_file(debugfs, "i915_runtime_pm_status");
>   
>   	return wait_for_suspended();
>   }
>   
> -static void teardown_environment(void)
> +static void teardown_environment(bool display_disabled)
>   {
>   	close(msr_fd);
>   	if (has_pc8)
> @@ -801,7 +807,8 @@ static void teardown_environment(void)
>   
>   	igt_pm_restore_sata_link_power_management();
>   
> -	fini_mode_set_data(&ms_data);
> +	if (!display_disabled)
> +		fini_mode_set_data(&ms_data);
>   
>   	close(debugfs);
>   	close(drm_fd);
> @@ -2004,7 +2011,7 @@ static struct option long_options[] = {
>   igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	igt_subtest("basic-rte") {
> -		igt_assert(setup_environment());
> +		igt_assert(setup_environment(false));
>   		basic_subtest();
>   	}
>   
> @@ -2012,7 +2019,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	 * PC8+. We don't want bug reports from cases where the machine is just
>   	 * not properly configured. */
>   	igt_fixture
> -		igt_require(setup_environment());
> +		igt_require(setup_environment(false));
>   
>   	if (stay)
>   		igt_subtest("stay")
> @@ -2142,7 +2149,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	}
>   
>   	igt_fixture
> -		teardown_environment();
> +		teardown_environment(false);
>   
>   	igt_subtest("module-reload") {
>   		igt_debug("Reload w/o display\n");
> @@ -2151,9 +2158,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
>   		igt_assert_eq(igt_i915_driver_load("disable_display=1 mmio_debug=-1"), 0);
>   
> -		igt_assert(setup_environment());
> +		igt_assert(setup_environment(true));
>   		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
> -		teardown_environment();
> +		teardown_environment(true);
>   
>   		igt_debug("Reload as normal\n");
>   		igt_i915_driver_unload();
> @@ -2161,11 +2168,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
>   		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
>   
> -		igt_assert(setup_environment());
> +		igt_assert(setup_environment(false));
>   		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
>   		if (enable_one_screen_with_type(&ms_data, SCREEN_TYPE_ANY))
>   			drm_resources_equal_subtest();
> -		teardown_environment();
> +		teardown_environment(false);
>   
>   		/* Remove our mmio_debugging module */
>   		igt_i915_driver_unload();

--------------3193EECBDFAA10DB837745D8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-05-2020 18:50, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200505132032.827-7-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">Initialize the mode set params for lpsp/non-lpsp screen
based upon their output lpsp capability instead
of edp/non-edp output type.

v2:
- CI failures fixup.
v3:
- changes according to lib function igt_output_is_lpsp_capable
  prefix chnaged to i915_output_is_lpsp_capable.

Acked-by: Martin Peres <a class="moz-txt-link-rfc2396E" href="mailto:martin.peres@linux.intel.com">&lt;martin.peres@linux.intel.com&gt;</a>
Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a></pre>
    </blockquote>
    <pre>Changes looks good to me.
Reviewed-by: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20200505132032.827-7-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 tests/i915/i915_pm_rpm.c | 53 +++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index fedef872..cb355a53 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -94,6 +94,7 @@ struct mode_set_data {
 	drmModeResPtr res;
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
 	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
+	igt_display_t display;
 
 	uint32_t devid;
 };
@@ -254,29 +255,29 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
 {
 	drmModeConnectorPtr connector = NULL;
 	drmModeModeInfoPtr mode = NULL;
+	igt_output_t *output = NULL;
+	igt_display_t *display = &amp;data-&gt;display;
 
-	if (!data-&gt;res)
+	if (!data-&gt;res || !display)
 		return false;
 
-	for (int i = 0; i &lt; data-&gt;res-&gt;count_connectors; i++) {
-		drmModeConnectorPtr c = data-&gt;connectors[i];
+	for_each_connected_output(display, output) {
+		drmModeConnectorPtr c = output-&gt;config.connector;
 
 		if (type == SCREEN_TYPE_LPSP &amp;&amp;
-		    c-&gt;connector_type != DRM_MODE_CONNECTOR_eDP)
+		     !i915_output_is_lpsp_capable(drm_fd, output))
 			continue;
 
 		if (type == SCREEN_TYPE_NON_LPSP &amp;&amp;
-		    c-&gt;connector_type == DRM_MODE_CONNECTOR_eDP)
+		    i915_output_is_lpsp_capable(drm_fd, output))
 			continue;
 
-		if (c-&gt;connection == DRM_MODE_CONNECTED &amp;&amp; c-&gt;count_modes) {
-			connector = c;
-			mode = &amp;c-&gt;modes[0];
-			break;
-		}
+		connector = c;
+		mode = igt_output_get_mode(output);
+		break;
 	}
 
-	if (!connector)
+	if (!connector || !mode)
 		return false;
 
 	igt_create_pattern_fb(drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay,
@@ -397,6 +398,7 @@ static void init_mode_set_data(struct mode_set_data *data)
 		kmstest_set_vt_graphics_mode();
 	}
 
+	igt_display_require(&amp;data-&gt;display, drm_fd);
 	data-&gt;devid = intel_get_drm_devid(drm_fd);
 	init_modeset_cached_params(&amp;ms_data);
 }
@@ -410,6 +412,8 @@ static void fini_mode_set_data(struct mode_set_data *data)
 		}
 		drmModeFreeResources(data-&gt;res);
 	}
+
+	igt_display_fini(&amp;data-&gt;display);
 }
 
 static void get_drm_info(struct compare_data *data)
@@ -760,7 +764,7 @@ static void dump_file(int dir, const char *filename)
 	free(contents);
 }
 
-static bool setup_environment(void)
+static bool setup_environment(bool display_disabled)
 {
 	if (has_runtime_pm)
 		goto out;
@@ -772,7 +776,8 @@ static bool setup_environment(void)
 	debugfs = igt_debugfs_dir(drm_fd);
 	igt_require(debugfs != -1);
 
-	init_mode_set_data(&amp;ms_data);
+	if (!display_disabled)
+		init_mode_set_data(&amp;ms_data);
 
 	igt_pm_enable_sata_link_power_management();
 
@@ -785,13 +790,14 @@ static bool setup_environment(void)
 	igt_require(igt_pm_dmc_loaded(debugfs));
 
 out:
-	disable_all_screens(&amp;ms_data);
+	if (!display_disabled)
+		disable_all_screens(&amp;ms_data);
 	dump_file(debugfs, "i915_runtime_pm_status");
 
 	return wait_for_suspended();
 }
 
-static void teardown_environment(void)
+static void teardown_environment(bool display_disabled)
 {
 	close(msr_fd);
 	if (has_pc8)
@@ -801,7 +807,8 @@ static void teardown_environment(void)
 
 	igt_pm_restore_sata_link_power_management();
 
-	fini_mode_set_data(&amp;ms_data);
+	if (!display_disabled)
+		fini_mode_set_data(&amp;ms_data);
 
 	close(debugfs);
 	close(drm_fd);
@@ -2004,7 +2011,7 @@ static struct option long_options[] = {
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	igt_subtest("basic-rte") {
-		igt_assert(setup_environment());
+		igt_assert(setup_environment(false));
 		basic_subtest();
 	}
 
@@ -2012,7 +2019,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	 * PC8+. We don't want bug reports from cases where the machine is just
 	 * not properly configured. */
 	igt_fixture
-		igt_require(setup_environment());
+		igt_require(setup_environment(false));
 
 	if (stay)
 		igt_subtest("stay")
@@ -2142,7 +2149,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture
-		teardown_environment();
+		teardown_environment(false);
 
 	igt_subtest("module-reload") {
 		igt_debug("Reload w/o display\n");
@@ -2151,9 +2158,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
 		igt_assert_eq(igt_i915_driver_load("disable_display=1 mmio_debug=-1"), 0);
 
-		igt_assert(setup_environment());
+		igt_assert(setup_environment(true));
 		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
-		teardown_environment();
+		teardown_environment(true);
 
 		igt_debug("Reload as normal\n");
 		igt_i915_driver_unload();
@@ -2161,11 +2168,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
 		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
 
-		igt_assert(setup_environment());
+		igt_assert(setup_environment(false));
 		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
 		if (enable_one_screen_with_type(&amp;ms_data, SCREEN_TYPE_ANY))
 			drm_resources_equal_subtest();
-		teardown_environment();
+		teardown_environment(false);
 
 		/* Remove our mmio_debugging module */
 		igt_i915_driver_unload();
</pre>
    </blockquote>
  </body>
</html>

--------------3193EECBDFAA10DB837745D8--

--===============0705196194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0705196194==--
