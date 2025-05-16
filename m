Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93896C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3667E10EB1D;
	Fri, 16 May 2025 16:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn/jodLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34BB10EB1B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411588; x=1778947588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EOzb5S/ytKKPqoqHoMW4kuMA58rqTV8SKJe1AsriZzY=;
 b=dn/jodLV5qNiXGJU8/OZehhkRCflKJHKW2tVh/KvwjdtWAeErMpIaRTE
 iRCx+kzV3oRam85jKdOITeUDyfisl1kw9PdoFXoY93yWcsQ8pM3HE3KQt
 8YGasHPaMVEkwLrDdam5ko0IiMsuRbm03TQVXfqHHOFeM/2pL/6vVvMp6
 Zx9XsTl9b2gX4SRvlRYb9KT6Odc8D57gUQdhkfj9950IsgTfIKJ258cz4
 T5GCgRBEkXm0SeomhCOim+f6TfaA/V3MhpiewkJF/DAoaojlU1vuXQ3Re
 Kq5HafggYQXU2ZPyY7i9MGH0G8sHN+o1c+dxJh1P8Cc2r5aVO0HEDToTl w==;
X-CSE-ConnectionGUID: BNvEY900Sk+DajouSCzi8w==
X-CSE-MsgGUID: UEIvJxvmTR+s8m5C1dvI9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941103"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941103"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:27 -0700
X-CSE-ConnectionGUID: zG9YiazvSrGMw7WG/A4gBw==
X-CSE-MsgGUID: 7olrd61oT1qRMIeCppgKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772508"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:24 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 04/14] runner: Include local igt_glib header for
 Android
Date: Fri, 16 May 2025 16:05:41 +0000
Message-ID: <20250516160551.58760-5-jeevaka.badrappan@intel.com>
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

