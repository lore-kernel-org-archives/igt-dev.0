Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF731109B46F
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7150F10EA06;
	Tue, 31 Mar 2026 14:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgRFQAkL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D3510E2B3
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774965978; x=1806501978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aW6VFbadlyZRUqi1g56n0QojQGNhB2ffyC3NlIpomyQ=;
 b=FgRFQAkLz+x2Jg8O2n6N4h20S3FGU3oX4pj5F8e1jOESCziMmmAPhLh9
 9gMbrE2sQhdXdaiMQOisk+MELDbacFHfS4HF0Db+2vKLKO1n+TwG0KNpc
 rby0/y0tNgz0cVHWPkZ8DenfB0loV0PUJudVTAnTjKTg6/+HaDaDf7wFP
 oviJ7NlF3s5HU7j94yqSXi40G6wEDBZt3beJXjpfKYMFkNUjDtHkHG2Ko
 EOUWBWsrRNqugtN+PIg30dT7wE21NsRnaSkPqktB2ku/Iz54WAVwsUAAC
 GWz3RuR97ktzuqNFU4DPLkdoHxR+QKlssYtH4mmzF8gawPu5fikvVXxYM g==;
X-CSE-ConnectionGUID: OqLVEgttTvK+ySztXwyMFw==
X-CSE-MsgGUID: msaDG2EZRByyAnqiiFcLHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76040780"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76040780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:18 -0700
X-CSE-ConnectionGUID: jEuDZrM0SlOWtq5xdc4ZsQ==
X-CSE-MsgGUID: nZXhd0fMQAmQRqPeHa3oCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230839484"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.212])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:16 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v5 4/4] tests/xe_pat: Verify PAT entries contain
 expected values
Date: Tue, 31 Mar 2026 16:05:46 +0200
Message-ID: <20260331140541.2561104-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
References: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Debugfs exposes PAT entries for different GTs so verify they
contain expected values. Verify they are correct also in reset
and suspend scenarios.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v4: Test is rewritten to support PAT + PTA + ATS entries.
---
 tests/intel/xe_pat.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2e2d7e01e7..4fbe2714ad 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -238,6 +238,76 @@ static void pat_sanity(int fd)
 	}
 }
 
+enum pat_test_opts {
+	PAT_CHECK = 1,
+	PAT_RESET_GT = 2,
+	PAT_SUSPEND = 3,
+};
+
+/**
+ * SUBTEST: pat-sw-hw-compare
+ * Description: verify debugfs 'pat' reflects 'pat_sw_config'
+ *
+ * SUBTEST: pat-sw-hw-reset-compare
+ * Description: verify debugfs 'pat' reflects 'pat_sw_config' after gt reset
+ *
+ * SUBTEST: pat-sw-hw-suspend
+ * Description: verify debugfs 'pat' reflects 'pat_sw_config' after suspend
+ */
+static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
+{
+	bool matches = true;
+	int gt;
+
+	xe_for_each_gt(fd, gt) {
+		struct intel_pat_cache pat_hw_config = {};
+		struct intel_pat_cache pat_sw_config = {};
+		int hw_entries, sw_entries;
+
+		if (opts == PAT_RESET_GT)
+			xe_force_gt_reset_sync(fd, gt);
+		else if (opts == PAT_SUSPEND)
+			igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
+
+		hw_entries = xe_get_pat_hw_config(fd, &pat_hw_config, gt);
+		sw_entries = xe_get_pat_sw_config(fd, &pat_sw_config, gt);
+		igt_assert_eq(hw_entries, sw_entries);
+
+		igt_debug("[GT%d] hw_entries: %d, sw_entries: %d\n", gt, hw_entries, sw_entries);
+
+		for (int i = 0; i < hw_entries; i++) {
+			uint32_t hw_pat, sw_pat;
+
+			hw_pat = pat_hw_config.entries[i].pat;
+			sw_pat = pat_sw_config.entries[i].pat;
+			if (hw_pat != sw_pat) {
+				igt_debug("[GT%d] Mismatch of pat register vs sw config "
+					  "- index: %i, entries: %08x <> %08x\n",
+					  gt, i, hw_pat, sw_pat);
+				matches = false;
+			}
+		}
+
+		/* Check PTA if was explicitly programmed */
+		if (pat_sw_config.pta_mode != UINT32_MAX &&
+			pat_hw_config.pta_mode != pat_sw_config.pta_mode) {
+			igt_debug("[GT%d] Mismatch of PTA_MODE - pta: %x, pta expected: %x\n",
+				  gt, pat_hw_config.pta_mode, pat_sw_config.pta_mode);
+			matches = false;
+		}
+
+		/* Check ATS if was explicitly programmed */
+		if (pat_sw_config.pat_ats != UINT32_MAX &&
+			pat_hw_config.pat_ats != pat_sw_config.pat_ats) {
+			igt_debug("[GT%d] Mismatch of PAT_ATS - ats: %x, ats expected: %x\n",
+				  gt, pat_hw_config.pat_ats, pat_sw_config.pat_ats);
+			matches = false;
+		}
+	}
+
+	igt_assert_eq(matches, true);
+}
+
 /**
  * SUBTEST: pat-index-all
  * Test category: functionality test
@@ -2152,6 +2222,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("pat-sanity")
 		pat_sanity(fd);
 
+	igt_subtest("pat-sw-hw-compare")
+		pat_sw_hw_compare(fd, 0);
+
+	igt_subtest("pat-sw-hw-reset-compare")
+		pat_sw_hw_compare(fd, PAT_RESET_GT);
+
+	igt_subtest("pat-sw-hw-suspend")
+		pat_sw_hw_compare(fd, PAT_SUSPEND);
+
 	igt_subtest("pat-index-all")
 		pat_index_all(fd);
 
-- 
2.43.0

