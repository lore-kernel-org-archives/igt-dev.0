Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA63C04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0391121BB;
	Thu, 18 Apr 2024 09:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAb6ijrA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA5E1121BB
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713432382; x=1744968382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x4M94TiWjpMirXqp0LfTHiJvaKzFOpIBZS2g0cYwb+Y=;
 b=oAb6ijrA0ua0vmKca9Qe0AvuoRWueHHIPi5qSd/Ti5b60mLP82414QRN
 YeGGWjhiHxWfIvsR7IbWXr6dLbtC/DtYjASAvRHbP3U34H+3IGWi+VJ3R
 Z+SrC6umklv4e6zHs5Bq9EesG4EWrvN8pJRxryfvNKZkmUa6CUsaaUjS5
 wE6+YqeLyiIO4fNHPaCV5qY3WdI8Vs3HOaoqzzomP8wgX1rQSmkRUbUYK
 8SRr4AdgSMVMHS9sAH8n/9fSAmUjosWLfTS3DipWPJSzB3+z3VdQ1dvp+
 dgeiU9FWxcMKvBM3YH1Xz6vvejBfU5pVhqXCdOUPBCl6XL4kxMbrejn7B Q==;
X-CSE-ConnectionGUID: 0Otci/dHTRmSYKIrXMSK0w==
X-CSE-MsgGUID: sVGNLyldSDWQOKAn6FKyvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31447811"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31447811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:22 -0700
X-CSE-ConnectionGUID: JILI9uFBTtq6juEe/aESSw==
X-CSE-MsgGUID: 3v+mCTS5RsS6CfhJjh/D9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="53855415"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 02:26:19 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 6/6] HAX: Test force joiner on BAT
Date: Thu, 18 Apr 2024 14:49:59 +0530
Message-ID: <20240418091959.781560-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
References: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
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
 tests/kms_flip.c           | 26 +++++++++++++++++++++++++-
 tests/kms_pipe_crc_basic.c |  6 ++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 57f6cff7a..24844fc39 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1748,12 +1748,15 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 			 "%s-%d",
 			 kmstest_connector_type_str(o->kconnector[i]->connector_type),
 			 o->kconnector[i]->connector_type_id);
+		igt_force_and_check_bigjoiner_status(drm_fd, conn_name, true);
 
-		if (i > 0)
+		if (i > 0) {
 			snprintf(prev_conn_name, sizeof(prev_conn_name),
 				 "%s-%d",
 				 kmstest_connector_type_str(o->kconnector[i - 1]->connector_type),
 				 o->kconnector[i - 1]->connector_type_id);
+			igt_force_and_check_bigjoiner_status(drm_fd, prev_conn_name, true);
+		}
 
 		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
 		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
@@ -2124,6 +2127,27 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
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
+					igt_force_and_check_bigjoiner_status(drm_fd, conn_name, false);
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
index 0c19745bc..65b9647ec 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -411,6 +411,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		data.debugfs = igt_debugfs_dir(data.drm_fd);
 
+		for_each_connected_output(&data.display, output)
+			igt_force_and_check_bigjoiner_status(data.drm_fd, output->name, true);
+
 		/* Get active pipes. */
 		for_each_pipe(&data.display, pipe)
 			active_pipes[last_pipe++] = pipe;
@@ -499,6 +502,9 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
+		for_each_connected_output(&data.display, output)
+			igt_force_and_check_bigjoiner_status(data.drm_fd, output->name, false);
+
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.2

