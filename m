Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E72C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 14:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3023510E5AC;
	Tue, 13 May 2025 14:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwURiSfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B7F10E5B1
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747145143; x=1778681143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9moSCa5aRVKWYi42fzmxVv2UqNQySsI1KCU02AKVews=;
 b=UwURiSfu2jnmoX/Hye4/87c1sLlaeBdAfIB19FTkZlTDZyamjgZHCQMP
 lYixXvV+YhdlYF8ovTfGCX7cKjxG60R3C14DAi/mKu4GaMwl3W0Ng/vFv
 9zmh+exT9sDf/zceTywNARik4Sc9TwWY0qXQBsMdyCIVnWUVOqCEVTBka
 Wd4w/MYRaL3m+d03NhAHvh19k7d2CWnnrM9xB0ac/eFo0f4AsfK6SpZnk
 3EBKJydWHL9Oxf1P2vhF7k9XGU1+9PS82wr7kL1S+qFlgv/yjIaA4AQJ1
 VlROZbzx3E9lK9KWfsQCmsp5jHyW+f5z+uxiEXTEARwfVyl9ZP/CWOT6b A==;
X-CSE-ConnectionGUID: w0JNobd9SxutH/jZ2YEzdg==
X-CSE-MsgGUID: G02v5Rx+SbWqr94GOVlPng==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48245781"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48245781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:42 -0700
X-CSE-ConnectionGUID: 0+tKnthwQnuuHyNz+KnwFA==
X-CSE-MsgGUID: i64VBUYqSGWLCZkPn1E3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="137583777"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 07:05:39 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 3/5] lib/igt_fs: Rename igt_io to igt_fs to add
 additional helpers
Date: Tue, 13 May 2025 19:58:23 +0530
Message-ID: <20250513142827.1129334-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513142827.1129334-1-riana.tauro@intel.com>
References: <20250513142827.1129334-1-riana.tauro@intel.com>
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

