Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B735C04FFF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 13:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10C3113C93;
	Thu, 18 Apr 2024 13:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQPUFKxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AF8113C91
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 13:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713447684; x=1744983684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dNbNM7P5Fn4Ajq4k3MnTzuoGmJ6ue/p3C6wWzSGZMGc=;
 b=YQPUFKxrHKwUxay1hR3HR9FJmAHtIFH/hfwl9d9a5ORBdN/2Df587+Zb
 jsRxSzrmyPwMUHrdHDysyR+fyP/Wk0JXrKZv1e5SheOMKyTYUWjgOyfa/
 /WH5S+tHwNG0I3VkkBekjRU3aDcaMLlN68W0bv0fCzmVkqmsOTkEiTBsC
 mGfu3JUDdgeo96tYAEfZJHsXINPxaQ62AbewmxHp3R2lCZGswtQnMExaZ
 Xppq6e6aoiiJTDy0246xWAZ5dcbHQl2oCGzStWlNxqmM/zqceFWyD1DP3
 YNCXeTr+4755XaHoP0KYml2Ixlq+aWJdXTRTP4aPK0+U7ltsg/giuoRvt w==;
X-CSE-ConnectionGUID: qpdcADTyTjGvaddvIA0tNg==
X-CSE-MsgGUID: QyHJB//pSCW4cpsNLxGkeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="34386014"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="34386014"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 06:41:23 -0700
X-CSE-ConnectionGUID: HRZ+hdUDTcCDxTgFzBCzhQ==
X-CSE-MsgGUID: /y1EyroRRLKvmbO5O1Mnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23506611"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 06:41:22 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V3 6/6] HAX: Test force joiner on BAT
Date: Thu, 18 Apr 2024 19:05:13 +0530
Message-ID: <20240418133513.812544-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418091959.781560-7-bhanuprakash.modem@intel.com>
References: <20240418091959.781560-7-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Expectation: All pipe-D tests should skip.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c                |  6 +++---
 lib/igt_kms.h                |  2 +-
 tests/intel/kms_big_joiner.c |  2 +-
 tests/kms_flip.c             | 29 ++++++++++++++++++++++++++++-
 tests/kms_pipe_crc_basic.c   | 10 ++++++++++
 5 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9258e8f3f..8edbf2dce 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6241,13 +6241,13 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
  * Returns:
  *  true if the debugfs is available, false otherwise.
  */
-bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
+bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
 {
 	char buf[512];
 	int debugfs_fd, ret;
 
-	igt_assert_f(output->name, "Connector name cannot be NULL\n");
-	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
+	igt_assert_f(conn_name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, conn_name, O_RDONLY);
 	if (debugfs_fd < 0)
 		return false;
 	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b8f7c745b..8e34caa60 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1214,7 +1214,7 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
-bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
+bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
 bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 078f76ac1..33e4046e3 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -320,7 +320,7 @@ igt_main
 				data.big_joiner_output[data.big_joiner_output_count++] = output;
 				igt_output_override_mode(output, &mode);
 			} else {
-				if (igt_has_force_joiner_debugfs(data.drm_fd, output)) {
+				if (igt_has_force_joiner_debugfs(data.drm_fd, output->name)) {
 					force_joiner_supported = true;
 					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 				}
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 57f6cff7a..d819779e5 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1748,12 +1748,17 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 			 "%s-%d",
 			 kmstest_connector_type_str(o->kconnector[i]->connector_type),
 			 o->kconnector[i]->connector_type_id);
+		if (igt_has_force_joiner_debugfs(drm_fd, conn_name))
+			igt_force_and_check_bigjoiner_status(drm_fd, conn_name, true);
 
-		if (i > 0)
+		if (i > 0) {
 			snprintf(prev_conn_name, sizeof(prev_conn_name),
 				 "%s-%d",
 				 kmstest_connector_type_str(o->kconnector[i - 1]->connector_type),
 				 o->kconnector[i - 1]->connector_type_id);
+			if (igt_has_force_joiner_debugfs(drm_fd, prev_conn_name))
+				igt_force_and_check_bigjoiner_status(drm_fd, prev_conn_name, true);
+		}
 
 		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
 		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
@@ -2124,6 +2129,28 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_stop_signal_helper();
 
 	igt_fixture {
+		resources = drmModeGetResources(drm_fd);
+		if (resources) {
+			for (i = 0; i < resources->count_connectors; i++) {
+				drmModeConnector *connector = drmModeGetConnectorCurrent(drm_fd, resources->connectors[i]);
+				char conn_name[24];
+
+				if (!connector)
+					continue;
+
+				if (connector->connection == DRM_MODE_CONNECTED) {
+					snprintf(conn_name, sizeof(conn_name),
+						 "%s-%d",
+						 kmstest_connector_type_str(connector->connector_type),
+						 connector->connector_type_id);
+					if (igt_check_force_joiner_status(drm_fd, conn_name))
+						igt_force_and_check_bigjoiner_status(drm_fd, conn_name, false);
+				}
+			}
+
+			drmModeFreeResources(resources);
+		}
+
 		igt_display_fini(&display);
 		drm_close_driver(drm_fd);
 	}
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 0c19745bc..a5a2d61a1 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -411,6 +411,11 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		data.debugfs = igt_debugfs_dir(data.drm_fd);
 
+		for_each_connected_output(&data.display, output) {
+			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
+				igt_force_and_check_bigjoiner_status(data.drm_fd, output->name, true);
+		}
+
 		/* Get active pipes. */
 		for_each_pipe(&data.display, pipe)
 			active_pipes[last_pipe++] = pipe;
@@ -499,6 +504,11 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
+		for_each_connected_output(&data.display, output) {
+			if (igt_check_force_joiner_status(data.drm_fd, output->name))
+				igt_force_and_check_bigjoiner_status(data.drm_fd, output->name, false);
+		}
+
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.2

