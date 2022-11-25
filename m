Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1EB10E740
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 12:02:07 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 13:01:42 +0100
Message-Id: <20221125120148.28490-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
References: <20221125120148.28490-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH v3 2/8] lib/igt_core: store GPU string or
 opened device name
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
The name will be automatically filled when a device will
be opened.

v2: reorganized code, changed commit message to note that
  it will be filled with pathname of opended device, also
  correct static initialization [Kamil]

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c  |  4 +++-
 lib/igt_core.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_core.h |  6 ++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 16e80bdf..5eb98272 100644
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
index ca363b7d..c86acf2a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1576,6 +1576,36 @@ static void kill_and_wait(pid_t *pids, int size, int signum)
 	}
 }
 
+static __thread char *gpu_string;
+
+void set_gpu_string(const char *fname)
+{
+	char sysfs[PATH_MAX], *path, *p;
+
+	if (gpu_string) {
+		free(gpu_string);
+		gpu_string = NULL;
+	}
+
+	if (!fname)
+		return;
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
+		igt_debug("opened %s as %s\n", fname, path);
+	}
+
+	gpu_string = path;
+	igt_assert(gpu_string);
+}
+
 __noreturn static void exit_subtest(const char *result)
 {
 	struct timespec now;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 082da036..276bf42f 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1519,4 +1519,10 @@ static inline void igt_pci_system_cleanup(void)
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
2.34.1
