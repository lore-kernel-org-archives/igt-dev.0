Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595DF8910B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jan 2021 06:54:43 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Mon, 25 Jan 2021 12:33:36 +0530
Message-Id: <20210125070336.15378-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_panel_fitting: test requires eDP
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added a condition to check the availability of eDP
before execution of the test. Skip the test with
proper debug messsage if eDP is not there

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_panel_fitting.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 4f4c5608..9f6b00e5 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -254,7 +254,10 @@ igt_main
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_display_require(&data.display, data.drm_fd);
-		igt_display_require_output(&data.display);
+
+		if (data.display.outputs->config.connector->connector_type !=
+		    DRM_MODE_CONNECTOR_eDP)
+			igt_skip("Can't test: no usable eDP screen.\n");
 	}
 
 	igt_subtest("legacy")
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
