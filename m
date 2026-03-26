Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E23A10A1E7E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED5A10E96B;
	Thu, 26 Mar 2026 11:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itK2hRJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDD410E969
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774524879; x=1806060879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQH1F4Y4xAA9dPh5vSHNPAonG+radHRD3N80qriamEE=;
 b=itK2hRJMsQKDek1gxOPc4FvGba/kNJuHogUDXeU57lGZX/LcnCMLHD41
 OUJXOPkwOSO6LrYW/ZqR63o8Ftwo1Ddrmr3pjNyBtZwtUMdZROj2ojYRb
 PmlA0xpp8VmAcBTvrZeGGZ5igkXlhC7SDMXE9JaJiSz/TXbLlujokbhxg
 Z0NvAnZbpKFN8zVX/ONtcnXgI5xZ7lLiwFptthTa7osrdynujoaRi0jGO
 kNvYpJwKcOYB5w4W50nYb5iKBIDDBPI1Z741DkKcWIufoJyqhcYHScTRp
 7FoKnZxL0uuIF14a1viEzoI4k6hm5QYGrti7wb8T/Yaj2nieNn2/qFVjI w==;
X-CSE-ConnectionGUID: 1qs6FVZPTo2hmoJo8AvzTg==
X-CSE-MsgGUID: 37YMbkosQI2U4VUG7fvMsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75647920"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75647920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:34:39 -0700
X-CSE-ConnectionGUID: S0Akr1PySiiVISfKwyhMNg==
X-CSE-MsgGUID: CgxpPBVMRZaeUvgvfzDDOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="221675635"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.222])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 04:34:38 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_pat: Verify PTA PAT entries contain
 expected values
Date: Thu, 26 Mar 2026 12:34:28 +0100
Message-ID: <20260326113425.520545-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326113425.520545-4-zbigniew.kempczynski@intel.com>
References: <20260326113425.520545-4-zbigniew.kempczynski@intel.com>
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
 tests/intel/xe_pat.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2e2d7e01e7..7e5dc9f44f 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -2115,6 +2115,93 @@ static void pt_caching_test(int xe, enum pt_test_opts opts)
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
+	uint32_t pta = 0;
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
+	struct intel_pat_cache pat_sw_config = {};
+	int gt;
+
+	xe_for_each_gt(fd, gt) {
+		xe_get_pat_sw_config(fd, &pat_sw_config, gt);
+		igt_debug("gt: %d, pta: %x, pta expected: %x\n",
+			  gt, pat_sw_config.pta_mode, get_expected_pta(fd, gt));
+		igt_assert_eq(pat_sw_config.pta_mode, get_expected_pta(fd, gt));
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
@@ -2253,6 +2340,16 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
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

