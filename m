Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DEF10FF93
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 06:39:19 +0000 (UTC)
Message-ID: <6f002776-3b07-e027-85f7-37bbc3c0b818@intel.com>
Date: Fri, 1 Jul 2022 12:09:00 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220628153553.2083-1-nidhi1.gupta@intel.com>
 <20220630142306.2883-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220630142306.2883-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_invalid_mode: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu-30-06-2022 07:53 pm, Nidhi Gupta wrote:
> Sanitize the system state before starting the subtest.

Please add a word about the things doing in this patch, since we are 
doing many things in this patch.

With above change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> 
> v2: test every mode listed by connector to be more
>      sure everything is really getting rejected.
>      (Modem Bhanuprakash)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_invalid_mode.c | 39 +++++++++++++++------------------------
>   1 file changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 0287ee02..28e1ad4b 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -35,7 +35,6 @@ struct _data {
>   	enum pipe pipe;
>   	igt_display_t display;
>   	igt_output_t *output;
> -	drmModeResPtr res;
>   	int max_dotclock;
>   	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
>   };
> @@ -182,35 +181,29 @@ static void
>   test_output(data_t *data)
>   {
>   	igt_output_t *output = data->output;
> -	drmModeModeInfo mode;
>   	struct igt_fb fb;
>   	int ret;
> -	uint32_t crtc_id;
> +	drmModeModeInfo *mode;
>   
> -	/*
> -	 * FIXME test every mode we have to be more
> -	 * sure everything is really getting rejected?
> -	 */
> -	mode = *igt_output_get_mode(output);
> -	igt_require(data->adjust_mode(data, &mode));
> +	igt_output_set_pipe(output, data->pipe);
>   
> -	igt_create_fb(data->drm_fd,
> -		      max_t(uint16_t, mode.hdisplay, 64),
> -		      max_t(uint16_t, mode.vdisplay, 64),
> -		      DRM_FORMAT_XRGB8888,
> +	igt_create_fb(data->drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
>   		      DRM_FORMAT_MOD_LINEAR,
>   		      &fb);
>   
> -	kmstest_unset_all_crtcs(data->drm_fd, data->res);
> -
> -	crtc_id = data->display.pipes[data->pipe].crtc_id;
> -
> -	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
> -			     fb.fb_id, 0, 0,
> -			     &output->id, 1, &mode);
> -	igt_assert_lt(ret, 0);
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		igt_require(data->adjust_mode(data, mode));
> +		igt_output_override_mode(output, mode);
> +		ret = igt_display_try_commit2(&data->display, &data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_assert(ret == -EINVAL);
> +	}
>   
>   	igt_remove_fb(data->drm_fd, &fb);
> +	igt_output_override_mode(output, NULL);
> +	/*unset_all_crtcs*/
> +	igt_display_reset(&data->display);
> +	igt_display_commit(&data->display);
>   }
>   
>   static int i915_max_dotclock(data_t *data)
> @@ -290,11 +283,10 @@ igt_main
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
> -		data.res = drmModeGetResources(data.drm_fd);
> -		igt_assert(data.res);
>   
>   		data.max_dotclock = i915_max_dotclock(&data);
>   		igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
> +		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("Make sure all modesets are rejected when the requested mode is invalid");
> @@ -314,6 +306,5 @@ igt_main
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		igt_reset_connectors();
> -		drmModeFreeResources(data.res);
>   	}
>   }
