Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C825F10E542
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 06:18:35 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1FADB580DFE
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 23:18:30 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ochRk-000Req-0w
 for igt-dev@lists.freedesktop.org; Mon, 26 Sep 2022 08:18:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:17:31 +0200
Message-Id: <52bea57a679de2d18b6a299cffc8e1d4c2f7bc86.1664173031.git.mchehab@kernel.org>
In-Reply-To: <cover.1664173031.git.mchehab@kernel.org>
References: <cover.1664173031.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 26/76] kms_force_connector_basic: Close device
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
See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.mchehab@kernel.org/

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
2.37.3
