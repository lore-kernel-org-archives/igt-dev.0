Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E62E1061B06
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B2410E237;
	Mon, 30 Mar 2026 14:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNJaI7Hp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6757B10E61B
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774881658; x=1806417658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wdYW8MdPOUWiSBMaTmVYRkZXASVvnjITuaUZmN5u6p0=;
 b=jNJaI7HpXzbX3h/9bk/5eY87yiXV2eiAVL0C+hDsdpCPkxGpaosOAu9E
 NyaopJzvJl6pM32vSVnXcPXBNvDamqvIDi4nAQv4RkbFTy4nc5sWgPycn
 feMDUP6ZOmFMtjDDCzBKtRB2QaULIUGD3gJ1YaMQVgPG9Uf6xjtBRQdKz
 7ZlJgnDIS+nuJioJp8++bHwBdFmSQt9LqhJ2Vjvc0vzdrn+9C99LFmfyd
 JThqJoInluj9iuzG1pNio9wE1ZDjVEqY4zA2l6ocUiOgm7Rk1pk5L7Uti
 dggr5Y9/Wm+rTDfFtTmi1v++v3iagAjbB3tq/jDbls1+a+1/8jhWtOv78 w==;
X-CSE-ConnectionGUID: sSv7kfnrRSamfE23U7LjWQ==
X-CSE-MsgGUID: x+s7oJcYQAW1YCCMTvCIhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75771113"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75771113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:58 -0700
X-CSE-ConnectionGUID: u8fV8ExwTAWRlyCNwKagFQ==
X-CSE-MsgGUID: CYUX7eODRMOtdVWmkIUb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="264013406"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:56 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v4 5/5] tests/xe_pat: Verify PAT registers are properly
 programmed
Date: Mon, 30 Mar 2026 16:40:38 +0200
Message-ID: <20260330144032.1954771-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
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
index a845541e6f..e2b6682449 100644
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
@@ -2204,6 +2248,12 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
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

