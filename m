Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA9089D66
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 08:05:03 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Mon, 23 Mar 2020 08:04:59 +0000
Message-ID: <651b3c35b765497a81b28473c4059d1a@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
 <20200323063248.5261-3-anshuman.gupta@intel.com>
 <824e1dd4da7f47e8b7598ac3c6d9f2fd@intel.com>
 <20200323074605.GC26511@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_651b3c35b765497a81b28473c4059d1aintelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/5] tests/i915_pm_lpsp: lpsp
 platform agnostic support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--_002_651b3c35b765497a81b28473c4059d1aintelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2020-03-23 09:56, Gupta, Anshuman wrote:=0A=
> On 2020-03-23 at 12:30:08 +0530, Peres, Martin wrote:=0A=
>> On 2020-03-23 08:32, Anshuman Gupta wrote:=0A=
>>> Current implementation of lpsp igt test, assumed that every non-edp=0A=
>>> panel isn't a lpsp panel but it is not true on TGL anymore,=0A=
>>> any HDMI/DP/DSI panel connected on pipe A and connected to PORT_{A,B,C}=
=0A=
>>> can drive LPSP.=0A=
>>> Even on older Gen9 platform a DP panel can drive lpsp on Port A.=0A=
>>> This requires complete design change in current lpsp igt for a platform=
=0A=
>>> agnostic support.=0A=
>>>=0A=
>>> The new igt approach is relies on connector specific debugfs=0A=
>>> attribute i915_lpsp_info, which exposes whether an output is capable=0A=
>>> of driving lpsp and whether lpsp is enabled.=0A=
>>>=0A=
>>> v2:=0A=
>>> - CI failures fixup.=0A=
>>>=0A=
>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>=0A=
>>> ---=0A=
>>>  tests/i915/i915_pm_lpsp.c | 303 +++++++++++++++++++++++---------------=
=0A=
>>>  1 file changed, 186 insertions(+), 117 deletions(-)=0A=
>>>=0A=
>>> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c=0A=
>>> index 42938e10..e400c92e 100644=0A=
>>> --- a/tests/i915/i915_pm_lpsp.c=0A=
>>> +++ b/tests/i915/i915_pm_lpsp.c=0A=
>>> @@ -25,49 +25,125 @@=0A=
>>>   */=0A=
>>>  =0A=
>>>  #include "igt.h"=0A=
>>> +#include "igt_kmod.h"=0A=
>>> +#include "igt_pm.h"=0A=
>>> +#include "igt_sysfs.h"=0A=
>>>  #include <sys/types.h>=0A=
>>>  #include <sys/stat.h>=0A=
>>>  #include <fcntl.h>=0A=
>>>  #include <unistd.h>=0A=
>>>  =0A=
>>> +#define MAX_SINK_LPSP_INFO_BUF_LEN	5000=0A=
>>>  =0A=
>>> -static bool supports_lpsp(uint32_t devid)=0A=
>>> +#define PWR_DOMAIN_INFO "i915_power_domain_info"=0A=
>>> +=0A=
>>> +const char *snd_module[10] =3D {"snd_hda_codec_hdmi", "snd_hda_intel",=
 "snd_hda_codec", "snd_hda_core", NULL};=0A=
>>> +=0A=
>>> +typedef struct {=0A=
>>> +	int drm_fd;=0A=
>>> +	int debugfs_fd;=0A=
>>> +	uint32_t devid;=0A=
>>> +	char *pwr_dmn_info;=0A=
>>> +	igt_display_t display;=0A=
>>> +	struct igt_fb fb;=0A=
>>> +	drmModeModeInfo *mode;=0A=
>>> +	igt_output_t *output;=0A=
>>> +} data_t;=0A=
>>> +=0A=
>>> +static void debugfs_read(int fd, const char *param, char *buf, int len=
)=0A=
>>>  {=0A=
>>> -	return IS_HASWELL(devid) || IS_BROADWELL(devid);=0A=
>>> +	len =3D igt_debugfs_simple_read(fd, param, buf, len);=0A=
>>> +	if (len < 0)=0A=
>>> +		igt_assert_eq(len, -ENODEV);=0A=
>>>  }=0A=
>>>  =0A=
>>> -static bool lpsp_is_enabled(int drm_fd)=0A=
>>> +static bool lpsp_is_enabled(data_t *data)=0A=
>>>  {=0A=
>>> -	uint32_t val;=0A=
>>> +	char buf[MAX_SINK_LPSP_INFO_BUF_LEN];=0A=
>>> +	int fd;=0A=
>>> +=0A=
>>> +	fd =3D igt_debugfs_connector_dir(data->drm_fd, data->output->name,=0A=
>>> +				       O_RDONLY);=0A=
>>> +	igt_require(fd >=3D 0);=0A=
>>> +=0A=
>>> +	debugfs_read(fd, "i915_lpsp_info", buf, sizeof(buf));=0A=
>>> +	close(fd);=0A=
>>>  =0A=
>>> -	val =3D INREG(HSW_PWR_WELL_CTL2);=0A=
>>> -	return !(val & HSW_PWR_WELL_STATE_ENABLED);=0A=
>>> +	return strstr(buf, "LPSP enabled");=0A=
>>>  }=0A=
>>>  =0A=
>>> -/* The LPSP mode is all about an enabled pipe, but we expect to also b=
e in the=0A=
>>> - * low power mode when no pipes are enabled, so do this check anyway. =
*/=0A=
>>> -static void screens_disabled_subtest(int drm_fd, drmModeResPtr drm_res=
)=0A=
>>> +/*=0A=
>>> + * The LPSP mode is all about an enabled pipe, but we expect to also b=
e in the=0A=
>>> + * low power mode when no pipes are enabled, so do this check anyway.=
=0A=
>>> + */=0A=
>>> +static void screens_disabled_subtest(data_t *data)=0A=
>>>  {=0A=
>>> -	kmstest_unset_all_crtcs(drm_fd, drm_res);=0A=
>>> -	igt_assert(lpsp_is_enabled(drm_fd));=0A=
>>> +	igt_output_t *output;=0A=
>>> +	enum pipe pipe;=0A=
>>> +	igt_plane_t *primary;=0A=
>>> +=0A=
>>> +	for_each_pipe_with_single_output(&data->display, pipe, output) {=0A=
>>> +		data->output =3D output;=0A=
>>> +		igt_output_set_pipe(data->output, pipe);=0A=
>>> +		primary =3D igt_output_get_plane_type(data->output,=0A=
>>> +						    DRM_PLANE_TYPE_PRIMARY);=0A=
>>> +		igt_plane_set_fb(primary, NULL);=0A=
>>> +		igt_display_commit(&data->display);=0A=
>>> +	}=0A=
>>> +=0A=
>>> +	igt_assert(lpsp_is_enabled(data));=0A=
>>>  }=0A=
>>>  =0A=
>>> -static uint32_t create_fb(int drm_fd, int width, int height)=0A=
>>> +static void check_output_lpsp(data_t *data)=0A=
>>>  {=0A=
>>> -	struct igt_fb fb;=0A=
>>> +	if (igt_output_is_lpsp_capable(data->drm_fd, data->output))=0A=
>>> +		igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%=
s\n",=0A=
>>> +			     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =3D=0A=
>>> +			     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));=0A=
>>> +	else=0A=
>>> +		igt_assert(!lpsp_is_enabled(data));=0A=
>>> +}=0A=
>>>  =0A=
>>> -	return igt_create_pattern_fb(drm_fd, width, height, DRM_FORMAT_XRGB88=
88,=0A=
>>> -				     LOCAL_DRM_FORMAT_MOD_NONE, &fb);=0A=
>>> +static void setup_lpsp_output(data_t *data)=0A=
>>> +{=0A=
>>> +	igt_plane_t *primary;=0A=
>>> +=0A=
>>> +	/* set output pipe =3D PIPE_A for LPSP */=0A=
>>> +	igt_output_set_pipe(data->output, PIPE_A);=0A=
>>> +	primary =3D igt_output_get_plane_type(data->output,=0A=
>>> +					    DRM_PLANE_TYPE_PRIMARY);=0A=
>>> +	igt_plane_set_fb(primary, NULL);=0A=
>>> +	igt_create_pattern_fb(data->drm_fd,=0A=
>>> +			      data->mode->hdisplay, data->mode->vdisplay,=0A=
>>> +			      DRM_FORMAT_XRGB8888,=0A=
>>> +			      LOCAL_DRM_FORMAT_MOD_NONE,=0A=
>>> +			      &data->fb);=0A=
>>> +	igt_plane_set_fb(primary, &data->fb);=0A=
>>> +	igt_display_commit(&data->display);=0A=
>>> +}=0A=
>>> +=0A=
>>> +static void cleanup_lpsp_output(data_t *data)=0A=
>>> +{=0A=
>>> +	igt_plane_t *primary;=0A=
>>> +=0A=
>>> +	if (!data->output)=0A=
>>> +		return;=0A=
>>> +=0A=
>>> +	primary =3D igt_output_get_plane_type(data->output,=0A=
>>> +					    DRM_PLANE_TYPE_PRIMARY);=0A=
>>> +	igt_plane_set_fb(primary, NULL);=0A=
>>> +	igt_output_set_pipe(data->output, PIPE_NONE);=0A=
>>> +	igt_display_commit(&data->display);=0A=
>>> +	igt_remove_fb(data->drm_fd, &data->fb);=0A=
>>> +	data->output =3D NULL;=0A=
>>>  }=0A=
>>>  =0A=
>>> -static void edp_subtest(int drm_fd, drmModeResPtr drm_res,=0A=
>>> -			drmModeConnectorPtr *drm_connectors, uint32_t devid,=0A=
>>> -			bool use_panel_fitter)=0A=
>>> +static void edp_subtest(data_t *data, bool use_panel_fitter)=0A=
>>>  {=0A=
>>> -	int i, rc;=0A=
>>> -	uint32_t crtc_id =3D 0, buffer_id =3D 0;=0A=
>>> -	drmModeConnectorPtr connector =3D NULL;=0A=
>>> -	drmModeModeInfoPtr mode =3D NULL;=0A=
>>> +	igt_display_t *display =3D &data->display;=0A=
>>> +	igt_output_t *output;=0A=
>>> +	int valid_output;=0A=
>>> +=0A=
>>>  	drmModeModeInfo std_1024_mode =3D {=0A=
>>>  		.clock =3D 65000,=0A=
>>>  		.hdisplay =3D 1024,=0A=
>>> @@ -86,23 +162,17 @@ static void edp_subtest(int drm_fd, drmModeResPtr =
drm_res,=0A=
>>>  		.name =3D "Custom 1024x768",=0A=
>>>  	};=0A=
>>>  =0A=
>>> -	kmstest_unset_all_crtcs(drm_fd, drm_res);=0A=
>>> -=0A=
>>> -	for (i =3D 0; i < drm_res->count_connectors; i++) {=0A=
>>> -		drmModeConnectorPtr c =3D drm_connectors[i];=0A=
>>> +	for_each_connected_output(display, output) {=0A=
>>> +		drmModeConnectorPtr c =3D output->config.connector;=0A=
>>>  =0A=
>>>  		if (c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)=0A=
>>>  			continue;=0A=
>>> -		if (c->connection !=3D DRM_MODE_CONNECTED)=0A=
>>> +		if (!igt_pipe_connector_valid(PIPE_A, output))=0A=
>>>  			continue;=0A=
>>>  =0A=
>>> -		if (!use_panel_fitter && c->count_modes) {=0A=
>>> -			connector =3D c;=0A=
>>> -			mode =3D &c->modes[0];=0A=
>>> -			break;=0A=
>>> -		}=0A=
>>> +		data->output =3D output;=0A=
>>> +=0A=
>>>  		if (use_panel_fitter) {=0A=
>>> -			connector =3D c;=0A=
>>>  =0A=
>>>  			/* This is one of the modes Xorg creates for panels, so=0A=
>>>  			 * it should work just fine. Notice that Gens that=0A=
>>> @@ -113,124 +183,123 @@ static void edp_subtest(int drm_fd, drmModeResP=
tr drm_res,=0A=
>>>  				   c->modes[0].hdisplay > 1024);=0A=
>>>  			igt_assert(c->count_modes &&=0A=
>>>  				   c->modes[0].vdisplay > 768);=0A=
>>> -			mode =3D &std_1024_mode;=0A=
>>> -			break;=0A=
>>> +			data->mode =3D &std_1024_mode;=0A=
>>> +			igt_output_override_mode(output, data->mode);=0A=
>>> +		} else {=0A=
>>> +			data->mode =3D igt_output_get_mode(output);=0A=
>>>  		}=0A=
>>> -	}=0A=
>>> -	igt_require(connector);=0A=
>>>  =0A=
>>> -	crtc_id =3D kmstest_find_crtc_for_connector(drm_fd, drm_res, connecto=
r,=0A=
>>> -						  0);=0A=
>>> -	buffer_id =3D create_fb(drm_fd, mode->hdisplay, mode->vdisplay);=0A=
>>> +		setup_lpsp_output(data);=0A=
>>> +=0A=
>>> +		if (use_panel_fitter && IS_HASWELL(data->devid))=0A=
>>> +			igt_assert(!lpsp_is_enabled(data));=0A=
>>> +		else=0A=
>>> +			check_output_lpsp(data);=0A=
>>>  =0A=
>>> -	igt_assert(buffer_id);=0A=
>>> -	igt_assert(connector);=0A=
>>> -	igt_assert(mode);=0A=
>>> +		cleanup_lpsp_output(data);=0A=
>>> +		valid_output++;=0A=
>>> +	}=0A=
>>>  =0A=
>>> -	rc =3D drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,=0A=
>>> -			    &connector->connector_id, 1, mode);=0A=
>>> -	igt_assert_eq(rc, 0);=0A=
>>> +	igt_require_f(valid_output, "No edp connector found\n");=0A=
>>> +}=0A=
>>>  =0A=
>>> -	if (use_panel_fitter) {=0A=
>>> -		if (IS_HASWELL(devid))=0A=
>>> -			igt_assert(!lpsp_is_enabled(drm_fd));=0A=
>>> -		else=0A=
>>> -			igt_assert(lpsp_is_enabled(drm_fd));=0A=
>>> -	} else {=0A=
>>> -		igt_assert(lpsp_is_enabled(drm_fd));=0A=
>>> +static bool unload_snd_hda_core_module(void)=0A=
>>> +{=0A=
>>> +	int i;=0A=
>>> +=0A=
>>> +	/* unbind snd_hda_intel */=0A=
>>> +	kick_snd_hda_intel();=0A=
>>> +=0A=
>>> +	for (i =3D 0; snd_module[i]; i++) {=0A=
>>> +		if (igt_kmod_is_loaded(snd_module[i]) &&=0A=
>>> +		    igt_kmod_unload(snd_module[i], KMOD_REMOVE_FORCE)) {=0A=
>>> +			igt_warn("Could not unload %s\n", snd_module[i]);=0A=
>>> +			igt_kmod_list_loaded();=0A=
>>> +			igt_lsof("/dev/snd");=0A=
>>> +			return false;=0A=
>>> +		}=0A=
>>>  	}=0A=
>>> +=0A=
>>> +	return true;=0A=
>>>  }=0A=
>>>  =0A=
>>> -static void non_edp_subtest(int drm_fd, drmModeResPtr drm_res,=0A=
>>> -			    drmModeConnectorPtr *drm_connectors)=0A=
>>> +static void load_snd_hda_core_module(void)=0A=
>>>  {=0A=
>>> -	int i, rc;=0A=
>>> -	uint32_t crtc_id =3D 0, buffer_id =3D 0;=0A=
>>> -	drmModeConnectorPtr connector =3D NULL;=0A=
>>> -	drmModeModeInfoPtr mode =3D NULL;=0A=
>>> +	igt_kmod_load("snd_hda_core", NULL);=0A=
>>> +}=0A=
>>> +=0A=
>>> +static void non_edp_subtest(data_t *data)=0A=
>>> +{=0A=
>>> +	igt_display_t *display =3D &data->display;=0A=
>>> +	igt_output_t *output;=0A=
>>> +	int valid_output;=0A=
>>>  =0A=
>>> -	kmstest_unset_all_crtcs(drm_fd, drm_res);=0A=
>>> +	/* DP/HDMI panel requires to drive lpsp without audio */=0A=
>>> +	igt_require(unload_snd_hda_core_module());=0A=
>>=0A=
>> I'm not super happy with having to unload modules that it would be very=
=0A=
>> easy to forget to re-add and would make audio tests fail :s=0A=
>>=0A=
>> IMO, if the DUT is not playing sound, we should be able to enter LPSP.=
=0A=
>> If no, then I would consider this a driver bug for wasting energy=0A=
>> sending 0s to the screen.=0A=
> i915 contorls AUDIO power domain on request of i915_audio_component_ops=
=0A=
> get_power/put_power, which is an external dependency.=0A=
> Despite unloading the module, it fails to enter lpsp for HDMI panels, =0A=
> audio driver didn't invoke the put_power to release the i915 power resour=
ces.=0A=
> It seems bug with audio driver interface.=0A=
> My plan was to raise a gitlab bug based upon lpsp failure due to=0A=
> AUDIO_POWER_DOMAIN non-zero ref count despite there was no audio =0A=
> module.=0A=
=0A=
=0A=
Yet another reason not to remove the modules then ;)=0A=
=0A=
>>=0A=
>> Thoughts on this?=0A=
> I agree with you, if there is no audio is being played from DP/hdmi=0A=
> we should be able to enter lpsp, but it seems audio codec requires =0A=
> power at the time of codec probe itself.=0A=
> @Kai Vehmanen may be the best one to confirm hdmi-codec behavior?=0A=
> =0A=
> IMO this should not block our igt validation, =0A=
> therefore i think in order to validate i915 lpsp use cases =0A=
> it would be a better approach to unload the snd module. =0A=
> These igt are pending since time of haswell/broadwell. =0A=
> Please suggest how to proceed this?=0A=
=0A=
I agree that this series is a step forward, and I want to see this=0A=
series merged sooner rather than later. What I don't want to see is=0A=
painting the grass green by working around actual bugs. I suggest you=0A=
stop unloading the modules and let the tests fail until the kernel gets=0A=
fixed. It should be easy to do and we can merge the series.=0A=
=0A=
As for validation, painting the grass green by working around real=0A=
issues is not acceptable. You can say in the bug we will file that the=0A=
cause is related to the audio codec, but working around it in the test=0A=
should be a no-no. We want normal users to be able to reach LPSP, not=0A=
just the ones who force-disable audio at boot. So, our IGT tests should=0A=
reflect the normal case :)=0A=
=0A=
Martin=0A=
=0A=
> Thanks,=0A=
> Anshuman Gupta.=0A=
>>=0A=
>> Martin=0A=
>>=0A=
>>>  =0A=
>>> -	for (i =3D 0; i < drm_res->count_connectors; i++) {=0A=
>>> -		drmModeConnectorPtr c =3D drm_connectors[i];=0A=
>>> +	for_each_connected_output(display, output) {=0A=
>>> +		drmModeConnectorPtr c =3D output->config.connector;=0A=
>>>  =0A=
>>>  		if (c->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)=0A=
>>>  			continue;=0A=
>>>  		if (c->connection !=3D DRM_MODE_CONNECTED)=0A=
>>>  			continue;=0A=
>>> +		if (!igt_pipe_connector_valid(PIPE_A, output))=0A=
>>> +			continue;=0A=
>>>  =0A=
>>> -		if (c->count_modes) {=0A=
>>> -			connector =3D c;=0A=
>>> -			mode =3D &c->modes[0];=0A=
>>> -			break;=0A=
>>> -		}=0A=
>>> +		data->output =3D output;=0A=
>>> +		data->mode =3D igt_output_get_mode(output);=0A=
>>> +		setup_lpsp_output(data);=0A=
>>> +		check_output_lpsp(data);=0A=
>>> +		cleanup_lpsp_output(data);=0A=
>>> +		load_snd_hda_core_module();=0A=
>>> +		valid_output++;=0A=
>>>  	}=0A=
>>> -	igt_require(connector);=0A=
>>> -=0A=
>>> -	crtc_id =3D kmstest_find_crtc_for_connector(drm_fd, drm_res, connecto=
r,=0A=
>>> -						  0);=0A=
>>> -	buffer_id =3D create_fb(drm_fd, mode->hdisplay, mode->vdisplay);=0A=
>>>  =0A=
>>> -	igt_assert(buffer_id);=0A=
>>> -	igt_assert(mode);=0A=
>>> -=0A=
>>> -	rc =3D drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,=0A=
>>> -			    &connector->connector_id, 1, mode);=0A=
>>> -	igt_assert_eq(rc, 0);=0A=
>>> -=0A=
>>> -	igt_assert(!lpsp_is_enabled(drm_fd));=0A=
>>> +	igt_require_f(valid_output, "No non-edp connector found\n");=0A=
>>>  }=0A=
>>>  =0A=
>>> -#define MAX_CONNECTORS 32=0A=
>>> -=0A=
>>> -int drm_fd;=0A=
>>> -uint32_t devid;=0A=
>>> -drmModeResPtr drm_res;=0A=
>>> -drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];=0A=
>>> -struct intel_mmio_data mmio_data;=0A=
>>> +IGT_TEST_DESCRIPTION("These tests validates display Low Power Single P=
ipe configurations");=0A=
>>>  igt_main=0A=
>>>  {=0A=
>>> -	igt_fixture {=0A=
>>> -		int i;=0A=
>>> -=0A=
>>> -		drm_fd =3D drm_open_driver_master(DRIVER_INTEL);=0A=
>>> -		igt_require(drm_fd >=3D 0);=0A=
>>> -=0A=
>>> -		devid =3D intel_get_drm_devid(drm_fd);=0A=
>>> +	data_t data =3D {};=0A=
>>>  =0A=
>>> -		drm_res =3D drmModeGetResources(drm_fd);=0A=
>>> -		igt_require(drm_res);=0A=
>>> -		igt_assert(drm_res->count_connectors <=3D MAX_CONNECTORS);=0A=
>>> -=0A=
>>> -		for (i =3D 0; i < drm_res->count_connectors; i++)=0A=
>>> -			drm_connectors[i] =3D drmModeGetConnectorCurrent(drm_fd,=0A=
>>> -							drm_res->connectors[i]);=0A=
>>> +	igt_fixture {=0A=
>>>  =0A=
>>> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);=0A=
>>> +		igt_require(data.drm_fd >=3D 0);=0A=
>>> +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);=0A=
>>> +		igt_require(data.debugfs_fd >=3D 0);=0A=
>>>  		igt_pm_enable_audio_runtime_pm();=0A=
>>> -=0A=
>>> -		igt_require(supports_lpsp(devid));=0A=
>>> -=0A=
>>> -		intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, dr=
m_fd);=0A=
>>> -=0A=
>>>  		kmstest_set_vt_graphics_mode();=0A=
>>> +		data.devid =3D intel_get_drm_devid(data.drm_fd);=0A=
>>> +		igt_display_require(&data.display, data.drm_fd);=0A=
>>> +		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));=0A=
>>>  	}=0A=
>>>  =0A=
>>> +	igt_describe("This test validates lpsp while all crtc are disabled");=
=0A=
>>>  	igt_subtest("screens-disabled")=0A=
>>> -		screens_disabled_subtest(drm_fd, drm_res);=0A=
>>> +		screens_disabled_subtest(&data);=0A=
>>> +	igt_describe("This test validates lpsp on eDP panel");=0A=
>>>  	igt_subtest("edp-native")=0A=
>>> -		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);=0A=
>>> +		edp_subtest(&data, false);=0A=
>>> +	igt_fixture=0A=
>>> +		cleanup_lpsp_output(&data);=0A=
>>> +	igt_describe("This test validates lpsp on eDP panel while forcing pan=
el_fitter");=0A=
>>>  	igt_subtest("edp-panel-fitter")=0A=
>>> -		edp_subtest(drm_fd, drm_res, drm_connectors, devid, true);=0A=
>>> +		edp_subtest(&data, true);=0A=
>>> +	igt_fixture=0A=
>>> +		cleanup_lpsp_output(&data);=0A=
>>> +	igt_describe("This test validates lpsp on DP/HDMI/DSI panels");=0A=
>>>  	igt_subtest("non-edp")=0A=
>>> -		non_edp_subtest(drm_fd, drm_res, drm_connectors);=0A=
>>> +		non_edp_subtest(&data);=0A=
>>> +	igt_fixture=0A=
>>> +		cleanup_lpsp_output(&data);=0A=
>>>  =0A=
>>>  	igt_fixture {=0A=
>>> -		int i;=0A=
>>> -=0A=
>>> -		intel_register_access_fini(&mmio_data);=0A=
>>> -		for (i =3D 0; i < drm_res->count_connectors; i++)=0A=
>>> -			drmModeFreeConnector(drm_connectors[i]);=0A=
>>> -		drmModeFreeResources(drm_res);=0A=
>>> -		close(drm_fd);=0A=
>>> +		free(data.pwr_dmn_info);=0A=
>>> +		load_snd_hda_core_module();=0A=
>>> +		close(data.drm_fd);=0A=
>>> +		igt_display_fini(&data.display);=0A=
>>>  	}=0A=
>>>  }=0A=
>>>=0A=
>>=0A=
> =0A=
>> pub  2048R/33A53379 2019-12-02 Martin Peres <martin.peres@linux.intel.co=
m>=0A=
>> sub  2048R/C5E7DE5F 2019-12-02 [expires: 2020-12-01]=0A=
> =0A=
> =0A=
=0A=

--_002_651b3c35b765497a81b28473c4059d1aintelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=1765;
	creation-date="Mon, 23 Mar 2020 08:04:59 GMT";
	modification-date="Mon, 23 Mar 2020 08:04:59 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUVOQkYwc2tFc0JDQURjUTVS
cG1SeWQreU5EbkJIcmpPeURLanpsVlJVSGNiRnU4TFRVWG0rdE1OaHZxeGdMCmRCWHI5c1I2S09N
U0UxZGp2czhBZXNNdXpqa293aVcwS3I2dVFuRlRxNVZWdGFGMmwyRVdPb1ZIYlJVejV6bGYKVFBV
ajlKbU1CWjVCVGFDekRGbjA1dUU3UklKamhpcUhyd0pnUlkzZjZGazZVUjdJUVJaUWZzQXRKZXBH
NUR5ZQpkcThjcHYrM0pFMUV1eDhMR0FOTzZxd25tOEU5ZkV6VDNNVjB4QTlZVGJmeE9Hcm5jV3lp
ZkhPNzBzWnUzZm5DCngyZXI5U29KVDhZM0VzSis1L0puSUMvWHFLV3VITTNaSEc2bXhFWFM2cC9E
R3hMQzg1OWhxN28xZ1Qvem1IYjcKRERVcXRWeWNqSDkzMFRuOVRJTnYrdFVXN2hseG9oaDlZQ2Zk
QUJFQkFBRzBKbEJsY21WekxDQk5ZWEowYVc0ZwpQRzFoY25ScGJpNXdaWEpsYzBCcGJuUmxiQzVq
YjIwK2lRRlVCQk1CQ0FBK0ZpRUV5TGV5bWVpR0llcGE5VDhvCm81SHZsSnZUK05nRkFsMHNrRXND
R3dNRkNRSGhNNEFGQ3drSUJ3SUdGUW9KQ0FzQ0JCWUNBd0VDSGdFQ0Y0QUEKQ2drUW81SHZsSnZU
K05qTWdnZ0FwU2did0JDUVB0NlI4NFZENTNRYlFGbXFWMkF4YU8zWDBEZTcwRCtrdXQzaQoxck9T
SjRRalk3djNUY1hWU3VueWRaR2R5TjIwamlzSUhOcUVJNThkWVc5a1JWdDY3OFU1QkVUQTBpVGc0
clVDCjZDZWJYTzM2dlZNK2FOaEtoV0MxWHphYnlyY3pGaGdJR2pEQ1QxdXF6aUYzVlM4c3Y1Slkz
eHFqUGpQNXJoODkKMVBMd3VaR0hWci9NVFlRQXZQSXkwR0tkTTVMTFFkdjRHRytXbnE4Q0ZaU3JT
OUF0VW1oRldhV0htNWZzZ3lNTQpWQUVQYzI5cW04emFXZmJMYW9XSVBWUkJiMHZodWxoZTRBNWtG
TTAyNnYwQ2JMdHJRWjU2YlRzU2c4UUgxYk9CCkFqdkE1Z0hmcGM2NGR2T2QrRTNlMjZwcWVwRjM2
NVUvZjBlN20va2NyN2tCRFFSZExKQkxBUWdBeG5kRUVoV2gKR29ra1VZN3h1Ym8xc3J6YSs0ekxV
elFoTnBML0k0Q2VGTGUwRWN3RFlVYVpiUllOd0huRjJTTWZXTjV6S3d5VQpVSzd4UHNGYVhLTFdC
eEx1NWNHREY0UDU2b1dBWnc3U2ZxaWlhTzd3c2tablJVOW5JLzFxMzBORG5pMk5xM2d3CnVqQ0Ju
andMaWxMTTRPV0lGNGFWQW1GZHlnaEhISEZNbXp4OFhYRTZkVGg4R2o5ZU9SanV5V3NBKzFwTitQ
UFIKaWZoclp2VzFVdVZRTmZpRUJmMWkyNTRuVVhXQnhLTThHVkpnNlRaQUttWjN3RzFITTN5NjBY
UHEzVFJrKzlyaQpjeU4yTVUva29GY3VSZlFiOGQvcWtTanA1R0RDQUZMQjNMeUZKc3FGZm5qaEFP
aFk0dXoxb2tFam51TEFmc0NxCjlkUE8za3lyRVdONFJRQVJBUUFCaVFFN0JCZ0JDQUFtRmlFRXlM
ZXltZWlHSWVwYTlUOG9vNUh2bEp2VCtOZ0YKQWwwc2tFc0NHd3dGQ1FIaE00QUFDZ2tRbzVIdmxK
dlQrTmlqM3dmNGwxd0pGQnlnUVhpSlBOUjR0QUx4dG9WWgpOYm5DWDhROU9jdjU0TWdMa1lJU0Zo
dFlMZjZzSXl2RlNvazdGSEtEaWFJaW0vR2JpdVJvTitlSStMRThia2ZPCm9YR3hIazZzMHVSeTk5
UUNlSkVNaFFYZXptd2dxMHk3Nzk0OE9xNFBLTUJiVGRpdDNSL29ONDNxbldDNzdnbzUKTjN6bVdn
VHRoQXNmNWd4YXpPNGwvQ2pvZ2VWTmJLd3ZVUW1qOU1uR2dNVTUybnVyejBTTjdVUUZ2RVZGTElF
VQpjTFhsOHd6R2t1bEU1ZUs4RWg3UWp0ckp0MkNrOTZVNVdZa0R4bUVZZlU0czNqTkpzcnhYZitW
ZklFTWlheGtvCld5a1czTktJekFUU1hjOFYrTEFlT011MVJoejRBSUtXaWhzWWFJZk1HZUhITUty
QllrM2xTbzhzSS9DQgo9TEVyUQotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==

--_002_651b3c35b765497a81b28473c4059d1aintelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_651b3c35b765497a81b28473c4059d1aintelcom_--
