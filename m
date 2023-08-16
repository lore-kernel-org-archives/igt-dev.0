Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAF210E391
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:40:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:01:52 +0530
Message-Id: <20230816163206.402705-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 06/20] tests/kms_plane_lowres: Add tiling
 support for XE
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

Remove the tiling restrictions in Xe specific tests

V2: - Update XE blocklist

Fixes: 129983d07 (tests/kms_plane_lowers: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 -
 tests/kms_plane_lowres.c        | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 358f44e6a..01495c7c9 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -76,6 +76,5 @@ igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
 igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
 igt@kms_rotation_crc@exhaust-fences
 igt@kms_force_connector_basic@force-load-detect
-igt@kms_plane_lowres@tiling-(4|x|y|yf)
 igt@kms_.*@.*hang.*
 ##################################################################
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 5ff06c417..ea6c08200 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -301,9 +301,6 @@ static void run_test(data_t *data, uint64_t modifier)
 	if(!igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888, modifier))
 		return;
 
-	if (is_xe_device(data->drm_fd) && modifier != DRM_FORMAT_MOD_LINEAR)
-		return;
-
 	for_each_pipe(&data->display, pipe) {
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
 			data->pipe = pipe;
-- 
2.40.0
