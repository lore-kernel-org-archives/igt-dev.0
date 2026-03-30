Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501CE1061B06
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85ED10E21B;
	Mon, 30 Mar 2026 14:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3agE0bh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E3510E475
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774881655; x=1806417655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFjjzQ0Tg9ylqVWVehEKmVCZpuOder0DEWsmTVZ5fE0=;
 b=D3agE0bhWTTszCkimB9dx/2iNuNO+WYJmeXt1kL1SmLAgvrApBw+CQZE
 BiJRkeEpR3y3DGnIQzQ6lTxhY03MOlqdHhRBnLjW9A2J9TBT2QWhJlRlL
 pRkUg1xoNdCooEsEElgxKKf8HTYMNDdrhByHAZb/BRwgBxigmlIikfiXy
 YeccdV77LWeOtbRJ4H7sc2oM6YJZwEV67SnDttHmuuaaBFwlzxK2O6WMd
 BansPAzxSNBWyUJ0vGvMudIlZG4gTMEw8TbYHdycIQRBKJUWSog8d/UWe
 p1tBolv83d3wybPmRqw9FtCIHtmksq8GKrzlTu6wnRKiufB862pbzQ/aq w==;
X-CSE-ConnectionGUID: kG+KOg/zS2KszMmJkjte7w==
X-CSE-MsgGUID: LmVp1EocRzenfDnDzMzSfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75771107"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75771107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:54 -0700
X-CSE-ConnectionGUID: olkinco+Q0Ch4qsEdeiJvw==
X-CSE-MsgGUID: uncyCZ88RweCudoGKKUwDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="264013389"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:53 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v4 4/5] tests/xe_pat: Verify PTA PAT entries contain
 expected values
Date: Mon, 30 Mar 2026 16:40:37 +0200
Message-ID: <20260330144032.1954771-11-zbigniew.kempczynski@intel.com>
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

Debugfs exposes PTA PAT entries for different GTs so verify they
contain expected values. Verify they are correct also in reset
and suspend scenarios.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
v2: - use pat file instead pat_sw_config as it accesses pat regs (Matt)
    - ignore PTAs which were not explicitely configured during PAT
      initialization (ZK)
v4: - simplify code by comparing sw/hw pta if defined (Matt)
---
 tests/intel/xe_pat.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2e2d7e01e7..a845541e6f 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -2115,6 +2115,58 @@ static void pt_caching_test(int xe, enum pt_test_opts opts)
 	pt_destroy_objects(xe, objs2, num_objs);
 }
 
+enum pt_pta_test_opts {
+	PT_PTA_CHECK = 1,
+	PT_PTA_RESET_GT = 2,
+	PT_PTA_SUSPEND = 3,
+};
+
+static void pt_check_pta_for_gts(int fd)
+{
+	int gt;
+
+	xe_for_each_gt(fd, gt) {
+		struct intel_pat_cache pat_sw_config = {};
+		struct intel_pat_cache pat_hw_config = {};
+
+		xe_get_pat_sw_config(fd, &pat_sw_config, gt);
+
+		 /* Ignore if PTA is not explicitly programmed */
+		if (pat_sw_config.pta_mode == UINT32_MAX)
+			continue;
+
+		xe_get_pat_hw_config(fd, &pat_hw_config, gt);
+
+		igt_debug("gt: %d, pta: %x, pta expected: %x\n",
+			  gt, pat_hw_config.pta_mode, pat_sw_config.pta_mode);
+		igt_assert_eq(pat_hw_config.pta_mode, pat_sw_config.pta_mode);
+	}
+}
+
+/**
+ * SUBTEST: pt-pta-check
+ * Description: verify pta value is expected
+ *
+ * SUBTEST: pt-pta-reset-gt
+ * Description: verify pta value is expected before and after gt reset
+ *
+ * SUBTEST: pt-pta-suspend
+ * Description: verify pta value is expected before and after suspend/resume
+ */
+static void pt_pta_check(int fd, enum pt_pta_test_opts opts)
+{
+	pt_check_pta_for_gts(fd);
+
+	if (opts == PT_PTA_RESET_GT) {
+		xe_force_gt_reset_all(fd);
+		sleep(1);
+		pt_check_pta_for_gts(fd);
+	} else if (opts == PT_PTA_SUSPEND) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
+		pt_check_pta_for_gts(fd);
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -2253,6 +2305,16 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("pt-caching-update-pat-and-pte")
 		pt_caching_test(fd, PT_UPDATE_PAT_AND_PTE);
 
+	igt_subtest("pt-pta-check")
+		pt_pta_check(fd, PT_PTA_CHECK);
+
+	igt_subtest("pt-pta-reset-gt")
+		pt_pta_check(fd, PT_PTA_RESET_GT);
+
+	igt_subtest("pt-pta-suspend")
+		pt_pta_check(fd, PT_PTA_SUSPEND);
+
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

