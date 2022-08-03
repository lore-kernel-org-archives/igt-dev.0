Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEF2112E96
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 07:04:26 +0000 (UTC)
Message-ID: <c3c00cb7-bded-0720-8919-bf9450370cde@intel.com>
Date: Wed, 3 Aug 2022 12:34:10 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220803042002.1929-1-nidhi1.gupta@intel.com>
 <20220803042002.1929-2-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220803042002.1929-2-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/i915/kms_draw_crc: Convert tests to
 dynamic
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

On Wed-03-08-2022 09:50 am, Nidhi Gupta wrote:
> Convert the existing subtests to dynamic subtests.
> 
> v2: check all per-requisites before starting dynamic
>      tests, since to avoid skip in igt_dynamic().
>      (Bhanu)
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/i915/kms_draw_crc.c | 54 ++++++++++++++++++++++++---------------
>   1 file changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index 33fefed4..edab2f3b 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -177,15 +177,6 @@ static void draw_method_subtest(enum igt_draw_method method,
>   {
>   	igt_crc_t crc;
>   
> -	igt_skip_on(modifier == I915_FORMAT_MOD_4_TILED &&
> -		    !HAS_4TILE(intel_get_drm_devid(drm_fd)));
> -
> -	igt_skip_on(method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd));
> -	igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
> -		    !gem_has_mappable_ggtt(drm_fd));
> -
> -	igt_require(format_is_supported(formats[format_index], modifier));
> -
>   	/* Use IGT_DRAW_MMAP_GTT/WC on an untiled buffer as the parameter for
>   	 * comparison. Cache the value so we don't recompute it for every single
>   	 * subtest. */
> @@ -331,22 +322,43 @@ igt_main
>   {
>   	enum igt_draw_method method;
>   	int format_idx, modifier_idx;
> +	uint64_t modifier;
>   
>   	igt_fixture
>   		setup_environment();
>   
> -	for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
> -	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
> -	for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
> -		igt_describe("This subtest verfies igt_draw library works "
> -			     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
> -		igt_subtest_f("draw-method-%s-%s-%s",
> -			      format_str(format_idx),
> -			      igt_draw_get_method_name(method),
> -			      modifier_str(modifier_idx))
> -			draw_method_subtest(method, format_idx,
> -					    modifiers[modifier_idx]);
> -	} } }
> +	igt_describe("This subtest verfies igt_draw library works "
> +		     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
> +	igt_subtest_with_dynamic("draw-method") {
> +		for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
> +			for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
> +				for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
> +					modifier = modifiers[modifier_idx];
> +
> +					if (modifier == I915_FORMAT_MOD_4_TILED &&
> +					    !HAS_4TILE(intel_get_drm_devid(drm_fd)))
> +						continue;
> +
> +					if (method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd))
> +						continue;
> +
> +					if (method == IGT_DRAW_MMAP_GTT &&
> +					    !gem_has_mappable_ggtt(drm_fd))
> +						continue;
> +
> +					if (!(format_is_supported(formats[format_idx], modifier)))
---------------------------------------------^
NIT: Please drop unnecessary braces.

> +						continue;
> +
> +					igt_dynamic_f("draw-method-%s-%s-%s",
-------------------------------------------------------^
Please drop "draw-method" from dynamic subtest name.

> +						      format_str(format_idx),
> +						      igt_draw_get_method_name(method),
> +						      modifier_str(modifier_idx))
> +						draw_method_subtest(method, format_idx,
> +								    modifiers[modifier_idx]);--------------------------------------------------------------------^
We can use "modifier" instead of "modifiers[modifier_idx]".

By addressing above comments, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +				}
> +			}
> +		}
> +	}
>   
>   	igt_describe("This subtest verifies CRC after filling fb with x-tiling "
>   		     "or none.");
