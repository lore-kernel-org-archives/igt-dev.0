Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E4910E2F0
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:54:02 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oV53V-007p9S-ET
 for igt-dev@lists.freedesktop.org; Mon, 05 Sep 2022 07:53:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 07:53:00 +0200
Message-Id: <c502b300dd03ac7e644f900fa951170028764b52.1662357022.git.mchehab@kernel.org>
In-Reply-To: <cover.1662357022.git.mchehab@kernel.org>
References: <cover.1662357022.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 26/77] kms_force_connector_basic: Close device
 before exit
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

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/77] at: https://lore.kernel.org/all/cover.1662357022.git.mchehab@kernel.org/

 tests/kms_force_connector_basic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 683d3672056d..6259cec538de 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -33,9 +33,9 @@ IGT_TEST_DESCRIPTION("Check the debugfs force connector/edid features work"
 
 static void reset_connectors(void)
 {
-	int drm_fd = 0;
 	drmModeRes *res;
 	drmModeConnector *connector = NULL;
+	int drm_fd;
 
 	drm_fd = drm_open_driver_master(DRIVER_ANY);
 	res = drmModeGetResources(drm_fd);
@@ -54,6 +54,8 @@ static void reset_connectors(void)
 	}
 
 	igt_set_module_param_int(drm_fd, "load_detect_test", 0);
+
+	close(drm_fd);
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
@@ -224,6 +226,9 @@ igt_main_args("", long_opts, help_str, opt_handler, NULL)
 
 			drmModeFreePlane(drm_plane);
 		}
+
+		igt_remove_fb(drm_fd, &xrgb_fb);
+		igt_remove_fb(drm_fd, &argb_fb);
 	}
 
 	igt_describe("Test to check the forced connector state.");
-- 
2.37.2
