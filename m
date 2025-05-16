Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0768C54756
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 15:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897FC10EAFE;
	Fri, 16 May 2025 15:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uv3SxNs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360F210EB00
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747409865; x=1778945865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=59UR5/kCoiGF+38dGsTHZUnDLHQpt3FxB2cFAlINN6E=;
 b=Uv3SxNs88FqF6wDJco/HVRqihtOJZzRyJXjh54DyE/I3HZFyiypOOW0D
 imfir29zoeNp5GovBHbUjYYsS/0y4QJciCLN+hbVl64jXIkfO9BLTKxwc
 xSskNbpvcSQDZe6LaL7IJ5dHMNKN/L/TNxPNpqx+2095ABnJDE4GH4plY
 8vKULrh2xdDdDwABIoj6we1BwCyRaCbrPwv29SUSCxRsFkECgENIU6D/H
 yfOGMC7ANSL9S9DfRZXQrO+Q5ZuwHYMVv4rGfRXJX78NEgHcp64zkOVLj
 YTKjcJCDPfOiHZxybTeYLWWoikwGNBJ5mHrLfe7m3h7vGCAkV1kxwjI7m g==;
X-CSE-ConnectionGUID: DztyDAsqS0q3fgOwcMq4qw==
X-CSE-MsgGUID: 2jHQCOK7TgyUm2ROyCJu8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49542230"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49542230"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:37:45 -0700
X-CSE-ConnectionGUID: uCBmDcQFRayCSX+s3UU0hQ==
X-CSE-MsgGUID: FFLjEe5uQAue8ZO2S29nEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="142726602"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by fmviesa003.fm.intel.com with ESMTP; 16 May 2025 08:37:44 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_mmap: Fix open/close calls
Date: Fri, 16 May 2025 21:25:33 +0530
Message-Id: <20250516155533.2786246-3-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516155533.2786246-1-kolanupaka.naveena@intel.com>
References: <20250516155533.2786246-1-kolanupaka.naveena@intel.com>
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
index 9421b8503..92225300c 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -438,15 +438,14 @@ igt_main
 			unsigned int i;
 			uint32_t *ptr;
 
-			xe = drm_open_driver(DRIVER_XE);
-			srand(time(0));
+			xe = drm_reopen_driver(fd);
 			i = rand() % (PAGE_SIZE / sizeof(*ptr));
 			igt_fork(child, 1)
 				test_pci_membarrier_parallel(xe, child, i);
 			test_pci_membarrier_parallel(fd, -1, i);
 			igt_waitchildren();
 
-			close(xe);
+			drm_close_driver(xe);
 		}
 
 		igt_subtest("pci-membarrier-bad-pagesize")
-- 
2.34.1

