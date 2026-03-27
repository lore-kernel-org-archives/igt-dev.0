Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3743810ED679
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 13:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D531810EE7D;
	Fri, 27 Mar 2026 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK7jo9eN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02F10EE79
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774617996; x=1806153996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4WADdC0CgpxDTAn4mR5t4m3sAJvXx6mmdnqVzUncrC4=;
 b=cK7jo9eNIWqovBWbs9jTxlARKYSHkRO0n9z+r1lflcqESeD6aAJvg1/v
 9g1/3Jyht2ng93yuFKZ6yJnIYy0O1/6zIimUTkFVHAcI4prtx0pTR612P
 wqy8Abe0AuHVB2S+y02+11PTrrxHBKnH2bj/1645Tc+WXe2/Fz/DhmDW6
 H8Q7LvUmH4inOYHXa31Jy7VCwvdLDURnc7LDv1THTKKkD5ypxsJThs86g
 4hv+eNEfq8LozEpuFwBTfyVbqKui+PdDwo9Y0VOihuf68+IOxTujylfGg
 pvvKd3Jmx4BciQGO2FIFeu0vugdx87RfNfuUpdXo7ROGmzV/QfZVSC43F w==;
X-CSE-ConnectionGUID: H6fOPDVqRAuzBiHoPLcL+w==
X-CSE-MsgGUID: oPiO1TdgSsy88d2cFu69ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75582211"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75582211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:26:36 -0700
X-CSE-ConnectionGUID: SyAEtFLOSrCpjeOWplgcQw==
X-CSE-MsgGUID: fnNFNE3qSHqLOMwSfTlfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="225567589"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:26:34 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/xe_pat: Verify PTA PAT entries contain
 expected values
Date: Fri, 27 Mar 2026 14:26:21 +0100
Message-ID: <20260327132617.974862-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327132617.974862-5-zbigniew.kempczynski@intel.com>
References: <20260327132617.974862-5-zbigniew.kempczynski@intel.com>
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
---
 tests/intel/xe_pat.c | 102 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2e2d7e01e7..b976d2c6a8 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -2115,6 +2115,98 @@ static void pt_caching_test(int xe, enum pt_test_opts opts)
 	pt_destroy_objects(xe, objs2, num_objs);
 }
 
+enum pt_pta_test_opts {
+	PT_PTA_CHECK = 1,
+	PT_PTA_RESET_GT = 2,
+	PT_PTA_SUSPEND = 3,
+};
+
+#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
+		((no_promote << 10) | \
+		(comp_en << 9) | \
+		(l3clos << 6) | \
+		(l3_policy << 4) | \
+		(l4_policy << 2) | \
+		(__coh_mode))
+
+
+#define NUMGT 2
+static uint32_t xe2_pta[NUMGT] = {
+	XE2_PAT( 0, 0, 0, 0, 3, 0 ),
+	XE2_PAT( 0, 0, 0, 0, 3, 0 )
+};
+
+static uint32_t xe3p_pta[NUMGT] = {
+	XE2_PAT( 0, 0, 0, 0, 0, 3 ),
+	XE2_PAT( 0, 0, 0, 0, 0, 2 )
+};
+
+static uint32_t xe3p_xpc_pta[NUMGT] = {
+	XE2_PAT( 0, 0, 0, 0, 0, 0 ),
+	XE2_PAT( 0, 0, 0, 0, 0, 0 )
+};
+
+static uint32_t get_expected_pta(int fd, int gt)
+{
+	uint32_t devid = intel_get_drm_devid(fd);
+	uint32_t ip_ver = intel_graphics_ver(devid);
+	int ver = intel_gen(devid);
+	uint32_t pta = UINT32_MAX;
+
+	igt_assert_lt(gt, NUMGT);
+
+	if (ip_ver == IP_VER(35, 11))
+		pta = xe3p_xpc_pta[gt];
+	else if (ver == 35 && !xe_has_vram(fd))
+		pta = xe3p_pta[gt];
+	else if ((ver == 30 || ver == 20) && xe_has_vram(fd))
+		pta = xe2_pta[gt];
+
+	return pta;
+}
+
+static void pt_check_pta_for_gts(int fd)
+{
+	struct intel_pat_cache pat_hw_config = {};
+	int gt;
+
+	xe_for_each_gt(fd, gt) {
+		xe_get_pat_hw_config(fd, &pat_hw_config, gt);
+
+		 /* Ignore if PTA is not explicitly programmed */
+		if (get_expected_pta(fd, gt) == UINT32_MAX)
+			continue;
+
+		igt_debug("gt: %d, pta: %x, pta expected: %x\n",
+			  gt, pat_hw_config.pta_mode, get_expected_pta(fd, gt));
+		igt_assert_eq(pat_hw_config.pta_mode, get_expected_pta(fd, gt));
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
@@ -2253,6 +2345,16 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
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

