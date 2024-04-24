Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27880C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 21:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF78113E1D;
	Wed, 24 Apr 2024 21:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqfGbbtj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A15113E1D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713995231; x=1745531231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8MZLbFkHNRNX6cb7HdE6mHixgY4fO7t9gYxZyEvthlA=;
 b=lqfGbbtj6EIzjAPQdJvwK9yaen6onsGgEeviMiaSF/BkkYJJ/vzjHeh5
 dL9ObpJjriucbXDIkPRE3nEqwgj8JFPK0gvSGEQKrv6ALpsqkFvm+tj5j
 GHcskhBEmO6ACo7amx+G6i3bmLgcIGICA+ZMlz/6E4phkUrg6g7fUr4MC
 otO4qQ2DLlR1EVDbDtV8a79lQuPZqthcpnn8aF4PCOJvzE8UhX3teuLes
 p/HSo93A97YWL4vOYV1JkWgIA99q2lZPIgvnxDqjeqN5zvqxy2brXzZrO
 1Lv4o0pdZKg33dcMqaYr9dbVEiT2EeLHSleWjAgpwHmgL1/SDeKry4pDc A==;
X-CSE-ConnectionGUID: R/m6u3BQTHqWyDK+sEY3hg==
X-CSE-MsgGUID: xlQmDnJ3RG6m9KOVZP/ufA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35051664"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="35051664"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 14:47:11 -0700
X-CSE-ConnectionGUID: /4N+90/cQDizNwpGb4f9Mg==
X-CSE-MsgGUID: Rg4wBEQDR4iQ8EgM4ULOGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24856821"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 14:47:10 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/intel/xe_vm: Always have at least 2 pages bound in mmap
 hammer sections
Date: Wed, 24 Apr 2024 14:47:08 -0700
Message-Id: <ddcb7264271a3aca34f3074e86ab7e04f24f851b.1713995117.git.jagmeet.randhawa@intel.com>
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

Fixes: ee0a9c8e30f6 ("tests/intel/xe_vm: Always have at
least 2 pages bound in munmap hammer sections")

This patch extends the recent improvements made
to the munmap hammer sections by applying a similar
fix to the mmap hammer sections.

If the prefetch buffer is 2k or larger the munmap hammer sections will
prefetch the next page, if the page is unbound a fault will occur.
Account for larger prefetchs by always having at least 2 pages bound for
the hammer thread.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index de2b1a813..9872df832 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1913,12 +1913,12 @@ igt_main
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
@@ -1926,7 +1926,7 @@ igt_main
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

