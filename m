Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7A189F9F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 12:12:20 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Tue, 10 Aug 2021 17:39:14 +0530
Message-Id: <20210810120914.2543884-2-ayaz.siddiqui@intel.com>
In-Reply-To: <20210810120914.2543884-1-ayaz.siddiqui@intel.com>
References: <20210810120914.2543884-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t V2 1/1] lib/rendercopy_gen9: Program MOCS
 value based on platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Mika Kahola <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Gen12 onward platforms does not support coachability via PTE.
So I915_MOCS_PTE( index 1) may point to unspecified/reserved or some
other coachability MOCS index. This may leads to data corruption.

A helper function has been added to provide UC MOCS index based
on platform.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Reviewed-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/rendercopy_gen9.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index eecf73d318..0356964e3e 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -23,6 +23,7 @@
 #include "gen9_render.h"
 #include "intel_reg.h"
 #include "igt_aux.h"
+#include "intel_chipset.h"
 
 #define VERTEX_SIZE (3*4)
 
@@ -115,12 +116,42 @@ static const uint32_t gen12_render_copy[][4] = {
 	{ 0x80040131, 0x00000004, 0x50007144, 0x00c40000 },
 };
 
+
+/*
+ * Gen >= 12 onwards don't have a setting for PTE,
+ * so using I915_MOCS_PTE as mocs index may lead to
+ * some undefined MOCS behavior.
+ * Correct MOCS index should be referred from BSpec
+ * and programmed accordingly.
+ * This helper function is providing appropriate UC index.
+ */
+static uint8_t
+intel_get_uc_mocs(int fd) {
+
+	uint16_t devid = intel_get_drm_devid(fd);
+	uint8_t  uc_index;
+
+	if (IS_DG1(devid))
+		uc_index = 1;
+	else if (IS_GEN12(devid))
+		uc_index = 3;
+	else
+		uc_index = I915_MOCS_PTE;
+
+	/*
+	 * BitField [6:1] represents index to MOCS Tables
+	 * BitField [0] represents Encryption/Decryption
+	 */
+	return uc_index << 1;
+}
+
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
 static uint32_t
 gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 	struct gen9_surface_state *ss;
 	uint32_t write_domain, read_domain;
 	uint64_t address;
+	int i915 = buf_ops_get_fd(buf->bops);
 
 	igt_assert_lte(buf->surface[0].stride, 256*1024);
 	igt_assert_lte(intel_buf_width(buf), 16384);
@@ -151,7 +182,7 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst) {
 	else if (buf->tiling != I915_TILING_NONE)
 		ss->ss0.tiled_mode = 3;
 
-	ss->ss1.memory_object_control = I915_MOCS_PTE << 1;
+	ss->ss1.memory_object_control = intel_get_uc_mocs(i915);
 
 	if (buf->tiling == I915_TILING_Yf)
 		ss->ss5.trmode = 1;
-- 
2.26.2
