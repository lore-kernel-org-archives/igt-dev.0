Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131301134BE
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 07:24:03 +0000 (UTC)
Message-ID: <f65ceb4b-e3aa-3678-2019-b2c2a0ebd3a4@intel.com>
Date: Mon, 27 Jun 2022 12:53:45 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220627070710.13641-1-nidhi1.gupta@intel.com>
 <20220627070710.13641-2-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220627070710.13641-2-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_invalid_mode: Convert
 tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon-27-06-2022 12:37 pm, Nidhi Gupta wrote:
> Convert the existing subtests to dynamic subtests at pipe level.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> ---
>   tests/kms_invalid_mode.c | 54 ++++++++++++++++++----------------------
>   1 file changed, 24 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 630798d8..b79fc78a 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -32,6 +32,7 @@ typedef struct _data data_t;
>   
>   struct _data {
>   	int drm_fd;
> +	enum pipe pipe;
>   	igt_display_t display;
>   	igt_output_t *output;
>   	drmModeResPtr res;
> @@ -177,21 +178,21 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
>   	return true;
>   }
>   
> -static int
> +static void
>   test_output(data_t *data)
>   {
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo mode;
>   	struct igt_fb fb;
> -	int i;
> +	int ret;
> +	uint32_t crtc_id;
>   
>   	/*
>   	 * FIXME test every mode we have to be more
>   	 * sure everything is really getting rejected?
>   	 */
>   	mode = *igt_output_get_mode(output);
> -	if (!data->adjust_mode(data, &mode))
> -		return 0;
> +	igt_require(data->adjust_mode(data, &mode));
>   
>   	igt_create_fb(data->drm_fd,
>   		      max_t(uint16_t, mode.hdisplay, 64),
> @@ -202,32 +203,14 @@ test_output(data_t *data)
>   
>   	kmstest_unset_all_crtcs(data->drm_fd, data->res);
>   
> -	for (i = 0; i < data->res->count_crtcs; i++) {
> -		int ret;
> -
> -		igt_info("Checking pipe %c connector %s with mode %s\n",
> -			 'A'+i, output->name, mode.name);
> +	crtc_id = data->display.pipes[data->pipe].crtc_id;
>   
> -		ret = drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
> -				     fb.fb_id, 0, 0,
> -				     &output->id, 1, &mode);
> -		igt_assert_lt(ret, 0);
> -	}
> +	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
> +			     fb.fb_id, 0, 0,
> +			     &output->id, 1, &mode);
> +	igt_assert_lt(ret, 0);
>   
>   	igt_remove_fb(data->drm_fd, &fb);
> -
> -	return 1;
> -}
> -
> -static void test(data_t *data)
> -{
> -	int valid_connectors = 0;
> -
> -	for_each_connected_output(&data->display, data->output) {
> -		valid_connectors += test_output(data);
> -	}
> -
> -	igt_require_f(valid_connectors, "No suitable connectors found\n");
>   }
>   
>   static int i915_max_dotclock(data_t *data)
> @@ -297,6 +280,10 @@ static data_t data;
>   
>   igt_main
>   {
> +
> +	enum pipe pipe;
> +	igt_output_t *output;
> +
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> @@ -310,10 +297,17 @@ igt_main
>   		igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
>   	}
>   
> +	igt_describe("Test all modesets are rejected when the requested mode is invalid");

Can we update like "Make sure that the commit must be rejected when the 
requested mode is invalid." ?

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

>   	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
> -		igt_subtest(subtests[i].name) {
> -			data.adjust_mode = subtests[i].adjust_mode;
> -			test(&data);
> +		igt_subtest_with_dynamic(subtests[i].name) {
> +			for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
> +					data.output = output;
> +					data.pipe = pipe;
> +					data.adjust_mode = subtests[i].adjust_mode;
> +					test_output(&data);
> +				}
> +			}
>   		}
>   	}
>   
