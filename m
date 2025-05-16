Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924F3C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 13:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4464910EAC0;
	Fri, 16 May 2025 13:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZeTJQYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C15F10EAC0
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747402832; x=1778938832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=za0U9oCIyv2aJYnHGT7JFWCNt87iE13sc75QWrI3Qsc=;
 b=UZeTJQYJz2jzQVXvDylOoXR+Cq2sT1yjoCZHWHKmsuNVI9hOvqayuPwI
 6zj+Qqh+Md1Qy3kJtvP353MJnBXrwDh7xakiV1WfbZPfcoKajUmHSpw1T
 TM+OZXEFvVetVJZSNRAb02bNjPisrlUkUpnDAYg0Dq7q7Aw5mfeztut8g
 UgdLfNFXMChZPzLylF3siQ2NfDf4FFMOHyqxnXf+BJALtG654Alwlvh0U
 sDE4hxCCPjpQTpj/Vn1X5BWjHcldZEDiRRBwg3SRldD0Jv6trK/yqJzOB
 6hbmTMFGKf3srZL76PDjBfWZoEfKbiRF/cF1eLpsqb6qh7hQUaQQvC3aJ g==;
X-CSE-ConnectionGUID: vCWS+aM8Shqm5BXEOAncGA==
X-CSE-MsgGUID: niOTTBG9Qjaz3DREmZP2RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53190695"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="53190695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 06:40:32 -0700
X-CSE-ConnectionGUID: e0xHmoUSStWbWQWDW9Al8g==
X-CSE-MsgGUID: +BEgx04ZT5+tKnVHEsxHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="175825577"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa001.jf.intel.com with ESMTP; 16 May 2025 06:40:31 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_mmap: Use appropriate drm APIs
Date: Fri, 16 May 2025 19:28:19 +0530
Message-Id: <20250516135819.2784676-3-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516135819.2784676-1-kolanupaka.naveena@intel.com>
References: <20250516135819.2784676-1-kolanupaka.naveena@intel.com>
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

Instead of using the standard drm_open and close APIs for driver
open and close operations, use the appropriate drm_reopen and
drm_close APIs to ensure the driver is opened and closed correctly.

Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 061b3de0a..abd144ac0 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -436,8 +436,7 @@ igt_main
 		uint32_t *ptr;
 
 		igt_require(is_pci_membarrier_supported(fd));
-		xe = drm_open_driver(DRIVER_XE);
-		srand(time(0));
+		xe = drm_reopen_driver(fd);
 		i = rand() % (PAGE_SIZE / sizeof(*ptr));
 		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
 		igt_assert_lte(0, fw_handle);
@@ -447,7 +446,7 @@ igt_main
 		igt_waitchildren();
 
 		close(fw_handle);
-		close(xe);
+		drm_close_driver(xe);
 	}
 
 	igt_subtest("pci-membarrier-bad-pagesize") {
-- 
2.34.1

