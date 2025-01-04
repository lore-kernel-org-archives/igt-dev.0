Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5713BE77197
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jan 2025 07:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA29810E0C8;
	Sat,  4 Jan 2025 07:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnZPogFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65BD10E102
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jan 2025 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735974963; x=1767510963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jT3hsEg62TUs58BVE5letz9xpBL++qAdqhwKeXYzDHY=;
 b=BnZPogFHpLeYSL5F2I2fp4gyq5zpF/v8t+sRqktQEXTpnWUCMj3roPeW
 4zY7OK1pEAlqfZVETtrAxckEwZ/5NgCG+ezbqNCBBrfwCBrGvLC+GDrMO
 fmd3isoTUyX+FFcJWI4GAba0ycrq2FvWBTt+PfPhfuAsYWcYHd/3crSZX
 ucHIobomlzjBD6UYvQWYO+E0mbDkoO1zFRkS7os/NiCY7TkXPSogePyz0
 dPKMhGrsuBMyet7SzxdBXp/nmbYu3S9PTg/RfUZxzatrjcpeoGvg/7BLe
 eTU7+fPggyb/fsf6Dpano2T8X9CYKB4vyZXHFCNY+WYgksbwOOKc2SLx8 Q==;
X-CSE-ConnectionGUID: lZfAswXTRleh293thsQBuw==
X-CSE-MsgGUID: FT8AX7twRhygEIWHDRItCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46878990"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="46878990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:02 -0800
X-CSE-ConnectionGUID: zrknAJ8mRbunMuTomvqbqA==
X-CSE-MsgGUID: 0vbGeMCOSkK7sy26afon2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="101761984"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 23:16:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/8] lib/xe/xe_gt: Fix header guards and boilerplate
Date: Fri,  3 Jan 2025 23:15:42 -0800
Message-ID: <20250104071548.737612-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250104071548.737612-1-lucas.demarchi@intel.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
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

