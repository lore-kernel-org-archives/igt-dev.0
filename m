Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EC810E55D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 11:39:25 +0000 (UTC)
Message-ID: <4a0f2593-1545-bd73-24db-548a6749a2a2@intel.com>
Date: Mon, 27 Mar 2023 13:39:30 +0200
Content-Language: en-US
To: Vikas Srivastava <vikas.srivastava@intel.com>
References: <20230324133346.2284000-1-vikas.srivastava@intel.com>
 <20230324133346.2284000-2-vikas.srivastava@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230324133346.2284000-2-vikas.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/intel_batchbuffer: Enable
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

Hi Vikas,

On 24.03.2023 14:33, Vikas Srivastava wrote:
> Test case uses legacy command XY_SRC_COPY_BLT_CMD which is
> not supported on newer platforms. Modified test to use

nit: The recommendation of using imperative mood in commit comments also 
applies to descriptions. s/Modified/Modify/

> XY_FAST_COPY_BLT.
> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> ---
>   lib/intel_batchbuffer.c | 63 +++++++++++++++++++++++++++--------------
>   1 file changed, 42 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index da4c238cae..b1eff42fcb 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2407,11 +2407,17 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
>    */
>   void intel_bb_blit_start(struct intel_bb *ibb, uint32_t flags)
>   {
> -	intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> -		     XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		     XY_SRC_COPY_BLT_WRITE_RGB |
> -		     flags |
> -		     (6 + 2 * (ibb->gen >= 8)));
> +	if (blt_has_fast_copy(ibb->i915))
> +		intel_bb_out(ibb, XY_FAST_COPY_BLT | flags);
> +	else if (blt_has_xy_src_copy(ibb->i915))
> +

^--- empty line, it'd be better to delete it

> +		intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			     XY_SRC_COPY_BLT_WRITE_RGB |
> +			     flags |
> +			     (6 + 2 * (ibb->gen >= 8)));
> +	else
> +		igt_assert_f(0, "No supported blit command found\n");
>   }
>   
>   /*
> @@ -2449,12 +2455,22 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
>   
>   	if (gen >= 4 && src->tiling != I915_TILING_NONE) {
>   		src_pitch /= 4;
> -		cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
> +		if (blt_has_fast_copy(ibb->i915))
> +			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);

I think you've run in a strange bug with that fast-copy that I didn't 
have time to investigate. I was able to fix the issue locally by 
reordering all of your checks (that is, first check for XY_SRC_COPY_BLT 
and then do if else on XY_FAST_COPY_BLT support). Remember to test it, 
on KBL for example, before sending the next version.

> +		else if (blt_has_xy_src_copy(ibb->i915))
> +			cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
> +		else
> +			igt_assert_f(0, "No supported blit command found\n");
>   	}
>   
>   	if (gen >= 4 && dst->tiling != I915_TILING_NONE) {
>   		dst_pitch /= 4;
> -		cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
> +		if (blt_has_fast_copy(ibb->i915))
> +			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
> +		else if (blt_has_xy_src_copy(ibb->i915))
> +			cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
> +		else
> +			igt_assert_f(0, "No supported blit command found\n");
>   	}
>   
>   	CHECK_RANGE(src_x1); CHECK_RANGE(src_y1);
> @@ -2465,20 +2481,25 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
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
> -	}
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
> +	} else if (blt_has_fast_copy(ibb->i915)) {
> +		br13_bits = fast_copy_dword1(ibb->i915, src->tiling, dst->tiling, bpp);
> +	} else
> +		igt_assert_f(0, "No supported blit command found\n");

Please add brackets to "else" as well.

All the best,
Karolina

>   
>   	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
>   		intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
