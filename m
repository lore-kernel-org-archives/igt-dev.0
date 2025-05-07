Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7310C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533BB10E863;
	Wed,  7 May 2025 16:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B03OuYww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE6F10E85D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633888; x=1778169888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nhg+ldxYWHztZzMZBkeFoMPjH8roA6e4A/v4uk+kmIQ=;
 b=B03OuYwwNnwRPxeoGOCDcnI3LiLJbhEDNkYyZjvs9LGg5DV9SnQ94lzh
 GCTt56EOGx3TLcM7SwJbXCfI00p6nZT3o19/h2+RtC28VxueZyNreyalT
 OI8vmyLEtwhc5SS8icE9NLr/rWPWBL62DwqHEAfu5ea+izghByn+lVwCr
 vY39lSGJY0rWqIN5r4enq6eVzQ87b/MOZ655vUyz+64TlM3SdWWVPqqzK
 IOihtD0M5EQ8Ti66O/iFEv3Dl3JOc2DOBn6Kp9/HJlYLOO+WEwx/pJ2yA
 6r8q2Fy/j4SYiKK7XbZzAC4foFNonsyLs2KZawAIn230wG/ooPa8APvaa w==;
X-CSE-ConnectionGUID: ao6qBQFJQQSlp2fchuMXNg==
X-CSE-MsgGUID: 2KaE0ug2SmmigE8+mHs5HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519297"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:43 -0700
X-CSE-ConnectionGUID: 1teQz5X+QzGef2p7iQZwhg==
X-CSE-MsgGUID: MnOywhPWRIi+1zFZ/vWfYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200872"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:41 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 05/15] tools: Include local igt_glib header for Android
Date: Wed,  7 May 2025 16:01:38 +0000
Message-ID: <20250507160148.53857-6-jeevaka.badrappan@intel.com>
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
 tools/igt_dp_compliance.h | 4 ++++
 tools/intel_pm_rpm.c      | 4 ++++
 tools/lsgpu.c             | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
index 5b1688039..0df44dad3 100644
--- a/tools/igt_dp_compliance.h
+++ b/tools/igt_dp_compliance.h
@@ -28,7 +28,11 @@
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 
 extern int drm_fd;
 
diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 9622f0552..a2fe16d01 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -24,7 +24,11 @@
 
 #include <errno.h>
 #include <getopt.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index e68390083..83ecaf953 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -24,7 +24,11 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#ifndef ANDROID
 #include <glib.h>
+#else
+#include "igt_glib.h"
+#endif
 #include <libudev.h>
 #include <string.h>
 #include <signal.h>
-- 
2.34.1

