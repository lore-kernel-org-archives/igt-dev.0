Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942610E5D2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 12:25:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 2/3] lib/intel_batchbuffer: Select xe2 rendercopy for
 LunarLake
Date: Wed, 10 Jan 2024 13:25:13 +0100
Message-Id: <20240110122514.33495-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240110122514.33495-1-zbigniew.kempczynski@intel.com>
References: <20240110122514.33495-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Along with rendercopy xe2 pipeline / shader selection for LunarLake
reorganize if/else conditionals to handle specific selection first.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Matthew Auld <matthew.william.auld@gmail.com>
---
v3: Drop feature selection toward direct ver/platform (Matt)
---
 lib/intel_batchbuffer.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ccab55cec7..85023f9e6f 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -656,28 +656,30 @@ igt_render_copyfunc_t igt_get_render_copyfunc(int devid)
 {
 	igt_render_copyfunc_t copy = NULL;
 
-	if (IS_GEN2(devid))
-		copy = gen2_render_copyfunc;
-	else if (IS_GEN3(devid))
-		copy = gen3_render_copyfunc;
-	else if (IS_GEN4(devid) || IS_GEN5(devid))
-		copy = gen4_render_copyfunc;
-	else if (IS_GEN6(devid))
-		copy = gen6_render_copyfunc;
-	else if (IS_GEN7(devid))
-		copy = gen7_render_copyfunc;
-	else if (IS_GEN8(devid))
-		copy = gen8_render_copyfunc;
-	else if (IS_GEN9(devid) || IS_GEN10(devid))
-		copy = gen9_render_copyfunc;
-	else if (IS_GEN11(devid))
-		copy = gen11_render_copyfunc;
-	else if (HAS_FLATCCS(devid))
-		copy = gen12p71_render_copyfunc;
-	else if (IS_METEORLAKE(devid))
+	if (IS_METEORLAKE(devid))
 		copy = mtl_render_copyfunc;
+	else if (IS_DG2(devid))
+		copy = gen12p71_render_copyfunc;
+	else if (IS_GEN(devid, 20))
+		copy = xe2_render_copyfunc;
 	else if (IS_GEN12(devid))
 		copy = gen12_render_copyfunc;
+	else if (IS_GEN11(devid))
+		copy = gen11_render_copyfunc;
+	else if (IS_GEN9(devid) || IS_GEN10(devid))
+		copy = gen9_render_copyfunc;
+	else if (IS_GEN8(devid))
+		copy = gen8_render_copyfunc;
+	else if (IS_GEN7(devid))
+		copy = gen7_render_copyfunc;
+	else if (IS_GEN6(devid))
+		copy = gen6_render_copyfunc;
+	else if (IS_GEN4(devid) || IS_GEN5(devid))
+		copy = gen4_render_copyfunc;
+	else if (IS_GEN3(devid))
+		copy = gen3_render_copyfunc;
+	else if (IS_GEN2(devid))
+		copy = gen2_render_copyfunc;
 
 	return copy;
 }
-- 
2.34.1
