Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDADC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318AC10EB4E;
	Fri, 16 May 2025 17:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtPVOOuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A6D10EB4E
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415545; x=1778951545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOjt9pWQx4+UeOMphILFU2G85AnQU73ZPUoDKy/f5U4=;
 b=CtPVOOuFvSl1D+ScWWjL0oKN5LikqVAz8l6lxrsRdN+AbwKOv02bpoCP
 yUIT1uRIvQtIDfZE8QcTrE8NHbaV/E5Ut5thczGNGuX0t31Rs3UvRDVMa
 OHXBtNDvFj3fBkQ8IDWm7d+9uRK0QIPLVc0hA3Q+1aNk0lAeojkklHub1
 o8s/WpGRUW/YGrbmEAXu//trfffzVq+y1TxchVfEptSIHxjS7LRzT6S27
 sS+jj4edpJfoVTnVP6H5dYgRACxPIDM2nrKWCwsY+nT3Ae4A//NJGEPnD
 lw9EEp57+WrTIgXRSxXapTLXbhOkAVw9Nx66Qt/TcqYIX7NoSYisFWfsH Q==;
X-CSE-ConnectionGUID: 92I4xtq2RvKCcboOe6unmA==
X-CSE-MsgGUID: OtPdTix4QuOsX2lKq0lqXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297086"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297086"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:25 -0700
X-CSE-ConnectionGUID: YbcdIe5zS4Gesy6pnDUP+w==
X-CSE-MsgGUID: 2NK8gX0uQDeMPCiSct4c5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793489"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:22 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v7 05/14] tools: Include local igt_glib header for
 Android
Date: Fri, 16 May 2025 17:11:44 +0000
Message-ID: <20250516171153.74079-6-jeevaka.badrappan@intel.com>
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

