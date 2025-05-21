Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610E4C54E65
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 10:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E3210E85A;
	Wed, 21 May 2025 10:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KP6zzR8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7EB10E870
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747823012; x=1779359012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9gSevIMXxKLfxJ909bzfAWuejt67l1fU/fg7SFybbYk=;
 b=KP6zzR8q6hbIt9LFLGjHnvm+xT4+zPS6naxznOjst+Ly5REgBNwg19p9
 wsJBLvbqAwN8Vkt+lSsAtBqA3C9CFr7QvmWruQ7jkUFU08ZMSQH5dupjK
 GfTDHvOajV3fqMr/VLej3nNM/dOamCvA0mgpINFjzRPWrCVzuKjDDoz3L
 jVYUFULXgvHA5pLn14mfCtOcda7XpqY1wSxeUE7OfP4pZOfljvfaUZpan
 2iFrofhy54/H0vOHXkCdh1RERvIG/izECnB7iHo6LW9lmUEcPe6L0wFFZ
 o0WVTsw0wKqBnBWaaZXMBTRHf9TF7Eq2w2FRjIJcr5GVemzrk5QoVLryn A==;
X-CSE-ConnectionGUID: d39hY3B0SiKTVU9SlYa7rw==
X-CSE-MsgGUID: /Crn1CE1Qt2CIMSVUYXayw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60837662"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="60837662"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 03:23:32 -0700
X-CSE-ConnectionGUID: ITFxb9nkT3euqxnqHQYqxg==
X-CSE-MsgGUID: 4UN4t4hiS/+esCpSYFRCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139868142"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa006.jf.intel.com with ESMTP; 21 May 2025 03:23:30 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_mmap: Fix open/close calls
Date: Wed, 21 May 2025 16:11:22 +0530
Message-Id: <20250521104122.2853986-3-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521104122.2853986-1-kolanupaka.naveena@intel.com>
References: <20250521104122.2853986-1-kolanupaka.naveena@intel.com>
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

Also drop the srand() call as this is already taken care by igt-core.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index aa76df507..117a3ab85 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -444,8 +444,7 @@ igt_main
 			unsigned int i;
 			uint32_t *ptr;
 
-			xe = drm_open_driver(DRIVER_XE);
-			srand(time(0));
+			xe = drm_reopen_driver(fd);
 			i = rand() % (PAGE_SIZE / sizeof(*ptr));
 			prepare_pci_membarrier_test(fd, &fw_handle);
 			igt_fork(child, 1)
@@ -453,7 +452,7 @@ igt_main
 			test_pci_membarrier_parallel(fd, -1, i);
 			igt_waitchildren();
 
-			close(xe);
+			drm_close_driver(xe);
 		}
 
 		igt_subtest("pci-membarrier-bad-pagesize") {
-- 
2.34.1

