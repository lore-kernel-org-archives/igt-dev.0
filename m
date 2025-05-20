Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268DEC3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B9210E14C;
	Tue, 20 May 2025 06:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnRwsWo4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DBC10E33D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747722333; x=1779258333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9moSCa5aRVKWYi42fzmxVv2UqNQySsI1KCU02AKVews=;
 b=hnRwsWo4P2qOu7ERDhjfPUUgMd09AfAhRuPUlO2RHDpwcr3k2rhn2DeM
 0C2UGlEs1U6f1QSccfT4IQ/qAA533taSx4yDX7GhneKmVp/baoEpggJlO
 8aXVSub1Qd3KIzr8+CqcIAQzkH/Da5xHwoXimyliQgKv4AFv+uxhDlqQ0
 BQXCWz9ylWVEtadPOd3nQXXTJZNPMiQCIqNKD61mQzMu+kCKXH7JVE3RH
 nQ64DI+C6bBAThS7hjGHq1AQ0PqSjcfVW3uAR6ZfgGxOGuQZ9THCHU9Vx
 t6VTkuC4MMcAvHxO1PWgy+t3ZYzRQc9UEX6c0UaYUQrJe9GQuXwbldUCs Q==;
X-CSE-ConnectionGUID: rae++XefRW6BnpkopvjBpw==
X-CSE-MsgGUID: rtHkD2JiThmYoIh4mu/KQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52272715"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="52272715"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:33 -0700
X-CSE-ConnectionGUID: MXwcR3aaRnaJIy0DTKKHlw==
X-CSE-MsgGUID: qAfugvlQT4uAAlbOeEkHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170609598"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:30 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com
Subject: [PATCH i-g-t v4 3/5] lib/igt_fs: Rename igt_io to igt_fs to add
 additional helpers
Date: Tue, 20 May 2025 12:19:08 +0530
Message-ID: <20250520064910.663022-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520064910.663022-1-riana.tauro@intel.com>
References: <20250520064910.663022-1-riana.tauro@intel.com>
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

Rename igt_io to igt_fs to add additional helper functions
to create and remove directories

v2: add docs (José)
    reorder headers (Kamil)

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
---
 docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml |  2 +-
 lib/{igt_io.c => igt_fs.c}                          | 12 ++++++------
 lib/{igt_io.h => igt_fs.h}                          |  6 +++---
 lib/igt_sysfs.c                                     |  2 +-
 lib/meson.build                                     |  2 +-
 tests/msm/msm_mapping.c                             |  2 +-
 tests/msm/msm_recovery.c                            |  2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)
 rename lib/{igt_io.c => igt_fs.c} (93%)
 rename lib/{igt_io.h => igt_fs.h} (94%)

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 11458c681..4cba804c3 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -31,9 +31,9 @@
     <xi:include href="xml/igt_dummyload.xml"/>
     <xi:include href="xml/igt_fb.xml"/>
     <xi:include href="xml/igt_frame.xml"/>
+    <xi:include href="xml/igt_fs.xml"/>
     <xi:include href="xml/igt_gt.xml"/>
     <xi:include href="xml/igt_hook.xml"/>
-    <xi:include href="xml/igt_io.xml"/>
     <xi:include href="xml/igt_kmod.xml"/>
     <xi:include href="xml/igt_kms.xml"/>
     <xi:include href="xml/igt_list.xml"/>
diff --git a/lib/igt_io.c b/lib/igt_fs.c
similarity index 93%
rename from lib/igt_io.c
rename to lib/igt_fs.c
index b5143184f..917ee80de 100644
--- a/lib/igt_io.c
+++ b/lib/igt_fs.c
@@ -26,15 +26,15 @@
 #include <stdlib.h>
 #include <unistd.h>
 
-#include "igt_io.h"
+#include "igt_fs.h"
 
 /**
- * SECTION:igt_io
- * @short_description: Helpers for file I/O
- * @title: io
- * @include: igt_io.h
+ * SECTION:igt_fs
+ * @short_description: Helpers for file operations
+ * @title: fs
+ * @include: igt_fs.h
  *
- * This library provides helpers for file I/O
+ * This library provides helpers for file operations
  */
 
 /**
diff --git a/lib/igt_io.h b/lib/igt_fs.h
similarity index 94%
rename from lib/igt_io.h
rename to lib/igt_fs.h
index eb9ffee1b..84c3fed62 100644
--- a/lib/igt_io.h
+++ b/lib/igt_fs.h
@@ -22,12 +22,12 @@
  *
  */
 
-#ifndef __IGT_IO_H__
-#define __IGT_IO_H__
+#ifndef __IGT_FS_H__
+#define __IGT_FS_H__
 
 #include <stdio.h>
 
 ssize_t igt_readn(int fd, char *buf, size_t len);
 ssize_t igt_writen(int fd, const char *buf, size_t len);
 
-#endif /* __IGT_IO_H__ */
+#endif /* __IGT_FS_H__ */
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index bc68cf61b..2ba96ca7f 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -46,7 +46,7 @@
 #include "igt_core.h"
 #include "igt_sysfs.h"
 #include "igt_device.h"
-#include "igt_io.h"
+#include "igt_fs.h"
 #include "intel_chipset.h"
 #include "xe/xe_query.h"
 
diff --git a/lib/meson.build b/lib/meson.build
index 4a9213375..6f3a1150c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -26,11 +26,11 @@ lib_sources = [
 	'igt_device_scan.c',
 	'igt_drm_clients.h',
 	'igt_drm_fdinfo.c',
+        'igt_fs.c',
 	'igt_aux.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
 	'igt_hwmon.c',
-	'igt_io.c',
 	'igt_matrix.c',
 	'igt_os.c',
 	'igt_params.c',
diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index e24618607..ac20ca91d 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -28,8 +28,8 @@
 #include <sys/stat.h>
 
 #include "igt.h"
+#include "igt_fs.h"
 #include "igt_msm.h"
-#include "igt_io.h"
 
 /*
  * Tests to ensure various kernel controlled buffers are mapped with the
diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 608836866..fbe26e687 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -25,8 +25,8 @@
 #include <glob.h>
 
 #include "igt.h"
+#include "igt_fs.h"
 #include "igt_msm.h"
-#include "igt_io.h"
 
 static struct msm_device *dev;
 static struct msm_bo *scratch_bo;
-- 
2.47.1

