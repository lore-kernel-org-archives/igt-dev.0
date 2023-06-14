Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652E310E059
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 15:01:32 +0000 (UTC)
Message-ID: <e95b5700-40ad-a8c6-aad9-9a5069279142@linux.intel.com>
Date: Wed, 14 Jun 2023 17:01:20 +0200
MIME-Version: 1.0
To: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org
References: <20230613195241.1619575-1-andrzej.hajda@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230613195241.1619575-1-andrzej.hajda@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 6/13/2023 9:52 PM, Andrzej Hajda wrote:
> Reducing heartbeat intervals may downgrade individual engine resets
> to full GPU resets. The latter is not desirable, especially
> on simulations, which do not support GPU reset. Only tests with
> reset flag enabled need reduced hearbeat intervals.
>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
LGTM
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/i915/kms_busy.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
> index 20d3058fb6f..ccabc38fd3f 100644
> --- a/tests/i915/kms_busy.c
> +++ b/tests/i915/kms_busy.c
> @@ -390,8 +390,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		{ "extended-modeset-hang-oldfb-with-reset", true, false, true },
>   		{ "extended-modeset-hang-newfb-with-reset", true, true, true },
>   	};
> -	struct gem_engine_properties saved_gpu_timeouts[GEM_MAX_ENGINES];
> -	int num_engines;
>   	int fd;
>   
>   	igt_fixture {
> @@ -409,8 +407,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		for_each_pipe(&display, pipe)
>   			active_pipes[last_pipe++] = pipe;
>   		last_pipe--;
> -
> -		gpu_engines_init_timeouts(fd, ARRAY_SIZE(saved_gpu_timeouts), &num_engines, saved_gpu_timeouts);
>   	}
>   
>   	/* XXX Extend to cover atomic rendering tests to all planes + legacy */
> @@ -488,14 +484,24 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   					continue;
>   
>   				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -					if (tests[i].reset)
> +					struct gem_engine_properties saved_gpu_timeouts[GEM_MAX_ENGINES];
> +					int num_engines;
> +
> +					if (tests[i].reset) {
> +						gpu_engines_init_timeouts(display.drm_fd,
> +									  ARRAY_SIZE(saved_gpu_timeouts),
> +									  &num_engines, saved_gpu_timeouts);
>   						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
> +					}
>   
>   					test_hang(&display, pipe, output,
>   						  tests[i].modeset, tests[i].hang_newfb);
>   
> -					if (tests[i].reset)
> +					if (tests[i].reset) {
>   						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
> +						gpu_engines_restore_timeouts(display.drm_fd, num_engines,
> +									     saved_gpu_timeouts);
> +					}
>   				}
>   			}
>   
> @@ -504,7 +510,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   	}
>   
>   	igt_fixture {
> -		gpu_engines_restore_timeouts(fd, num_engines, saved_gpu_timeouts);
>   		igt_display_fini(&display);
>   		close(display.drm_fd);
>   	}
