Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B4E10E5EE
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 06:24:49 +0000 (UTC)
Message-ID: <2306c602-7454-e65b-0586-3a8ab633024d@intel.com>
Date: Fri, 23 Dec 2022 11:54:31 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20221115165916.196084-1-bhanuprakash.modem@intel.com>
 <20221115165916.196084-5-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20221115165916.196084-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 03/52] tests/kms_async_flips: Add support
 for Bigjoiner
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


On 11/15/2022 10:28 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> V2: - Use updated helper name
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_async_flips.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 7cb71f6b..674fcb5a 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -330,15 +330,6 @@ static void test_cursor(data_t *data)
>   	struct igt_fb cursor_fb;
>   	struct drm_mode_cursor cur;
>   
> -	/*
> -	 * Intel's PSR2 selective fetch adds other planes to state when
> -	 * necessary, causing the async flip to fail because async flip is not
> -	 * supported in cursor plane.
> -	 */
> -	igt_skip_on_f(i915_psr2_selective_fetch_check(data->drm_fd),
> -		      "PSR2 sel fetch causes cursor to be added to primary plane " \
> -		      "pages flips and async flip is not supported in cursor\n");
> -

Hi,

This change looks unrelated, could you please move this to a separate patch.

>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
>   	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
>   
> @@ -380,12 +371,12 @@ static void test_invalid(data_t *data)
>   	struct igt_fb fb;
>   	drmModeModeInfo *mode;
>   
> +	test_init(data);
> +
>   	mode = igt_output_get_mode(data->output);
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
> -	test_init(data);
> -
Same as above.
>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>   		      I915_FORMAT_MOD_Y_TILED, &fb);
>   
> @@ -542,9 +533,16 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_output_t *output;
>   	enum pipe pipe;
> +	igt_display_t *display = &data->display;
> +
> +	for_each_pipe(display, pipe) {
> +		for_each_valid_output_on_pipe(display, pipe, output) {
> +			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(display))
> +				continue;
>   
> -	for_each_pipe(&data->display, pipe) {
> -		for_each_valid_output_on_pipe(&data->display, pipe, output) {

With those changes, the patch LGTM.

Thanks,
Karthik.B.S
>   			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>   				data->output = output;
>   				data->pipe = pipe;
