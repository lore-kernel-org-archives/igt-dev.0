Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6AF10E14E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 00:51:54 +0000 (UTC)
Message-ID: <3eb062b9-9a05-fbe6-5bc4-bcfc77a21d6e@quicinc.com>
Date: Wed, 19 Oct 2022 17:51:43 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>
References: <20221003073641.77220-1-nidhi1.gupta@intel.com>
 <20221003073641.77220-2-nidhi1.gupta@intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20221003073641.77220-2-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_writeback: Test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

On 10/3/2022 12:36 AM, Nidhi Gupta wrote:
> v1: move igt_skip_on(data.dump_check || data.list_modes)
>      to igt_fixture as it is common for all subtests.
>      (Bhanu)
> v2: replaced hard coded mode with default mode.
>      (Bhanu)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_writeback.c | 50 +++++++++++--------------------------------
>   1 file changed, 13 insertions(+), 37 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 9d134585..248c6acc 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -107,46 +107,26 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>   
>   static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>   {
> -	int i;
>   	enum pipe pipe;
> +	igt_output_t *output;
>   
> -	drmModeModeInfo override_mode = {
> -		.clock = 25175,
> -		.hdisplay = 640,
> -		.hsync_start = 656,
> -		.hsync_end = 752,
> -		.htotal = 800,
> -		.hskew = 0,
> -		.vdisplay = 480,
> -		.vsync_start = 490,
> -		.vsync_end = 492,
> -		.vtotal = 525,
> -		.vscan = 0,
> -		.vrefresh = 60,
> -		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> -		.name = {"640x480-60"},
> -	};
> -
> -	for (i = 0; i < display->n_outputs; i++) {
> -		igt_output_t *output = &display->outputs[i];
> +	drmModeModeInfo override_mode;
>   
> +	for_each_pipe_with_valid_output(display, pipe, output) {
>   		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>   			continue;
>   
> -		for_each_pipe(display, pipe) {
> -			igt_output_set_pipe(output, pipe);
> +		override_mode = *igt_output_get_mode(output);

Missing a call to igt_output_set_pipe(). I would suggest you put it 
right before this line assigning override_mode.

Thanks,

Jessica Zhang

>   
> -			if (data.custom_mode)
> -				override_mode = data.user_mode;
> -			if (data.builtin_mode)
> -				override_mode = output->config.connector->modes[data.mode_index];
> -
> -			if (check_writeback_config(display, output, override_mode)) {
> -				igt_debug("Using connector %u:%s on pipe %d\n",
> -					  output->config.connector->connector_id,
> -					  output->name, pipe);
> +		if (data.custom_mode)
> +			override_mode = data.user_mode;
> +		if (data.builtin_mode)
> +			override_mode = output->config.connector->modes[data.mode_index];
> +		if (check_writeback_config(display, output, override_mode)) {
> +			igt_debug("Using connector %u:%s on pipe %d\n",
> +				   output->config.connector->connector_id,
> +				   output->name, pipe);
>   				return output;
> -			}
>   		}
>   
>   		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
> @@ -155,7 +135,6 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>   		/* Restore any connectors we don't use, so we don't trip on them later */
>   		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
>   	}
> -
>   	return NULL;
>   }
>   
> @@ -521,6 +500,7 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   			list_writeback_modes(&display);
>   		if (data.dump_check)
>   			commit_and_dump_fb(&display, output, plane, &input_fb, &mode);
> +		igt_skip_on(data.dump_check || data.list_modes);
>   	}
>   	/*
>   	 * When dump_check or list_modes flag is high, then the following subtests will be skipped
> @@ -533,7 +513,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   		drmModePropertyBlobRes *formats_blob;
>   		const char *valid_chars;
>   
> -		igt_skip_on(data.dump_check || data.list_modes);
>   		formats_blob = get_writeback_formats_blob(output);
>   		valid_chars = "01234568 ABCGNRUVXY";
>   
> @@ -556,7 +535,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	igt_subtest("writeback-invalid-parameters") {
>   		igt_fb_t invalid_output_fb;
>   
> -		igt_skip_on(data.dump_check || data.list_modes);
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
>   				      mode.vdisplay / 2,
>   				      DRM_FORMAT_XRGB8888,
> @@ -573,7 +551,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	igt_subtest("writeback-fb-id") {
>   		igt_fb_t output_fb;
>   
> -		igt_skip_on(data.dump_check || data.list_modes);
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
>   				      DRM_FORMAT_XRGB8888,
>   				      DRM_FORMAT_MOD_LINEAR,
> @@ -589,7 +566,6 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
>   	igt_subtest("writeback-check-output") {
>   		igt_fb_t output_fb;
>   
> -		igt_skip_on(data.dump_check || data.list_modes);
>   		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
>   				      DRM_FORMAT_XRGB8888,
>   				      igt_fb_mod_to_tiling(0),
> -- 
> 2.25.1
> 
