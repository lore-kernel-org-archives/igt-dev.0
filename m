Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3A10F227
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 12:53:47 +0000 (UTC)
Message-ID: <70f9742b-0e40-a7a8-f1dc-2a93884b63f3@intel.com>
Date: Fri, 31 Mar 2023 14:53:59 +0200
Content-Language: en-US
To: Vikas Srivastava <vikas.srivastava@intel.com>
References: <20230331122133.3000215-1-vikas.srivastava@intel.com>
 <20230331122133.3000215-5-vikas.srivastava@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230331122133.3000215-5-vikas.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4 v3] lib/intel_batchbuffer: Enable
 XY_FAST_COPY_BLT support for api_intel_bb
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 31.03.2023 14:21, Vikas Srivastava wrote:
> Test case uses legacy command XY_SRC_COPY_BLT_CMD which is
> not supported on newer platforms. Modify test to use
> XY_FAST_COPY_BLT.
> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   lib/intel_batchbuffer.c | 57 ++++++++++++++++++++++++++---------------
>   1 file changed, 37 insertions(+), 20 deletions(-)
> 

Looking good, and now this should work for lower generations.

Still, please wait for BAT and FULL results before merge. If they are 
all green, then:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 40e444ad9b..a4eb4c2bbc 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2409,11 +2409,16 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
>    */
>   void intel_bb_blit_start(struct intel_bb *ibb, uint32_t flags)
>   {
> -	intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> -		     XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		     XY_SRC_COPY_BLT_WRITE_RGB |
> -		     flags |
> -		     (6 + 2 * (ibb->gen >= 8)));
> +	if (blt_has_xy_src_copy(ibb->i915))
> +		intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			     XY_SRC_COPY_BLT_WRITE_RGB |
> +			     flags |
> +			     (6 + 2 * (ibb->gen >= 8)));
> +	else if (blt_has_fast_copy(ibb->i915))
> +		intel_bb_out(ibb, XY_FAST_COPY_BLT | flags);
> +	else
> +		igt_assert_f(0, "No supported blit command found\n");
>   }
>   
>   /*
> @@ -2451,12 +2456,20 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
>   
>   	if (gen >= 4 && src->tiling != I915_TILING_NONE) {
>   		src_pitch /= 4;
> -		cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
> +		if (blt_has_xy_src_copy(ibb->i915))
> +			cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
> +		else if (blt_has_fast_copy(ibb->i915))
> +			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
> +		else
> +			igt_assert_f(0, "No supported blit command found\n");
>   	}
>   
>   	if (gen >= 4 && dst->tiling != I915_TILING_NONE) {
>   		dst_pitch /= 4;
> -		cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
> +		if (blt_has_xy_src_copy(ibb->i915))
> +			cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
> +		else
> +			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
>   	}
>   
>   	CHECK_RANGE(src_x1); CHECK_RANGE(src_y1);
> @@ -2467,19 +2480,23 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
>   	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
>   
>   	br13_bits = 0;
> -	switch (bpp) {
> -	case 8:
> -		break;
> -	case 16:		/* supporting only RGB565, not ARGB1555 */
> -		br13_bits |= 1 << 24;
> -		break;
> -	case 32:
> -		br13_bits |= 3 << 24;
> -		cmd_bits |= (XY_SRC_COPY_BLT_WRITE_ALPHA |
> -			     XY_SRC_COPY_BLT_WRITE_RGB);
> -		break;
> -	default:
> -		igt_fail(IGT_EXIT_FAILURE);
> +	if (blt_has_xy_src_copy(ibb->i915)) {
> +		switch (bpp) {
> +		case 8:
> +			break;
> +		case 16:		/* supporting only RGB565, not ARGB1555 */
> +			br13_bits |= 1 << 24;
> +			break;
> +		case 32:
> +			br13_bits |= 3 << 24;
> +			cmd_bits |= (XY_SRC_COPY_BLT_WRITE_ALPHA |
> +				     XY_SRC_COPY_BLT_WRITE_RGB);
> +			break;
> +		default:
> +			igt_fail(IGT_EXIT_FAILURE);
> +		}
> +	} else {
> +		br13_bits = fast_copy_dword1(ibb->i915, src->tiling, dst->tiling, bpp);
>   	}
>   
>   	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
