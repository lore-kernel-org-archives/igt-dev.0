Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0206110E841
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 17:15:31 +0000 (UTC)
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 19:14:36 +0200
Message-Id: <20231026171440.4046190-3-bernd@kuhls.net>
In-Reply-To: <20231026171440.4046190-1-bernd@kuhls.net>
References: <20231026171440.4046190-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/6] Include limits.h to fix build with musl
 libc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Stefano Ragni <st3r4g@protonmail.com>

Original patch was added to void-linux:
https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7

Bug report with request to split the original patch into some
functional changes:
Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

Signed-off-by: Stefano Ragni <st3r4g@protonmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd: alphabetically sorted includes, removed includes not needed
 anymore, patched tests/intel/kms_pm_rpm.c instead of
 tests/intel/i915_pm_rpm.c]
---
 lib/igt_aux.c                 | 1 +
 lib/igt_eld.c                 | 1 +
 lib/igt_hwmon.c               | 1 +
 tests/intel/kms_pm_rpm.c      | 1 +
 tests/kms_sysfs_edid_timing.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 18edc5ef9..d6aeb876b 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -31,6 +31,7 @@
 #endif
 #include <stdio.h>
 #include <fcntl.h>
+#include <limits.h> // PATH_MAX
 #include <pwd.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index ef6625df1..6cec9abdd 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -28,6 +28,7 @@
 #include <dirent.h>
 #include <errno.h>
 #include <glob.h>
+#include <limits.h> // PATH_MAX
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/lib/igt_hwmon.c b/lib/igt_hwmon.c
index f37ced2d9..53c346e73 100644
--- a/lib/igt_hwmon.c
+++ b/lib/igt_hwmon.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
+#include <limits.h> // PATH_MAX
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
 #include <dirent.h>
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 14f34d904..9211ee7a9 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -18,6 +18,7 @@
  */
 
 #if defined(__linux__)
+#include <limits.h> // PATH_MAX
 #include <linux/i2c.h>
 #include <linux/i2c-dev.h>
 #elif defined(__FreeBSD__)
diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index ee47a024e..c371a5e5e 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -24,6 +24,7 @@
 
 #include <dirent.h>
 #include <fcntl.h>
+#include <limits.h> // PATH_MAX
 #include <sys/stat.h>
 /**
  * TEST: kms sysfs edid timing
-- 
2.39.2
