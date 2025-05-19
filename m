Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679FEC3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F3910E373;
	Mon, 19 May 2025 15:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+v3/pvc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2CF10E373
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667529; x=1779203529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hOP5d4xG/RXbqwi9mHp2Fhs9CmRMBotDZB5Dv1Tk5PI=;
 b=I+v3/pvcf/34BnWHarHlJ/kWcxS3K4zq3iKseycOs7WkP/Tinif4MTuI
 9ikn0JSGzIa6Qot/dtiGAOpNVGDD9/2209ggbkxCUiRFUfxucf2Rhv7a2
 k2DbI5UQ8Zj7l7q1KR/vJQIzMr8rUehb/+NZJtjC+oHhaiIhPw1s3A+bj
 sVbkYL0cp/ZnZCo/XrNXAKnrnNCK9nrhQ4ybafHPY3Ja//JjuOUMoYlsb
 /TUXHii20/x/dW7m8X8jsB5qee5AZG+IpMCrHfWG1l6vnaXBYO9ljZWuT
 B+IHVivjhiD4APxlFyuXWxc9/denv1Gdc39qRk3XJGA9cndtrDiRvt1as g==;
X-CSE-ConnectionGUID: gn6trjsWSmekiBw0M/j6UQ==
X-CSE-MsgGUID: mBbZRXeNTwKImHpHLim68w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710540"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710540"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:09 -0700
X-CSE-ConnectionGUID: Z82URtnXR3ShJHMd8CarIg==
X-CSE-MsgGUID: nuxC3PVVQEig9gE7VLcylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139287914"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:06 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 04/14] runner: Include local glib header for Android
Date: Mon, 19 May 2025 15:11:25 +0000
Message-ID: <20250519151135.43874-5-jeevaka.badrappan@intel.com>
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

As glib is not available in Android, added local stub header to build
igt for Android.

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

