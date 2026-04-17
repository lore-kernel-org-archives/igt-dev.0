Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BFEF8DFF9
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 18:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E1210EA48;
	Fri, 17 Apr 2026 18:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6E66ixR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E3010EA48
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 18:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776449530; x=1807985530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bbhcUXS99oRebegWIwoGiPdzQo1mKpJvbnjrUih5SdU=;
 b=T6E66ixROcwyEkq4XI3q8wS+HuDcdfs4xrtAWnxuEMhVC3DcOGwO+03s
 yDo5KAjdU4h+CS+nt/3aF9GRxa23ec0nVxmLeDdPEqvIEUJsn9lVwGwpQ
 I+tcBivmxNX3cU60Tb0Qh2gZvOM3pg/BTQMjwLzEpMwU5I2nwCHRivFR/
 bx9wmA+zGQKc2/JVbLE/oxHyFVelyhA5FGuK1y1vE0B1WZRDs+WL64fVR
 O1uaCYtwr2OYDqvK5Fn1GGVk6TJMFAZhu42CaS/D8UBBvJXPP7CxkiMur
 I7pcdQ8IDAkEh1of/JI7l1DlSrzPMndRZwEanbBIc4iiw6ypZk2J+Rcyt Q==;
X-CSE-ConnectionGUID: bXHAvzTrRKSaiDSD0CLeTQ==
X-CSE-MsgGUID: cgLUwnlORmm7lrNj0Qx8nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77480846"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77480846"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:12:10 -0700
X-CSE-ConnectionGUID: xIKwuWGdSomAfS/aVlQ4oQ==
X-CSE-MsgGUID: XwB9wBAXTo6vAzots/Nlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="236070130"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:12:08 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_madvise: Fix armhf compilation
Date: Fri, 17 Apr 2026 20:11:57 +0200
Message-ID: <20260417181157.177299-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417181157.177299-1-kamil.konieczny@linux.intel.com>
References: <20260417181157.177299-1-kamil.konieczny@linux.intel.com>
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

There are a compiler errors on armhf, related to a cast from pointer
to uint64_t:

../tests/intel/xe_madvise.c:201:20: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
      |                    ^

Fix it by using igt_assert_eq_ptr() macro.

Cc: Arvind Yadav <arvind.yadav@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Fixes: 42d669fde782 ("tests/intel/xe_madvise: Add purged-mmap-blocked subtest")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_madvise.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 805de793a..e9bf55ff5 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -198,7 +198,7 @@ static void test_purged_mmap_blocked(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
 
 	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
-	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
+	igt_assert_eq_ptr(ptr, MAP_FAILED);
 	igt_assert_eq(errno, EINVAL);
 
 	gem_close(fd, bo);
@@ -340,7 +340,7 @@ static void test_dontneed_before_mmap(int fd)
 
 	/* mmap() on a DONTNEED BO must fail with EBUSY. */
 	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
-	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
+	igt_assert_eq_ptr(ptr, MAP_FAILED);
 	igt_assert_eq(errno, EBUSY);
 
 	/* Restore to WILLNEED before cleanup */
-- 
2.53.0

