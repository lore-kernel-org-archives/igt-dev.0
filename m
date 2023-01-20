Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB83D10EA02
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 10:14:18 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 11:14:01 +0100
Message-Id: <bbe0b715361d93bb0800f255af77fbd65fc14fc0.1674208534.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1674208534.git.karolina.stolarek@intel.com>
References: <cover.1674208534.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 1/9] lib/i915_blt: Rename blt_tiling to
 blt_tiling_type
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

Make it more clear that blt_tiling enum indicates the tiling type.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c            |  8 ++++----
 lib/i915/i915_blt.h            |  8 ++++----
 tests/i915/gem_ccs.c           | 10 +++++-----
 tests/i915/gem_lmem_swapping.c |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 54193565..694c818c 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -217,7 +217,7 @@ bool blt_supports_compression(int i915)
  * Returns:
  * true if it does, false otherwise.
  */
-bool blt_supports_tiling(int i915, enum blt_tiling tiling)
+bool blt_supports_tiling(int i915, enum blt_tiling_type tiling)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
 
@@ -245,7 +245,7 @@ bool blt_supports_tiling(int i915, enum blt_tiling tiling)
  * Returns:
  * name of @tiling passed. Useful to build test names.
  */
-const char *blt_tiling_name(enum blt_tiling tiling)
+const char *blt_tiling_name(enum blt_tiling_type tiling)
 {
 	switch (tiling) {
 	case T_LINEAR: return "linear";
@@ -259,7 +259,7 @@ const char *blt_tiling_name(enum blt_tiling tiling)
 	return NULL;
 }
 
-static int __block_tiling(enum blt_tiling tiling)
+static int __block_tiling(enum blt_tiling_type tiling)
 {
 	switch (tiling) {
 	case T_LINEAR: return 0;
@@ -891,7 +891,7 @@ struct gen12_fast_copy_data {
 	} dw09;
 };
 
-static int __fast_tiling(enum blt_tiling tiling)
+static int __fast_tiling(enum blt_tiling_type tiling)
 {
 	switch (tiling) {
 	case T_LINEAR: return 0;
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 34db9bb9..747eb093 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -59,7 +59,7 @@ enum blt_color_depth {
 	CD_128bit,
 };
 
-enum blt_tiling {
+enum blt_tiling_type {
 	T_LINEAR,
 	T_XMAJOR,
 	T_YMAJOR,
@@ -83,7 +83,7 @@ struct blt_copy_object {
 	uint32_t region;
 	uint64_t size;
 	uint8_t mocs;
-	enum blt_tiling tiling;
+	enum blt_tiling_type tiling;
 	enum blt_compression compression;  /* BC only */
 	enum blt_compression_type compression_type; /* BC only */
 	uint32_t pitch;
@@ -165,8 +165,8 @@ struct blt_ctrl_surf_copy_data {
 };
 
 bool blt_supports_compression(int i915);
-bool blt_supports_tiling(int i915, enum blt_tiling tiling);
-const char *blt_tiling_name(enum blt_tiling tiling);
+bool blt_supports_tiling(int i915, enum blt_tiling_type tiling);
+const char *blt_tiling_name(enum blt_tiling_type tiling);
 
 uint64_t emit_blt_block_copy(int i915,
 			     uint64_t ahnd,
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index 6ae5ad85..724aa20b 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -46,7 +46,7 @@ struct test_config {
 
 static void set_object(struct blt_copy_object *obj,
 		       uint32_t handle, uint64_t size, uint32_t region,
-		       uint8_t mocs, enum blt_tiling tiling,
+		       uint8_t mocs, enum blt_tiling_type tiling,
 		       enum blt_compression compression,
 		       enum blt_compression_type compression_type)
 {
@@ -108,7 +108,7 @@ static void set_surf_object(struct blt_ctrl_surf_copy_object *obj,
 static struct blt_copy_object *
 create_object(int i915, uint32_t region,
 	      uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
-	      enum blt_tiling tiling,
+	      enum blt_tiling_type tiling,
 	      enum blt_compression compression,
 	      enum blt_compression_type compression_type,
 	      bool create_mapping)
@@ -429,7 +429,7 @@ static void block_copy(int i915,
 		       const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
 		       uint32_t region1, uint32_t region2,
-		       enum blt_tiling mid_tiling,
+		       enum blt_tiling_type mid_tiling,
 		       const struct test_config *config)
 {
 	struct blt_copy_data blt = {};
@@ -548,7 +548,7 @@ static void block_multicopy(int i915,
 			    const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e,
 			    uint32_t region1, uint32_t region2,
-			    enum blt_tiling mid_tiling,
+			    enum blt_tiling_type mid_tiling,
 			    const struct test_config *config)
 {
 	struct blt_copy3_data blt3 = {};
@@ -637,7 +637,7 @@ static const struct {
 	const char *suffix;
 	void (*copyfn)(int, const intel_ctx_t *,
 		       const struct intel_execution_engine2 *,
-		       uint32_t, uint32_t, enum blt_tiling,
+		       uint32_t, uint32_t, enum blt_tiling_type,
 		       const struct test_config *);
 } copyfns[] = {
 	[BLOCK_COPY] = { "", block_copy },
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 75121d41..9388d4de 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -78,7 +78,7 @@ struct object {
 
 static void set_object(struct blt_copy_object *obj,
 		       uint32_t handle, uint64_t size, uint32_t region,
-		       uint8_t mocs, enum blt_tiling tiling,
+		       uint8_t mocs, enum blt_tiling_type tiling,
 		       enum blt_compression compression,
 		       enum blt_compression_type compression_type)
 {
-- 
2.25.1
