Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C490C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC74C10E0D9;
	Tue,  3 Jun 2025 19:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JznO/s/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509B710E0D9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978687; x=1780514687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJ/LwN0aTIy1ZEWR5SY9KIv5TRrc5MM9UPBhJwom5PU=;
 b=JznO/s/wWtftUf/hCaDJqFKWZpBxg3fAk/DAdHLRF+Sl2nPha+rLUT1+
 71hyh2yD1qyBVfEGWSeiyDKm4StkKZmt7dJLcwVfQYT0IJkLqiB7eM282
 NsnSjwVPaU+7Rl8DAn1tydD5rLXi9LmRlHFd7ju5BOC4QUf4IelmPS3tE
 /MlT+dvOXxKCqTK8sdJ3mB96rTZJX4zyJJBmJmlJHaSkBBceBt2n2TnVv
 FuKBUXhjD/nG2TPpbg9sqNrlPsbCXgmftYgq18cez5E/r2a/p2yPYrR/T
 TRv5GYNxfhStr+43xBqCnpYjdBxFAWLqrGWqAimSlcDgt8xHbVBNo3S4E Q==;
X-CSE-ConnectionGUID: KyAulzECRsOMgw40C0xLXA==
X-CSE-MsgGUID: pszZtMLXQJyZjegxYfDb2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76424319"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="76424319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:24:47 -0700
X-CSE-ConnectionGUID: +FMPQvNVQoGHhLFZ4A11Sg==
X-CSE-MsgGUID: 44DBLmj+S7CQXskZ5taAkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175821628"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2025 12:24:45 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v14 08/11] runner: Include local glib header for Android
Date: Tue,  3 Jun 2025 19:23:51 +0000
Message-ID: <20250603192355.77019-9-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
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
index 41f521e56..784d9eb5f 100644
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

