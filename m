Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D4CC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF0B10EB27;
	Fri, 16 May 2025 16:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwhbdaGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C0810EB23
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411607; x=1778947607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PAvsdXnFrekWrVV0dncm5yZatms4rl/Z0Q7Tsft/GLc=;
 b=MwhbdaGB7TglWWtes756l0yt23zOUxFSWZi5ZAlLJX9M8sYwOxmeLYhp
 HtH3odxxLLDgBRgkhjRe0KgX9B9/mQS0Z03qyPTNyPcJubboHxQ7qDwvW
 3emA55qklumr4uJYx1tJDvJYYMaSb9z6vPocyYnmZTCB/rjc5z2agP1gC
 pX0duDsrjlwUyZIIJ1ViOWS4Lc/pyeWiNaz2cJHe2Ale5iUXDiaO7Fgf5
 9mifiB2vHDB6MNnRHT99YdksSE+J375FBDK6Y5cxLhhbSfP1HlfPabC9W
 /2Q2VsUkq0gllhNGCs7vF0A7lvyt6rRwt2K3Tdd6uMAI5/0zD9y2utM4S g==;
X-CSE-ConnectionGUID: xFRZvBRJTUWN7nHKvK3nWg==
X-CSE-MsgGUID: 1Qswl5c8ST2RX+SEhurF0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941177"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:47 -0700
X-CSE-ConnectionGUID: ADQ3n8WWTSmDDrAW5aCO2w==
X-CSE-MsgGUID: 49OYqFlgQ3+vmhHQg/2m/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772621"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:44 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 12/14] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Date: Fri, 16 May 2025 16:05:49 +0000
Message-ID: <20250516160551.58760-13-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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

