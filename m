Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E729FF4947
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 05:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3200F10E1C3;
	Mon, 30 Mar 2026 05:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FB6wKn2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B544F10E1C3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 05:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774849571; x=1806385571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=21Lss01r3UaTpHf8/ee0VCcOa5kwwBFnkA4x6TqoiE4=;
 b=FB6wKn2Ufn//ER4O3ANRHyjpYBjBEGg1Sc7BKf4bxrU9RdwKaAKhk7IL
 v+qm/OQZ1f56fu9n3vfj4B144/+j+t6Zd4PhQ3YUUoiyAn5Q0Q8y50LjN
 MCbuHbdxcRFOBsxqtvWVW+3gbmQpUUjZf2G/+B9pdBwSQWxHSZLxd7hY3
 6S0kRvJmCxSdBBqTUQSfar0mNOAyWKtwqVHxb+cg9jMXvkiBGFy0TbMJY
 6jMvWWmjjtleGVxUQ9PcYdbGz8PG646PfPXnhdCt3TGR8cjQj5muqmpp3
 ZoLWSUyl4PDdWU1fTIHsX7seCFxybUHWeyqFpxBws9H+W5blRHi7z5XEA g==;
X-CSE-ConnectionGUID: gbuIEu6CTE6RSDADvCsR6A==
X-CSE-MsgGUID: cQSGL90aTYOSBGhsH2qoyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75728605"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75728605"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2026 22:46:10 -0700
X-CSE-ConnectionGUID: QNqIJn/FSnihrMZgWpuXCw==
X-CSE-MsgGUID: ZIH+DgB9SoGOXXzZLTYqJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227569643"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2026 22:46:09 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v3 4/4] tests/xe_pat: Add PAT registers contain expected
 config
Date: Mon, 30 Mar 2026 07:45:56 +0200
Message-ID: <20260330054551.1729437-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330054551.1729437-6-zbigniew.kempczynski@intel.com>
References: <20260330054551.1729437-6-zbigniew.kempczynski@intel.com>
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

Debugfs exposes file which reflects current PAT registers settings.
Verify these registers matches predefined PAT config.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_pat.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index b976d2c6a8..4f68d51ec2 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -238,6 +238,50 @@ static void pat_sanity(int fd)
 	}
 }
 
+#define GT_RESET 1
+/**
+ * SUBTEST: pat-sw-hw-compare
+ * Description: verify debugfs 'pat' reflects 'pat_sw_config'
+ *
+ * SUBTEST: pat-sw-hw-reset-compare
+ * Description: verify debugfs 'pat' reflects 'pat_sw_config' after gt reset
+ */
+static void pat_sw_hw_compare(int fd, uint32_t flags)
+{
+	bool matches = true;
+	int gt;
+
+	xe_for_each_gt(fd, gt) {
+		struct intel_pat_cache pat_hw_config = {};
+		struct intel_pat_cache pat_sw_config = {};
+		int hw_entries, sw_entries;
+
+		if (flags & GT_RESET)
+			xe_force_gt_reset_sync(fd, gt);
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
+	}
+
+	igt_assert_eq(matches, true);
+}
+
 /**
  * SUBTEST: pat-index-all
  * Test category: functionality test
@@ -2244,6 +2288,12 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("pat-sanity")
 		pat_sanity(fd);
 
+	igt_subtest("pat-sw-hw-compare")
+		pat_sw_hw_compare(fd, 0);
+
+	igt_subtest("pat-sw-hw-reset-compare")
+		pat_sw_hw_compare(fd, GT_RESET);
+
 	igt_subtest("pat-index-all")
 		pat_index_all(fd);
 
-- 
2.43.0

