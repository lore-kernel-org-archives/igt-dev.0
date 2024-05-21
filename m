Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09360C25B75
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4162E10E462;
	Tue, 21 May 2024 09:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czdTkpdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDE910E462
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716285166; x=1747821166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cpAi6Fo+wZOjJcjlNgk+ea1DN8SpHBpAF4GVzOM5/SM=;
 b=czdTkpdtaBCtpYWC4oMI+P0k1cabZTdoHGfXOhVACtITPvGi5zXEFu6J
 ld7YT2g+7Mpe92Sd4Xp08o+5GmRSeeJZXOOdngnp2BQLoOY9MjKEJhxou
 3R4ZZHiXgcdQQDgYBT4YetyJF38VjwA4jxECYzv18r67DEV8fIAcoKkuT
 QjS8VxbZXKwqykl14bOVk65MkA5254gF2GTRvUcJ62YcVSX4AksGv7Ydg
 sJiefsESwqxokYkgwqcATV/uqn+NJesm8k/1Q1KaSc3tyBZnHqKYYzT3L
 dtC91bM9p9cf/Q6cyigZlboo+EO9QH/gcYwUsjS4LohyqGPA7Ku9q5gdn A==;
X-CSE-ConnectionGUID: ZbrKbESnSriGaPeSGOrpAg==
X-CSE-MsgGUID: r8I7m7BATSqS9vGk6xAaYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12580540"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12580540"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:52:39 -0700
X-CSE-ConnectionGUID: VWyGxnO/QHCLHNzcIBN/mg==
X-CSE-MsgGUID: X5bw1Hv5QlG5V1sZsMZ7Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="33461036"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:52:38 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] HAX/DONOT_MERGE: Add debug prints to HDR tests.
Date: Tue, 21 May 2024 15:15:28 +0530
Message-ID: <20240521094528.2591672-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c   | 10 ++++++++--
 tests/kms_hdr.c | 21 +++++++++++++++++----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f82102144..df6c8f8fc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6189,15 +6189,21 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 	for_each_connector_mode(output) {
 		igt_output_override_mode(output, &connector->modes[j__]);
 
+		kmstest_dump_mode(&connector->modes[j__]);
+
 		if (is_intel_device(display->drm_fd) &&
-		    !igt_check_bigjoiner_support(display))
+		    !igt_check_bigjoiner_support(display)) {
+			igt_info("Bigjoiner not supported, on selected combo, trying another mode\n");
 			continue;
+		}
 
 		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 		if (!igt_check_output_bpc_equal(display->drm_fd, pipe,
-						output->name, bpc))
+						output->name, bpc)) {
+			igt_info("Can't use this mode to match the requested bpc-%d, trying another mode\n", bpc);
 			continue;
+		}
 
 		return true;
 	}
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 99b78f7ef..cc5a08f8c 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -621,25 +621,37 @@ static void test_hdr(data_t *data, uint32_t flags)
 		 * set MAX_BPC property to 10bpc prior to setting
 		 * HDR metadata property. Therefore, checking.
 		 */
-		if (!has_max_bpc(output) || !has_hdr(output))
+		if (!has_max_bpc(output) || !has_hdr(output)) {
+			igt_info("Output %s: doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA\n", output->name);
 			continue;
+		}
 
 		/* For negative test, panel should be non-hdr. */
-		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output))
+		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
+			igt_info("Output %s: Can't run negative test on HDR panel\n", output->name);
 			continue;
+		}
 
-		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output))
+		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
+			igt_info("Output %s: Can't run HDR tests on non-HDR panel\n", output->name);
 			continue;
+		}
 
-		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
+		if (igt_get_output_max_bpc(data->fd, output->name) < 10) {
+			igt_info("Output %s: doesn't support 10 bpc\n", output->name);
 			continue;
+		}
 
 		for_each_pipe(display, pipe) {
+			igt_info("Using the combo: pipe-%s + %s\n", kmstest_pipe_name(pipe), output->name);
+
 			if (igt_pipe_connector_valid(pipe, output)) {
 				prepare_test(data, output, pipe);
 
 				if (is_intel_device(data->fd) &&
 				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					igt_info("No suitable mode found to use 10 bpc.\n");
+
 					test_fini(data);
 					break;
 				}
@@ -661,6 +673,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 				/* One pipe is enough */
 				break;
 			}
+			igt_info("pipe-%s-%s: Invalid combo\n", kmstest_pipe_name(pipe), output->name);
 		}
 	}
 }
-- 
2.43.2

