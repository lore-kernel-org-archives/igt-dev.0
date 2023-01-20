Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F080610E136
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 17:39:13 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 23:11:17 +0530
Message-Id: <20230120174119.3937-4-swati2.sharma@intel.com>
In-Reply-To: <20230120174119.3937-1-swati2.sharma@intel.com>
References: <20230120174119.3937-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/i915/kms_dsc: Add disp_ver as
 struct data_t member
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
index 22239122..8f32ae95 100644
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
