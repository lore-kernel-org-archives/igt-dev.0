Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131B210E238
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 09:06:50 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 10:06:34 +0100
Message-Id: <20230118090640.10659-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230118090640.10659-1-zbigniew.kempczynski@intel.com>
References: <20230118090640.10659-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/7] i915/lib: Add new library for blitter
 and tiling formats
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Add structs to describe what blitter commands and tiling formats
are supported per platform. Add generic functions that check if
a specific blitter command or tiling format is supported. Move
blt_tiling enum to the newly created library and update its
definition. Update i915_blt and block copy tests to reflect that
change. Update blt_supports_tiling to return false for invalid
tiling formats.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/i915/i915_blt.c                           |  37 ++---
 lib/i915/i915_blt.h                           |  14 +-
 lib/i915/intel_blt_info.c                     | 156 ++++++++++++++++++
 lib/i915/intel_blt_info.h                     |  93 +++++++++++
 lib/i915/intel_tiling_info.c                  |  87 ++++++++++
 lib/meson.build                               |  14 +-
 tests/i915/gem_ccs.c                          |  13 +-
 tests/i915/gem_lmem_swapping.c                |   2 +-
 9 files changed, 373 insertions(+), 44 deletions(-)
 create mode 100644 lib/i915/intel_blt_info.c
 create mode 100644 lib/i915/intel_blt_info.h
 create mode 100644 lib/i915/intel_tiling_info.c

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 102c8a8978..24ee17fcc7 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -59,6 +59,7 @@
   </chapter>
   <chapter>
     <title>igt/i915 API Reference</title>
+    <xi:include href="xml/intel_blt_info.xml"/>
     <xi:include href="xml/gem_create.xml"/>
     <xi:include href="xml/gem_context.xml"/>
     <xi:include href="xml/gem_engine_topology.xml"/>
diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 541935656b..99bf0247d6 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -217,10 +217,13 @@ bool blt_supports_compression(int i915)
  * Returns:
  * true if it does, false otherwise.
  */
-bool blt_supports_tiling(int i915, enum blt_tiling tiling)
+bool blt_supports_tiling(int i915, enum blt_tiling_type tiling)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
 
+	if (tiling >= T_YFMAJOR)
+		return false;
+
 	if (tiling == T_XMAJOR) {
 		if (IS_TIGERLAKE(devid) || IS_DG1(devid))
 			return false;
@@ -238,28 +241,7 @@ bool blt_supports_tiling(int i915, enum blt_tiling tiling)
 	return true;
 }
 
-/**
- * blt_tiling_name:
- * @tiling: tiling id
- *
- * Returns:
- * name of @tiling passed. Useful to build test names.
- */
-const char *blt_tiling_name(enum blt_tiling tiling)
-{
-	switch (tiling) {
-	case T_LINEAR: return "linear";
-	case T_XMAJOR: return "xmajor";
-	case T_YMAJOR: return "ymajor";
-	case T_TILE4:  return "tile4";
-	case T_TILE64: return "tile64";
-	}
-
-	igt_warn("invalid tiling passed: %d\n", tiling);
-	return NULL;
-}
-
-static int __block_tiling(enum blt_tiling tiling)
+static int __block_tiling(enum blt_tiling_type tiling)
 {
 	switch (tiling) {
 	case T_LINEAR: return 0;
@@ -267,6 +249,8 @@ static int __block_tiling(enum blt_tiling tiling)
 	case T_YMAJOR: return 1;
 	case T_TILE4:  return 2;
 	case T_TILE64: return 3;
+	default:
+		break;
 	}
 
 	igt_warn("invalid tiling passed: %d\n", tiling);
@@ -891,15 +875,20 @@ struct gen12_fast_copy_data {
 	} dw09;
 };
 
-static int __fast_tiling(enum blt_tiling tiling)
+static int __fast_tiling(enum blt_tiling_type tiling)
 {
 	switch (tiling) {
 	case T_LINEAR: return 0;
 	case T_XMAJOR: return 1;
 	case T_YMAJOR: return 2;
 	case T_TILE4:  return 2;
+	case T_YFMAJOR: return 2;
 	case T_TILE64: return 3;
+	default:
+		break;
 	}
+
+	igt_warn("invalid tiling passed: %d\n", tiling);
 	return 0;
 }
 
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 34db9bb962..8fa480b87d 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -47,6 +47,7 @@
 #include <malloc.h>
 #include "drm.h"
 #include "igt.h"
+#include "intel_blt_info.h"
 
 #define CCS_RATIO 256
 
@@ -59,14 +60,6 @@ enum blt_color_depth {
 	CD_128bit,
 };
 
-enum blt_tiling {
-	T_LINEAR,
-	T_XMAJOR,
-	T_YMAJOR,
-	T_TILE4,
-	T_TILE64,
-};
-
 enum blt_compression {
 	COMPRESSION_DISABLED,
 	COMPRESSION_ENABLED,
@@ -83,7 +76,7 @@ struct blt_copy_object {
 	uint32_t region;
 	uint64_t size;
 	uint8_t mocs;
-	enum blt_tiling tiling;
+	enum blt_tiling_type tiling;
 	enum blt_compression compression;  /* BC only */
 	enum blt_compression_type compression_type; /* BC only */
 	uint32_t pitch;
@@ -165,8 +158,7 @@ struct blt_ctrl_surf_copy_data {
 };
 
 bool blt_supports_compression(int i915);
-bool blt_supports_tiling(int i915, enum blt_tiling tiling);
-const char *blt_tiling_name(enum blt_tiling tiling);
+bool blt_supports_tiling(int i915, enum blt_tiling_type tiling);
 
 uint64_t emit_blt_block_copy(int i915,
 			     uint64_t ahnd,
diff --git a/lib/i915/intel_blt_info.c b/lib/i915/intel_blt_info.c
new file mode 100644
index 0000000000..31da412d01
--- /dev/null
+++ b/lib/i915/intel_blt_info.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <stddef.h>
+
+#include "intel_blt_info.h"
+#include "igt_core.h"
+#include "intel_chipset.h"
+
+/**
+ * blt_tiling_name:
+ * @tiling: tiling id
+ *
+ * Returns:
+ * name of @tiling passed. Useful to build test names.
+ */
+const char *blt_tiling_name(enum blt_tiling_type tiling)
+{
+	switch (tiling) {
+	case T_LINEAR: return "linear";
+	case T_XMAJOR: return "xmajor";
+	case T_YMAJOR: return "ymajor";
+	case T_TILE4:  return "tile4";
+	case T_TILE64: return "tile64";
+	case T_YFMAJOR: return "yfmajor";
+	default: return NULL;
+	}
+}
+
+static const char *blt_cmd_name(enum blt_cmd_type cmd)
+{
+	switch (cmd) {
+	case SRC_COPY: return "SRC_COPY_BLT";
+	case XY_SRC_COPY: return "XY_SRC_COPY_BLT";
+	case XY_FAST_COPY: return "XY_FAST_COPY_BLT";
+	case XY_BLOCK_COPY: return "XY_BLOCK_COPY_BLT";
+	default: return NULL;
+	}
+}
+
+/**
+ * blt_supports_command:
+ * @info: Blitter command info struct
+ * @cmd: Blitter command enum
+ *
+ * Checks if @info has an entry of supported tiling formats for @cmd command.
+ *
+ * Returns: true if it does, false otherwise
+ */
+bool blt_supports_command(const struct blt_cmd_info *info,
+			  enum blt_cmd_type cmd)
+{
+	igt_require_f(info, "No config found for the platform\n");
+
+	return info->supported_tiling[cmd];
+}
+
+/**
+ * blt_cmd_supports_tiling:
+ * @info: Blitter command info struct
+ * @cmd: Blitter command enum
+ * @tiling: tiling format enum
+ *
+ * Checks if a @cmd entry of @info lists @tiling. It also returns false if
+ * no information about the command is stored.
+ *
+ * Returns: true if it does, false otherwise
+ */
+bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
+			     enum blt_cmd_type cmd,
+			     enum blt_tiling_type tiling)
+{
+	struct blt_tiling_info const *tile_config;
+
+	if (!info)
+		return false;
+
+	tile_config = info->supported_tiling[cmd];
+
+	/* no config means no support for that tiling */
+	if (!tile_config)
+		return false;
+
+	return tile_config->supported_tiling & BIT(tiling);
+}
+
+/* Info dump functions */
+static char *tiling_info(struct blt_cmd_info const *info, enum blt_cmd_type type)
+{
+	struct blt_tiling_info const *tiling = info->supported_tiling[type];
+	uint32_t tile, len;
+	char *tmp = NULL;
+	char *tile_list_str;
+
+	if (!tiling) {
+		igt_warn("No tiling info found for the platform\n");
+		return NULL;
+	}
+
+	for_each_tiling(tile) {
+		if (tiling->supported_tiling & BIT(tile)) {
+			len = asprintf(&tile_list_str, "%s%s ",
+				       (tmp ? tmp : ""), blt_tiling_name(tile));
+
+			if (tmp)
+				free(tmp);
+
+			igt_assert_f(len > 0, "asprintf failed!\n");
+			tmp = tile_list_str;
+		}
+	}
+
+	tile_list_str[len - 1] = '\0';
+
+	return tile_list_str;
+}
+
+/**
+ * dump_devid_blt_info:
+ * @info: pointer to the Blitter command info struct
+ *
+ * Prints a list of supported commands with available tiling formats.
+ *
+ */
+void blt_dump_blt_cmd_info(struct blt_cmd_info const *info)
+{
+	char *cmd_ln, *tiling_str;
+	int len;
+
+	if (!info) {
+		igt_warn("No config available\n");
+		return;
+	}
+
+	igt_info("Supported blitter commands:\n");
+
+	for (int cmd = 0; cmd < __BLT_MAX_CMD; cmd++) {
+		if (info->supported_tiling[cmd]) {
+			tiling_str = tiling_info(info, cmd);
+
+			if (tiling_str) {
+				len = asprintf(&cmd_ln, "  * %s [%s]\n",
+					       blt_cmd_name(cmd), tiling_str);
+
+				free(tiling_str);
+
+				igt_assert_f(len > 0, "asprintf failed!\n");
+				igt_info("%s", cmd_ln);
+
+				free(cmd_ln);
+			}
+		}
+	}
+}
diff --git a/lib/i915/intel_blt_info.h b/lib/i915/intel_blt_info.h
new file mode 100644
index 0000000000..e57cb74d6d
--- /dev/null
+++ b/lib/i915/intel_blt_info.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef BLT_TILING_H
+#define BLT_TILING_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+/**
+ * SECTION:intel_blt_info
+ * @short_description: blitter library to query for available commands and tiling formats
+ * @title: Intel blitter info
+ * @include: intel_blt_info.h
+ *
+ * # Introduction
+ *
+ * When we do a blitter copy, a number of different tiling formats can be used.
+ * The list of available formats and commands varies between generations, in
+ * some cases even within the generation (e.g. block copy tiling formats offered
+ * by TGL vs DG2). Such information is required by different tests, so it's
+ * beneficial to store it in one place. `intel_blt_info` is a blitter library
+ * that describes available commands with a list of supported tiling formats.
+ * They are encapsulated in static `blt_cmd_info` instances, each of them
+ * defined per generation or platform.
+ *
+ * Tiling formats here are described by blt_tiling_type enum, which represents
+ * shifts used to create bit flags of supported tiling formats:
+ * `.supported_tiling = BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_YMAJOR)`
+ *
+ * # Usage
+ *
+ * - blt_supports_command(info, cmd) - checks if a blt_cmd_type instance has an
+ *				       entry for the command
+ * - blt_cmd_supports_tiling(info, cmd, tiling) - checks if a tiling format is
+ *						  supported by the command. Can
+ *						  also handle the case when the
+ *						  command is not available on
+ *						  the platform.
+ *
+ * These general checks can be wrapped in a command or tiling specific check,
+ * provided by other libraries.
+ *
+ */
+
+enum blt_tiling_type {
+	T_LINEAR,
+	T_XMAJOR,
+	T_YMAJOR,
+	T_TILE4,
+	T_TILE64,
+	T_YFMAJOR,
+	__BLT_MAX_TILING
+};
+
+enum blt_cmd_type {
+	SRC_COPY,
+	XY_SRC_COPY,
+	XY_FAST_COPY,
+	XY_BLOCK_COPY,
+	__BLT_MAX_CMD
+};
+
+struct blt_tiling_info {
+	enum blt_cmd_type blt_cmd_type;
+	uint32_t supported_tiling;
+};
+
+struct blt_cmd_info {
+	struct blt_tiling_info const *supported_tiling[__BLT_MAX_CMD];
+};
+
+extern const struct blt_cmd_info pre_gen8_blt_info;
+extern const struct blt_cmd_info gen8_blt_info;
+extern const struct blt_cmd_info gen11_blt_info;
+extern const struct blt_cmd_info gen12_blt_info;
+extern const struct blt_cmd_info gen12_dg2_blt_info;
+
+#define for_each_tiling(__tiling) \
+	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
+
+bool blt_supports_command(const struct blt_cmd_info *info,
+			  enum blt_cmd_type cmd);
+bool blt_cmd_supports_tiling(const struct blt_cmd_info *info,
+			     enum blt_cmd_type cmd,
+			     enum blt_tiling_type tiling);
+
+void blt_dump_blt_cmd_info(struct blt_cmd_info const *info);
+const char *blt_tiling_name(enum blt_tiling_type tiling);
+
+#endif // BLT_TILING_H
diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_tiling_info.c
new file mode 100644
index 0000000000..1f6a4d80c5
--- /dev/null
+++ b/lib/i915/intel_tiling_info.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "intel_blt_info.h"
+#include "intel_chipset.h"
+
+#define BLT_INFO(_cmd, _tiling)  { \
+		.blt_cmd_type = _cmd, \
+		.supported_tiling = _tiling \
+	}
+
+static const struct blt_tiling_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
+static const struct blt_tiling_info
+		pre_gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
+						BIT(T_LINEAR) |
+						BIT(T_XMAJOR));
+static const struct blt_tiling_info
+		gen8_xy_src_copy = BLT_INFO(XY_SRC_COPY,
+					    BIT(T_LINEAR) |
+					    BIT(T_XMAJOR) |
+					    BIT(T_YMAJOR));
+static const struct blt_tiling_info
+		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
+					      BIT(T_LINEAR)  |
+					      BIT(T_YMAJOR)  |
+					      BIT(T_YFMAJOR) |
+					      BIT(T_TILE64));
+static const struct blt_tiling_info
+		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
+					      BIT(T_LINEAR) |
+					      BIT(T_YMAJOR) |
+					      BIT(T_TILE4)  |
+					      BIT(T_TILE64));
+static const struct blt_tiling_info
+		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
+					    BIT(T_LINEAR) |
+					    BIT(T_XMAJOR) |
+					    BIT(T_TILE4)  |
+					    BIT(T_TILE64));
+static const struct blt_tiling_info
+		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
+					       BIT(T_LINEAR) |
+					       BIT(T_YMAJOR));
+static const struct blt_tiling_info
+		dg2_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
+					     BIT(T_LINEAR) |
+					     BIT(T_XMAJOR) |
+					     BIT(T_TILE4)  |
+					     BIT(T_TILE64));
+
+const struct blt_cmd_info pre_gen8_blt_info = {
+	.supported_tiling = {
+		[SRC_COPY] = &src_copy,
+		[XY_SRC_COPY] = &pre_gen8_xy_src_copy
+	}
+};
+
+const struct blt_cmd_info gen8_blt_info = {
+	.supported_tiling = {
+		[XY_SRC_COPY] = &gen8_xy_src_copy,
+	}
+};
+
+const struct blt_cmd_info gen11_blt_info = {
+	.supported_tiling = {
+		[XY_SRC_COPY] = &gen8_xy_src_copy,
+		[XY_FAST_COPY] = &gen11_xy_fast_copy,
+	}
+};
+
+const struct blt_cmd_info gen12_blt_info = {
+	.supported_tiling = {
+		[XY_SRC_COPY] = &gen8_xy_src_copy,
+		[XY_FAST_COPY] = &gen12_xy_fast_copy,
+		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
+	}
+};
+
+const struct blt_cmd_info gen12_dg2_blt_info = {
+	.supported_tiling = {
+		[XY_SRC_COPY] = &gen8_xy_src_copy,
+		[XY_FAST_COPY] = &dg2_xy_fast_copy,
+		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
+	}
+};
diff --git a/lib/meson.build b/lib/meson.build
index cc78468696..ffb2d3edb2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -11,6 +11,8 @@ lib_sources = [
 	'i915/gem_ring.c',
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
+	'i915/intel_blt_info.c',
+	'i915/intel_tiling_info.c',
 	'i915/intel_decode.c',
 	'i915/intel_memory_region.c',
 	'i915/intel_mocs.c',
@@ -229,6 +231,14 @@ lib_igt_perf_build = static_library('igt_perf',
 lib_igt_perf = declare_dependency(link_with : lib_igt_perf_build,
 				  include_directories : inc)
 
+lin_igt_intel_blt_info_build = static_library('igt_intel_blt_info',
+					     ['i915/intel_blt_info.c',
+					      'i915/intel_tiling_info.c'],
+					     include_directories : inc)
+
+lib_igt_intel_blt_info = declare_dependency(link_with : lin_igt_intel_blt_info_build,
+					    include_directories : inc)
+
 scan_dep = [
 	glib,
 	libudev,
@@ -240,7 +250,7 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 	'igt_tools_stub.c',
 	'intel_device_info.c',
 	],
-	dependencies : scan_dep,
+	dependencies : [scan_dep, lib_igt_intel_blt_info],
 	include_directories : inc)
 
 lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
@@ -320,7 +330,7 @@ endforeach
 lib_igt_i915_perf_build = shared_library(
   'i915_perf',
   i915_perf_files,
-  dependencies: lib_igt_chipset,
+  dependencies: [lib_igt_chipset, lib_igt_intel_blt_info],
   include_directories : inc,
   install: true,
   soversion: '1.5')
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index ff28c6d889..8c153ecea8 100644
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
@@ -547,7 +547,7 @@ static void block_multicopy(int i915,
 			    const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e,
 			    uint32_t region1, uint32_t region2,
-			    enum blt_tiling mid_tiling,
+			    enum blt_tiling_type mid_tiling,
 			    const struct test_config *config)
 {
 	struct blt_copy3_data blt3 = {};
@@ -636,7 +636,7 @@ static const struct {
 	const char *suffix;
 	void (*copyfn)(int, const intel_ctx_t *,
 		       const struct intel_execution_engine2 *,
-		       uint32_t, uint32_t, enum blt_tiling,
+		       uint32_t, uint32_t, enum blt_tiling_type,
 		       const struct test_config *);
 } copyfns[] = {
 	[BLOCK_COPY] = { "", block_copy },
@@ -651,6 +651,7 @@ static void block_copy_test(int i915,
 {
 	struct igt_collection *regions;
 	const struct intel_execution_engine2 *e;
+	int tiling;
 
 	if (config->compression && !blt_supports_compression(i915))
 		return;
@@ -658,7 +659,7 @@ static void block_copy_test(int i915,
 	if (config->inplace && !config->compression)
 		return;
 
-	for (int tiling = T_LINEAR; tiling <= T_TILE64; tiling++) {
+	for_each_tiling(tiling) {
 		if (!blt_supports_tiling(i915, tiling) ||
 		    (param.tiling >= 0 && param.tiling != tiling))
 			continue;
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 75121d4194..9388d4de06 100644
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
2.34.1
