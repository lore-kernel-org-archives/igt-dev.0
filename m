Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:33 -0700
Message-Id: <20230915132346.1845909-2-lucas.demarchi@intel.com>
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/14] lib/rendercopy: Use common mocs
 function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Do not duplicate what is done by lib/intel_mocs.[ch], just reuse it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/rendercopy_gen9.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index db67b5ee3..b8959d073 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -19,6 +19,7 @@
 #include "intel_bufops.h"
 #include "intel_batchbuffer.h"
 #include "intel_io.h"
+#include "intel_mocs.h"
 #include "rendercopy.h"
 #include "gen9_render.h"
 #include "intel_reg.h"
@@ -135,34 +136,6 @@ static const uint32_t gen12p71_render_copy[][4] = {
 	{ 0x80041131, 0x00000004, 0x50007144, 0x00c40000 },
 };
 
-/*
- * Gen >= 12 onwards don't have a setting for PTE,
- * so using I915_MOCS_PTE as mocs index may lead to
- * some undefined MOCS behavior.
- * Correct MOCS index should be referred from BSpec
- * and programmed accordingly.
- * This helper function is providing appropriate UC index.
- */
-static uint8_t
-intel_get_uc_mocs(int fd) {
-
-	uint16_t devid = intel_get_drm_devid(fd);
-	uint8_t  uc_index;
-
-	if (IS_DG1(devid))
-		uc_index = 1;
-	else if (IS_GEN12(devid))
-		uc_index = 3;
-	else
-		uc_index = I915_MOCS_PTE;
-
-	/*
-	 * BitField [6:1] represents index to MOCS Tables
-	 * BitField [0] represents Encryption/Decryption
-	 */
-	return uc_index << 1;
-}
-
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
 static uint32_t
 gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
-- 
2.40.1
