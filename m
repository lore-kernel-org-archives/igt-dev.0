Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9BB10E07D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 15:33:00 +0000 (UTC)
Date: Wed, 14 Jun 2023 17:32:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614153254.ifcyphnglzzrbcln@kamilkon-desk1>
References: <20230613195241.1619575-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230613195241.1619575-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/kms_busy: reduce heartbeat
 intervals only if neccessary
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Andrzej,

On 2023-06-13 at 21:52:41 +0200, Andrzej Hajda wrote:
> Reducing heartbeat intervals may downgrade individual engine resets
> to full GPU resets. The latter is not desirable, especially
> on simulations, which do not support GPU reset. Only tests with
> reset flag enabled need reduced hearbeat intervals.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/i915/kms_busy.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
> index 20d3058fb6f..ccabc38fd3f 100644
> --- a/tests/i915/kms_busy.c
> +++ b/tests/i915/kms_busy.c
> @@ -390,8 +390,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		{ "extended-modeset-hang-oldfb-with-reset", true, false, true },
>  		{ "extended-modeset-hang-newfb-with-reset", true, true, true },
>  	};
> -	struct gem_engine_properties saved_gpu_timeouts[GEM_MAX_ENGINES];
> -	int num_engines;
>  	int fd;
>  
>  	igt_fixture {
> @@ -409,8 +407,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		for_each_pipe(&display, pipe)
>  			active_pipes[last_pipe++] = pipe;
>  		last_pipe--;
> -
> -		gpu_engines_init_timeouts(fd, ARRAY_SIZE(saved_gpu_timeouts), &num_engines, saved_gpu_timeouts);

Restoration of intervals is needed after test fails so maybe we
need separate functionality into reading timeouts (starting
fixup), set new one and restore ?

>  	}
>  
>  	/* XXX Extend to cover atomic rendering tests to all planes + legacy */
> @@ -488,14 +484,24 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  					continue;
>  
>  				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					if (tests[i].reset)
> +					struct gem_engine_properties saved_gpu_timeouts[GEM_MAX_ENGINES];
> +					int num_engines;
> +
> +					if (tests[i].reset) {
> +						gpu_engines_init_timeouts(display.drm_fd,
> +									  ARRAY_SIZE(saved_gpu_timeouts),
> +									  &num_engines, saved_gpu_timeouts);
>  						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
> +					}
>  
>  					test_hang(&display, pipe, output,
>  						  tests[i].modeset, tests[i].hang_newfb);
>  
> -					if (tests[i].reset)
> +					if (tests[i].reset) {
>  						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
> +						gpu_engines_restore_timeouts(display.drm_fd, num_engines,
> +									     saved_gpu_timeouts);

If test fails this will not be run. Other way to ensure it will
be run would be to use atexit function, it may be set at first
init. Look at igt_install_exit_handler in igt_core.

Regards,
Kamil

> +					}
>  				}
>  			}
>  
> @@ -504,7 +510,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture {
> -		gpu_engines_restore_timeouts(fd, num_engines, saved_gpu_timeouts);
>  		igt_display_fini(&display);
>  		close(display.drm_fd);
>  	}
> -- 
> 2.34.1
> 
