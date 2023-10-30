Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDEC10E362
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 19:59:11 +0000 (UTC)
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 20:58:09 +0100
Message-Id: <20231030195809.3527410-7-bernd@kuhls.net>
In-Reply-To: <20231030195809.3527410-1-bernd@kuhls.net>
References: <20231030195809.3527410-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 7/7] tests: include limits.h to fix build with
 musl libc
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
v3: split patches for lib/ and tests/ (Kamil)
    moved include in kms_pm_rpm.c (Kamil)

 tests/intel/kms_pm_rpm.c      | 1 +
 tests/kms_sysfs_edid_timing.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 14f34d904..7e54c8619 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -17,6 +17,7 @@
  * Test category: functionality test
  */
 
+#include <limits.h> // PATH_MAX
 #if defined(__linux__)
 #include <linux/i2c.h>
 #include <linux/i2c-dev.h>
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
