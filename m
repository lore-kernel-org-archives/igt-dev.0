Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51165C04FF9
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 04:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B2610EA5D;
	Fri, 12 Apr 2024 04:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjbIbN1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F37410EA5D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 04:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712895500; x=1744431500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fAj/9st44YLmf5Ev1vOUAzBWM9RbEJOkzSTezqUo+eU=;
 b=LjbIbN1F22PKXwmxXuQJKXROt7+7z3z0vQ6dcHuIoZqsfscQXRdMxkRi
 6aS90LA9AQhy7iFLmVJf02zEl9PFWcgFg5MxywwGt1QDWYSPopaV8MJlK
 wHBpjDge8B7m9jaWCURy1vDe2k8tdrRA0qEQFrnzW3oIyIww+ct7GnUnF
 tSaRmSr5gy2fXtnTNIiAlahqpcvRXIPYNZfqnqC67Y49fAsF2z7LGiR4o
 Cqf6ffIrwsad6wvREYD/6KjVcQZeXpNkd4p8Lx5FdtSC/ie/HuEuPo86r
 n9AzYjVt7fbhoff34ff31FEAELFvtR3RjEQrm/axArOkN5HNyLsqVeUz+ A==;
X-CSE-ConnectionGUID: fm9VtpR7RNOp7IKXx56VcA==
X-CSE-MsgGUID: w8jUcsmIQU+8KF0em0GZ5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19490165"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19490165"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 21:18:19 -0700
X-CSE-ConnectionGUID: cnX8PRZ3RpC3mn5StoaVEg==
X-CSE-MsgGUID: AJq37/VlTse4u8JAybVjFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="44396292"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 21:18:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_vm: Always have at least 2 pages bound in
 munmap hammer sections
Date: Thu, 11 Apr 2024 21:18:41 -0700
Message-Id: <20240412041841.491326-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412041841.491326-1-matthew.brost@intel.com>
References: <20240412041841.491326-1-matthew.brost@intel.com>
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

If the prefetch buffer is 2k or larger the munmap hammer sections will
prefetch the next page, if the page is unbound a fault will occur.
Account for larger prefetchs by always having at least 2 pages bound for
the hammer thread.

v2:
 - Missed table entry
v3:
 - Don't modify mmap section (Jonathan)
 - Add assert to ensure no prefetch overrun (Matt Auld)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index bd4973cc38..13cca27520 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1263,6 +1263,11 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	int exit = 0;
 	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
 
+	/* Ensure prefetch will not fetch an unmapped page */
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE)
+		igt_assert(unbind_n_page_offset * 0x1000 >
+			   xe_cs_prefetch_size(fd));
+
 	if (flags & MAP_FLAG_LARGE_PAGE) {
 		bo_n_pages *= n_page_per_2mb;
 		unbind_n_pages *= n_page_per_2mb;
@@ -1843,12 +1848,12 @@ igt_main
 		{ "all", 4, 2, 0, 4, 0 },
 		{ "one-partial", 4, 1, 1, 2, 0 },
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
-		{ "either-side-partial-hammer", 4, 2, 1, 2,
+		{ "either-side-partial-hammer", 6, 2, 2, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
-		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
+		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE |
 			MAP_FLAG_LARGE_PAGE },
-		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
+		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE |
 			MAP_FLAG_LARGE_PAGE |
 			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
@@ -1857,7 +1862,7 @@ igt_main
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
 		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
-		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
+		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
 		{ "many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8, 0 },
 		{ "many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2, 0 },
-- 
2.34.1

