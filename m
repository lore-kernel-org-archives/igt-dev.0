Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB7CC71136
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 17:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C5B10E083;
	Wed, 11 Jun 2025 17:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltBw7Hq8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F1B910E083
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749664370; x=1781200370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K3n1MWhJfXpY3DZy5Aqy+wwXPETJf1hy5mOo8F+qvk4=;
 b=ltBw7Hq8tHa8OKvcIhEnlsS/JnABdU99H6SnIUeXo8pJ9p2tceKNram9
 or2R4Z0+T1aOyg6KSVdluznOvnqzgzyrGqG5myypEuqh5LVkJ4EIefwhh
 d3K/ghRzGKYbVmqhBZGXDPqImsG33oUJ2f0fXc47cC2Qeuueb/zlE2l8h
 5a9HLkxFOB0Q8QnNTzdc3+UuY/Kw+5P9dEie5yKDCCoLZNq7Magwoig8u
 qFYx0nYnPm6VngsOZsGaD9FDSQpW8XFJ1vZ7Qv/B15p9Hc3OIIdPlfT+r
 4lwpiM0XzwpNzNIIovO7cv11LQC726/5/yUaQQpgOyVW8LfFCydpxtuME g==;
X-CSE-ConnectionGUID: fmGl/AXoQf6kPwy5Q2f7jQ==
X-CSE-MsgGUID: UzXOFP4iQeOX1uVykvIzjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62470347"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="62470347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:52:19 -0700
X-CSE-ConnectionGUID: eYqTV9aLS12XUt7GuYUapQ==
X-CSE-MsgGUID: i+0lSm15T0yPdSY5d+8log==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="152040169"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.188])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:52:18 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v2] tests/amdgpu: Fix compilation warnings for USERQ
Date: Wed, 11 Jun 2025 19:52:12 +0200
Message-ID: <20250611175212.746883-1-kamil.konieczny@linux.intel.com>
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

Recent change brings compilation warnings when
AMDGPU_USERQ_ENABLED was defined, for example:

../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
  319 |         bool enable_test = false;

Fix this and also while at this move setting var into igt_fixture.

Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/amdgpu/amd_cs_nop.c   | 7 +++++--
 tests/amdgpu/amd_deadlock.c | 8 ++++++--
 tests/amdgpu/amd_security.c | 7 +++++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 644016d5d..9b6410352 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -171,10 +171,10 @@ igt_main
 	int fd = -1;
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+#ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -189,6 +189,9 @@ igt_main
 		igt_assert_eq(err, 0);
 		asic_rings_readness(device, 1, arr_cap);
 		asic_userq_readiness(device, userq_arr_cap);
+#ifdef AMDGPU_USERQ_ENABLED
+		enable_test = env && atoi(env);
+#endif
 	}
 
 	for (p = phase; p->name; p++) {
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 45a864feb..4ea2ae8dc 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -43,10 +43,10 @@ igt_main
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	struct pci_addr pci;
+#ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test = false;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -71,6 +71,10 @@ igt_main
 		igt_skip_on(get_pci_addr_from_fd(fd, &pci));
 		igt_info("PCI Address: domain %04x, bus %02x, device %02x, function %02x\n",
 				pci.domain, pci.bus, pci.device, pci.function);
+#ifdef AMDGPU_USERQ_ENABLED
+		enable_test = env && atoi(env);
+#endif
+
 	}
 	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 45bd7e771..a01e339ca 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -316,10 +316,10 @@ igt_main
 	int r, fd = -1;
 	bool is_secure = true;
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+#ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test = false;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
-
-	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -338,6 +338,9 @@ igt_main
 		igt_assert_eq(r, 0);
 		asic_userq_readiness(device, userq_arr_cap);
 		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
+#ifdef AMDGPU_USERQ_ENABLED
+		enable_test = env && atoi(env);
+#endif
 	}
 
 	igt_describe("amdgpu security alloc buf test");
-- 
2.49.0

