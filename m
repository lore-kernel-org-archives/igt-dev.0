Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF2A10E37C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 06:46:05 +0000 (UTC)
Message-ID: <6ed86ff6-2681-88c6-0bbb-f0e57ae25fbd@intel.com>
Date: Mon, 17 Apr 2023 12:15:51 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230414135319.1270913-1-bhanuprakash.modem@intel.com>
 <20230414135319.1270913-3-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230414135319.1270913-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 2/6] tests/i915/kms_big_joiner: Fix
 Bigjoiner checks
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


On 4/14/2023 7:23 PM, Bhanuprakash Modem wrote:
> Bigjoiner will come in the picture when the resolution > 5K or
> clock > max dot-clock. Add a support to check the selected mode
> clock is greater than the max dot-clock.
>
> V2: - Handle both 5k & max dot clock cases
>      - Other minor cleanups
> V3: - Fix the logic to avoid the retry
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_big_joiner.c | 80 ++++++++++++++++++++++---------------
>   1 file changed, 48 insertions(+), 32 deletions(-)
>
> diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
> index 8be60ea1176..74639df9d69 100644
> --- a/tests/i915/kms_big_joiner.c
> +++ b/tests/i915/kms_big_joiner.c
> @@ -26,10 +26,13 @@
>   
>   #include "igt.h"
>   
> -#define MAX_HDISPLAY_PER_PIPE 5120
> -
>   IGT_TEST_DESCRIPTION("Test big joiner");
>   
> +struct big_joiner_output {
> +	uint32_t output_id;
> +	drmModeModeInfo mode;
> +};
> +
>   typedef struct {
>   	int drm_fd;
>   	igt_display_t display;
> @@ -37,9 +40,11 @@ typedef struct {
>   	int n_pipes;
>   	enum pipe pipe1;
>   	enum pipe pipe2;
> -	uint32_t big_joiner_output[2];
> +	struct big_joiner_output output[2];

May be not in this patch, but we might need to have consistent naming 
for bigjoiner, so either big_joiner or bigjoiner.

>   } data_t;
>   
> +static int max_dotclock;


I think we can avoid the global variable. Perhaps pass max_dotclock in 
bigjoiner_mode_found() ?

> +
>   static void test_invalid_modeset(data_t *data)
>   {
>   	igt_output_t *output;
> @@ -91,7 +96,7 @@ static void test_basic_modeset(data_t *data)
>   	igt_display_reset(display);
>   
>   	for_each_connected_output(display, output) {
> -		if (data->big_joiner_output[0] == output->id) {
> +		if (data->output[0].output_id == output->id) {
>   			big_joiner_output = output;
>   			break;
>   		}
> @@ -99,9 +104,7 @@ static void test_basic_modeset(data_t *data)
>   
>   	igt_output_set_pipe(big_joiner_output, data->pipe1);
>   
> -	igt_sort_connector_modes(big_joiner_output->config.connector,
> -				 sort_drm_modes_by_res_dsc);
> -	mode = &big_joiner_output->config.connector->modes[0];
> +	mode = &data->output[0].mode;
>   	igt_output_override_mode(big_joiner_output, mode);
>   
>   	pipe = &display->pipes[data->pipe1];
> @@ -130,7 +133,7 @@ static void test_dual_display(data_t *data)
>   	igt_display_reset(display);
>   
>   	for_each_connected_output(display, output) {
> -		if (data->big_joiner_output[count] == output->id) {
> +		if (data->output[count].output_id == output->id) {
>   			big_joiner_output[count] = output;
>   			count++;
>   		}
> @@ -143,9 +146,7 @@ static void test_dual_display(data_t *data)
>   	igt_output_set_pipe(big_joiner_output[1], data->pipe2);
>   
>   	/* Set up first big joiner output on Pipe A*/
> -	igt_sort_connector_modes(big_joiner_output[0]->config.connector,
> -				 sort_drm_modes_by_res_dsc);
> -	mode = &big_joiner_output[0]->config.connector->modes[0];
> +	mode = &data->output[0].mode;
>   	igt_output_override_mode(big_joiner_output[0], mode);
>   
>   	pipe = &display->pipes[data->pipe1];
> @@ -156,9 +157,7 @@ static void test_dual_display(data_t *data)
>   	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
>   
>   	/* Set up second big joiner output on Pipe C*/
> -	igt_sort_connector_modes(big_joiner_output[1]->config.connector,
> -				 sort_drm_modes_by_res_dsc);
> -	mode = &big_joiner_output[1]->config.connector->modes[0];
> +	mode = &data->output[1].mode;
>   	igt_output_override_mode(big_joiner_output[1], mode);
>   
>   	pipe = &display->pipes[data->pipe2];
> @@ -178,6 +177,16 @@ static void test_dual_display(data_t *data)
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> +static bool bigjoiner_mode_found(drmModeConnector *connector,
> +				 int (*sort_method)(const void *, const void*),
> +				 drmModeModeInfo *mode)
> +{
> +	igt_sort_connector_modes(connector, sort_method);
> +	*mode = connector->modes[0];
> +
> +	return igt_bigjoiner_possible(mode, max_dotclock);
> +}
> +
>   igt_main
>   {
>   	data_t data;
> @@ -194,13 +203,24 @@ igt_main
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_require(data.display.is_atomic);
>   
> -		for_each_connected_output(&data.display, output) {
> -			igt_sort_connector_modes(output->config.connector,
> -						 sort_drm_modes_by_res_dsc);
> +		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
> -			mode = &output->config.connector->modes[0];
> -			if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
> -				data.big_joiner_output[count++] = output->id;
> +		for_each_connected_output(&data.display, output) {
> +			bool found = false;
> +			drmModeConnector *connector = output->config.connector;
> +
> +			/*
> +			 * Bigjoiner will come in the picture when
> +			 * the resolution > 5K or clock > max-dot-clock.
> +			 */
> +			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, mode) ||
> +				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, mode)) ?
> +					true : false;
> +
> +			if (found) {
> +				data.output[count].output_id = output->id;
> +				memcpy(&data.output[count].mode, mode, sizeof(drmModeModeInfo));
> +				count++;
>   
>   				width = max(width, mode->hdisplay);
>   				height = max(height, mode->vdisplay);
> @@ -215,7 +235,7 @@ igt_main
>   			j++;
>   		}
>   
> -		igt_require_f(count > 0, "No output with 5k+ mode found\n");
> +		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>   
>   		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   				      DRM_FORMAT_MOD_LINEAR, &data.fb);
> @@ -237,14 +257,12 @@ igt_main
>   
>   		igt_display_reset(&data.display);
>   		for_each_connected_output(&data.display, output) {
> -			if (data.big_joiner_output[0] != output->id)
> +			if (data.output[0].output_id != output->id)
>   				continue;
>   
> -			igt_sort_connector_modes(output->config.connector,
> -						 sort_drm_modes_by_res_dsc);
> -
> +			mode = &data.output[0].mode;
>   			igt_output_set_pipe(output, data.pipe1);
> -			igt_output_override_mode(output, &output->config.connector->modes[0]);
> +			igt_output_override_mode(output, mode);
>   
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(data.pipe1),
> @@ -261,17 +279,15 @@ igt_main
>   
>   				igt_display_reset(&data.display);
>   				for_each_connected_output(&data.display, output) {
> -					igt_sort_connector_modes(output->config.connector,
> -								 sort_drm_modes_by_res_dsc);
> -
> -					if (data.big_joiner_output[0] == output->id) {
> +					if (data.output[0].output_id == output->id) {
>   						first_output = output;
> +						mode = &data.output[0].mode;
> +
>   						igt_output_set_pipe(output, data.pipe1);
> -						igt_output_override_mode(output, &output->config.connector->modes[0]);
> +						igt_output_override_mode(output, mode);
>   					} else if (second_output == NULL) {
>   						second_output = output;
>   						igt_output_set_pipe(output, data.pipe2);
> -						igt_output_override_mode(output, &output->config.connector->modes[0]);

Is this not required? Is it because getting the highest mode on 
second_output doesn't matter, as the modeset on the slave pipe is going 
to fail?


Regards,

Ankit

>   
>   						break;
>   					}
