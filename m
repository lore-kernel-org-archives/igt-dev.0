Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E321F10E0A8
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Nov 2022 09:26:34 +0000 (UTC)
Date: Wed, 9 Nov 2022 10:26:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y2tyM6YJ5PHWjc4l@kamilkon-desk1>
References: <1667912583-27297-1-git-send-email-nidhi1.gupta@intel.com>
 <1667912583-27297-3-git-send-email-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1667912583-27297-3-git-send-email-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH 2/2] tests/i915/i915_pm_backlight: Create
 dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

On 2022-11-08 at 18:33:03 +0530, Nidhi Gupta wrote:
> Modified the test to include dynamic subtests.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/i915/i915_pm_backlight.c | 109 +++++++++++++++++++++--------------------
>  1 file changed, 56 insertions(+), 53 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index fdf1315..9fe9f45 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -66,7 +66,8 @@ static int backlight_read(int *result, const char *fname, struct context *contex
>  	char dst[512];
>  	int r, e;
>  
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
> +	if (snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) > PATH_MAX)
> +		return -errno;
>  	fd = open(full, O_RDONLY);
>  	if (fd == -1)
>  		return -errno;
> @@ -90,7 +91,8 @@ static int backlight_write(int value, const char *fname, struct context *context
>  	char src[64];
>  	int len;
>  
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
> +	if (snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) > PATH_MAX)
> +		return -errno;
>  	fd = open(full, O_WRONLY);
>  	if (fd == -1)
>  		return -errno;
> @@ -163,30 +165,32 @@ static void test_fade(struct context *context)
>  	}
>  }
>  
> -static void
> -test_fade_with_dpms(struct context *context, igt_output_t *output)
> +static int
> +check_dpms(igt_output_t *output)
>  {
> -	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
> +	if ((igt_setup_runtime_pm(output->display->drm_fd)) == 0)
> +			return -errno;
>  
>  	kmstest_set_connector_dpms(output->display->drm_fd,
>  				   output->config.connector,
>  				   DRM_MODE_DPMS_OFF);
> -	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	if ((igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) == 0)
> +		return -errno;
>  
>  	kmstest_set_connector_dpms(output->display->drm_fd,
>  				   output->config.connector,
>  				   DRM_MODE_DPMS_ON);
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
> +	if ((igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE)) == 0)
> +		return -errno;
> +
> +	return 1;
>  
> -	test_fade(context);
>  }
>  
>  static void
> -test_fade_with_suspend(struct context *context, igt_output_t *output)
> +check_suspend(igt_output_t *output)
>  {
>  	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> -
> -	test_fade(context);
>  }
>  
>  static void test_cleanup(igt_display_t *display, igt_output_t *output)
> @@ -228,13 +232,25 @@ static void test_setup(igt_display_t display, igt_output_t *output)
>  
>  igt_main
>  {
> -	int old, fd;
> -	int i = 0;
> +	int old[NUM_EDP_OUTPUTS], fd;
> +	int i = 0, ret = 0;
>  	igt_display_t display;
>  	igt_output_t *output;
>  	char file_path_n[PATH_MAX] = "";
>  	bool dual_edp = false;
>  	struct context contexts[NUM_EDP_OUTPUTS];
> +	struct {
> +		const char *name;
> +		const char *desc;
> +		void (*test_t) (struct context *);
> +		int flags;
> +	} tests[] = {
> +		{ "basic-brightness", "desc", test_brightness, TEST_NONE },
-------------------------------------- ^
Please do not put dummy descriptions, either write it correctly
from the start or do it in separate patch.

Regards,
Kamil

> +		{ "bad-brightness", "desc", test_bad_brightness, TEST_NONE },
> +		{ "fade", "desc", test_fade, TEST_NONE },
> +		{ "fade-with-dpms", "desc", test_fade, TEST_DPMS },
> +		{ "fade-with-suspend", "desc", test_fade, TEST_SUSPEND },
> +	};
>  
>  	igt_fixture {
>  		bool found = false;
> @@ -289,54 +305,41 @@ igt_main
>  		igt_require_f(found, "No valid output found.\n");
>  	}
>  
> -	igt_subtest("basic-brightness") {
> -		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> -			test_setup(display, &contexts->output[j]);
> -			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
> -			test_brightness(&contexts[j]);
> -			test_cleanup(&display, output);
> -		}
> -	}
>  
> -	igt_subtest("bad-brightness") {
> -		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> -			test_setup(display, &contexts->output[j]);
> -			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
> -			test_bad_brightness(&contexts[j]);
> -			test_cleanup(&display, output);
> -		}
> -	}
> -	igt_subtest("fade") {
> -		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> -			test_setup(display, &contexts->output[j]);
> -			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
> -			test_fade(&contexts[j]);
> -			test_cleanup(&display, output);
> -		}
> -	}
> -	igt_subtest("fade_with_dpms") {
> -		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> -			test_setup(display, &contexts->output[j]);
> -			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
> -			test_fade_with_dpms(&contexts[j], output);
> -			test_cleanup(&display, output);
> -		}
> -	}
> -	igt_subtest("fade_with_suspend") {
> -		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> -			test_setup(display, &contexts->output[j]);
> -			igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
> -			test_fade_with_suspend(&contexts[j], output);
> -			test_cleanup(&display, output);
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe(tests[i].desc);
> +		igt_subtest_with_dynamic(tests[i].name) {
> +			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> +				 test_setup(display, &contexts->output[j]);
> +
> +				 if (backlight_read(&old[j], "brightness", &contexts[j]))
> +					continue;
> +
> +				 if (tests[i].flags == TEST_DPMS) {
> +					ret = check_dpms(contexts[j].output);
> +					if (ret == 0)
> +						continue;
> +				 }
> +
> +				 if (tests[i].flags == TEST_SUSPEND)
> +					check_suspend(contexts[j].output);
> +
> +				igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
> +					igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);
> +					tests[i].test_t(&contexts[j]);
> +				}
> +
> +				test_cleanup(&display, output);
> +			}
> +			/* TODO: Add tests for dual eDP. */
>  		}
>  	}
>  
>  
> -
>  	igt_fixture {
>  		/* Restore old brightness */
>  		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> -			backlight_write(old, "brightness", &contexts[j]);
> +			backlight_write(old[j], "brightness", &contexts[j]);
>  		}
>  
>  		igt_display_fini(&display);
> -- 
> 1.9.1
> 
