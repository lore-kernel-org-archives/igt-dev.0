Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ABBCCF9F8
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 19:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2A310E32C;
	Thu, 30 Oct 2025 19:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OAPNOZE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F90E10E32C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761851766; x=1793387766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gD4xuQcp9Py/tbf9MnvxX8dSsAzjPAqDbrluzq2vDow=;
 b=OAPNOZE9qSfsTZWdueayCSKp2pQyQghS/s9c1wsnnSD98OMmdqm9wnIl
 4tgEZD+QBdbe9yH1ZNuKe/8EKROVIZdVLijoDOszDf51eJt/FILQ4AHnH
 S/HbwdFpIi8f9T90OZI5xFJ+3az/SW/Z43rjhQaWbuj+rbPQf18x1lK86
 zvQOFqo5z4I1q80sDMz0WGpA5X6uuQ9Z+CYTtDiimlDbZMU7ms0X3j3+U
 pFOmmIRdl2zQrPOAq4OiLcrOfVWpBgadDNqSGt3GFtg0oa16VS2vYHylp
 Se8Rki0Pi2hUKbV+Ml+PeBAiQ0SKrM+ijEY53NtIMtAcw1dAqQ+RVZK9Y A==;
X-CSE-ConnectionGUID: ms9UXMg3RZW1z47YwJF/Ow==
X-CSE-MsgGUID: gb8gyMtOSPe/eSQtXR2Jow==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64103591"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64103591"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:16:06 -0700
X-CSE-ConnectionGUID: IUCrKBH7Se6EQSeRzF5tlQ==
X-CSE-MsgGUID: Sv/RR4OTTiSpV9e2k1eLYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="191177003"
Received: from nkwan-gpu-0.jf.intel.com ([10.88.27.158])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:16:05 -0700
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: gustavo.sousa@intel.com,
	igt-dev@lists.freedesktop.org
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/kms_atomic_transition: Fix dynamic subtest
Date: Thu, 30 Oct 2025 12:15:50 -0700
Message-ID: <20251030191558.206251-1-ngai-mint.kwan@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix Segmentation Fault when calling igt_pipe_crc_free() due to double-freeing a
dangling pointer.

This occurs when a system connected to multiple displays executes a test with
"1x-outputs" dynamic subtest.

Example:
kms_atomic_transition --run-subtest modeset-transition --dynamic-subtest 1x-outputs

v2:
 - Move test cleanup inside run_modeset_tests().

Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
---
 tests/kms_atomic_transition.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index e1387bd89..419afe4dd 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -899,6 +899,7 @@ static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool
 	unsigned iter_max;
 	igt_output_t *output;
 	uint16_t width = 0, height = 0;
+	enum pipe pipe_enum;
 
 retry:
 	unset_output_pipe(&data->display);
@@ -1033,6 +1034,18 @@ retry:
 			}
 		}
 	}
+
+	/* Cleanup */
+	unset_output_pipe(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	if (is_intel_device(data->drm_fd)) {
+		for_each_pipe(&data->display, pipe_enum)
+			igt_pipe_crc_free(data->pipe_crcs[pipe_enum]);
+	}
+
+	igt_remove_fb(data->drm_fd, &data->fbs[0]);
+	igt_remove_fb(data->drm_fd, &data->fbs[1]);
 }
 
 static void run_modeset_transition(data_t *data, int requested_outputs, bool nonblocking, bool fencing)
@@ -1067,18 +1080,6 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 
 	igt_dynamic_f("%ix-outputs", requested_outputs)
 		run_modeset_tests(data, requested_outputs, nonblocking, fencing);
-
-	/* Cleanup */
-	unset_output_pipe(&data->display);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
-	if (is_intel_device(data->drm_fd)) {
-		for_each_pipe(&data->display, pipe)
-			igt_pipe_crc_free(data->pipe_crcs[pipe]);
-	}
-
-	igt_remove_fb(data->drm_fd, &data->fbs[0]);
-	igt_remove_fb(data->drm_fd, &data->fbs[1]);
 }
 
 static bool pipe_output_combo_valid(igt_display_t *display,
-- 
2.43.0

