Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9440FC2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2C10E3C0;
	Mon, 19 May 2025 15:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+jKsd7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4696210E3C0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667549; x=1779203549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PAvsdXnFrekWrVV0dncm5yZatms4rl/Z0Q7Tsft/GLc=;
 b=K+jKsd7+ypNeusRCYLJYFBk7Pd/OzyAxtDSKGshGtP4oLbtlnVUB3cK6
 BlH6qOwq5JecBGbCvFtgtqYLuvpkxhc2lLDGYuAIjeW66jLzDGKk3d28j
 3toYCo4/I/qiyrM/pPJc779W6zcp65ZetCpSTlOSFM8PogiPO14DLJJC4
 svqt4rJltMd1byAqUfiJHOr7DbLFZONqOzBKWRYvP98kD1ZW52fXEN9jW
 bewCm7HE91jmghqkeGEVbQYwkXxxWbSqRFp5q0x/AKJiyX8GMsgzw8g8T
 eMgq+sAAedPuPPe973dSmkmDGzhDWhBk2k3fAWLd6jjHU+vOb2Gfjyjwi A==;
X-CSE-ConnectionGUID: 29xj2d2qQreMDFXN9UpNhQ==
X-CSE-MsgGUID: zy4rfT17QHCizWAO9jrTag==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710583"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710583"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:29 -0700
X-CSE-ConnectionGUID: AS0TdJ3ATdabPfNPfZwVyg==
X-CSE-MsgGUID: 9iJ/5eNQQhCnHfrLOEsZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139288023"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:26 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 12/14] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Date: Mon, 19 May 2025 15:11:33 +0000
Message-ID: <20250519151135.43874-13-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
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

Ensure PAGE_SIZE is defined only if it is not already defined,
addressing compatibility with Android where PAGE_SIZE is predefined.

Note: PAGE_SIZE is defined in multiple files; a cleanup will be
addressed in a future patch series.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_create.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index b22084c84..e8b8bb025 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -18,7 +18,9 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#ifndef PAGE_SIZE
 #define PAGE_SIZE 0x1000
+#endif
 
 static struct param {
 	unsigned int quantity;
-- 
2.49.0

