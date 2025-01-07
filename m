Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B73E77198
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB0110E793;
	Tue,  7 Jan 2025 20:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J26rMx2H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866610E31D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736281685; x=1767817685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jQ9IqVxHzh46wi+sTRzykFaQK8o0J52yAWArv70KvTs=;
 b=J26rMx2HyIQ10yC6edGvjT+0M2/v2kYJticynwneL/HB1rqnaWYMIFlE
 uCXzDLa+2b0mW473wIc20Ib18pFhDn8LTG6+qC1T++S2hhjLcJWiQU0nE
 M11+NFsXTWKR6mRrbl6BpOHLgMhrhUsZ0xcuJ3yTYvuyd8eR8bWKMEDHK
 2rx/0W6xYAyi39f8HLISmEojSK2xK+/it+4/9k39f9fLxvO3T0atNtzNV
 sbcihR9Bbi9fAc5t/0vh3c1PUX0WMfrLI3PJlZZMIyrTIPYLSwgciBgB/
 TF8aGdQ5ZQLt4/5EAVn7harPqhj3Zpsci5QVcY96fLJx1RjNwRjSzo+8B Q==;
X-CSE-ConnectionGUID: IVm3jk/3QfG0IOBVyYk5+Q==
X-CSE-MsgGUID: 9IIhSoaKQ5WKhDS5WF4F5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39309007"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="39309007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:04 -0800
X-CSE-ConnectionGUID: YYM7ab/JSD6p5xm7fAfdvg==
X-CSE-MsgGUID: Ia33D3LhRxKG5mWimz9MKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133725672"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 1/8] lib/xe/xe_gt: Fix header guards and boilerplate
Date: Tue,  7 Jan 2025 12:26:08 -0800
Message-ID: <20250107202615.1306306-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Add proper header guard and remove author from comment: authorship is
maintained in git, not as comment.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_gt.c | 3 ---
 lib/xe/xe_gt.h | 8 +++++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 1f4b42ed9..53554beb0 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -1,9 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2023 Intel Corporation
- *
- * Authors:
- *    Janga Rahul Kumar <janga.rahul.kumar@intel.com>
  */
 
 #include <fcntl.h>
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index a4bb85679..756b5f38e 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2023 Intel Corporation
- *
- * Authors:
- *    Janga Rahul Kumar <janga.rahul.kumar@intel.com>
  */
 
+#ifndef XE_GT_H
+#define XE_GT_H
+
 #include "lib/igt_gt.h"
 
 bool has_xe_gt_reset(int fd);
@@ -14,3 +14,5 @@ igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 				unsigned int flags);
 void xe_post_hang_ring(int fd, igt_hang_t arg);
 int xe_gt_stats_get_count(int fd, int gt, const char *stat);
+
+#endif
-- 
2.47.0

