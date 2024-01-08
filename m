Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E1610E22E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 11:30:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] lib/intel_batchbuffer: Select xe2 rendercopy for
 LunarLake
Date: Mon,  8 Jan 2024 12:30:11 +0100
Message-Id: <20240108113012.382557-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
References: <20240108113012.382557-1-zbigniew.kempczynski@intel.com>
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
---
 lib/intel_batchbuffer.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ccab55cec7..d374645d99 100644
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
+	if (IS_METEORLAKE(devid))
+		copy = mtl_render_copyfunc;
+	else if (IS_LUNARLAKE(devid))
+		copy = genxe2_render_copyfunc;
 	else if (HAS_FLATCCS(devid))
 		copy = gen12p71_render_copyfunc;
-	else if (IS_METEORLAKE(devid))
-		copy = mtl_render_copyfunc;
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
