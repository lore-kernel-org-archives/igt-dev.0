Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527C3C71136
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 21:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912510E73A;
	Wed, 11 Jun 2025 21:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYSvSbUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32F210E73A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 21:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749677109; x=1781213109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k7yVSAaSYtbLvOgjlUo/Ua5StK63yajatRb7DdAAWBQ=;
 b=EYSvSbUKtDYMNyjzKzamyYp+7IenMJeG181buABiFzADVMd/DlfcgNgh
 APPXH5aoA8o7wGorA3Gwkn6HbCBqcmQh5EF4j8s88PRL8do1nHE61NY7z
 +aBulkwXz9WzpSlwr5dxiSHDowN3M/Egepre9K3Z/WMg28B+mfObcQA1H
 HTV0WN9nRe8UgtOP8KL0yIB11Dr56jvtTtfGi7S/O6i8Dkf2iXh8KPu3e
 1lpPyMZ8lWVCe1GofSgukacHm0QwVQYaQftxlaJS/HPVPYV1j3KfekwIP
 hdwNehDvPMEm8OGICE7Ed/thJh2/ZdCXHHAnygmPJnuEbLp9gMyVZRjKy Q==;
X-CSE-ConnectionGUID: GLLLb59jS/2gfiNM5opodg==
X-CSE-MsgGUID: uyVeSy8OQSieHO7k5jpGOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51753697"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51753697"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:25:08 -0700
X-CSE-ConnectionGUID: 4jEt5aBGTku7FI/B+MOrHA==
X-CSE-MsgGUID: sCFM5RaBToKxaUTTGz5Zkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147303298"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.245.188])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:25:05 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v3] tests/amdgpu: Fix compilation warnings for USERQ
Date: Wed, 11 Jun 2025 23:25:00 +0200
Message-ID: <20250611212500.1940399-1-kamil.konieczny@linux.intel.com>
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
AMDGPU_USERQ_ENABLED was not defined, for example:

../tests/amdgpu/amd_security.c: In function '__igt_unique____real_main311':
../tests/amdgpu/amd_security.c:319:14: warning: variable 'enable_test' set but not used [-Wunused-but-set-variable]
  319 |         bool enable_test = false;

Fix this.

v2: removed additional vars and prints (Sunil)
v3: correcting description, moved var setting back (Kamil)

Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Fixes: dad4b2bb9e5a ("tests/amdgpu: add environment variable to enable tests")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/amdgpu/amd_cs_nop.c   | 2 ++
 tests/amdgpu/amd_deadlock.c | 2 ++
 tests/amdgpu/amd_security.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 644016d5d..c406f2fc5 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -171,10 +171,12 @@ igt_main
 	int fd = -1;
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+#ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 45a864feb..2330b2955 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -43,10 +43,12 @@ igt_main
 	bool arr_cap[AMD_IP_MAX] = {0};
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
 	struct pci_addr pci;
+#ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test = false;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 45bd7e771..4f38ee04e 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -316,10 +316,12 @@ igt_main
 	int r, fd = -1;
 	bool is_secure = true;
 	bool userq_arr_cap[AMD_IP_MAX] = {0};
+#ifdef AMDGPU_USERQ_ENABLED
 	bool enable_test = false;
 	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
 
 	enable_test = env && atoi(env);
+#endif
 
 	igt_fixture {
 		uint32_t major, minor;
-- 
2.49.0

