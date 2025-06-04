Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE9C5B555
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A04E10E794;
	Wed,  4 Jun 2025 17:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPVdbpaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F0010E75F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057572; x=1780593572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=scDniira9qeiRiGtmQ4i4JA2qgbAIbr+cDc53CN/XQs=;
 b=kPVdbpaW4FMeu/0mLukEMCigz8dxJrEOz8R6Jjjr8ICktUoina0sMmWo
 OHIYJKSRQ3TPc3qKj/rM9nywhzfxr+NzNoGOlogwOw/wLpPtSZ1MiRDAW
 IdrFWBNFm9mpp4jVU0tvH/2Zoh9jzmB3gzEC513Jr2CkBCgI9UUP6YbzN
 Rec3BIFshB+NYttE5ayKdK7fOPC1w0NICC+8CJwtdzZGbjrkG0qpio4bk
 VtlOkst9Iaxm59x/Ibfu4JYKsSCFwQZ5fcuYdBHiGNIlE1fkPe8LyPuuq
 7X7mjpvk6x3H1iih0ppphRjxHfZShgGZyeVdhfcCnc0kifGBOmzMLhc2w A==;
X-CSE-ConnectionGUID: VDMTvES2RYK2OW5iNYO/8Q==
X-CSE-MsgGUID: vaIG+75lQN6kLMHRM2caBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595971"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595971"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:42 -0700
X-CSE-ConnectionGUID: T/Dj0cx/TrqjbkhpVfZttg==
X-CSE-MsgGUID: NefcW6GKQwiF2zwZ+UcC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203298"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:40 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v15 6/9] runner: Include local glib header for Android
Date: Wed,  4 Jun 2025 17:16:53 +0000
Message-ID: <20250604171656.31559-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local stub header to build
igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 4 ++++
 runner/settings.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index 661305006..13180a0a4 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1,7 +1,11 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #ifdef __linux__
 #include <linux/watchdog.h>
 #endif
diff --git a/runner/settings.h b/runner/settings.h
index 1f0b85318..ccdc7281b 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -5,7 +5,11 @@
 #include <stddef.h>
 #include <sys/types.h>
 #include <stdio.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 
 #include "igt_list.h"
 #include "igt_vec.h"
-- 
2.49.0

