Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF0910E08D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Feb 2023 06:56:50 +0000 (UTC)
Message-ID: <f0975ed8-2212-b0a2-71e0-2a5317ab453a@intel.com>
Date: Fri, 10 Feb 2023 12:04:01 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230209062322.1562797-2-bhanuprakash.modem@intel.com>
 <20230210044904.1766729-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230210044904.1766729-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 2/2] tests/kms_atomic_transition: Test
 cleanup
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


On 2/10/2023 10:19 AM, Bhanuprakash Modem wrote:
> As we are using same function for cleanup, no need to do other
> stuff, just return after unsetting the output to pipe.
>
> V2: - New helper to unset output to pipe (Karthik)
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_atomic_transition.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index e1b74ac2c..64e7e7091 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -704,15 +704,21 @@ static void commit_display(data_t *data, unsigned event_mask, bool nonblocking)
>   	igt_reset_timeout();
>   }
>   
> +static void unset_output_pipe(igt_display_t *display)
> +{
> +	int i;
> +
> +	for (i = 0; i < display->n_outputs; i++)
> +		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
> +}
> +
>   static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
>   {
>   	igt_output_t *output;
>   	enum pipe pipe;
>   	unsigned event_mask = 0;
> -	int i;
>   
> -	for (i = 0; i < data->display.n_outputs; i++)
> -		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
> +	unset_output_pipe(&data->display);
>   
>   	for_each_pipe(&data->display, pipe) {
>   		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
> @@ -806,10 +812,9 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
>   	igt_output_t *output;
>   	uint16_t width = 0, height = 0;
>   
> -	for (i = 0; i < data->display.n_outputs; i++)
> -		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
> -
>   retry:
> +	unset_output_pipe(&data->display);
> +
>   	j = 0;
>   	for_each_connected_output(&data->display, output) {
>   		drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -865,13 +870,9 @@ retry:
>   				DRM_MODE_ATOMIC_TEST_ONLY |
>   				DRM_MODE_ATOMIC_ALLOW_MODESET,
>   				NULL) != 0) {
> -		igt_output_t *out;
>   		bool found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
>   		igt_require_f(found, "No valid mode combo found.\n");
>   
> -		for_each_connected_output(&data->display, out)
> -			igt_output_set_pipe(out, PIPE_NONE);
> -
>   		goto retry;
>   	}
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -971,7 +972,7 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
>   		run_modeset_tests(data, requested_outputs, nonblocking, fencing);
>   
>   	/* Cleanup */
> -	set_combinations(data, 0, NULL);
> +	unset_output_pipe(&data->display);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	if (is_i915_device(data->drm_fd)) {
