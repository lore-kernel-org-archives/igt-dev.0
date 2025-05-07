Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD08C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212B810E876;
	Wed,  7 May 2025 16:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PML/R7TQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9853510E859
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633886; x=1778169886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pTwGmmu8EFjvsyWCFrK8J5KUIXeapFswGNV1T6jxcPo=;
 b=PML/R7TQGNH6yf67TKGwyirQHP21EearDDm2ycni4j1tJnUWdkbFmgoH
 k3Fwp/FAuw3UIHGxpqJAIJ5DBQdVi/zzk4+aQ2hbQCd0zSXr8qhEcw2lo
 LeIADk3fv8Ao6/U8kbANQVf6UJWCVI0PH9W+lQgat94UlCO/oz4znnpLj
 /amZsPuozgV2nRxqeDKW/k5Wf2RpPeBWPOUsb9vLi9zdSQ+EXt0rfq2VD
 6lD2mBUHvSxJKK9eVkl2UahDWaHY/7wYK8jhdghwOOOqm+zlU7jqtokD9
 GO8T+oNS6A7eXArD+BN0AHcFeL4KXkVUUuYxTX+raljr2QODxRwd/960t Q==;
X-CSE-ConnectionGUID: GLMCS8ASTxKGzL13dNQQvg==
X-CSE-MsgGUID: JN39YJCRSluy1ZALpRDQmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519272"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:40 -0700
X-CSE-ConnectionGUID: NM8rYv1wTx2II55KhqF7Sw==
X-CSE-MsgGUID: nnw9blVbRh6/jAr754M2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200837"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:38 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 04/15] runner: Include local igt_glib header for Android
Date: Wed,  7 May 2025 16:01:37 +0000
Message-ID: <20250507160148.53857-5-jeevaka.badrappan@intel.com>
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 runner/executor.c | 4 ++++
 runner/settings.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index 41f521e56..7be02cea1 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1,7 +1,11 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 #ifdef __linux__
 #include <linux/watchdog.h>
 #endif
diff --git a/runner/settings.h b/runner/settings.h
index 1f0b85318..36a69036c 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -5,7 +5,11 @@
 #include <stddef.h>
 #include <sys/types.h>
 #include <stdio.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 
 #include "igt_list.h"
 #include "igt_vec.h"
-- 
2.34.1

