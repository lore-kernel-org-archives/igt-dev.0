Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55C10E849
 for <igt-dev@lists.freedesktop.org>; Mon,  9 May 2022 10:00:13 +0000 (UTC)
Date: Mon, 9 May 2022 13:00:30 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <YnjmPrT7UBSsjpFK@platvala-desk.ger.corp.intel.com>
References: <20220506212253.1352246-1-alex.hung@amd.com>
 <20220506212253.1352246-2-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506212253.1352246-2-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH 2/2 i-g-t] tests/kms_universal_plane: enable
 gen9_test_pipe for all devices
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

On Fri, May 06, 2022 at 03:22:53PM -0600, Alex Hung wrote:
> This subtest runs on non-i915 devices, and let's make it generic by
> removing igt_require_intel and renaming it.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_universal_plane.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 3a3667e6..65f898fe 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -701,15 +701,14 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
>   * windowing)
>   */
>  static void
> -gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> +pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>  {
>  	gen9_test_t test = { .data = data };
>  	igt_plane_t *primary;
>  
>  	int ret = 0;
> -
> -	igt_require_intel(data->drm_fd);
> -	igt_skip_on(data->display_ver < 9);
> +	if (is_i915_device(data->drm_fd))
> +		igt_skip_on(data->display_ver < 9);
>  	igt_require_pipe(&data->display, pipe);
>  
>  	igt_output_set_pipe(output, pipe);
> @@ -789,10 +788,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>  			cursor_leak_test_pipe(data, pipe, output);
>  
>  	igt_describe("Check if pageflip succeeds in windowed setting");
> -	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
> +	igt_subtest_f("universal-plane-pageflip_windowed-pipe-%s",

Don't mix dashes and underscores, make it pageflip-windowed.


-- 
Petri Latvala


>  		      kmstest_pipe_name(pipe))
>  		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			gen9_test_pipe(data, pipe, output);
> +			pageflip_win_test_pipe(data, pipe, output);
>  }
>  
>  static data_t data;
> -- 
> 2.25.1
> 
