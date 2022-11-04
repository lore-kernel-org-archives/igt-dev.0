Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C93810E058
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Nov 2022 02:35:15 +0000 (UTC)
Message-ID: <ace95f56-515a-4113-1f2b-51864ffe3ca5@intel.com>
Date: Fri, 4 Nov 2022 08:04:45 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <1667408924-19566-1-git-send-email-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <1667408924-19566-1-git-send-email-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_backlight: Add new
 subtest to validate dual panel backlight
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

On Wed-02-11-2022 10:38 pm, Nidhi Gupta wrote:
> Since driver can now support multiple eDPs and Debugfs structure for
> backlight changed per connector the test should then iterate through
> all eDP connectors.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/i915_pm_backlight.c | 208 ++++++++++++++++++++++++++++-------------
>   1 file changed, 144 insertions(+), 64 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index cafae7f..54e51b7 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -34,29 +34,39 @@
>   #include <errno.h>
>   #include <unistd.h>
>   #include <time.h>
> +#include "igt_device.h"
> +#include "igt_device_scan.h"
>   
>   struct context {
>   	int max;
> +	igt_output_t *output;
> +	char path[PATH_MAX];
>   };
>   
> +enum {
> +	TEST_NONE = 0,
> +	TEST_DPMS,
> +	TEST_SUSPEND,
> +};
>   
>   #define TOLERANCE 5 /* percent */
> -#define BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
> +#define BACKLIGHT_PATH "/sys/class/backlight"
>   
>   #define FADESTEPS 10
>   #define FADESPEED 100 /* milliseconds between steps */
>   
> +#define NUM_EDP_OUTPUTS 2
> +
>   IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>   
> -static int backlight_read(int *result, const char *fname)
> +static int backlight_read(int *result, const char *fname, struct context *context)
>   {
>   	int fd;
>   	char full[PATH_MAX];
> -	char dst[64];
> +	char dst[512];
>   	int r, e;
>   
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
> -
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);

As we are using dynamic subtests, don't assert here. Instead return some 
error.

>   	fd = open(full, O_RDONLY);
>   	if (fd == -1)
>   		return -errno;
> @@ -73,14 +83,14 @@ static int backlight_read(int *result, const char *fname)
>   	return errno;
>   }
>   
> -static int backlight_write(int value, const char *fname)
> +static int backlight_write(int value, const char *fname, struct context *context)
>   {
>   	int fd;
>   	char full[PATH_MAX];
>   	char src[64];
>   	int len;
>   
> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);

Please check above comment.

>   	fd = open(full, O_WRONLY);
>   	if (fd == -1)
>   		return -errno;
> @@ -100,12 +110,12 @@ static void test_and_verify(struct context *context, int val)
>   	const int tolerance = val * TOLERANCE / 100;
>   	int result;
>   
> -	igt_assert_eq(backlight_write(val, "brightness"), 0);
> -	igt_assert_eq(backlight_read(&result, "brightness"), 0);
> +	igt_assert_eq(backlight_write(val, "brightness", context), 0);
> +	igt_assert_eq(backlight_read(&result, "brightness", context), 0);
>   	/* Check that the exact value sticks */
>   	igt_assert_eq(result, val);
>   
> -	igt_assert_eq(backlight_read(&result, "actual_brightness"), 0);
> +	igt_assert_eq(backlight_read(&result, "actual_brightness", context), 0);
>   	/* Some rounding may happen depending on hw */
>   	igt_assert_f(result >= max(0, val - tolerance) &&
>   		     result <= min(context->max, val + tolerance),
> @@ -124,16 +134,16 @@ static void test_bad_brightness(struct context *context)
>   {
>   	int val;
>   	/* First write some sane value */
> -	backlight_write(context->max / 2, "brightness");
> +	backlight_write(context->max / 2, "brightness", context);
>   	/* Writing invalid values should fail and not change the value */
> -	igt_assert_lt(backlight_write(-1, "brightness"), 0);
> -	backlight_read(&val, "brightness");
> +	igt_assert_lt(backlight_write(-1, "brightness", context), 0);
> +	backlight_read(&val, "brightness", context);
>   	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(context->max + 1, "brightness"), 0);
> -	backlight_read(&val, "brightness");
> +	igt_assert_lt(backlight_write(context->max + 1, "brightness", context), 0);
> +	backlight_read(&val, "brightness", context);
>   	igt_assert_eq(val, context->max / 2);
> -	igt_assert_lt(backlight_write(INT_MAX, "brightness"), 0);
> -	backlight_read(&val, "brightness");
> +	igt_assert_lt(backlight_write(INT_MAX, "brightness", context), 0);
> +	backlight_read(&val, "brightness", context);
>   	igt_assert_eq(val, context->max / 2);
>   }
>   
> @@ -154,7 +164,7 @@ static void test_fade(struct context *context)
>   }
>   
>   static void
> -test_fade_with_dpms(struct context *context, igt_output_t *output)
> +check_dpms(igt_output_t *output)
>   {
>   	igt_require(igt_setup_runtime_pm(output->display->drm_fd));

Please check above comments.

>   
> @@ -167,33 +177,77 @@ test_fade_with_dpms(struct context *context, igt_output_t *output)
>   				   output->config.connector,
>   				   DRM_MODE_DPMS_ON);
>   	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));

Please check above comments.

> -
> -	test_fade(context);
>   }
>   
>   static void
> -test_fade_with_suspend(struct context *context, igt_output_t *output)
> +check_suspend(igt_output_t *output)
>   {
>   	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +}
>   
> -	test_fade(context);
> +static void test_cleanup(igt_display_t *display, igt_output_t *output)
> +{
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +	igt_pm_restore_sata_link_power_management();
> +}
> +
> +static void test_setup(igt_display_t display, igt_output_t *output)
> +{
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	enum pipe pipe;
> +
> +	igt_display_reset(&display);
> +
> +	for_each_pipe(&display, pipe) {
> +		if (!igt_pipe_connector_valid(pipe, output))
> +			continue;
> +
> +		igt_output_set_pipe(output, pipe);
> +		mode = igt_output_get_mode(output);
> +
> +		igt_create_pattern_fb(display.drm_fd,
> +				      mode->hdisplay, mode->vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &fb);
> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &fb);
> +
> +		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +		igt_pm_enable_sata_link_power_management();
> +
> +		break;
> +	}

There is a possibility that all pipes are invalid to use the selected 
output.

>   }
>   
>   igt_main
>   {
> -	struct context context = {0};
> -	int old;
> +	int old, fd;
> +	int i = 0;
>   	igt_display_t display;
>   	igt_output_t *output;
> -	struct igt_fb fb;
> +	char file_path_n[PATH_MAX] = "";
> +	bool dual_edp = false;
> +	struct context contexts[NUM_EDP_OUTPUTS];
> +	struct {
> +		const char *name;
> +		const char *desc;
> +		void (*test_t) (struct context *);
> +		int flags;
> +	} tests[] = {
> +		{ "basic-brightness", "desc", test_brightness, TEST_NONE },
> +		{ "bad-brightness", "desc", test_bad_brightness, TEST_NONE },
> +		{ "fade", "desc", test_fade, TEST_NONE },
> +		{ "fade-with-dpms", "desc", test_fade, TEST_DPMS },
> +		{ "fade-with-suspend", "desc", test_fade, TEST_SUSPEND },
> +	};
>   
>   	igt_fixture {
> -		enum pipe pipe;
>   		bool found = false;
>   		char full_name[32] = {};
>   		char *name;
> -		drmModeModeInfo *mode;
> -		igt_plane_t *primary;
>   
>   		/*
>   		 * Backlight tests requires the output to be enabled,
> @@ -202,56 +256,82 @@ igt_main
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
>   
> -		/* Get the max value and skip the whole test if sysfs interface not available */
> -		igt_skip_on(backlight_read(&old, "brightness"));
> -		igt_assert(backlight_read(&context.max, "max_brightness") > -1);
> +		for_each_connected_output(&display, output) {
> +			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +				continue;
>   
> -		/* should be ../../cardX-$output */
> -		igt_assert_lt(12, readlink(BACKLIGHT_PATH "/device", full_name, sizeof(full_name) - 1));
> -		name = basename(full_name);
> +			if (found)
> +				snprintf(file_path_n, PATH_MAX, "%s/card%i-%s-backlight/brightness",
> +					 BACKLIGHT_PATH, igt_device_get_card_index(display.drm_fd),
> +					 igt_output_name(output));
> +			else
> +				snprintf(file_path_n, PATH_MAX, "%s/intel_backlight/brightness", BACKLIGHT_PATH);

It is perfectly fine, if display->outputs[] exposes list of connectors 
as eDP-1 followed by eDP-2. In case the order got changed, this code 
does't work.

>   
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> -			if (strcmp(name + 6, output->name))
> +			fd = open(file_path_n, O_RDONLY);
> +			if (fd == -1) {
>   				continue;
> -			found = true;
> -			break;
> +			}
> +			if (found)
> +				snprintf(contexts[i].path, PATH_MAX, "card%i-%s-backlight",
> +					 igt_device_get_card_index(display.drm_fd),
> +					 igt_output_name(output));
> +			else
> +				snprintf(contexts[i].path, PATH_MAX, "intel_backlight");
> +
> +			close(fd);
> +
> +			/* should be ../../cardX-$output */
> +			snprintf(file_path_n, PATH_MAX, "%s/%s/device", BACKLIGHT_PATH, contexts[i].path);
> +			igt_assert_lt(16, readlink(file_path_n, full_name, sizeof(full_name) - 1));
> +			name = basename(full_name);
> +
> +			if (!strcmp(name + 6, output->name)) {
> +				contexts[i++].output = output;
> +
> +				if (found)
> +					dual_edp = true;
> +				else
> +					found = true;
> +			}

Once we find the duel edp, there is no point in checking for other 
connectors.

>   		}
> +		igt_require_f(found, "No valid output found.\n");
> +	}
>   
> -		igt_require_f(found,
> -			      "Could not map backlight for \"%s\" to connected output\n",
> -			      name);
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe(tests[i].desc);
> +		igt_subtest_with_dynamic(tests[i].name) {

Probably, we should have a separate patch for dynamic subtests.

> +			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> +				test_setup(display, &contexts->output[j]);
>   
> -		igt_output_set_pipe(output, pipe);
> -		mode = igt_output_get_mode(output);
> +				if (backlight_read(&old, "brightness", &contexts[j]))
> +					continue;
>   
> -		igt_create_pattern_fb(display.drm_fd,
> -				      mode->hdisplay, mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR, &fb);
> -		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &fb);
> +				igt_assert(backlight_read(&contexts[j].max, "max_brightness", &contexts[j]) > -1);

Please drop this. This is redundant & also igt_assert is not allowed 
inside the igt_subtest_with_dynamic() before execting the igt_dynamic() 
block.

>   
> -		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> -		igt_pm_enable_sata_link_power_management();
> -	}
> +				if (tests[i].flags == TEST_DPMS)
> +					check_dpms(contexts[j].output);
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
> +				if (tests[i].flags == TEST_SUSPEND)
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
> +		}
> +	}
>   
>   	igt_fixture {
>   		/* Restore old brightness */
> -		backlight_write(old, "brightness");
> +		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
> +			backlight_write(old, "brightness", &contexts[j]);

Same "old" content for both the eDPs?

- Bhanu

> +		}
>   
>   		igt_display_fini(&display);
> -		igt_remove_fb(display.drm_fd, &fb);
>   		igt_pm_restore_sata_link_power_management();
>   		close(display.drm_fd);
>   	}
