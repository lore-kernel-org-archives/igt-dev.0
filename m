Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90E189BF3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 11:04:40 +0000 (UTC)
Date: Thu, 19 Nov 2020 13:04:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201119110436.GJ7444@platvala-desk.ger.corp.intel.com>
References: <20201119094318.2213919-2-chris@chris-wilson.co.uk>
 <20201119105440.2214381-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119105440.2214381-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_pipe_crc_basic: Handle
 absent pipes for disable-crc-after-crtc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 10:54:40AM +0000, Chris Wilson wrote:
> Check that the output exists prior to use, and in doing so prevent the
> test from exploding (without leaving an intelligible trace) when the
> connector is randomly lost.
> 
> v2: Convert test_compare_crc to follow the same output requirements
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/kms_pipe_crc_basic.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index e584dca9b..db047c4cd 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -71,6 +71,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
>  	igt_crc_t *crcs = NULL;
>  	int c, j;
>  
> +	igt_require_pipe(display, pipe);
>  	igt_display_require_output_on_pipe(display, pipe);
>  	output = igt_get_single_output_for_pipe(display, pipe);
>  
> @@ -171,10 +172,11 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
>  	igt_crc_t ref_crc, crc;
>  	igt_pipe_crc_t *pipe_crc = NULL;
>  	struct igt_fb fb0, fb1;
> -	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
> +	igt_output_t *output;
>  
> -	igt_require_f(output, "No connector found for pipe %s\n",
> -			kmstest_pipe_name(pipe));
> +	igt_require_pipe(display, pipe);
> +	igt_display_require_output_on_pipe(display, pipe);
> +	output = igt_get_single_output_for_pipe(display, pipe);

Turns out igt_display_require_output_on_pipe also calls
igt_require_pipe. As does igt_get_single_output_for_pipe.

Either way, checking for non-null output is needed so with or without
the redundant extra igt_require_pipe

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>  
>  	igt_display_reset(display);
>  	igt_output_set_pipe(output, pipe);
> @@ -224,14 +226,21 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
>  static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
>  {
>  	igt_display_t *display = &data->display;
> -	igt_output_t *output = igt_get_single_output_for_pipe(&data->display, pipe);
> -	igt_pipe_crc_t *pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
> -	drmModeModeInfo *mode = igt_output_get_mode(output);
> +	igt_pipe_crc_t *pipe_crc;
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
>  	igt_crc_t crc[2];
>  
> +	igt_require_pipe(display, pipe);
> +	igt_display_require_output_on_pipe(display, pipe);
> +	output = igt_get_single_output_for_pipe(display, pipe);
> +
> +	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
> +
>  	igt_display_reset(display);
>  	igt_output_set_pipe(output, pipe);
>  
> +	mode = igt_output_get_mode(output);
>  	igt_create_color_fb(data->drm_fd,
>  			    mode->hdisplay, mode->vdisplay,
>  			    DRM_FORMAT_XRGB8888,
> @@ -290,8 +299,6 @@ igt_main
>  			test_read_crc(&data, pipe, TEST_SEQUENCE | TEST_NONBLOCK);
>  
>  		igt_subtest_f("suspend-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
> -			igt_require_pipe(&data.display, pipe);
> -
>  			test_read_crc(&data, pipe, 0);
>  
>  			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
