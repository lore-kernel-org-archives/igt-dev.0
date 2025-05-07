Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA70C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA04D10E866;
	Wed,  7 May 2025 16:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyWhCezg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524B910E84F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633898; x=1778169898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kcbp9Rr+pevoyG76CJRHPbhyDOZ30DhDAYI+6jpkGDg=;
 b=GyWhCezgOjQIFNYO7y2DIHKqcyog1DGV127c0NlFjHIm/nQHor3wtTHv
 diT3BCtC9FYefXP+XXfYIPJtA01f/SBQfnXOPgDDkPeGKfrGNwtxMnos7
 Q1Il7hiWlU7xIE59sM6uMqZCHIDSeYxQH06fMkCFthL0CSbjnDrcK69r8
 xUPel5uIn08qNYM9iEwv6ktAlJfW0XN3IwyWzh47fM/gA2z8v6u8cj0Bw
 Ebk/8qgUON41ZRu4ORUzSIH2RDa0lyJDupDZhU6XWw980p8zJpzBqPyGd
 4ajafOaMxVwNYNgXygVRzx2t3hfXLHjNc1pwid2XvvWlQqZAHN67thN1V A==;
X-CSE-ConnectionGUID: eOekcFlgQam4JC99bPMKyw==
X-CSE-MsgGUID: nyubFqwDTLqYeTFoSyY63w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519559"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:04:09 -0700
X-CSE-ConnectionGUID: HIS5W08kS/Oi+BSx7c8y7g==
X-CSE-MsgGUID: z2vWAMxTR12N6lquuzxYoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173201295"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:04:07 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 12/15] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Date: Wed,  7 May 2025 16:01:45 +0000
Message-ID: <20250507160148.53857-13-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

Ensure PAGE_SIZE is defined only if it is not already defined,
addressing compatibility with Android where PAGE_SIZE is predefined.

Note: PAGE_SIZE is defined in multiple files; a cleanup will be
addressed in a future patch series.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
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
2.34.1

