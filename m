Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648E910F951
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 15:08:26 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 20:38:24 +0530
Message-Id: <20220516150824.3535-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Fix typo from
 src_tiling to dst_tiling
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

fix typo to avoid CRC mismatch for tile-4 tests

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/intel_batchbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ebf3c598..8680c9ba 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -658,7 +658,7 @@ static uint32_t fast_copy_dword1(unsigned int src_tiling,
 	if (src_tiling == I915_TILING_Yf || src_tiling == I915_TILING_4)
 		/* Repurposed as Tile-4 on DG2 */
 		dword1 |= XY_FAST_COPY_SRC_TILING_Yf;
-	if (dst_tiling == I915_TILING_Yf || src_tiling == I915_TILING_4)
+	if (dst_tiling == I915_TILING_Yf || dst_tiling == I915_TILING_4)
 		/* Repurposed as Tile-4 on DG2 */
 		dword1 |= XY_FAST_COPY_DST_TILING_Yf;
 
-- 
2.36.0
