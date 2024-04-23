Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEE4C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 12:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EEE113367;
	Tue, 23 Apr 2024 12:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyhTEoCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89352113365
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713875588; x=1745411588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2jPi1hxvUt0q78OHFmZv+hR+KC4nOgVM+UjGaeFCxA=;
 b=UyhTEoCzIwRAngO4BxQnIHBsT+E/PYpGB2qIDRvr3ooqRrkFbe32+0hc
 yAKMqfoDPSo1lgwzU/yFsL0NaplACwniDdpm0lL1ZHuwY0Wk1ZGuNST7T
 Ppf7BLXxapGKmHsGo8BVPyKN1UMQKgMdNZytCAUwGjJ02UO3682nC+eJi
 XVfRyAP2SoSLceliHWB+uPUdn7wMEWZUn/Er7hJ1pc0K9yARXqXcrflSu
 cyo5chvTJ7ikaGUzdMr3KrzFnNaiJ+0W470Y0tU9/57+i7FusZTEFjDqC
 N9jlxVGOEH5AE+uGDI5spxJ3ndOPwSSLgXdI4Q8cixTs4GjuUOmDXKPia g==;
X-CSE-ConnectionGUID: fxY6T/p0StWqKXmDWDF2wA==
X-CSE-MsgGUID: gTi/b9CGT5qFGX2jxxpSew==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20067061"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20067061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:33:08 -0700
X-CSE-ConnectionGUID: QGQ2YHaVREaXhQcXwsTyhQ==
X-CSE-MsgGUID: EK/swxhxTwu7LO553T2qfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24361371"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 05:33:06 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V4 7/7] HAX: Test force joiner on BAT
Date: Tue, 23 Apr 2024 17:56:36 +0530
Message-ID: <20240423122636.1241111-8-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
References: <20240423122636.1241111-1-bhanuprakash.modem@intel.com>
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
 tests/kms_flip.c           | 9 ++++++++-
 tests/kms_pipe_crc_basic.c | 6 ++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 57f6cff7a..b30a89715 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1748,12 +1748,17 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 			 "%s-%d",
 			 kmstest_connector_type_str(o->kconnector[i]->connector_type),
 			 o->kconnector[i]->connector_type_id);
+		if (igt_has_force_joiner_debugfs(drm_fd, conn_name))
+			kmstest_force_connector_bigjoiner(drm_fd, o->kconnector[i]);
 
-		if (i > 0)
+		if (i > 0) {
 			snprintf(prev_conn_name, sizeof(prev_conn_name),
 				 "%s-%d",
 				 kmstest_connector_type_str(o->kconnector[i - 1]->connector_type),
 				 o->kconnector[i - 1]->connector_type_id);
+			if (igt_has_force_joiner_debugfs(drm_fd, prev_conn_name))
+				kmstest_force_connector_bigjoiner(drm_fd, o->kconnector[i - 1]);
+		}
 
 		if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
 		      igt_bigjoiner_possible(&o->kmode[i], max_dotclock)) &&
@@ -2124,6 +2129,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_stop_signal_helper();
 
 	igt_fixture {
+		igt_reset_connectors();
+
 		igt_display_fini(&display);
 		drm_close_driver(drm_fd);
 	}
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 0c19745bc..e5e5264b5 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -411,6 +411,11 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		data.debugfs = igt_debugfs_dir(data.drm_fd);
 
+		for_each_connected_output(&data.display, output) {
+			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
+				kmstest_force_connector_bigjoiner(data.drm_fd, output->config.connector);
+		}
+
 		/* Get active pipes. */
 		for_each_pipe(&data.display, pipe)
 			active_pipes[last_pipe++] = pipe;
@@ -499,6 +504,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
+		igt_reset_connectors();
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.2

