Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0638710E8F6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 09:23:27 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Jan 2023 14:55:29 +0530
Message-Id: <20230119092530.3780-4-swati2.sharma@intel.com>
In-Reply-To: <20230119092530.3780-1-swati2.sharma@intel.com>
References: <20230119092530.3780-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 3/4] tests/i915/kms_dsc: Add disp_ver as struct
 data_t member
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

disp_ver is added as struct data_t member. This is required
since features like fractional BPP and DSC YCBCR420 are
getting introduced from MTL+ and we need disp_ver check.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 22239122c..8f32ae950 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -47,6 +47,7 @@ typedef struct {
 	igt_output_t *output;
 	int input_bpc;
 	int n_pipes;
+	int disp_ver;
 	enum pipe pipe;
 } data_t;
 
@@ -217,11 +218,12 @@ igt_main
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
+		data.disp_ver = intel_display_ver(data.devid);
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-		igt_require(intel_display_ver(data.devid) >= 11);
+		igt_require(data.disp_ver >= 11);
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i)
 			data.n_pipes++;
-- 
2.25.1
