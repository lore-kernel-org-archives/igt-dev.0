Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677BF10E0B7
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 09:29:54 +0000 (UTC)
Date: Fri, 16 Jun 2023 11:29:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230616092948.qrmzbhmoj7ebyebm@kamilkon-desk1>
References: <20230615115516.1684584-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230615115516.1684584-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/kms_busy: reduce heartbeat
 intervals only if neccessary
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Andrzej,

On 2023-06-15 at 13:55:16 +0200, Andrzej Hajda wrote:
> Reducing heartbeat intervals may downgrade individual engine resets
> to full GPU resets. The latter is not desirable, especially
> on simulations, which do not support GPU reset. Only tests with
> reset flag enabled need reduced hearbeat intervals.
> 
> v2: moved timeouts init/restore to fixups of affected tests, to allow
>     proper work in case test fail

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/i915/kms_busy.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
> index 20d3058fb6f..3b838cb8005 100644
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
>  	}
>  
>  	/* XXX Extend to cover atomic rendering tests to all planes + legacy */
> @@ -470,8 +466,16 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
> -		igt_fixture
> +		struct gem_engine_properties saved_gpu_timeouts[GEM_MAX_ENGINES];
> +		int num_engines;
> +
> +		igt_fixture {
>  			igt_require(display.is_atomic);
> +			if (tests[i].reset)
> +				gpu_engines_init_timeouts(display.drm_fd,
> +							  ARRAY_SIZE(saved_gpu_timeouts),
> +							  &num_engines, saved_gpu_timeouts);
> +		}
>  
>  		igt_subtest_with_dynamic(tests[i].name) {
>  			igt_hang_t hang;
> @@ -501,10 +505,14 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  
>  			igt_disallow_hang(display.drm_fd, hang);
>  		}
> +
> +		igt_fixture {
> +			if (tests[i].reset)
> +				gpu_engines_restore_timeouts(display.drm_fd, num_engines, saved_gpu_timeouts);
> +		}
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
