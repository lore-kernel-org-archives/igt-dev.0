Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8916EE28
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 11:28:14 +0000 (UTC)
Date: Tue, 11 Feb 2020 13:28:11 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200211112811.GO25209@platvala-desk.ger.corp.intel.com>
References: <20200211111634.10802-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211111634.10802-1-jani.nikula@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/pm_backlight: ensure driver is
 loaded before checking backlight
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
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 01:16:34PM +0200, Jani Nikula wrote:
> Checking the existence of the backlight interface before ensuring the
> driver is loaded skips whenever the test is run without the driver
> loaded. None of the tests would work properly if they were run as the
> first thing or after tests that unload the driver.
> 
> Open the driver (and thus probe it as needed) as the first thing.
> 
> (This is the low-hanging fruit. A proper test for skipping would be
> based on the presence of embedded displays, not based on the presence of
> the interface we're aiming to test.)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/i915/i915_pm_backlight.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index 08c07a5787bb..9753ef957c31 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -195,10 +195,6 @@ igt_main
>  		drmModeModeInfo *mode;
>  		igt_plane_t *primary;
>  
> -		/* Get the max value and skip the whole test if sysfs interface not available */
> -		igt_skip_on(backlight_read(&old, "brightness"));
> -		igt_assert(backlight_read(&context.max, "max_brightness") > -1);
> -
>  		/*
>  		 * Backlight tests requires the output to be enabled,
>  		 * try to enable all.
> @@ -206,6 +202,10 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&display, drm_open_driver(DRIVER_INTEL));
>  
> +		/* Get the max value and skip the whole test if sysfs interface not available */
> +		igt_skip_on(backlight_read(&old, "brightness"));
> +		igt_assert(backlight_read(&context.max, "max_brightness") > -1);
> +
>  		/* should be ../../cardX-$output */
>  		igt_assert_lt(12, readlink(BACKLIGHT_PATH "/device", full_name, sizeof(full_name) - 1));
>  		name = basename(full_name);
> -- 
> 2.20.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
