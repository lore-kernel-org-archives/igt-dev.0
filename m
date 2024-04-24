Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DBFC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 22:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F524113E4B;
	Wed, 24 Apr 2024 22:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1maiibw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76945113E4B
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 22:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713997563; x=1745533563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v0rAXtdlGkRLJAWfEpH2ImBb4SDiLQipLwMTiv+d7JY=;
 b=c1maiibwRvCsAXHcKAVTZ9OcWTJMhkAqUe0QDwLNW+VK9H687kjKpcQ3
 CTCm1V5hkw2b6MkhXJ1P45n99MdXXe5HrwdZl38yDWD/wKEEjNq9XuJkL
 jJlahjHzHXzdecg4xBZ0YxhFptBwGSdKC85O0IB4wjbCiKtfeZMRbgj9s
 JPSZx+aNKzLn6kxsQ2v81qu0nf5E3jBrUaX61QDyrf3r4QMohVxpPh+R3
 m5+srQG7MTxUhEkjGoZd3iIDt0d45hRJz96Z8bosunFQxnbowKLDfxAx5
 5ogxBs6DVnafOC4JOZy5gCJxax/FfAbRx87JlgY3dWR+fGBOrgzZUyT4U g==;
X-CSE-ConnectionGUID: oFjI/i6fR/GJLqpoK1kobw==
X-CSE-MsgGUID: 4zPE743cQgm55wqQLykbHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20206166"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="20206166"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 15:26:02 -0700
X-CSE-ConnectionGUID: yIBmHPHLR4+UgDZXg6Rqmg==
X-CSE-MsgGUID: h57tqo2HTJ6Fdksc8Dbxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="62329401"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 15:26:01 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t,
 v3] tests/intel/xe_vm: Always have at least 2 pages bound in mmap
 hammer sections
Date: Wed, 24 Apr 2024 15:26:00 -0700
Message-Id: <975b205e7e6c88469a92afaa52817ac4475c3bcc.1713997476.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Extend ee0a9c8e30f6 ("tests/intel/xe_vm: Always have at least 2 pages
bound in munmap hammer sections") to apply a similar fix to the mmap
hammer sections.

Fixes: ee0a9c8e30f6 ("tests/intel/xe_vm: Always have at
least 2 pages bound in munmap hammer sections")
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index de2b1a813..df56c90e8 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1568,6 +1568,11 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 	int exit = 0;
 	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
 
+	/* Ensure prefetch will not fetch an unmapped page */
+	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE)
+		igt_assert(unbind_n_page_offset * 0x1000 >
+			xe_cs_prefetch_size(fd));
+
 	if (flags & MAP_FLAG_LARGE_PAGE) {
 		bo_n_pages *= n_page_per_2mb;
 		unbind_n_pages *= n_page_per_2mb;
@@ -1913,12 +1918,12 @@ igt_main
 		{ "one-partial", 4, 1, 1, 2, 0 },
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
 		{ "either-side-full", 4, 4, 1, 2, 0 },
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
@@ -1926,7 +1931,7 @@ igt_main
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
 		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
-		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
+		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
 		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
 		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
-- 
2.25.1

