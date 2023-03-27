Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923910E5C5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:43:40 +0000 (UTC)
Message-ID: <4aeee9cc-7503-8ed2-288d-5955d1b90d33@intel.com>
Date: Mon, 27 Mar 2023 15:43:49 +0200
Content-Language: en-US
To: Vikas Srivastava <vikas.srivastava@intel.com>
References: <20230324133346.2284000-1-vikas.srivastava@intel.com>
 <20230324133346.2284000-3-vikas.srivastava@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230324133346.2284000-3-vikas.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/i915/gem_caching: Enable
 XY_FAST_COPY_BLT for MTL
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

On 24.03.2023 14:33, Vikas Srivastava wrote:
> Test case uses legacy command XY_SRC_COPY_BLT_CMD which
> is not supported on newer platforms. Modified test to
> use XY_FAST_COPY_BLT.
> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> ---
>   tests/i915/gem_caching.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index eb0170abca..6a7f9fad06 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -39,6 +39,7 @@
>   
>   #include "i915/gem.h"
>   #include "igt.h"
> +#include "i915/i915_blt.h"
>   
>   IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
>   		     " cachelines.");
> @@ -81,16 +82,22 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
>   
>   	intel_bb_add_intel_buf(ibb, src, false);
>   	intel_bb_add_intel_buf(ibb, dst, true);
> +	if (blt_has_fast_copy(ibb->i915)) {
> +		intel_bb_out(ibb, XY_FAST_COPY_BLT);
> +		intel_bb_out(ibb, XY_FAST_COPY_COLOR_DEPTH_32 | 4096);
> +	} else if (blt_has_xy_src_copy(ibb->i915)) {

Please double-check if this works on older gens, because we might have a 
problem similar to the one I described in review for the first patch.

> +		intel_bb_out(ibb,
> +			     XY_SRC_COPY_BLT_CMD |
> +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			     XY_SRC_COPY_BLT_WRITE_RGB |
> +			     (6 + 2 * has_64b_reloc));
> +
> +		intel_bb_out(ibb, (3 << 24) | /* 32 bits */
> +			     (0xcc << 16) | /* copy ROP */
> +			     4096);
> +	} else
> +		igt_assert_f(0, "No supported blit command found\n");

It would be good to also add brackets here (checkpatch.pl also complains 
about it)

Thanks,
Karolina

>   
> -	intel_bb_out(ibb,
> -		     XY_SRC_COPY_BLT_CMD |
> -		     XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		     XY_SRC_COPY_BLT_WRITE_RGB |
> -		     (6 + 2 * has_64b_reloc));
> -
> -	intel_bb_out(ibb, (3 << 24) | /* 32 bits */
> -		     (0xcc << 16) | /* copy ROP */
> -		     4096);
>   	intel_bb_out(ibb, 0 << 16 | 0);
>   	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
>   	intel_bb_emit_reloc_fenced(ibb, dst->handle,
