Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B5110E887
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 16:44:24 +0000 (UTC)
Date: Mon, 16 May 2022 09:44:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20220516164422.up4s2jrztacuhztf@ldmartin-desk2>
References: <20220516150824.3535-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220516150824.3535-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Fix typo from
 src_tiling to dst_tiling
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

On Mon, May 16, 2022 at 08:38:24PM +0530, Jeevan B wrote:
>fix typo to avoid CRC mismatch for tile-4 tests
>

Fixes: ff9b8f21ce93 ("igt/lib: Add tile 4(F-tile) format support")
>Signed-off-by: Jeevan B <jeevan.b@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> lib/intel_batchbuffer.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>index ebf3c598..8680c9ba 100644
>--- a/lib/intel_batchbuffer.c
>+++ b/lib/intel_batchbuffer.c
>@@ -658,7 +658,7 @@ static uint32_t fast_copy_dword1(unsigned int src_tiling,
> 	if (src_tiling == I915_TILING_Yf || src_tiling == I915_TILING_4)
> 		/* Repurposed as Tile-4 on DG2 */
> 		dword1 |= XY_FAST_COPY_SRC_TILING_Yf;
>-	if (dst_tiling == I915_TILING_Yf || src_tiling == I915_TILING_4)
>+	if (dst_tiling == I915_TILING_Yf || dst_tiling == I915_TILING_4)
> 		/* Repurposed as Tile-4 on DG2 */
> 		dword1 |= XY_FAST_COPY_DST_TILING_Yf;
>
>-- 
>2.36.0
>
