Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537C189A1A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 11:01:22 +0000 (UTC)
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
 <20200409053951.26929-4-anshuman.gupta@intel.com>
 <26fc49ab-bf41-41e4-d3ff-5d7455d64b79@intel.com>
 <20200417152850.GM5533@intel.com>
 <798f4455-63ec-fba1-352c-a46d04b86880@intel.com>
 <20200417164440.GO5533@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <2365a5a2-29b4-5cf9-4b17-91ade3e0c06a@intel.com>
Date: Mon, 20 Apr 2020 16:31:14 +0530
MIME-Version: 1.0
In-Reply-To: <20200417164440.GO5533@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v5 3/5] tests/i915_pm_lpsp: lpsp
 platform agnostic support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0263615363=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org, jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0263615363==
Content-Type: multipart/alternative;
 boundary="------------E1D57C1F27AEE98F0C776EDE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E1D57C1F27AEE98F0C776EDE
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit


On 17-04-2020 22:14, Anshuman Gupta wrote:
> On 2020-04-17 at 21:57:25 +0530, Manna, Animesh wrote:
>> On 17-04-2020 20:58, Anshuman Gupta wrote:
>>> On 2020-04-17 at 19:52:00 +0530, Manna, Animesh wrote:
>>>> On 09-04-2020 11:09, Anshuman Gupta wrote:
>>>>> Current implementation of lpsp igt test, assumed that every non-edp
>>>>> panel isn't a lpsp panel but it is not true on TGL anymore,
>>>>> any HDMI/DP/DSI panel connected on pipe A and connected to PORT_{A,B,C}
>>>>> can drive LPSP.
>>>>> Even on older Gen9 platform a DP panel can drive lpsp on Port A.
>>>>> This requires complete design change in current lpsp igt for a platform
>>>>> agnostic support.
>>>>>
>>>>> The new igt approach is relies on connector specific
>>>>> i915_lpsp_capability and i915_lpsp_status debugfs attributes,
>>>>> these debugfs exposes whether an output is capable of driving lpsp
>>>>> and lpsp is enabled.
>>>>>
>>>>> Nuking edp-native and non-edp test, introducing a new dynamic
>>>>> igt subtest kms-lpsp, which validates lpsp on each connected output
>>>>> and skip the subtest if output is not lpsp capable.
>>>>>
>>>>> v2:
>>>>> - CI failures fixup.
>>>>> v3:
>>>>> - removed unloading of snd_modules. [Martin]
>>>>> v4:
>>>>> - Don't test non-lpsp(if lpsp disabled), no ROI to test that.
>>>>> - nuke panel-fitter test.
>>>>> v5:
>>>>> - Added dynamic subtest and igt changes according to kernel
>>>>>    debugfs i915_lpsp_status changes.
>>>>>
>>>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>>> ---
>>>>>   tests/i915/i915_pm_lpsp.c | 285 +++++++++++++++-----------------------
>>>>>   1 file changed, 114 insertions(+), 171 deletions(-)
>>>>>
>>>>> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
>>>>> index 08f82e7c..7be23e6c 100644
>>>>> --- a/tests/i915/i915_pm_lpsp.c
>>>>> +++ b/tests/i915/i915_pm_lpsp.c
>>>>> @@ -25,210 +25,153 @@
>>>>>    */
>>>>>   #include "igt.h"
>>>>> +#include "igt_kmod.h"
>>>>> +#include "igt_pm.h"
>>>>> +#include "igt_sysfs.h"
>>>>>   #include <sys/types.h>
>>>>>   #include <sys/stat.h>
>>>>>   #include <fcntl.h>
>>>>>   #include <unistd.h>
>>>>> +#define MAX_SINK_LPSP_INFO_BUF_LEN	4096
>>>>> -static bool supports_lpsp(uint32_t devid)
>>>>> -{
>>>>> -	return IS_HASWELL(devid) || IS_BROADWELL(devid);
>>>>> -}
>>>>> +#define PWR_DOMAIN_INFO "i915_power_domain_info"
>>>>> -static bool lpsp_is_enabled(int drm_fd)
>>>>> +typedef struct {
>>>>> +	int drm_fd;
>>>>> +	int debugfs_fd;
>>>>> +	uint32_t devid;
>>>>> +	char *pwr_dmn_info;
>>>>> +	igt_display_t display;
>>>>> +	struct igt_fb fb;
>>>>> +	drmModeModeInfo *mode;
>>>>> +	igt_output_t *output;
>>>>> +} data_t;
>>>>> +
>>>>> +static bool lpsp_is_enabled(data_t *data)
>>>>>   {
>>>>> -	uint32_t val;
>>>>> +	char buf[MAX_SINK_LPSP_INFO_BUF_LEN];
>>>>> +	int len;
>>>>> -	val = INREG(HSW_PWR_WELL_CTL2);
>>>>> -	return !(val & HSW_PWR_WELL_STATE_ENABLED);
>>>>> -}
>>>>> +	len = igt_debugfs_simple_read(data->debugfs_fd, "i915_lpsp_status",
>>>>> +				      buf, sizeof(buf));
>>>>> +	if (len < 0)
>>>>> +		igt_assert_eq(len, -ENODEV);
>>>>> -/* The LPSP mode is all about an enabled pipe, but we expect to also be in the
>>>>> - * low power mode when no pipes are enabled, so do this check anyway. */
>>>>> -static void screens_disabled_subtest(int drm_fd, drmModeResPtr drm_res)
>>>>> -{
>>>>> -	kmstest_unset_all_crtcs(drm_fd, drm_res);
>>>>> -	igt_assert(lpsp_is_enabled(drm_fd));
>>>>> +	return strstr(buf, "LPSP: enabled");
>>>>>   }
>>>>> -static uint32_t create_fb(int drm_fd, int width, int height)
>>>>> +/*
>>>>> + * The LPSP mode is all about an enabled pipe, but we expect to also be in the
>>>>> + * low power mode when no pipes are enabled, so do this check anyway.
>>>>> + */
>>>> All pipe disabled in not same as lpsp. I feel the idea behind lpsp is single
>>>> pipe usage with least power consumption ... there maybe no display
>>>> connected.
>>> Yes you are correct that is the same above comment has mentioned that "LPSP mode
>>> is all about an enabled pipe", but here test method checks for lpsp when all screens
>>> are disbaled i.e. all crtc are disabled, that is almost same as there is no display
>>> connected with respect to power consumption.
>>>>> +static void screens_disabled_subtest(data_t *data)
>>>>>   {
>>>>> -	struct igt_fb fb;
>>>>> +	igt_output_t *output;
>>>>> +	int valid_output = 0;
>>>>> +	enum pipe pipe;
>>>>> +
>>>>> +	for_each_pipe_with_single_output(&data->display, pipe, output) {
>>>>> +		data->output = output;
>>>>> +		igt_output_set_pipe(data->output, PIPE_NONE);
>>>> Passing PIPE_NONE and testing lpsp maybe not the right thing here. We may
>>>> not have connector but need to enable a single pipe to test lpsp...  rt?
>>> PIPE_NONE commit will disbale a crtc, when all crtc gets disbaled, all power well
>>> except PG1 will be disbaled, PG1 is controlled by DMC.
>> I do not think DC9 is controlled by DMC, during all crtc disable driver will disable all power-well and enter into DC9, no role of DMC here ... am I missing anything?
> yes DC9 is not controlled by DMC, and i915 program DC9 in case of runtime suspend or system wide suspend, so DC9 a deeper state depends on i915 suspend, let's think about a use case when all CRTC are disabled but gem has valid run time usages count or let's say i915 device is always on i.e (/sys/bus/pci/devices/0000\:00\:02.0/power/control attribute in on), in those cases runtime status will be always active, so i think test method to validate PIPE_B associated power well is valid here when all crtc are disbaled i.e. all display are off.

As per the above example though DC9 is not triggered but all power-well will be disabled by driver as it is display engine specific. This is not lpsp.
Here valid testcase would be to check PG1 is enabled or not.

Regards,
Animesh

> We want validate a intermediate power state here, which is a valid use case.
> Please correct me if my thought process about test method is wrong.
> Thanks ,
> Anshuman Gupta.
>> Regards,
>> Animesh
>>
>>> So testing lpsp is here is one of the test case, i.e we want to test power well associated
>>> to PIPE_B should be turned off. There may be a bug in driver that when all crtc are disbaled
>>> PIPE_B  associated  power is not turned off, that is what this test validated.
>>> Enabling a pipe for lpsp will get covered in kms-lpsp test.
>>> Thanks,
>>> Anshuman Gupta.
>>>> Regards,
>>>>
>>>> Animesh
>>>>
>>>>> +		igt_display_commit(&data->display);
>>>>> +		valid_output++;
>>>>> +	}
>>>>> -	return igt_create_pattern_fb(drm_fd, width, height, DRM_FORMAT_XRGB8888,
>>>>> -				     LOCAL_DRM_FORMAT_MOD_NONE, &fb);
>>>>> +	igt_require_f(valid_output, "No connected output found\n");
>>>>> +	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
>>>>> +		     PWR_DOMAIN_INFO, data->pwr_dmn_info =
>>>>> +		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>>>>>   }
>>>>> -static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
>>>>> -			drmModeConnectorPtr *drm_connectors, uint32_t devid,
>>>>> -			bool use_panel_fitter)
>>>>> +static void setup_lpsp_output(data_t *data)
>>>>>   {
>>>>> -	int i, rc;
>>>>> -	uint32_t crtc_id = 0, buffer_id = 0;
>>>>> -	drmModeConnectorPtr connector = NULL;
>>>>> -	drmModeModeInfoPtr mode = NULL;
>>>>> -	drmModeModeInfo std_1024_mode = {
>>>>> -		.clock = 65000,
>>>>> -		.hdisplay = 1024,
>>>>> -		.hsync_start = 1048,
>>>>> -		.hsync_end = 1184,
>>>>> -		.htotal = 1344,
>>>>> -		.hskew = 0,
>>>>> -		.vdisplay = 768,
>>>>> -		.vsync_start = 771,
>>>>> -		.vsync_end = 777,
>>>>> -		.vtotal = 806,
>>>>> -		.vscan = 0,
>>>>> -		.vrefresh = 60,
>>>>> -		.flags = 0xA,
>>>>> -		.type = 0x40,
>>>>> -		.name = "Custom 1024x768",
>>>>> -	};
>>>>> -
>>>>> -	kmstest_unset_all_crtcs(drm_fd, drm_res);
>>>>> -
>>>>> -	for (i = 0; i < drm_res->count_connectors; i++) {
>>>>> -		drmModeConnectorPtr c = drm_connectors[i];
>>>>> -
>>>>> -		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
>>>>> -			continue;
>>>>> -		if (c->connection != DRM_MODE_CONNECTED)
>>>>> -			continue;
>>>>> -
>>>>> -		if (!use_panel_fitter && c->count_modes) {
>>>>> -			connector = c;
>>>>> -			mode = &c->modes[0];
>>>>> -			break;
>>>>> -		}
>>>>> -		if (use_panel_fitter) {
>>>>> -			connector = c;
>>>>> -
>>>>> -			/* This is one of the modes Xorg creates for panels, so
>>>>> -			 * it should work just fine. Notice that Gens that
>>>>> -			 * support LPSP are too new for panels with native
>>>>> -			 * 1024x768 resolution, so this should force the panel
>>>>> -			 * fitter. */
>>>>> -			igt_assert(c->count_modes &&
>>>>> -				   c->modes[0].hdisplay > 1024);
>>>>> -			igt_assert(c->count_modes &&
>>>>> -				   c->modes[0].vdisplay > 768);
>>>>> -			mode = &std_1024_mode;
>>>>> -			break;
>>>>> -		}
>>>>> -	}
>>>>> -	igt_require(connector);
>>>>> -
>>>>> -	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
>>>>> -						  0);
>>>>> -	buffer_id = create_fb(drm_fd, mode->hdisplay, mode->vdisplay);
>>>>> -
>>>>> -	igt_assert(buffer_id);
>>>>> -	igt_assert(connector);
>>>>> -	igt_assert(mode);
>>>>> -
>>>>> -	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
>>>>> -			    &connector->connector_id, 1, mode);
>>>>> -	igt_assert_eq(rc, 0);
>>>>> -
>>>>> -	if (use_panel_fitter) {
>>>>> -		if (IS_HASWELL(devid))
>>>>> -			igt_assert(!lpsp_is_enabled(drm_fd));
>>>>> -		else
>>>>> -			igt_assert(lpsp_is_enabled(drm_fd));
>>>>> -	} else {
>>>>> -		igt_assert(lpsp_is_enabled(drm_fd));
>>>>> -	}
>>>>> +	igt_plane_t *primary;
>>>>> +
>>>>> +	/* set output pipe = PIPE_A for LPSP */
>>>>> +	igt_output_set_pipe(data->output, PIPE_A);
>>>>> +	primary = igt_output_get_plane_type(data->output,
>>>>> +					    DRM_PLANE_TYPE_PRIMARY);
>>>>> +	igt_plane_set_fb(primary, NULL);
>>>>> +	igt_create_pattern_fb(data->drm_fd,
>>>>> +			      data->mode->hdisplay, data->mode->vdisplay,
>>>>> +			      DRM_FORMAT_XRGB8888,
>>>>> +			      LOCAL_DRM_FORMAT_MOD_NONE,
>>>>> +			      &data->fb);
>>>>> +	igt_plane_set_fb(primary, &data->fb);
>>>>> +	igt_display_commit(&data->display);
>>>>>   }
>>>>> -static void non_edp_subtest(int drm_fd, drmModeResPtr drm_res,
>>>>> -			    drmModeConnectorPtr *drm_connectors)
>>>>> +static void test_cleanup(data_t *data)
>>>>>   {
>>>>> -	int i, rc;
>>>>> -	uint32_t crtc_id = 0, buffer_id = 0;
>>>>> -	drmModeConnectorPtr connector = NULL;
>>>>> -	drmModeModeInfoPtr mode = NULL;
>>>>> -
>>>>> -	kmstest_unset_all_crtcs(drm_fd, drm_res);
>>>>> -
>>>>> -	for (i = 0; i < drm_res->count_connectors; i++) {
>>>>> -		drmModeConnectorPtr c = drm_connectors[i];
>>>>> -
>>>>> -		if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
>>>>> -			continue;
>>>>> -		if (c->connection != DRM_MODE_CONNECTED)
>>>>> -			continue;
>>>>> -
>>>>> -		if (c->count_modes) {
>>>>> -			connector = c;
>>>>> -			mode = &c->modes[0];
>>>>> -			break;
>>>>> -		}
>>>>> -	}
>>>>> -	igt_require(connector);
>>>>> -
>>>>> -	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
>>>>> -						  0);
>>>>> -	buffer_id = create_fb(drm_fd, mode->hdisplay, mode->vdisplay);
>>>>> -
>>>>> -	igt_assert(buffer_id);
>>>>> -	igt_assert(mode);
>>>>> -
>>>>> -	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
>>>>> -			    &connector->connector_id, 1, mode);
>>>>> -	igt_assert_eq(rc, 0);
>>>>> -
>>>>> -	igt_assert(!lpsp_is_enabled(drm_fd));
>>>>> +	igt_plane_t *primary;
>>>>> +
>>>>> +	if (!data->output || data->output->pending_pipe == PIPE_NONE)
>>>>> +		return;
>>>>> +
>>>>> +	primary = igt_output_get_plane_type(data->output,
>>>>> +					    DRM_PLANE_TYPE_PRIMARY);
>>>>> +	igt_plane_set_fb(primary, NULL);
>>>>> +	igt_output_set_pipe(data->output, PIPE_NONE);
>>>>> +	igt_display_commit(&data->display);
>>>>> +	igt_remove_fb(data->drm_fd, &data->fb);
>>>>> +	data->output = NULL;
>>>>>   }
>>>>> -#define MAX_CONNECTORS 32
>>>>> +static void test_lpsp(data_t *data)
>>>>> +{
>>>>> +	/* LPSP is low power single pipe usages i.e. PIPE_A */
>>>>> +	igt_require(igt_pipe_connector_valid(PIPE_A, data->output));
>>>>> +	igt_require_f(i915_output_is_lpsp_capable(data->drm_fd, data->output),
>>>>> +		      "output is not lpsp capable\n");
>>>>> +
>>>>> +	data->mode = igt_output_get_mode(data->output);
>>>>> +	setup_lpsp_output(data);
>>>>> +	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
>>>>> +		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
>>>>> +		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>>>>> +}
>>>>> -int drm_fd;
>>>>> -uint32_t devid;
>>>>> -drmModeResPtr drm_res;
>>>>> -drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
>>>>> -struct intel_mmio_data mmio_data;
>>>>> +IGT_TEST_DESCRIPTION("These tests validates display Low Power Single Pipe configurations");
>>>>>   igt_main
>>>>>   {
>>>>> -	igt_fixture {
>>>>> -		int i;
>>>>> -
>>>>> -		drm_fd = drm_open_driver_master(DRIVER_INTEL);
>>>>> -		igt_require(drm_fd >= 0);
>>>>> -
>>>>> -		devid = intel_get_drm_devid(drm_fd);
>>>>> -
>>>>> -		drm_res = drmModeGetResources(drm_fd);
>>>>> -		igt_require(drm_res);
>>>>> -		igt_assert(drm_res->count_connectors <= MAX_CONNECTORS);
>>>>> +	data_t data = {};
>>>>> -		for (i = 0; i < drm_res->count_connectors; i++)
>>>>> -			drm_connectors[i] = drmModeGetConnectorCurrent(drm_fd,
>>>>> -							drm_res->connectors[i]);
>>>>> +	igt_fixture {
>>>>> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
>>>>> +		igt_require(data.drm_fd >= 0);
>>>>> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>>>>> +		igt_require(data.debugfs_fd >= 0);
>>>>>   		igt_pm_enable_audio_runtime_pm();
>>>>> -
>>>>> -		igt_require(supports_lpsp(devid));
>>>>> -
>>>>> -		intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, drm_fd);
>>>>> -
>>>>>   		kmstest_set_vt_graphics_mode();
>>>>> +		data.devid = intel_get_drm_devid(data.drm_fd);
>>>>> +		igt_display_require(&data.display, data.drm_fd);
>>>>> +		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
>>>>>   	}
>>>>> +	igt_describe("This test validates lpsp while all crtc are disabled");
>>>>>   	igt_subtest("screens-disabled")
>>>>> -		screens_disabled_subtest(drm_fd, drm_res);
>>>>> -	igt_subtest("edp-native")
>>>>> -		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
>>>>> -	igt_subtest("non-edp")
>>>>> -		non_edp_subtest(drm_fd, drm_res, drm_connectors);
>>>>> +		screens_disabled_subtest(&data);
>>>>> -	igt_fixture {
>>>>> -		int i;
>>>>> +	igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
>>>>> +	igt_subtest_with_dynamic_f("kms-lpsp") {
>>>>> +		igt_display_t *display = &data.display;
>>>>> +		igt_output_t *output;
>>>>> -		intel_register_access_fini(&mmio_data);
>>>>> -		for (i = 0; i < drm_res->count_connectors; i++)
>>>>> -			drmModeFreeConnector(drm_connectors[i]);
>>>>> -		drmModeFreeResources(drm_res);
>>>>> -		close(drm_fd);
>>>>> +		for_each_connected_output(display, output) {
>>>>> +			igt_dynamic_f("kms-lpsp-%s", output->name) {
>>>>> +				data.output = output;
>>>>> +				test_lpsp(&data);
>>>>> +			}
>>>>> +
>>>>> +			test_cleanup(&data);
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	igt_fixture {
>>>>> +		free(data.pwr_dmn_info);
>>>>> +		close(data.drm_fd);
>>>>> +		igt_display_fini(&data.display);
>>>>>   	}
>>>>>   }

--------------E1D57C1F27AEE98F0C776EDE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-04-2020 22:14, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200417164440.GO5533@intel.com">
      <pre class="moz-quote-pre" wrap="">On 2020-04-17 at 21:57:25 +0530, Manna, Animesh wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 17-04-2020 20:58, Anshuman Gupta wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 2020-04-17 at 19:52:00 +0530, Manna, Animesh wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 09-04-2020 11:09, Anshuman Gupta wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Current implementation of lpsp igt test, assumed that every non-edp
panel isn't a lpsp panel but it is not true on TGL anymore,
any HDMI/DP/DSI panel connected on pipe A and connected to PORT_{A,B,C}
can drive LPSP.
Even on older Gen9 platform a DP panel can drive lpsp on Port A.
This requires complete design change in current lpsp igt for a platform
agnostic support.

The new igt approach is relies on connector specific
i915_lpsp_capability and i915_lpsp_status debugfs attributes,
these debugfs exposes whether an output is capable of driving lpsp
and lpsp is enabled.

Nuking edp-native and non-edp test, introducing a new dynamic
igt subtest kms-lpsp, which validates lpsp on each connected output
and skip the subtest if output is not lpsp capable.

v2:
- CI failures fixup.
v3:
- removed unloading of snd_modules. [Martin]
v4:
- Don't test non-lpsp(if lpsp disabled), no ROI to test that.
- nuke panel-fitter test.
v5:
- Added dynamic subtest and igt changes according to kernel
  debugfs i915_lpsp_status changes.

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
---
 tests/i915/i915_pm_lpsp.c | 285 +++++++++++++++-----------------------
 1 file changed, 114 insertions(+), 171 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 08f82e7c..7be23e6c 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -25,210 +25,153 @@
  */
 #include "igt.h"
+#include "igt_kmod.h"
+#include "igt_pm.h"
+#include "igt_sysfs.h"
 #include &lt;sys/types.h&gt;
 #include &lt;sys/stat.h&gt;
 #include &lt;fcntl.h&gt;
 #include &lt;unistd.h&gt;
+#define MAX_SINK_LPSP_INFO_BUF_LEN	4096
-static bool supports_lpsp(uint32_t devid)
-{
-	return IS_HASWELL(devid) || IS_BROADWELL(devid);
-}
+#define PWR_DOMAIN_INFO "i915_power_domain_info"
-static bool lpsp_is_enabled(int drm_fd)
+typedef struct {
+	int drm_fd;
+	int debugfs_fd;
+	uint32_t devid;
+	char *pwr_dmn_info;
+	igt_display_t display;
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+} data_t;
+
+static bool lpsp_is_enabled(data_t *data)
 {
-	uint32_t val;
+	char buf[MAX_SINK_LPSP_INFO_BUF_LEN];
+	int len;
-	val = INREG(HSW_PWR_WELL_CTL2);
-	return !(val &amp; HSW_PWR_WELL_STATE_ENABLED);
-}
+	len = igt_debugfs_simple_read(data-&gt;debugfs_fd, "i915_lpsp_status",
+				      buf, sizeof(buf));
+	if (len &lt; 0)
+		igt_assert_eq(len, -ENODEV);
-/* The LPSP mode is all about an enabled pipe, but we expect to also be in the
- * low power mode when no pipes are enabled, so do this check anyway. */
-static void screens_disabled_subtest(int drm_fd, drmModeResPtr drm_res)
-{
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-	igt_assert(lpsp_is_enabled(drm_fd));
+	return strstr(buf, "LPSP: enabled");
 }
-static uint32_t create_fb(int drm_fd, int width, int height)
+/*
+ * The LPSP mode is all about an enabled pipe, but we expect to also be in the
+ * low power mode when no pipes are enabled, so do this check anyway.
+ */
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">All pipe disabled in not same as lpsp. I feel the idea behind lpsp is single
pipe usage with least power consumption ... there maybe no display
connected.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Yes you are correct that is the same above comment has mentioned that "LPSP mode
is all about an enabled pipe", but here test method checks for lpsp when all screens
are disbaled i.e. all crtc are disabled, that is almost same as there is no display
connected with respect to power consumption.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+static void screens_disabled_subtest(data_t *data)
 {
-	struct igt_fb fb;
+	igt_output_t *output;
+	int valid_output = 0;
+	enum pipe pipe;
+
+	for_each_pipe_with_single_output(&amp;data-&gt;display, pipe, output) {
+		data-&gt;output = output;
+		igt_output_set_pipe(data-&gt;output, PIPE_NONE);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Passing PIPE_NONE and testing lpsp maybe not the right thing here. We may
not have connector but need to enable a single pipe to test lpsp...  rt?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">PIPE_NONE commit will disbale a crtc, when all crtc gets disbaled, all power well
except PG1 will be disbaled, PG1 is controlled by DMC.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I do not think DC9 is controlled by DMC, during all crtc disable driver will disable all power-well and enter into DC9, no role of DMC here ... am I missing anything?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">yes DC9 is not controlled by DMC, and i915 program DC9 in case of runtime suspend or system wide suspend, so DC9 a deeper state depends on i915 suspend, let's think about a use case when all CRTC are disabled but gem has valid run time usages count or let's say i915 device is always on i.e (/sys/bus/pci/devices/0000\:00\:02.0/power/control attribute in on), in those cases runtime status will be always active, so i think test method to validate PIPE_B associated power well is valid here when all crtc are disbaled i.e. all display are off.</pre>
    </blockquote>
    <pre>As per the above example though DC9 is not triggered but all power-well will be disabled by driver as it is display engine specific. This is not lpsp.
Here valid testcase would be to check PG1 is enabled or not.

Regards,
Animesh
</pre>
    <blockquote type="cite" cite="mid:20200417164440.GO5533@intel.com">
      <pre class="moz-quote-pre" wrap="">
We want validate a intermediate power state here, which is a valid use case.
Please correct me if my thought process about test method is wrong.
Thanks ,
Anshuman Gupta.
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Animesh

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">So testing lpsp is here is one of the test case, i.e we want to test power well associated
to PIPE_B should be turned off. There may be a bug in driver that when all crtc are disbaled
PIPE_B  associated  power is not turned off, that is what this test validated.
Enabling a pipe for lpsp will get covered in kms-lpsp test.
Thanks,
Anshuman Gupta.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,

Animesh

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+		igt_display_commit(&amp;data-&gt;display);
+		valid_output++;
+	}
-	return igt_create_pattern_fb(drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				     LOCAL_DRM_FORMAT_MOD_NONE, &amp;fb);
+	igt_require_f(valid_output, "No connected output found\n");
+	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
+		     PWR_DOMAIN_INFO, data-&gt;pwr_dmn_info =
+		     igt_sysfs_get(data-&gt;debugfs_fd, PWR_DOMAIN_INFO));
 }
-static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			drmModeConnectorPtr *drm_connectors, uint32_t devid,
-			bool use_panel_fitter)
+static void setup_lpsp_output(data_t *data)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
-	drmModeModeInfo std_1024_mode = {
-		.clock = 65000,
-		.hdisplay = 1024,
-		.hsync_start = 1048,
-		.hsync_end = 1184,
-		.htotal = 1344,
-		.hskew = 0,
-		.vdisplay = 768,
-		.vsync_start = 771,
-		.vsync_end = 777,
-		.vtotal = 806,
-		.vscan = 0,
-		.vrefresh = 60,
-		.flags = 0xA,
-		.type = 0x40,
-		.name = "Custom 1024x768",
-	};
-
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-
-	for (i = 0; i &lt; drm_res-&gt;count_connectors; i++) {
-		drmModeConnectorPtr c = drm_connectors[i];
-
-		if (c-&gt;connector_type != DRM_MODE_CONNECTOR_eDP)
-			continue;
-		if (c-&gt;connection != DRM_MODE_CONNECTED)
-			continue;
-
-		if (!use_panel_fitter &amp;&amp; c-&gt;count_modes) {
-			connector = c;
-			mode = &amp;c-&gt;modes[0];
-			break;
-		}
-		if (use_panel_fitter) {
-			connector = c;
-
-			/* This is one of the modes Xorg creates for panels, so
-			 * it should work just fine. Notice that Gens that
-			 * support LPSP are too new for panels with native
-			 * 1024x768 resolution, so this should force the panel
-			 * fitter. */
-			igt_assert(c-&gt;count_modes &amp;&amp;
-				   c-&gt;modes[0].hdisplay &gt; 1024);
-			igt_assert(c-&gt;count_modes &amp;&amp;
-				   c-&gt;modes[0].vdisplay &gt; 768);
-			mode = &amp;std_1024_mode;
-			break;
-		}
-	}
-	igt_require(connector);
-
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
-	buffer_id = create_fb(drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	igt_assert(buffer_id);
-	igt_assert(connector);
-	igt_assert(mode);
-
-	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
-			    &amp;connector-&gt;connector_id, 1, mode);
-	igt_assert_eq(rc, 0);
-
-	if (use_panel_fitter) {
-		if (IS_HASWELL(devid))
-			igt_assert(!lpsp_is_enabled(drm_fd));
-		else
-			igt_assert(lpsp_is_enabled(drm_fd));
-	} else {
-		igt_assert(lpsp_is_enabled(drm_fd));
-	}
+	igt_plane_t *primary;
+
+	/* set output pipe = PIPE_A for LPSP */
+	igt_output_set_pipe(data-&gt;output, PIPE_A);
+	primary = igt_output_get_plane_type(data-&gt;output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_create_pattern_fb(data-&gt;drm_fd,
+			      data-&gt;mode-&gt;hdisplay, data-&gt;mode-&gt;vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &amp;data-&gt;fb);
+	igt_plane_set_fb(primary, &amp;data-&gt;fb);
+	igt_display_commit(&amp;data-&gt;display);
 }
-static void non_edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			    drmModeConnectorPtr *drm_connectors)
+static void test_cleanup(data_t *data)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
-
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-
-	for (i = 0; i &lt; drm_res-&gt;count_connectors; i++) {
-		drmModeConnectorPtr c = drm_connectors[i];
-
-		if (c-&gt;connector_type == DRM_MODE_CONNECTOR_eDP)
-			continue;
-		if (c-&gt;connection != DRM_MODE_CONNECTED)
-			continue;
-
-		if (c-&gt;count_modes) {
-			connector = c;
-			mode = &amp;c-&gt;modes[0];
-			break;
-		}
-	}
-	igt_require(connector);
-
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
-	buffer_id = create_fb(drm_fd, mode-&gt;hdisplay, mode-&gt;vdisplay);
-
-	igt_assert(buffer_id);
-	igt_assert(mode);
-
-	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
-			    &amp;connector-&gt;connector_id, 1, mode);
-	igt_assert_eq(rc, 0);
-
-	igt_assert(!lpsp_is_enabled(drm_fd));
+	igt_plane_t *primary;
+
+	if (!data-&gt;output || data-&gt;output-&gt;pending_pipe == PIPE_NONE)
+		return;
+
+	primary = igt_output_get_plane_type(data-&gt;output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(data-&gt;output, PIPE_NONE);
+	igt_display_commit(&amp;data-&gt;display);
+	igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt;fb);
+	data-&gt;output = NULL;
 }
-#define MAX_CONNECTORS 32
+static void test_lpsp(data_t *data)
+{
+	/* LPSP is low power single pipe usages i.e. PIPE_A */
+	igt_require(igt_pipe_connector_valid(PIPE_A, data-&gt;output));
+	igt_require_f(i915_output_is_lpsp_capable(data-&gt;drm_fd, data-&gt;output),
+		      "output is not lpsp capable\n");
+
+	data-&gt;mode = igt_output_get_mode(data-&gt;output);
+	setup_lpsp_output(data);
+	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+		     data-&gt;output-&gt;name, PWR_DOMAIN_INFO, data-&gt;pwr_dmn_info =
+		     igt_sysfs_get(data-&gt;debugfs_fd, PWR_DOMAIN_INFO));
+}
-int drm_fd;
-uint32_t devid;
-drmModeResPtr drm_res;
-drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
-struct intel_mmio_data mmio_data;
+IGT_TEST_DESCRIPTION("These tests validates display Low Power Single Pipe configurations");
 igt_main
 {
-	igt_fixture {
-		int i;
-
-		drm_fd = drm_open_driver_master(DRIVER_INTEL);
-		igt_require(drm_fd &gt;= 0);
-
-		devid = intel_get_drm_devid(drm_fd);
-
-		drm_res = drmModeGetResources(drm_fd);
-		igt_require(drm_res);
-		igt_assert(drm_res-&gt;count_connectors &lt;= MAX_CONNECTORS);
+	data_t data = {};
-		for (i = 0; i &lt; drm_res-&gt;count_connectors; i++)
-			drm_connectors[i] = drmModeGetConnectorCurrent(drm_fd,
-							drm_res-&gt;connectors[i]);
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		igt_require(data.drm_fd &gt;= 0);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
+		igt_require(data.debugfs_fd &gt;= 0);
 		igt_pm_enable_audio_runtime_pm();
-
-		igt_require(supports_lpsp(devid));
-
-		intel_register_access_init(&amp;mmio_data, intel_get_pci_device(), 0, drm_fd);
-
 		kmstest_set_vt_graphics_mode();
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		igt_display_require(&amp;data.display, data.drm_fd);
+		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
 	}
+	igt_describe("This test validates lpsp while all crtc are disabled");
 	igt_subtest("screens-disabled")
-		screens_disabled_subtest(drm_fd, drm_res);
-	igt_subtest("edp-native")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
-	igt_subtest("non-edp")
-		non_edp_subtest(drm_fd, drm_res, drm_connectors);
+		screens_disabled_subtest(&amp;data);
-	igt_fixture {
-		int i;
+	igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
+	igt_subtest_with_dynamic_f("kms-lpsp") {
+		igt_display_t *display = &amp;data.display;
+		igt_output_t *output;
-		intel_register_access_fini(&amp;mmio_data);
-		for (i = 0; i &lt; drm_res-&gt;count_connectors; i++)
-			drmModeFreeConnector(drm_connectors[i]);
-		drmModeFreeResources(drm_res);
-		close(drm_fd);
+		for_each_connected_output(display, output) {
+			igt_dynamic_f("kms-lpsp-%s", output-&gt;name) {
+				data.output = output;
+				test_lpsp(&amp;data);
+			}
+
+			test_cleanup(&amp;data);
+		}
+	}
+
+	igt_fixture {
+		free(data.pwr_dmn_info);
+		close(data.drm_fd);
+		igt_display_fini(&amp;data.display);
 	}
 }
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------E1D57C1F27AEE98F0C776EDE--

--===============0263615363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0263615363==--
