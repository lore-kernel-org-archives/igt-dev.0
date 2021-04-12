Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967A96E151
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 06:42:18 +0000 (UTC)
Date: Mon, 12 Apr 2021 09:43:15 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YHPsAw4an7zaRzvm@platvala-desk.ger.corp.intel.com>
References: <20210326221524.10233-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326221524.10233-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [v4 i-g-t] tests/kms_busy: Limit the execution to two
 pipes
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>, Kunche Kishore <kishore.kunche@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Mar 27, 2021 at 03:45:24AM +0530, Bhanuprakash Modem wrote:
> As all pipes are symmetric, restrict the execution to two pipes
> can save lot of CI time.
> 
> If we want to execute on all pipes, we need to pass an extra
> argument "-e" indicates extended.
> 
> Example: ./build/tests/kms_busy -e --r basic
> 
> V2, V3:
> * Fix the typo in args handler (Petri)
> V4:
> * Handle clampling cleanly (Petri)
> * Restore lost test coverage in the previous version (Petri/Bhanu)
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Latvala Petri <petri.latvala@intel.com>
> Cc: Kunche Kishore <kishore.kunche@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com> (V3)
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_busy.c | 139 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 89 insertions(+), 50 deletions(-)
> 
> diff --git a/tests/kms_busy.c b/tests/kms_busy.c
> index df1f8e11a..2354ae1fe 100644
> --- a/tests/kms_busy.c
> +++ b/tests/kms_busy.c
> @@ -30,6 +30,11 @@
>  
>  IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
>  
> +/* restricted pipe count */
> +#define CRTC_RESTRICT_CNT 2
> +
> +static bool all_pipes = false;
> +
>  static igt_output_t *
>  set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
>  {
> @@ -287,10 +292,41 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
>  	igt_remove_fb(dpy->drm_fd, &fb);
>  }
>  
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +		case 'e':
> +			all_pipes = true;
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
> +
> +igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
>  	igt_display_t display = { .drm_fd = -1, .n_pipes = IGT_MAX_PIPES };
> -	enum pipe n;
> +
> +	int crtc_count;
> +	int i;
> +	struct {
> +		const char *name;
> +		bool modeset;
> +		bool hang_newfb;
> +		bool reset;
> +	} tests[] = {
> +		{ "extended-pageflip-hang-oldfb", false, false, false },
> +		{ "extended-pageflip-hang-newfb", false, true, false },
> +		{ "extended-modeset-hang-oldfb", true, false, false },
> +		{ "extended-modeset-hang-newfb", true, true, false },
> +		{ "extended-modeset-hang-oldfb-with-reset", true, false, true },
> +		{ "extended-modeset-hang-newfb-with-reset", true, true, true },
> +	};
>  
>  	igt_fixture {
>  		int fd = drm_open_driver_master(DRIVER_INTEL);
> @@ -318,70 +354,73 @@ igt_main
>  		}
>  	}
>  
> -	for_each_pipe_static(n) igt_subtest_group {
> -		igt_hang_t hang;
> -
> +	igt_subtest_with_dynamic("basic") {
> +		enum pipe pipe;
> +		igt_output_t *output;
> +		int count = 0;
> +		igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
>  		errno = 0;
>  
> -		igt_fixture {
> -			igt_display_require_output_on_pipe(&display, n);
> -		}
> -
> -		igt_subtest_f("basic-flip-pipe-%s", kmstest_pipe_name(n)) {
> -			test_flip(&display, n, false);
> -		}
> -		igt_subtest_f("basic-modeset-pipe-%s", kmstest_pipe_name(n)) {
> -
> -			test_flip(&display, n, true);
> -		}
> -
> -		igt_fixture {
> -			hang = igt_allow_hang(display.drm_fd, 0, 0);
> -		}
> +		crtc_count = (all_pipes)? display.n_pipes : CRTC_RESTRICT_CNT;
> +		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			igt_dynamic_f("flip-pipe-%s", kmstest_pipe_name(pipe))
> +				test_flip(&display, pipe, false);
> +			igt_dynamic_f("modeset-pipe-%s", kmstest_pipe_name(pipe))
> +				test_flip(&display, pipe, true);

You missed my earlier point about the "basic" subtest. The code now
just executes on _one_ pipe and then breaks out. Don't make it execute
more, one pipe is enough.

Not to mention this patch makes the test have two subtest with the
name "basic"...


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
