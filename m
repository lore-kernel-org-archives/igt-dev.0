Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1076D6FA42
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jul 2021 05:23:28 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Fri, 23 Jul 2021 05:23:22 +0000
Message-ID: <8342535f7d80476685f7f26643788ea8@intel.com>
References: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
 <20210705125617.4631-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20210705125617.4631-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_busy: Limit the execution
 to two pipes
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "Kunche,
 Kishore" <kishore.kunche@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Monday, July 5, 2021 6:26 PM
> To: igt-dev@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Latvala, Petri <petri.latvala@intel.com>; Kunche, Kishore
> <kishore.kunche@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [PATCH i-g-t 1/3] tests/kms_busy: Limit the execution to two pipes
> 
> To save the CI time, we can restrict the execution to two pipes i.e first and last
> active pipes.
> 
> If we want to execute on all pipes, we need to pass an extra argument "-e" indicates
> extended.
> 
> Example: ./build/tests/kms_busy -e --r basic
> 
> V2, V3:
> * Fix the typo in args handler (Petri)
> V4:
> * Handle clampling cleanly (Petri)
> * Restore lost test coverage in the previous version (Petri/Bhanu)
> V5:
> * Fix two subtest with the name "basic" (Petri)
> V6:
> * Refactor to run on first & last pipes.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Latvala Petri <petri.latvala@intel.com>
> Cc: Kunche Kishore <kishore.kunche@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_busy.c | 149 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 90 insertions(+), 59 deletions(-)
> 
> diff --git a/tests/kms_busy.c b/tests/kms_busy.c index 0973daf04e..61d4d35ddf
> 100644
> --- a/tests/kms_busy.c
> +++ b/tests/kms_busy.c
> @@ -30,6 +30,8 @@
> 
>  IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
> 
> +static bool all_pipes = false;
> +
>  static igt_output_t *
>  set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)  { @@ -287,13 +289,46
> @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
>  	igt_remove_fb(dpy->drm_fd, &fb);
>  }
> 
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data) {
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
> +	"  -e \tRun on all pipes. (By default subtests will run on two
> +pipes)\n";
> +
> +igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
>  	igt_display_t display = { .drm_fd = -1, .n_pipes = IGT_MAX_PIPES };
> -	enum pipe n;
> +
> +	enum pipe active_pipes[IGT_MAX_PIPES];
> +	uint32_t last_pipe = 0;
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
> +		enum pipe pipe;
> 
>  		igt_require_gem(fd);
>  		gem_require_mmap_wc(fd);
> @@ -301,6 +336,11 @@ igt_main
> 
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&display, fd);
> +
> +		/* Get active pipes. */
> +		for_each_pipe(&display, pipe)
> +			active_pipes[last_pipe++] = pipe;
> +		last_pipe--;
>  	}
> 
>  	/* XXX Extend to cover atomic rendering tests to all planes + legacy */ @@ -
> 319,79 +359,70 @@ igt_main
>  		}
>  	}
> 
> -	for_each_pipe_static(n) igt_subtest_group {
> -		igt_hang_t hang;
> -
> +	igt_subtest_with_dynamic("basic-hang") {
> +		enum pipe pipe;
> +		igt_output_t *output;
> +		igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
>  		errno = 0;
> 
> -		igt_fixture {
> -			igt_display_require_output_on_pipe(&display, n);
> -		}
> -
> -		igt_describe("Tests basic flip on pipe.");
> -		igt_subtest_f("basic-flip-pipe-%s", kmstest_pipe_name(n)) {
> -			test_flip(&display, n, false);
> -		}
> -		igt_describe("Tests basic modeset on pipe.");
> -		igt_subtest_f("basic-modeset-pipe-%s", kmstest_pipe_name(n)) {
> -
> -			test_flip(&display, n, true);
> -		}
> -
> -		igt_fixture {
> -			hang = igt_allow_hang(display.drm_fd, 0, 0);
> -		}
> +		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			if (!all_pipes && pipe != active_pipes[0] &&
> +					  pipe != active_pipes[last_pipe])
> +				continue;
> 
> -		igt_describe("Hang test on pipe with oldfb and extended pageflip
> modeset.");
> -		igt_subtest_f("extended-pageflip-modeset-hang-oldfb-pipe-%s",
> -			      kmstest_pipe_name(n)) {
> -			test_pageflip_modeset_hang(&display, n);
> +			igt_dynamic_f("flip-pipe-%s", kmstest_pipe_name(pipe))
> +				test_flip(&display, pipe, false);
> +			igt_dynamic_f("modeset-pipe-%s",
> kmstest_pipe_name(pipe))
> +				test_flip(&display, pipe, true);
>  		}
> 
> -		igt_fixture
> -			igt_require(display.is_atomic);
> +		igt_disallow_hang(display.drm_fd, hang);
> +	}
> 
> -		igt_describe("Test the results with a single hanging pageflip on pipe
> with oldfb.");
> -		igt_subtest_f("extended-pageflip-hang-oldfb-pipe-%s",
> -			      kmstest_pipe_name(n))
> -			test_hang(&display, n, false, false);
> +	igt_subtest_with_dynamic("extended-pageflip-modeset-hang-oldfb") {
> +		enum pipe pipe;
> +		igt_output_t *output;
> +		igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
> +		errno = 0;
> 
> -		igt_describe("Test the results with a single hanging pageflip on pipe
> with newfb.");
> -		igt_subtest_f("extended-pageflip-hang-newfb-pipe-%s",
> -			      kmstest_pipe_name(n))
> -			test_hang(&display, n, false, true);
> +		for_each_pipe_with_valid_output(&display, pipe, output) {
> +			if (!all_pipes && pipe != active_pipes[0] &&
> +					  pipe != active_pipes[last_pipe])
> +				continue;
> 
> -		igt_describe("Tests modeset disable/enable with hang on pipe with
> oldfb.");
> -		igt_subtest_f("extended-modeset-hang-oldfb-pipe-%s",
> -			      kmstest_pipe_name(n))
> -			test_hang(&display, n, true, false);
> +			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
> +				test_pageflip_modeset_hang(&display, pipe);
> +		}
> 
> -		igt_describe("Tests modeset disable/enable with hang on pipe with
> newfb.");
> -		igt_subtest_f("extended-modeset-hang-newfb-pipe-%s",
> -			      kmstest_pipe_name(n))
> -			test_hang(&display, n, true, true);
> +		igt_disallow_hang(display.drm_fd, hang);
> +	}
> 
> -		igt_describe("Tests modeset disable/enable with hang on reset pipe
> with oldfb.");
> -		igt_subtest_f("extended-modeset-hang-oldfb-with-reset-pipe-%s",
> -			      kmstest_pipe_name(n)) {
> -			igt_set_module_param_int(display.drm_fd,
> "force_reset_modeset_test", 1);
> +	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
> +		igt_subtest_with_dynamic(tests[i].name) {
> +			enum pipe pipe;
> +			igt_output_t *output;
> +			igt_hang_t hang;
> +			errno = 0;
> 
> -			test_hang(&display, n, true, false);
> +			igt_require(display.is_atomic);
> +			hang = igt_allow_hang(display.drm_fd, 0, 0);
> 
> -			igt_set_module_param_int(display.drm_fd,
> "force_reset_modeset_test", 0);
> -		}
> +			for_each_pipe_with_valid_output(&display, pipe, output) {
> +				if (!all_pipes && pipe != active_pipes[0] &&
> +						  pipe != active_pipes[last_pipe])
> +					continue;
> 
> -		igt_describe("Tests modeset disable/enable with hang on reset pipe
> with newfb.");
> -		igt_subtest_f("extended-modeset-hang-newfb-with-reset-pipe-%s",
> -			      kmstest_pipe_name(n)) {
> -			igt_set_module_param_int(display.drm_fd,
> "force_reset_modeset_test", 1);
> +				igt_dynamic_f("pipe-%s",
> kmstest_pipe_name(pipe)) {
> +					if (tests[i].reset)
> +
> 	igt_set_module_param_int(display.drm_fd,
> +"force_reset_modeset_test", 1);
> 
> -			test_hang(&display, n, true, true);
> +					test_hang(&display, pipe, tests[i].modeset,
> tests[i].hang_newfb);
> 
> -			igt_set_module_param_int(display.drm_fd,
> "force_reset_modeset_test", 0);
> -		}
> +					if (tests[i].reset)
> +
> 	igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
> +				}
> +			}
> 
> -		igt_fixture {
>  			igt_disallow_hang(display.drm_fd, hang);
>  		}
>  	}
> --
> 2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
