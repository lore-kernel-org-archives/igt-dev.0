Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C75C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675110EB4D;
	Fri, 16 May 2025 17:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeAXDowH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522CA10EB4D
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415542; x=1778951542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EOzb5S/ytKKPqoqHoMW4kuMA58rqTV8SKJe1AsriZzY=;
 b=aeAXDowHBZyngIY89wW08lGee61chD2WexvR4yi2UQHSf2pbtsWgd/Er
 uzHeKdRe1ovVe9lVE6iz3raWIzwF6RxNfo2n1ByDX4+EUnbXh/zvVKvZU
 9xiLmTylGrgtoh1mqR7VHhczgDAQZIMqtXmDf7fcOkBHKp7h+m1qf0En4
 ORQhr76bMs+o+RXuK+jBjfYU54iKXD5uPR7evZjgAsz1F7ln8eOmVfUB3
 x/LaKrvpDQbaYJnjXMzRAFcrUDEUb6FSIwYD2UdMgnGDGBXufrGjPV4Jk
 xpVZAN9vTDrx5uQ4z1lksMz5PjFP0uGZlHkgHlyZ64mSEc1DKt6uwUak0 w==;
X-CSE-ConnectionGUID: ZlSIDScVRJehpL/p93Rczw==
X-CSE-MsgGUID: oicOyyeQSgqm4cOZ33mGuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297080"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297080"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:22 -0700
X-CSE-ConnectionGUID: mTL6Q8PoTZaPQQQgt33o/Q==
X-CSE-MsgGUID: aOLlg/LRR32u5/nDOOfOqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793480"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:20 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v7 04/14] runner: Include local igt_glib header for
 Android
Date: Fri, 16 May 2025 17:11:43 +0000
Message-ID: <20250516171153.74079-5-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

