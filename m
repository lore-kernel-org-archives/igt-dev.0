Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E722810E37A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:50:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:54 +0530
Message-Id: <20230418164501.1687266-39-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 38/45] tests/kms_plane_lowers: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_lowres.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 958d3ec6f..db9f5a54c 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -266,8 +266,11 @@ static void run_test(data_t *data, uint64_t modifier)
 	enum pipe pipe;
 	igt_output_t *output;
 
-	igt_skip_on(!igt_display_has_format_mod(&data->display,
-						DRM_FORMAT_XRGB8888, modifier));
+	if(!igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888, modifier))
+		return;
+
+	if (is_xe_device(data->drm_fd) && modifier != DRM_FORMAT_MOD_LINEAR)
+		return;
 
 	for_each_pipe(&data->display, pipe) {
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
@@ -318,7 +321,7 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-		data.devid = is_i915_device(data.drm_fd) ?
+		data.devid = is_intel_device(data.drm_fd) ?
 			intel_get_drm_devid(data.drm_fd) : 0;
 
 		kmstest_set_vt_graphics_mode();
-- 
2.40.0
