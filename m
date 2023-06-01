Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3310E210
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 05:05:22 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 10:39:24 +0530
Message-Id: <20230601050928.2487611-3-kunal1.joshi@intel.com>
In-Reply-To: <20230601050928.2487611-1-kunal1.joshi@intel.com>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] RFC Added is_xe to check if xe device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added is_xe for test to have XE checks

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index c2b99670..3bef46b6 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -309,6 +309,8 @@ struct {
 	.stop = true,
 };
 
+static bool is_xe;
+
 static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
 {
 	drmModeConnector *c = output->config.connector;
@@ -1341,6 +1343,12 @@ static void setup_drm(void)
 	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 	drm.debugfs = igt_debugfs_dir(drm.fd);
 
+	/*
+	 * Test has XE checks as we don't have gem IOCTLS
+	 * on XE used in this test, for now ignore it if XE
+	 */
+	is_xe = is_xe_device(drm.fd);
+
 	kmstest_set_vt_graphics_mode();
 	igt_display_require(&drm.display, drm.fd);
 
-- 
2.25.1
