Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A66A10E6D0
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 15:03:07 +0000 (UTC)
Date: Tue, 4 Apr 2023 17:02:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230404150244.aqfj5jaiieep3p7d@kamilkon-desk1>
References: <20230331134556.4077113-1-bhanuprakash.modem@intel.com>
 <20230331134556.4077113-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230331134556.4077113-4-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 3/5] tests/kms_addfb_basic: Add XE support
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

Hi Bhanuprakash,

On 2023-03-31 at 19:15:54 +0530, Bhanuprakash Modem wrote:
> Update/fix necessary subtests for XE driver compatibility.
> Also, reorder existing subtests to avoid code duplication.
> 
> V2: - Fix invalid-smem-bo-on-discrete subtest (Zbigniew)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_addfb_basic.c | 42 +++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index b4526eee6..e27b22fe0 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -41,6 +41,8 @@
>  #include "igt_rand.h"
>  #include "igt_device.h"
>  #include "i915/intel_memory_region.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>  
>  uint32_t gem_bo;
>  uint32_t gem_bo_small;
> @@ -121,7 +123,7 @@ static void invalid_tests(int fd)
>  
>  	igt_describe("Check if addfb2 call works for clobbered modifier");
>  	igt_subtest("clobberred-modifier") {
> -		igt_require_intel(fd);
> +		igt_require_i915(fd);
>  		igt_require(gem_available_fences(fd) > 0);
>  		f.flags = 0;
>  		f.modifier[0] = 0;
> @@ -139,10 +141,17 @@ static void invalid_tests(int fd)
>  		uint64_t size;
>  
>  		igt_require_intel(fd);
> -		igt_require(gem_has_lmem(fd));
>  		igt_calc_fb_size(fd, f.width, f.height,
>  				DRM_FORMAT_XRGB8888, 0, &size, &stride);
> -		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
> +
> +		if (is_i915_device(fd)) {
> +			igt_require(gem_has_lmem(fd));
> +			handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
> +		} else {
> +			igt_require(xe_has_vram(fd));
> +			handle = xe_bo_create_flags(fd, 0, size, system_memory(fd));
> +		}
> +
>  		f.handles[0] = handle;
>  		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
>  	}
> @@ -323,7 +332,7 @@ static void tiling_tests(int fd)
>  
>  	igt_subtest_group {
>  		igt_fixture {
> -			igt_require_intel(fd);
> +			igt_require_i915(fd);
>  			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
>  				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
>  				1024*4, NULL, NULL, NULL);
> @@ -494,7 +503,7 @@ static void size_tests(int fd)
>  
>  	igt_describe("Test that addfb2 call fails correctly with small buffer object after changing tile");
>  	igt_subtest("bo-too-small-due-to-tiling") {
> -		igt_require_intel(fd);
> +		igt_require_i915(fd);
>  		igt_require(gem_available_fences(fd) > 0);
>  		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
>  		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
> @@ -548,7 +557,7 @@ static void addfb25_tests(int fd)
>  
>  	igt_subtest_group {
>  		igt_fixture {
> -			igt_require_intel(fd);
> +			igt_require_i915(fd);
>  			igt_require(gem_available_fences(fd) > 0);
>  			gem_set_tiling(fd, gem_bo, I915_TILING_X, 1024*4);
>  			igt_require_fb_modifiers(fd);
> @@ -594,6 +603,7 @@ static void addfb25_ytile(int fd)
>  	igt_display_t display;
>  
>  	igt_fixture {
> +		igt_require_i915(fd);
>  		igt_display_require(&display, fd);
>  
>  		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> @@ -618,7 +628,6 @@ static void addfb25_ytile(int fd)
>  	igt_describe("Check if addfb2 call works for y-tiling");
>  	igt_subtest("addfb25-y-tiled-legacy") {
>  		igt_require_fb_modifiers(fd);
> -		igt_require_intel(fd);

This removes duplication (if it is intel-i915 specific subtest).

>  
>  		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
>  		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> @@ -631,7 +640,6 @@ static void addfb25_ytile(int fd)
>  	igt_describe("Check if addfb2 call works for yf-tiling");
>  	igt_subtest("addfb25-yf-tiled-legacy") {
>  		igt_require_fb_modifiers(fd);
> -		igt_require_intel(fd);
>  
>  		f.modifier[0] = I915_FORMAT_MOD_Yf_TILED;
>  		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> @@ -644,7 +652,6 @@ static void addfb25_ytile(int fd)
>  	igt_describe("Test that addfb2 call fails correctly for y-tiling with given height and modifier");
>  	igt_subtest("addfb25-y-tiled-small-legacy") {
>  		igt_require_fb_modifiers(fd);
> -		igt_require_intel(fd);
>  
>  		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
>  		f.height = 1023;
> @@ -667,6 +674,7 @@ static void addfb25_4tile(int fd)
>  	igt_display_t display;
>  
>  	igt_fixture {
> +		igt_require_i915(fd);
>  		igt_display_require(&display, fd);
>  
>  		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> @@ -689,7 +697,6 @@ static void addfb25_4tile(int fd)
>  	igt_describe("Check if addfb2 call works for tiling-4");
>  	igt_subtest("addfb25-4-tiled") {
>  		igt_require_fb_modifiers(fd);
> -		igt_require_intel(fd);
>  
>  		f.modifier[0] = I915_FORMAT_MOD_4_TILED;
>  		igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
> @@ -839,6 +846,9 @@ igt_main
>  	igt_fixture {
>  		fd = drm_open_driver_master(DRIVER_ANY);
>  		igt_require(has_addfb2_iface(fd));
> +
> +		if (is_xe_device(fd))
> +			xe_device_get(fd);
>  	}
>  
>  	invalid_tests(fd);
> @@ -847,6 +857,10 @@ igt_main
>  
>  	size_tests(fd);
>  
> +	prop_tests(fd);
> +
> +	master_tests(fd);
> +
>  	addfb25_tests(fd);
>  
>  	addfb25_ytile(fd);
> @@ -855,10 +869,10 @@ igt_main
>  
>  	tiling_tests(fd);
>  
> -	prop_tests(fd);
> -
> -	master_tests(fd);

This is just moved above, how does it avoid duplication ?

Regards,
Kamil

> +	igt_fixture {
> +		if (is_xe_device(fd))
> +			xe_device_put(fd);
>  
> -	igt_fixture
>  		close(fd);
> +	}
>  }
> -- 
> 2.40.0
> 
