Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D74110E07B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 05:18:20 +0000 (UTC)
Message-ID: <1e92092c-12b3-c2ce-6068-98b2f534ebeb@intel.com>
Date: Wed, 19 Apr 2023 10:48:06 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230418152822.1655272-1-bhanuprakash.modem@intel.com>
 <20230418152822.1655272-4-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230418152822.1655272-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 3/5] tests/kms_flip: Add XE support
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


On 4/18/2023 8:58 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> V2: - Minor cleanups
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_flip.c | 32 ++++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 5e82f4a2f84..d048f2f125a 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -44,6 +44,7 @@
>   
>   #include "i915/gem_create.h"
>   #include "igt_stats.h"
> +#include "xe/xe_query.h"
>   
>   #define TEST_DPMS		(1 << 0)
>   
> @@ -1347,15 +1348,21 @@ restart:
>   		o->fb_width *= 2;
>   
>   	modifier = DRM_FORMAT_MOD_LINEAR;
> -	if (o->flags & TEST_FENCE_STRESS)
> +	if (o->flags & TEST_FENCE_STRESS) {
> +		igt_skip_on(is_xe_device(drm_fd));
>   		modifier = I915_FORMAT_MOD_X_TILED;

Hi,

Would it be possible to move this check to the main function where we 
can directly skip the test if we've TEST_FENCE_STRESS flag being used? 
Or do we have any case where we use the TEST_FENCE_STRESS flag without 
using tiled modifiers?

Just so that we skip the test right at the beginning instead of doing 
all the setup before finally skipping.

Other than this, the patch LGTM.

Thanks,
Karthik.B.S
> +	}
>   
>   	/* 256 MB is usually the maximum mappable aperture,
>   	 * (make it 4x times that to ensure failure) */
>   	if (o->flags & TEST_BO_TOOBIG) {
> -		igt_skip_on(!is_i915_device(drm_fd));
> +		igt_skip_on(!is_intel_device(drm_fd));
>   		bo_size = 4*gem_mappable_aperture_size(drm_fd);
> -		igt_require(bo_size < gem_global_aperture_size(drm_fd));
> +
> +		if (is_i915_device(drm_fd))
> +			igt_require(bo_size < gem_global_aperture_size(drm_fd));
> +		else
> +			igt_require(bo_size < (1ULL << xe_va_bits(drm_fd)));
>   	}
>   
>   	o->fb_ids[0] = igt_create_fb(drm_fd, o->fb_width, o->fb_height,
> @@ -1557,9 +1564,10 @@ static int run_test(int duration, int flags)
>   	struct test_output o;
>   	int i, n, modes = 0;
>   
> -	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
> +	igt_require((flags & TEST_HANG) == 0 ||
> +		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
>   	igt_require(!(flags & TEST_FENCE_STRESS) ||
> -		    gem_available_fences(drm_fd));
> +		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
>   
>   	resources = drmModeGetResources(drm_fd);
>   	igt_require(resources);
> @@ -1626,9 +1634,10 @@ static int run_pair(int duration, int flags)
>   	struct test_output o;
>   	int i, j, m, n, modes = 0;
>   
> -	igt_require((flags & TEST_HANG) == 0 || !is_wedged(drm_fd));
> +	igt_require((flags & TEST_HANG) == 0 ||
> +		    (is_i915_device(drm_fd) && !is_wedged(drm_fd)));
>   	igt_require(!(flags & TEST_FENCE_STRESS) ||
> -		    gem_available_fences(drm_fd));
> +		    (is_i915_device(drm_fd) && gem_available_fences(drm_fd)));
>   
>   	resources = drmModeGetResources(drm_fd);
>   	igt_require(resources);
> @@ -1813,6 +1822,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		igt_install_exit_handler(kms_flip_exit_handler);
>   		get_timestamp_format();
>   
> +		if (is_xe_device(drm_fd))
> +			xe_device_get(drm_fd);
> +
>   		if (is_i915_device(drm_fd)) {
>   			bops = buf_ops_create(drm_fd);
>   		}
> @@ -1878,6 +1890,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   	}
>   	igt_stop_signal_helper();
>   
> -	igt_fixture
> +	igt_fixture {
> +		if (is_xe_device(drm_fd))
> +			xe_device_put(drm_fd);
> +
>   		close(drm_fd);
> +	}
>   }
