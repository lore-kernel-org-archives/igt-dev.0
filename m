Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132E2EA7959
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 03:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68B010E790;
	Thu,  5 Feb 2026 03:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzxNgxEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22A510E790
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 03:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770262532; x=1801798532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5NTw9LWcpm1N7Kf4J7JKMSMFfYCCaVTmPlhkDqcS8co=;
 b=YzxNgxEL6UpkgT02F+L/KBPTBULK/vgA8g0ENqHyzUb/sYgG8xZywyNM
 NDdYAYEwEARQLLJTg57P2+7aHIBlJftJJ+6rxJbQELoKCJJbPpNLtEqsd
 gDhjMlFiehUUYhbXdxT4tYZx8fQsF0v9HQC6jlLWCTx9cRklvenxBJiCZ
 Jz8Pgn/kLz3TCfx+a41EoH7RdDsDXhMKi0Ba1D5cp+r8lYz/B230fImn5
 IpVnLteHZMNxm4HKZtzfKbUeEJEDBCzQnG5ROVxpQvI7sojY4PD0zqSNh
 NZoYp3dr2PEhYRqDj7W55RAWIU5w4k3l+HHYId0IYOPF9I07L3uaPpFts w==;
X-CSE-ConnectionGUID: du+oyerlSm6i27mNlbtmsg==
X-CSE-MsgGUID: pObqRU/DR3STjG7nlytNaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82827344"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="82827344"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:35:32 -0800
X-CSE-ConnectionGUID: gxdqwI2gQJ2XS02Ezm4bHA==
X-CSE-MsgGUID: qJ9eDPOaTcSsQrLuoM/ywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214884131"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 19:35:30 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, ankit.k.nautiyal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_joiner: Add joiner modeset test
 across suspend resume
Date: Thu,  5 Feb 2026 09:01:25 +0530
Message-Id: <20260205033125.1422303-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Test to validate the joiner mode is preserved after suspend and resume
cycles.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 1f8d6600b..cba25924b 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -77,6 +77,9 @@
  * SUBTEST: basic-max-non-joiner
  * Description: Validate basic max non-joiner modeset by selecting the max mode
  *		supported on single pipe.
+ *
+ * SUBTEST: joiner-suspend-resume
+ * Description: Validate joiner modeset is preserved properly after suspend and resume cycles.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -794,6 +797,40 @@ int igt_main()
 			test_basic_max_non_joiner(&data);
 	}
 
+	igt_describe("Validate joiner modeset is preserved properly after suspend and resume cycles");
+	igt_subtest_with_dynamic("joiner-suspend-resume") {
+		require_big_joiner(&data, FORCE_JOINER_DISABLE);
+
+		igt_dynamic_f("single-joiner") {
+			test_single_joiner(&data, data.big_joiner_output_count, false);
+			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+			test_single_joiner(&data, data.big_joiner_output_count, false);
+		}
+
+		if (data.big_joiner_output_count > 1) {
+			igt_dynamic_f("multi-joiner") {
+				test_multi_joiner(&data, data.big_joiner_output_count, false);
+				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+				test_multi_joiner(&data, data.big_joiner_output_count, false);
+			}
+		} else {
+			igt_debug("Skipping multi-joiner: only %d big joiner output(s) found\n",
+				  data.big_joiner_output_count);
+		}
+
+		if (data.ultra_joiner_supported && data.ultra_joiner_output_count > 0) {
+			igt_dynamic_f("ultra-joiner") {
+				require_ultra_joiner(&data, FORCE_JOINER_DISABLE);
+				test_ultra_joiner(&data, false, false, false);
+				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+				test_ultra_joiner(&data, false, false, false);
+			}
+		} else {
+			igt_debug("Skipping ultra-joiner: ultra_joiner_output_count=%d\n",
+				  data.ultra_joiner_output_count);
+		}
+	}
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.34.1

