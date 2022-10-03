Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EFA10E3A1
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Oct 2022 13:31:50 +0000 (UTC)
Date: Mon, 3 Oct 2022 15:31:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YzrkQcukTfhqIbRD@kamilkon-desk1>
References: <20220929092845.6684-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220929092845.6684-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_backlight: Add new
 subtest to validate dual panel backlight
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

On 2022-09-29 at 14:58:45 +0530, Nidhi Gupta wrote:
> Since driver can now support multiple eDPs and Debugfs structure for
> backlight changed per connector the test should then iterate through
> all eDP connectors.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

I will not review kms parts, only some notes about descriptions,
see below.

> ---
>  tests/i915/i915_pm_backlight.c | 110 ++++++++++++++++++++++++---------
>  1 file changed, 80 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index cafae7f7..bf67b50c 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -34,9 +34,12 @@
>  #include <errno.h>
>  #include <unistd.h>
>  #include <time.h>
> +#include "igt_device.h"
> +#include "igt_device_scan.h"
>  
>  struct context {
>  	int max;
> +	const char *path;
>  };
>  
>  
> @@ -48,14 +51,14 @@ struct context {
>  
>  IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>  
> -static int backlight_read(int *result, const char *fname)
> +static int backlight_read(int *result, const char *fname, struct context *context)
>  {
>  	int fd;
>  	char full[PATH_MAX];
>  	char dst[64];
>  	int r, e;
>  
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
>  
>  	fd = open(full, O_RDONLY);
>  	if (fd == -1)
> @@ -73,14 +76,14 @@ static int backlight_read(int *result, const char *fname)
>  	return errno;
>  }
>  
> -static int backlight_write(int value, const char *fname)
> +static int backlight_write(int value, const char *fname, struct context *context)
>  {
>  	int fd;
>  	char full[PATH_MAX];
>  	char src[64];
>  	int len;
>  
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
>  	fd = open(full, O_WRONLY);
>  	if (fd == -1)
>  		return -errno;
> @@ -100,12 +103,12 @@ static void test_and_verify(struct context *context, int val)
>  	const int tolerance = val * TOLERANCE / 100;
>  	int result;
>  
> -	igt_assert_eq(backlight_write(val, "brightness"), 0);
> -	igt_assert_eq(backlight_read(&result, "brightness"), 0);
> +	igt_assert_eq(backlight_write(val, "brightness", context), 0);
> +	igt_assert_eq(backlight_read(&result, "brightness", context), 0);
>  	/* Check that the exact value sticks */
>  	igt_assert_eq(result, val);
>  
> -	igt_assert_eq(backlight_read(&result, "actual_brightness"), 0);
> +	igt_assert_eq(backlight_read(&result, "actual_brightness", context), 0);
>  	/* Some rounding may happen depending on hw */
>  	igt_assert_f(result >= max(0, val - tolerance) &&
>  		     result <= min(context->max, val + tolerance),
> @@ -124,16 +127,16 @@ static void test_bad_brightness(struct context *context)
>  {
>  	int val;
>  	/* First write some sane value */
> -	backlight_write(context->max / 2, "brightness");
> +	backlight_write(context->max / 2, "brightness", context);
>  	/* Writing invalid values should fail and not change the value */
> -	igt_assert_lt(backlight_write(-1, "brightness"), 0);
> -	backlight_read(&val, "brightness");
> +	igt_assert_lt(backlight_write(-1, "brightness", context), 0);
> +	backlight_read(&val, "brightness", context);
>  	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(context->max + 1, "brightness"), 0);
> -	backlight_read(&val, "brightness");
> +	igt_assert_lt(backlight_write(context->max + 1, "brightness", context), 0);
> +	backlight_read(&val, "brightness", context);
>  	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(INT_MAX, "brightness"), 0);
> -	backlight_read(&val, "brightness");
> +	igt_assert_lt(backlight_write(INT_MAX, "brightness", context), 0);
> +	backlight_read(&val, "brightness", context);
>  	igt_assert_eq(val, context->max / 2);
>  }
>  
> @@ -186,6 +189,8 @@ igt_main
>  	igt_display_t display;
>  	igt_output_t *output;
>  	struct igt_fb fb;
> +	const char *paths[2][50];
> +	char path1[PATH_MAX];
>  
>  	igt_fixture {
>  		enum pipe pipe;
> @@ -202,10 +207,6 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
>  
> -		/* Get the max value and skip the whole test if sysfs interface not available */
> -		igt_skip_on(backlight_read(&old, "brightness"));
> -		igt_assert(backlight_read(&context.max, "max_brightness") > -1);
> -
>  		/* should be ../../cardX-$output */
>  		igt_assert_lt(12, readlink(BACKLIGHT_PATH "/device", full_name, sizeof(full_name) - 1));
>  		name = basename(full_name);
> @@ -233,22 +234,71 @@ igt_main
>  
>  		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  		igt_pm_enable_sata_link_power_management();
> +
> +		memcpy(paths[0], "intel_backlight", 8);
> +		for (int i = 0; (i = display.n_outputs); i++) {
> +			output = &display.outputs[i];
> +			igt_output_set_pipe(output, PIPE_ANY);
> +			snprintf(path1, 100 , "card%i-%s-backlight", igt_device_get_card_index(display.drm_fd), igt_output_name(output));
> +			int fd = open(path1, O_WRONLY);
> +			if (fd == -1)
> +				continue;
> +			memcpy(paths[1], name, 30);
> +			break;
> +		}
> +		/* Get the max value and skip the whole test if sysfs interface not available */
> +		for (size_t i = 0; i < sizeof(paths) / sizeof(paths[0]); i++) {
> +			memcpy(&context.path, paths[i], 8);
> +			igt_skip_on(backlight_read(&old, "brightness", &context));
> +			igt_assert(backlight_read(&context.max, "max_brightness", &context) > -1);
> +		}
> +	}
> +	

Please add here description to new test with igt_describe().

> +	igt_subtest_with_dynamic("basic-brightness") {
> +		for (size_t j = 0; j < sizeof(paths) / sizeof(paths[0]); j++) {
> +			igt_dynamic_f("connector-%zu", j) {
> +				memcpy(&context.path, paths[j], 8);
> +				test_brightness(&context);
> +			}
> +		}
> +	}

Same here plus add newline.

> +	igt_subtest_with_dynamic("bad-brightness") {
> +		for (size_t j = 0; j < sizeof(paths) / sizeof(paths[0]); j++) {
> +			igt_dynamic_f("connector-%zu", j) {
> +				memcpy(&context.path, paths[j], 8);
> +				test_bad_brightness(&context);
> +			}
> +		}
> +	}
> +

Same here.

> +	igt_subtest_with_dynamic("fade") {
> +		for (size_t j = 0; j < sizeof(paths) / sizeof(paths[0]); j++) {
> +			igt_dynamic_f("connector-%zu", j) {
> +				memcpy(&context.path, paths[j], 8);
> +				test_fade(&context);
> +			}
> +		}
>  	}
>  
> -	igt_subtest("basic-brightness")
> -		test_brightness(&context);
> -	igt_subtest("bad-brightness")
> -		test_bad_brightness(&context);
> -	igt_subtest("fade")
> -		test_fade(&context);
> -	igt_subtest("fade_with_dpms")
> -		test_fade_with_dpms(&context, output);
> -	igt_subtest("fade_with_suspend")
> -		test_fade_with_suspend(&context, output);

btw if you do not mind, please also prepare patch which add
descriptions here.

> +	igt_subtest_with_dynamic("fade_with_dpms") {
> +		for (size_t j = 0; j < sizeof(paths) / sizeof(paths[0]); j++) {
> +			igt_dynamic_f("connector-%zu", j) {
> +				memcpy(&context.path, paths[j], 8);
> +				test_fade_with_dpms(&context, output);
> +			}
> +		}
> +	}
> +

Same here.

Regards,
Kamil

> +	igt_subtest_with_dynamic("fade_with_suspend") {
> +		for (size_t j = 0; j < sizeof(paths) / sizeof(paths[0]); j++) {
> +			igt_dynamic_f("connector-%zu", j) {
> +				memcpy(&context.path, paths[j], 8);
> +				test_fade_with_suspend(&context, output);
> +			}
> +		}
> +	}
>  
>  	igt_fixture {
> -		/* Restore old brightness */
> -		backlight_write(old, "brightness");
>  
>  		igt_display_fini(&display);
>  		igt_remove_fb(display.drm_fd, &fb);
> -- 
> 2.17.1
> 
