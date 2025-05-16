Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7A0C54755
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 10:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BAC10EA45;
	Fri, 16 May 2025 10:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akM5YsWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D423910EA45
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747391644; x=1778927644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CHCHdiiEPqG6wjyYKO/3hoGdrLl22oPdHwRYgoUXNf8=;
 b=akM5YsWLDYpeBLeNik/tRoMI/R6xuOhhj0kxdfM/57oYJmx8GngQkSrs
 x36wlEgVKONHUBa/ouM3xenVwGjjADUPUgLhKD0cftS4wBisohLRfsEgR
 t7TLIUZX9j5/OrKV5ZnevhuTlG0EdiWB4HZZIpf8Y3tY0/PGAZ9jPKobh
 PiguaFACxNJyYB+RLVHOuYOpSAXERM8yVMLyBnX0CG2vEQDqN+9HQDoBp
 tQZrMZU3CRmiEvK9p1cIUVHXu7vgdLFPcZGbc/48MAJ5w6xlJIWmruDUw
 V2s8/bksk06Si/oF+7rOXZJW1a9S7MzsylurPnXPsN3X1+VuD0UgV+K32 g==;
X-CSE-ConnectionGUID: AdnwiGXDQ3e4qu30Yi157g==
X-CSE-MsgGUID: PsYS8lXxR+SsQ4YHgp14uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60697272"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60697272"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 03:34:03 -0700
X-CSE-ConnectionGUID: i6Xg+B11RPukZUJp0lkrxw==
X-CSE-MsgGUID: 8ix18n0cSq+xInkuAp/Wrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139539087"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa008.jf.intel.com with ESMTP; 16 May 2025 03:34:02 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_mmap: Acquire rpm ref for all other
 pci-membarrier tests
Date: Fri, 16 May 2025 16:21:49 +0530
Message-Id: <20250516105149.2783072-3-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516105149.2783072-1-kolanupaka.naveena@intel.com>
References: <20250516105149.2783072-1-kolanupaka.naveena@intel.com>
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

To make sure the device is awake during the access. If not the read is
getting a special value 0xffffffff thus leading to error.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 51c27586f..061b3de0a 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -406,6 +406,7 @@ static bool is_pci_membarrier_supported(int fd)
 igt_main
 {
 	int fd;
+	int fw_handle = -1;
 
 	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
@@ -423,14 +424,16 @@ igt_main
 
 	igt_subtest("pci-membarrier") {
 		igt_require(is_pci_membarrier_supported(fd));
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
 		test_pci_membarrier(fd);
+		close(fw_handle);
 	}
 
 	igt_subtest("pci-membarrier-parallel") {
 		int xe;
 		unsigned int i;
 		uint32_t *ptr;
-		int fw_handle = -1;
 
 		igt_require(is_pci_membarrier_supported(fd));
 		xe = drm_open_driver(DRIVER_XE);
@@ -449,7 +452,10 @@ igt_main
 
 	igt_subtest("pci-membarrier-bad-pagesize") {
 		igt_require(is_pci_membarrier_supported(fd));
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
 		test_bad_pagesize_for_pcimem(fd);
+		close(fw_handle);
 	}
 
 	igt_subtest("bad-flags")
@@ -463,7 +469,10 @@ igt_main
 
 	igt_subtest("pci-membarrier-bad-object") {
 		igt_require(is_pci_membarrier_supported(fd));
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
 		test_bad_object_for_pcimem(fd);
+		close(fw_handle);
 	}
 
 	igt_subtest("small-bar") {
-- 
2.34.1

