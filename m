Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9972310E716
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 10:25:53 +0000 (UTC)
Message-ID: <9e8fbe16-edbd-4ad1-bfee-8022821eb670@intel.com>
Date: Thu, 23 Nov 2023 15:55:48 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20231120100151.1792953-1-kunal1.joshi@intel.com>
 <20231120100151.1792953-2-kunal1.joshi@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231120100151.1792953-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/intel/kms_big_joiner: added
 new subtest simultaneous-modeset
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

Hi Kunal,

Subject line should be "add new subtest".

On 20-Nov-23 3:31 PM, Kunal Joshi wrote:
> newly added test tries to have as many outputs as possible,
> prefernce is given to big_joiner outputs, with this we can
> stress on bw
> 
> v2: Sorting not needed when output count is 1
>      Skip if output count is 0
> v3: Rebase
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 118 ++++++++++++++++++++++++++++++++---
>   1 file changed, 108 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index 2f81204f5..73d3b20ae 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -46,10 +46,101 @@ typedef struct {
>   	enum pipe pipe1;
>   	enum pipe pipe2;
>   	struct bigjoiner_output output[2];
> +	int no_of_big_joiner_outputs;
> +	igt_output_t **sorted_outputs;
> +	int no_sorted_outputs;
>   } data_t;
>   
>   static int max_dotclock;
>   
> +/*
> + *  Sort outputs based on hdisplay
> + */
> +static int compare_outputs(const void *a, const void *b)
> +{
> +	igt_output_t *outputA = *(igt_output_t **)a;
> +	igt_output_t *outputB = *(igt_output_t **)b;
> +
> +	return outputB->config.connector->modes[0].hdisplay - outputA->config.connector->modes[0].hdisplay;
> +}
> +
> +/*
> + * Function to add connected outputs to an array and sort them by hdisplay
> + */
> +static void set_sorted_outputs(data_t *data)
> +{
> +	int i;
> +	igt_output_t *output;
> +
> +	i = 0;
> +	for_each_connected_output(&data->display, output)
> +		data->no_sorted_outputs++;
> +
> +	igt_skip_on_f(data->no_sorted_outputs <= 0, "No output found\n");
> +	/*
> +	 * Create an array to store igt_output_t pointers
> +	 */
> +	data->sorted_outputs = (igt_output_t **)malloc(sizeof(igt_output_t *) * data->no_sorted_outputs);
> +	/*
> +	 * Add connected outputs to the array
> +	 */
> +	for_each_connected_output(&data->display, output)
> +		data->sorted_outputs[i++] = output;
> +
> +	if (data->no_sorted_outputs > 1)
> +		/*
> +		 * Sort the array based on hdisplay
> +		 */
> +		qsort(data->sorted_outputs, data->no_sorted_outputs,
> +		      sizeof(igt_output_t *), compare_outputs);
> +}
> +
> +/**
> + * SUBTEST: simultaneous-modeset
> + * Description: Try to do modeset with as many output as possible
> + *		with big joiner given as priority
> + * Driver requirement: i915, xe
> + * Functionality: BW
> + * Mega feature: Bigjoiner, BW
> + * Test category: BW test
> + */
> +static int run_simultaneous_modeset(data_t *data)
> +{
> +	int pipe, i, j;
> +	int remanining_big_joiner_outputs;
> +	struct igt_fb *primary_fb = malloc(data->n_pipes * sizeof(struct igt_fb));
> +	igt_plane_t **primary = malloc(data->n_pipes * sizeof(igt_plane_t *));
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
> +
> +	remanining_big_joiner_outputs = data->no_of_big_joiner_outputs;
> +	pipe = i = j = 0;
> +	set_sorted_outputs(data);
> +
> +	while (pipe < data->n_pipes) {
> +		output = i < data->no_sorted_outputs ? data->sorted_outputs[i] : NULL;
> +		if (output == NULL)
> +			break;
> +		mode = igt_output_get_mode(output);
> +		igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1.0, 0.0, 0.0, &primary_fb[i]);
> +		igt_output_set_pipe(output, pipe);
> +		igt_info("Using (pipe %s + %s) to run the subtest with mode %dx%d.\n",
> +				kmstest_pipe_name(pipe), igt_output_name(output),
> +				mode->hdisplay, mode->vdisplay);
> +		primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary[i], &primary_fb[i]);
> +		i++;
> +		pipe = pipe + remanining_big_joiner_outputs > 0 ? 2 : 1;
> +	       --remanining_big_joiner_outputs;
> +	}
> +	if (igt_display_try_commit2(&data->display, COMMIT_ATOMIC) == 0) {
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		return 0;
> +	} else
> +		return igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
>   /**
>    * SUBTEST: invalid-modeset
>    * Description: Verify if the modeset on the adjoining pipe is rejected when
> @@ -222,7 +313,7 @@ igt_main
>   	data_t data;
>   	igt_output_t *output;
>   	drmModeModeInfo *mode;
> -	int valid_output = 0, i, count = 0, j = 0;
> +	int valid_output = 0, i, j = 0;
>   	uint16_t width = 0, height = 0;
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   
> @@ -248,9 +339,8 @@ igt_main
>   					true : false;
>   
>   			if (found) {
> -				data.output[count].output_id = output->id;
> -				memcpy(&data.output[count].mode, mode, sizeof(drmModeModeInfo));
> -				count++;
> +				data.output[data.no_of_big_joiner_outputs].output_id = output->id;
> +				memcpy(&data.output[data.no_of_big_joiner_outputs++].mode, mode, sizeof(drmModeModeInfo));
>   
>   				width = max(width, mode->hdisplay);
>   				height = max(height, mode->vdisplay);
> @@ -264,15 +354,13 @@ igt_main
>   			pipe_seq[j] = i;
>   			j++;
>   		}
> -
> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> -
> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic") {
> +		igt_require_f(data.no_of_big_joiner_outputs > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   		for (i = 0; i < data.n_pipes - 1; i++) {
>   			data.pipe1 = pipe_seq[i];
>   			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
> @@ -283,6 +371,10 @@ igt_main
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
>   	igt_subtest_with_dynamic("invalid-modeset") {
> +		igt_require_f(data.no_of_big_joiner_outputs > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
> +
>   		data.pipe1 = pipe_seq[j - 1];
>   
>   		igt_display_reset(&data.display);
> @@ -335,7 +427,9 @@ igt_main
>   
>   	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>   	igt_subtest_with_dynamic("2x-modeset") {
> -		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
> +		igt_require_f(data.no_of_big_joiner_outputs > 1, "2 outputs with big joiner modes are required\n");
> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>   		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>   		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>   			data.pipe1 = pipe_seq[i];
> @@ -345,6 +439,10 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Simultaneous moseset on all pipes possible");
> +	igt_subtest("simultaneous-modeset")
> +		igt_assert_f(run_simultaneous_modeset(&data) == 0, "Commit failure\n");
> +
>   	igt_fixture {
>   		igt_remove_fb(data.drm_fd, &data.fb);
>   		igt_display_fini(&data.display);
