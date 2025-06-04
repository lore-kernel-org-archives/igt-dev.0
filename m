Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFBAC677C4
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E123710E78A;
	Wed,  4 Jun 2025 17:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOeJyptE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5272710E771
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749057572; x=1780593572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUeyRz7fheWJ/FyOEUkY5W9G0TBbrxdDZw5MsTQYhvQ=;
 b=EOeJyptE+wFLWfAEFdu0yMnWKXhK9Lvh/5p5H/ELXcRReJHZDTTq9pHG
 Y08bmshtvn1sj8hyVFqCXNm67DeOz7O4xIppFYb+c7eIzJkZWjovPF54t
 zyWnH+dj/GRYnUvvIgtbJSMKM9/K4Ijfadq7aLiw6l4gXtYtCaQdDA636
 FZCXLqpJ3Ycs3gMd969I6Vb+JmuxlHzZZMeOVgApTAO1s43BWXK/IstnT
 gEBgS+kTbUZNjY4MVGJlm+sQpGrYTEytKcytgOTbJ2RRm7bjnduTzmZg5
 ihdwW7h1pBDwngV7ozOiXVe6BLckWraE9t36x4vAfbn23HjvUv/Z2QYZz A==;
X-CSE-ConnectionGUID: BloyjxrtQyaX+Lppf8sTmg==
X-CSE-MsgGUID: tSjtu8W9QNmped86bbbOlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68595974"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="68595974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:17:44 -0700
X-CSE-ConnectionGUID: rS3IafQaR1mu+QRe8ud/Dg==
X-CSE-MsgGUID: U4T9TsoKQomBHmrJ+u0HcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145203308"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2025 10:17:42 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v15 7/9] tools: Include local glib header for Android
Date: Wed,  4 Jun 2025 17:16:54 +0000
Message-ID: <20250604171656.31559-8-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local glib stub header to
build igt for Android.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/igt_dp_compliance.h | 4 ++++
 tools/intel_pm_rpm.c      | 4 ++++
 tools/lsgpu.c             | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
index 5b1688039..226a13662 100644
--- a/tools/igt_dp_compliance.h
+++ b/tools/igt_dp_compliance.h
@@ -28,7 +28,11 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 
 extern int drm_fd;
 
diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 9622f0552..c1cc54b82 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -24,7 +24,11 @@
 
 #include <errno.h>
 #include <getopt.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index e68390083..6cfbf3142 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -24,7 +24,11 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 #include <libudev.h>
 #include <string.h>
 #include <signal.h>
-- 
2.49.0

