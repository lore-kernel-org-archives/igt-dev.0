Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD86C89DEC
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 07:10:07 +0000 (UTC)
From: "Peres, Martin" <martin.peres@intel.com>
Date: Mon, 23 Mar 2020 07:10:04 +0000
Message-ID: <ff96d5d7446e4e298dd238863214da31@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
 <20200323063248.5261-6-anshuman.gupta@intel.com>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_ff96d5d7446e4e298dd238863214da31intelcom_"
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/5] tests/i915_pm_rpm: lpsp/non-lpsp
 screen mode_set_data
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Peres, Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--_002_ff96d5d7446e4e298dd238863214da31intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 2020-03-23 08:32, Anshuman Gupta wrote:=0A=
> Initialize the mode set params for lpsp/non-lpsp screen=0A=
> based upon their output lpsp capability instead=0A=
> of edp/non-edp output type.=0A=
> =0A=
> v2:=0A=
> - CI failures fixup.=0A=
=0A=
This patch is:=0A=
=0A=
Acked-by: Martin Peres <martin.peres@linux.intel.com>=0A=
=0A=
Congrats on your series, Anshuman! My only gripe with it is letting the=0A=
audio free-wheel even when we don't need it and could reach LPSP.=0A=
=0A=
That being said, if you were to remove the sound drivers unloading, the=0A=
series would be very close to a mergeable state. It's OK if the new=0A=
tests fail, they can be fixed with a corresponding i915 patch series.=0A=
=0A=
Thanks again!=0A=
=0A=
Martin=0A=
=0A=
> =0A=
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>=0A=
> ---=0A=
>  tests/i915/i915_pm_rpm.c | 53 +++++++++++++++++++++++-----------------=
=0A=
>  1 file changed, 30 insertions(+), 23 deletions(-)=0A=
> =0A=
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c=0A=
> index 4f8124dc..e2fb732c 100644=0A=
> --- a/tests/i915/i915_pm_rpm.c=0A=
> +++ b/tests/i915/i915_pm_rpm.c=0A=
> @@ -94,6 +94,7 @@ struct mode_set_data {=0A=
>  	drmModeResPtr res;=0A=
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS];=0A=
>  	drmModePropertyBlobPtr edids[MAX_CONNECTORS];=0A=
> +	igt_display_t display;=0A=
>  =0A=
>  	uint32_t devid;=0A=
>  };=0A=
> @@ -254,29 +255,29 @@ static bool init_modeset_params_for_type(struct mod=
e_set_data *data,=0A=
>  {=0A=
>  	drmModeConnectorPtr connector =3D NULL;=0A=
>  	drmModeModeInfoPtr mode =3D NULL;=0A=
> +	igt_output_t *output =3D NULL;=0A=
> +	igt_display_t *display =3D &data->display;=0A=
>  =0A=
> -	if (!data->res)=0A=
> +	if (!data->res || !display)=0A=
>  		return false;=0A=
>  =0A=
> -	for (int i =3D 0; i < data->res->count_connectors; i++) {=0A=
> -		drmModeConnectorPtr c =3D data->connectors[i];=0A=
> +	for_each_connected_output(display, output) {=0A=
> +		drmModeConnectorPtr c =3D output->config.connector;=0A=
>  =0A=
>  		if (type =3D=3D SCREEN_TYPE_LPSP &&=0A=
> -		    c->connector_type !=3D DRM_MODE_CONNECTOR_eDP)=0A=
> +		     !igt_output_is_lpsp_capable(drm_fd, output))=0A=
>  			continue;=0A=
>  =0A=
>  		if (type =3D=3D SCREEN_TYPE_NON_LPSP &&=0A=
> -		    c->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)=0A=
> +		    igt_output_is_lpsp_capable(drm_fd, output))=0A=
>  			continue;=0A=
>  =0A=
> -		if (c->connection =3D=3D DRM_MODE_CONNECTED && c->count_modes) {=0A=
> -			connector =3D c;=0A=
> -			mode =3D &c->modes[0];=0A=
> -			break;=0A=
> -		}=0A=
> +		connector =3D c;=0A=
> +		mode =3D igt_output_get_mode(output);=0A=
> +		break;=0A=
>  	}=0A=
>  =0A=
> -	if (!connector)=0A=
> +	if (!connector || !mode)=0A=
>  		return false;=0A=
>  =0A=
>  	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay,=0A=
> @@ -397,6 +398,7 @@ static void init_mode_set_data(struct mode_set_data *=
data)=0A=
>  		kmstest_set_vt_graphics_mode();=0A=
>  	}=0A=
>  =0A=
> +	igt_display_require(&data->display, drm_fd);=0A=
>  	data->devid =3D intel_get_drm_devid(drm_fd);=0A=
>  	init_modeset_cached_params(&ms_data);=0A=
>  }=0A=
> @@ -410,6 +412,8 @@ static void fini_mode_set_data(struct mode_set_data *=
data)=0A=
>  		}=0A=
>  		drmModeFreeResources(data->res);=0A=
>  	}=0A=
> +=0A=
> +	igt_display_fini(&data->display);=0A=
>  }=0A=
>  =0A=
>  static void get_drm_info(struct compare_data *data)=0A=
> @@ -760,7 +764,7 @@ static void dump_file(int dir, const char *filename)=
=0A=
>  	free(contents);=0A=
>  }=0A=
>  =0A=
> -static bool setup_environment(void)=0A=
> +static bool setup_environment(bool display_disabled)=0A=
>  {=0A=
>  	if (has_runtime_pm)=0A=
>  		goto out;=0A=
> @@ -772,7 +776,8 @@ static bool setup_environment(void)=0A=
>  	debugfs =3D igt_debugfs_dir(drm_fd);=0A=
>  	igt_require(debugfs !=3D -1);=0A=
>  =0A=
> -	init_mode_set_data(&ms_data);=0A=
> +	if (!display_disabled)=0A=
> +		init_mode_set_data(&ms_data);=0A=
>  =0A=
>  	igt_pm_enable_sata_link_power_management();=0A=
>  =0A=
> @@ -785,13 +790,14 @@ static bool setup_environment(void)=0A=
>  	igt_require(igt_pm_dmc_loaded(debugfs));=0A=
>  =0A=
>  out:=0A=
> -	disable_all_screens(&ms_data);=0A=
> +	if (!display_disabled)=0A=
> +		disable_all_screens(&ms_data);=0A=
>  	dump_file(debugfs, "i915_runtime_pm_status");=0A=
>  =0A=
>  	return wait_for_suspended();=0A=
>  }=0A=
>  =0A=
> -static void teardown_environment(void)=0A=
> +static void teardown_environment(bool display_disabled)=0A=
>  {=0A=
>  	close(msr_fd);=0A=
>  	if (has_pc8)=0A=
> @@ -801,7 +807,8 @@ static void teardown_environment(void)=0A=
>  =0A=
>  	igt_pm_restore_sata_link_power_management();=0A=
>  =0A=
> -	fini_mode_set_data(&ms_data);=0A=
> +	if (!display_disabled)=0A=
> +		fini_mode_set_data(&ms_data);=0A=
>  =0A=
>  	close(debugfs);=0A=
>  	close(drm_fd);=0A=
> @@ -2008,7 +2015,7 @@ static struct option long_options[] =3D {=0A=
>  igt_main_args("", long_options, help_str, opt_handler, NULL)=0A=
>  {=0A=
>  	igt_subtest("basic-rte") {=0A=
> -		igt_assert(setup_environment());=0A=
> +		igt_assert(setup_environment(false));=0A=
>  		basic_subtest();=0A=
>  	}=0A=
>  =0A=
> @@ -2016,7 +2023,7 @@ igt_main_args("", long_options, help_str, opt_handl=
er, NULL)=0A=
>  	 * PC8+. We don't want bug reports from cases where the machine is just=
=0A=
>  	 * not properly configured. */=0A=
>  	igt_fixture=0A=
> -		igt_require(setup_environment());=0A=
> +		igt_require(setup_environment(false));=0A=
>  =0A=
>  	if (stay)=0A=
>  		igt_subtest("stay")=0A=
> @@ -2146,7 +2153,7 @@ igt_main_args("", long_options, help_str, opt_handl=
er, NULL)=0A=
>  	}=0A=
>  =0A=
>  	igt_fixture=0A=
> -		teardown_environment();=0A=
> +		teardown_environment(false);=0A=
>  =0A=
>  	igt_subtest("module-reload") {=0A=
>  		igt_debug("Reload w/o display\n");=0A=
> @@ -2155,9 +2162,9 @@ igt_main_args("", long_options, help_str, opt_handl=
er, NULL)=0A=
>  		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");=0A=
>  		igt_assert_eq(igt_i915_driver_load("disable_display=3D1 mmio_debug=3D-=
1"), 0);=0A=
>  =0A=
> -		igt_assert(setup_environment());=0A=
> +		igt_assert(setup_environment(true));=0A=
>  		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));=0A=
> -		teardown_environment();=0A=
> +		teardown_environment(true);=0A=
>  =0A=
>  		igt_debug("Reload as normal\n");=0A=
>  		igt_i915_driver_unload();=0A=
> @@ -2165,11 +2172,11 @@ igt_main_args("", long_options, help_str, opt_han=
dler, NULL)=0A=
>  		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");=0A=
>  		igt_assert_eq(igt_i915_driver_load("mmio_debug=3D-1"), 0);=0A=
>  =0A=
> -		igt_assert(setup_environment());=0A=
> +		igt_assert(setup_environment(false));=0A=
>  		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));=0A=
>  		if (enable_one_screen_with_type(&ms_data, SCREEN_TYPE_ANY))=0A=
>  			drm_resources_equal_subtest();=0A=
> -		teardown_environment();=0A=
> +		teardown_environment(false);=0A=
>  =0A=
>  		/* Remove our mmio_debugging module */=0A=
>  		igt_i915_driver_unload();=0A=
> =0A=
=0A=

--_002_ff96d5d7446e4e298dd238863214da31intelcom_
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Description: pEpkey.asc
Content-Disposition: attachment; filename="pEpkey.asc"; size=1774;
	creation-date="Mon, 23 Mar 2020 07:10:04 GMT";
	modification-date="Mon, 23 Mar 2020 07:10:04 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUVOQkYzazA1Z0JDQUN5WmhP
WGExNGJUY3lUUWtjMVV5R2ZjNGx4ckhQREw1YXVPbkM3cUVIWkw1b3ZWd3NDCmF1ZlFaOVFKVWwx
NHh1OCt4dUl6UGoyWXhEbjFBeVJFN0RzSXNxNjVIaDlRa2YxQytFNmtHeHBDS2VXeFpEalIKS0xE
a2pQWmdRTTdOeHNFWkRkemNaTlFLUEt3OXBXUUovRCtrSUlyNDJYaERhbktyQ1pHV3Vxc3VwVGI4
YmM2agp3ZnBxVzV2eUp2WnVMSHcrTURhRVhoZ1Z0SlVWYVdSWENXbXFZQU1YWFlMMGh5NHVjRDZz
UWl3U2psK3JUU2NIClhqSHdhWURWWTI5bVFlR3lWMDMyeXBFWFQzWG1DVTJVT0hhNENNaktLR3ZK
MjRBU2Q5SFkyWHo4cmNyR1pTbGsKRkhMTGRwNUNET2wrRFU2Vjc5SWs5a3pPMFVxK0hXWDRtc2Z4
QUJFQkFBRzBLMDFoY25ScGJpQlFaWEpsY3lBOApiV0Z5ZEdsdUxuQmxjbVZ6UUd4cGJuVjRMbWx1
ZEdWc0xtTnZiVDZKQVZRRUV3RUlBRDRXSVFSTjlzUS9iN0dPClhRdkh5WUVDditaL002VXplUVVD
WGVUVG1RSWJBd1VKQWVFemdBVUxDUWdIQWdZVkNna0lDd0lFRmdJREFRSWUKQVFJWGdBQUtDUkFD
ditaL002VXplUmJ3Qi85ZHhZaG01WU14eGlSa2tZRVBrOE9DUGZjOGJwazF6RFc5Nkc0MgpLYVoz
RlRPRGNSMktjelg1ZVRMRFYwdklNRndqMmw0UXAvRFpzbVlsNzlKNDNhbHg1RHRIQUZJMlJHSis2
dXJhClFZMkovVXUvUWt5eEdrMTRpQUFzYytaalJSdWllQ1h0Wkc2THRMYmdsTUZCWUd4dzlWVEow
L0xhNHJjUVk3UksKOW1KM1QwWUxKMkJNNlVha3lUWEdzbnN0aWtOa2wzU0JKVDBJc1B1bVdGL240
a25penZQcG5BTGNQWGwwS3VtUwpuZDZ1b2dPT3VrQ0t4Z0RUWm1qRG9meDVvN1pveDI5blNkdjR3
aVJMOHVBeDRrY0pPOUxPOFhBN0lITzd6SXRTCmpXbWRXRmN4QTVicFRkRWR0TThIQWlCQkFaNU44
WXVraENuejltT0FFOXZLOXZydHVRRU5CRjNrMDVrQkNBREwKR3JGN1NBblB5NVo2R2ZlelZDclFm
dUlHSmhPemxuY0c2aFdHYU05YzlDVEtxSGZDNHROV1VFeHJmam5YNjBtRgpJbUx2aHhlRlZDOWJv
QS9jNGFVTmhEYy9NOUtqc08ycWRyd2d4QXl3bnIraVJqbzNORUJWQkF3T2NldWRRM0xPClZmZW5k
b296d3lqd3ZZRFV2QzNUcWtjajBsNmE2R3JqZTZWMVVTQ3RIL0ZlR2NONG9EMnZPOW1yWFlQb2hr
V2cKU3B2QUpPSEs5bk5nMUtaTjcvcDlXNUZMMlZZN2pIbHErd1gxZDBTRytRNlhjVHNEQUEyOStO
YmM1Qk0vcTJJTAphV1Fva0I0bzBaRjNsakZiN2RYZDNRZEpNWDdvNXRURzFMUi9TalZmbkZGckMw
K1IrZGhlRUVldGxVckRMRmF0CnhnRTdvREVPLzA4c2g5eHJPdzdMQUJFQkFBR0pBVHdFR0FFSUFD
WVdJUVJOOXNRL2I3R09YUXZIeVlFQ3YrWi8KTTZVemVRVUNYZVRUbVFJYkRBVUpBZUV6Z0FBS0NS
QUN2K1ovTTZVemVTMVRCLzlNbTFYTUhpbWtFbW15ZXNiMQpxdHFUY2htV2Q1NWhiRkIxMDRSbUx5
c0VrSU43Q3IweVNEZjBZRWxxd2QvSDlGWWVLUTVEWWJWWS9CclhjeGYzCmNKVDJBZ01Zdk54bHZ5
NHluR1F4Yy9YbXRzMGZVSno5cmRVVmZxZlFKbDlHZkR1U3dpQnhmb3BlN21aR2NIZWcKNzBaQTg3
Q0xJQ0FVbi9uRFpSekZuUHNhdUxJSU9sMGhxVWtJUml3WVp0WW9WZnNoVGhTNzNEcXNGS2U0Y25r
eApZcGVCRXNsYUduZnRMUC9uWDl6dkZ4SXJYUXBPdHJ2eWdkWklhMVMrZXhYM2NXMHNPYm02Zjk0
T3Q1Mjl3V3pTCnhJRjBvRnZPY3NlZ2ErL3FPK1hSNHNjbUJ1K3NUVU5FQnA1NWYyc0ptOWllVlU5
SXUwM2JYVnBMZGV3dTNtMEIKTTVtaAo9YzJPTwotLS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9D
Sy0tLS0tCg==

--_002_ff96d5d7446e4e298dd238863214da31intelcom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--_002_ff96d5d7446e4e298dd238863214da31intelcom_--
