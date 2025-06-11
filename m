Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DC1C677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 14:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B9610E671;
	Wed, 11 Jun 2025 14:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNPkwGTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3117B10E68A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749650666; x=1781186666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VOBf74PtvrrkEszPaYjXbYeqXxzrKFwqL5HDakhzI0E=;
 b=bNPkwGTCOgTdd71XZa5Q7pnJt0yvgdfDqcc4akZu8giGUCIplrcTT2ci
 erFVSHM7vsN7nlJnyBaXd+zjA5q+iXrYFzRVGBhzjNhC01WT9kk25jZHa
 ttL31lxjWY2zU/V52b9dIrbGyl30zDTQwR71s7GW+RUEDkyHT9UJxxpbe
 YEcl4B7ZeHx5rXn+fvAF1adtIbkxWmnb6g08bVoZjntSEx/ZA3VANtfdf
 BvXLW0x8uj0tcJbWooJp7lwODOoToUCOPkBQYUWswJLQmBgsa+TYsAI5E
 40+5Gi7SEkagUPIIy+n0rtxxKNJU8xQVDwFwe8bn6hL82f6RzNWXfd4dE w==;
X-CSE-ConnectionGUID: DqaNa2jkRueUvg5kjUBzKA==
X-CSE-MsgGUID: O4rtvdQERAyIEzVLop7YcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="50902786"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="50902786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 07:04:25 -0700
X-CSE-ConnectionGUID: N1F5PXQ2R962XZQDZNYFxg==
X-CSE-MsgGUID: TMJf8CevRcKUYtI0CO0Mkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="148117836"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.188])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 07:04:24 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: Fix compilation warnings for USERQ
Date: Wed, 11 Jun 2025 16:04:15 +0200
Message-ID: <20250611140415.158461-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Recent change bringed compilation warnings, for example:

../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
  319 |         bool enable_test = false;

Fix this and move setting var into igt_fixture.
Also while at this, print if AMDGPU_USERQ_ENABLED was defined.

Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/amdgpu/amd_cs_nop.c   | 10 ++++++++--
 tests/amdgpu/amd_deadlock.c | 11 +++++++++--
 tests/amdgpu/amd_security.c | 10 ++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 644016d5d..24fae3635 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -173,8 +173,11 @@ igt_main
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *enable_str = "USERQTEST enabled";
+#else
+	const char *enable_str = "USERQTEST not enabled";
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -189,6 +192,9 @@ igt_main
 		igt_assert_eq(err, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+		enable_test = env && atoi(env);
+		if (enable_test)
+			igt_info("%s\n", enable_str);
 	}
 
 	for (p = phase; p->name; p++) {
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 45a864feb..d416b4909 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -45,8 +45,11 @@ igt_main
 	struct pci_addr pci;
 	bool enable_test = false;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *enable_str = "USERQTEST enabled";
+#else
+	const char *enable_str = "USERQTEST not enabled";
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -71,6 +74,10 @@ igt_main
 		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
 		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
 				pci.domain, pci.bus, pci.device, pci.function);
+		enable_test = env && atoi(env);
+		if (enable_test)
+			igt_info("%s\n", enable_str);
+
 	}
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 45bd7e771..891d8f577 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -318,8 +318,11 @@ igt_main
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	bool enable_test = false;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+#ifdef AMDGPU_USERQ_ENABLED
+	const char *enable_str = "USERQTEST enabled";
+#else
+	const char *enable_str = "USERQTEST not enabled";
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -338,6 +341,9 @@ igt_main
 		igt_assert_eq(r, 0);
 		asic_userq_readiness(device, userq_arr_cap);
 		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
+		enable_test = env && atoi(env);
+		if (enable_test)
+			igt_info("%s\n", enable_str);
 	}
 
 	igt_describe("amdgpu security alloc buf test");
-- 
2.49.0

