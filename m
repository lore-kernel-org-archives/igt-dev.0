Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AF810E360
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 08:59:13 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.37.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0E2A958067A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 01:58:47 -0700 (PDT)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:58:41 +0200
Message-Id: <20220928085842.34107-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20220928085842.34107-1-mauro.chehab@linux.intel.com>
References: <20220928085842.34107-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC 1/2] lib/igt_core: add a logic to store a GPU
 string
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This is helpful on tests that run with multiple GPUs.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/drmtest.c  |  4 +++-
 lib/igt_core.c | 24 ++++++++++++++++++++++++
 lib/igt_core.h |  6 ++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 16e80bdfcfb1..5eb9827278c8 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -222,8 +222,10 @@ static int open_device(const char *name, unsigned int chipset)
 			break;
 		}
 	}
-	if ((chipset & chip) == chip)
+	if ((chipset & chip) == chip) {
+		set_gpu_string(name);
 		return fd;
+	}
 
 err:
 	close(fd);
diff --git a/lib/igt_core.c b/lib/igt_core.c
index e7425326b7f0..0d018758ce38 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1447,6 +1447,30 @@ bool __igt_enter_dynamic_container(void)
 	return true;
 }
 
+static __thread char *gpu_string = NULL;
+
+void set_gpu_string(const char *fname)
+{
+	char sysfs[PATH_MAX], *path, *p;
+
+
+	p = strrchr(fname, '/');
+	if (!p) {
+		path = strdup(fname);
+	} else {
+		p++;
+
+		strcpy(sysfs, "/sys/class/drm/");
+		strcat(sysfs, p);
+		path = realpath(sysfs, NULL);
+	}
+
+	if (gpu_string)
+		free(gpu_string);
+	gpu_string = path;
+	igt_assert(gpu_string);
+}
+
 __noreturn static void exit_subtest(const char *result)
 {
 	struct timespec now;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index aa98e8ed8deb..62e7065429c9 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1490,4 +1490,10 @@ static inline void igt_pci_system_cleanup(void)
 {
 }
 
+/**
+ * set_gpu_string():
+ * Sets a string to describe the GPU being tested
+ */
+void set_gpu_string(const char *string);
+
 #endif /* IGT_CORE_H */
-- 
2.37.3
