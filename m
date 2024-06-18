Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F2CC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28EB10E5EE;
	Tue, 18 Jun 2024 08:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5e0lYqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE80710E5FB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699467; x=1750235467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T34oCcwOeV8sgSoQIuQOIaYDXM9jcQRvlIPeaUxlRok=;
 b=b5e0lYqSm9A9+x9yqMWroOkRGkrva6CHn9+WQDeV1jRb430drCAO9uEU
 T1dCrh+zNh8YA4L6bwVd8ORLeGQbZjPgQM2WWWUT+GhsaIgJde3i1Xy0i
 3YMYNKmBt3rsju0y66nLXNhbRJV2YmvxUad8z/t81DXhDtIiA24687ETZ
 frmU+jJUk09avyMik/vIVUDflSP1Wi8iE2B0PEKqU25hurtbrXJ3sNBXX
 ZgPhzFtNbKyqaFglteKK4YeiOR94WVf7TZxrI4yZvYMbuXXHF/LZ7xhCK
 w3A0gYFq1AKHCyLcDgn6nB9goxH0q4tn9s6CeaU5ufotFnqmyw7EyA5CR A==;
X-CSE-ConnectionGUID: lYXdMensRB61/BI4sPqUyw==
X-CSE-MsgGUID: 9oucP97pSm6QENNxatt62g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38082207"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="38082207"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:31:07 -0700
X-CSE-ConnectionGUID: a4hip+voTReNbfdLdWYq0w==
X-CSE-MsgGUID: Umrhnc4qRNSn8LwodASFhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64699608"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:31:05 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V6 8/8] HAX: Test force joiner on BAT
Date: Tue, 18 Jun 2024 13:52:48 +0530
Message-ID: <20240618082248.4070611-9-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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
index cbabbe74f..326fd7130 100755
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

