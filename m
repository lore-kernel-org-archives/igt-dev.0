Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215C610E671
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 11:21:15 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Mar 2023 12:21:01 +0100
Message-Id: <a1512aee2b348f5ccfda2727166539292247bb4b.1678273325.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678273325.git.karolina.stolarek@intel.com>
References: <cover.1678273325.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/7] tests/i915/gem_blits: Add
 XY_FAST_COPY_BLT support for gem_blits
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Arjun Melkaveri <arjun.melkaveri@intel.com>

Test case uses legacy command XY_SRC_COPY_BLT_CMD which is not supported
on newer generations. Modify test to use XY_FAST_COPY_BLT.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 tests/i915/gem_blits.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index f704dbdd..eb16b567 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -218,7 +218,12 @@ static void buffer_set_tiling(const struct device *device,
 
 	if (!blt_has_xy_src_copy(device->fd)) {
 		batch[i++] = fast_copy_dword0(buffer->tiling, tiling);
-		dword1 = fast_copy_dword1(buffer->tiling, tiling, 32);
+		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
+		dword1 = fast_copy_dword1(buffer->tiling ?
+					  I915_TILING_Yf : I915_TILING_NONE,
+					  tiling ?
+					  I915_TILING_Yf : I915_TILING_NONE,
+					  32);
 		batch[i++] = dword1 | pitch;
 	} else {
 		batch[i] = (XY_SRC_COPY_BLT_CMD |
@@ -363,8 +368,11 @@ static bool blit_to_linear(const struct device *device,
 	}
 
 	if (!blt_has_xy_src_copy(device->fd)) {
-		batch[i++] = fast_copy_dword0(buffer->tiling, I915_TILING_NONE);
-		dword1 = fast_copy_dword1(buffer->tiling, I915_TILING_NONE, 32);
+		batch[i++] = fast_copy_dword0(buffer->tiling, 0);
+		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
+		dword1 = fast_copy_dword1(buffer->tiling ?
+					  I915_TILING_Yf : I915_TILING_NONE,
+					  0, 32);
 		batch[i++] = dword1 | buffer->stride;
 	} else {
 		batch[i] = (XY_SRC_COPY_BLT_CMD |
@@ -707,7 +715,12 @@ blit(const struct device *device,
 
 	if (!blt_has_xy_src_copy(device->fd)) {
 		batch[i++] = fast_copy_dword0(src->tiling, dst->tiling);
-		dword1 = fast_copy_dword1(src->tiling, dst->tiling, 32);
+		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
+		dword1 = fast_copy_dword1(src->tiling ?
+					  I915_TILING_Yf : I915_TILING_NONE,
+					  dst->tiling ?
+					  I915_TILING_Yf : I915_TILING_NONE,
+					  32);
 		batch[i++] = dword1 | pitch;
 	} else {
 		batch[i] = (XY_SRC_COPY_BLT_CMD |
-- 
2.25.1
