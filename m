Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697F610E14C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:01:01 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:29:58 +0530
Message-Id: <20220214150009.26815-6-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
References: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 05/16] igt/tests: Add support for
 Tile4(TileF) format to kms_draw_crc
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

kms_draw_crc would be the first sample test to support new
format.

v2: check for tile-4 support

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_draw_crc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 82c368e1..8579a55e 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -41,25 +41,24 @@ drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
 struct buf_ops *bops;
 igt_pipe_crc_t *pipe_crc;
 
-#define N_FORMATS 3
-static const uint32_t formats[N_FORMATS] = {
+static const uint32_t formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB2101010,
 };
 
-#define N_MODIFIER_METHODS 3
-static const uint64_t modifiers[N_MODIFIER_METHODS] = {
+static const uint64_t modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_4_TILED,
 };
 
 struct base_crc {
 	bool set;
 	igt_crc_t crc;
 };
-struct base_crc base_crcs[N_FORMATS];
+struct base_crc base_crcs[ARRAY_SIZE(formats)];
 
 struct modeset_params ms;
 
@@ -178,6 +177,9 @@ static void draw_method_subtest(enum igt_draw_method method,
 {
 	igt_crc_t crc;
 
+	if (modifier == I915_FORMAT_MOD_4_TILED)
+		igt_require(intel_get_device_info(intel_get_drm_devid(drm_fd))->has_4tile);
+
 	igt_skip_on(method == IGT_DRAW_MMAP_WC && !gem_mmap__has_wc(drm_fd));
 	igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
 		    !gem_has_mappable_ggtt(drm_fd));
@@ -315,6 +317,8 @@ static const char *modifier_str(int modifier_index)
 		return "xtiled";
 	case I915_FORMAT_MOD_Y_TILED:
 		return "ytiled";
+	case I915_FORMAT_MOD_4_TILED:
+		return "4tiled";
 	default:
 		igt_assert(false);
 	}
@@ -328,9 +332,9 @@ igt_main
 	igt_fixture
 		setup_environment();
 
-	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
+	for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
 	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
-	for (modifier_idx = 0; modifier_idx < N_MODIFIER_METHODS; modifier_idx++) {
+	for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
 		igt_describe("This subtest verfies igt_draw library works "
 			     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
 		igt_subtest_f("draw-method-%s-%s-%s",
-- 
2.17.1
