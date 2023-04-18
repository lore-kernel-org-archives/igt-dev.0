Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD39D10E259
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 09:35:05 +0000 (UTC)
Message-ID: <8802536c-7268-413b-5b0c-6210160f3184@intel.com>
Date: Tue, 18 Apr 2023 15:04:39 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
 <20230413162732.1155058-6-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230413162732.1155058-6-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 5/7] tests/kms_flip: Add XE support
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


On 4/13/2023 9:57 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_flip.c | 35 ++++++++++++++++++++++++++---------
>   1 file changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 5e82f4a2f84..5f5e84ba27c 100755
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
> @@ -792,7 +793,8 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
>   
>   	memset(&hang, 0, sizeof(hang));
>   	if (do_flip && (o->flags & TEST_HANG)) {
> -		igt_require_intel(drm_fd);
> +		igt_require_i915(drm_fd);
> +		/* TODO: Add XE support? */

Hi,

As we're expecting to add XE support shortly, instead of adding TODO I 
would suggest keeping the original check and allow the test to fail on Xe.

>   		ahnd = get_reloc_ahnd(drm_fd, 0);
>   		hang = hang_gpu(drm_fd, ahnd);
>   	}
> @@ -1347,15 +1349,21 @@ restart:
>   		o->fb_width *= 2;
>   
>   	modifier = DRM_FORMAT_MOD_LINEAR;
> -	if (o->flags & TEST_FENCE_STRESS)
> +	if (o->flags & TEST_FENCE_STRESS) {
> +		igt_skip_on(!is_i915_device(drm_fd));
I get this check, but I would prefer an xe specific check instead of 
'NOT i915' check, as this a xe specific patch.
And if  any clean up required other than this we can handle it in a 
separate patch?

Thanks,
Karthik.B.S

>   		modifier = I915_FORMAT_MOD_X_TILED;
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
> @@ -1557,9 +1565,10 @@ static int run_test(int duration, int flags)
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
> @@ -1626,9 +1635,10 @@ static int run_pair(int duration, int flags)
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
> @@ -1813,6 +1823,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		igt_install_exit_handler(kms_flip_exit_handler);
>   		get_timestamp_format();
>   
> +		if (is_xe_device(drm_fd))
> +			xe_device_get(drm_fd);
> +
>   		if (is_i915_device(drm_fd)) {
>   			bops = buf_ops_create(drm_fd);
>   		}
> @@ -1878,6 +1891,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
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
