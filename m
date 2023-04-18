Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5500610E810
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:49:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:34 +0530
Message-Id: <20230418164501.1687266-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 18/45] tests/i915/kms_dsc: Add XE support
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
 tests/i915/kms_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index cf34dc8a8..c4dfc9251 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -212,7 +212,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.disp_ver = intel_display_ver(data.devid);
 		kmstest_set_vt_graphics_mode();
-- 
2.40.0
