Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010BFD35171
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C7410EA53;
	Wed,  1 Apr 2026 11:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Az/gPVe8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71F110ECC8
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043257; x=1806579257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JqemlXO6bcjVWLTENsxoNAQqHoJl5SV3KEekGJ8Bct0=;
 b=Az/gPVe8W1UDKTBT/9PaDWKP7+cc70OaInhNmLPgH031YDE86AG2jASW
 QURo0QxtwSFgq4iVZqLPBNDnAM5UjIEd5p6mRTwO4WjyiiyoGUnzhTgLw
 7syFL/Vuysnrw65zzmapyrkWQMfzBn9wROQf5BA8toaqRA2iQiV76ja4y
 rBJoAFQs+xwJJekwM8S+CXiUmw1BYoGI14Z/opURtn8/0biCIxuxqgrx3
 Z/ouZ2H3VFo72/i8MXWS6CiAKNWmNtF8abUiqHMmXTJVpVAylpn5Ynh2A
 9KNmFRx6h6e4h4O7xJO6KILvlGX8uVeTX7IxOiwNfR+9lha02enIvxA2S A==;
X-CSE-ConnectionGUID: 6EnbndWdQLqCsj9nGczsOQ==
X-CSE-MsgGUID: 72TQ3McpTW2HSjeN9i5XCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76092223"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76092223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:34:16 -0700
X-CSE-ConnectionGUID: P7PsUSqCRN2uvJeY1bePxw==
X-CSE-MsgGUID: szSfquQnTweKUKPVhDSkfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231450380"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:34:15 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, X Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v6 4/4] tests/xe_pat: Verify PAT entries contain
 expected values
Date: Wed,  1 Apr 2026 13:33:58 +0200
Message-ID: <20260401113353.2825367-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401113353.2825367-6-zbigniew.kempczynski@intel.com>
References: <20260401113353.2825367-6-zbigniew.kempczynski@intel.com>
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
Cc: X Wang <x.wang@intel.com>
---
v4: Test is rewritten to support PAT + PTA + ATS entries.
v6: Skip on !pf and assert in case of problem with access PAT (Wang)
---
 tests/intel/xe_pat.c | 82 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2e2d7e01e7..9fe80ac373 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -19,6 +19,7 @@
 #include "igt_fs.h"
 #include "igt_kmod.h"
 #include "igt_map.h"
+#include "igt_sriov_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
@@ -238,6 +239,78 @@ static void pat_sanity(int fd)
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
+	igt_require(igt_sriov_is_pf(fd));
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
@@ -2152,6 +2225,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
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

