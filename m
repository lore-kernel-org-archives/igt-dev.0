Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0910E63D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 10:56:19 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 366A6580D93
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 03:56:18 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qvbYd-000tYK-2H
 for igt-dev@lists.freedesktop.org; Wed, 25 Oct 2023 12:56:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Oct 2023 12:56:14 +0200
Message-ID: <20231025105614.213533-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] lib/igt_sysfs: move kick_snd_hda_intel()
 to igt_kmod.c
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

This unbind function is now used only inside igt_kmod, and
should be called only via igt_always_unload_audio_driver(),
which does other required steps to unbind the audio driver.

So, move it to igt_kmod and make it static.

Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

---

v3: fix a typo on a message: cand ->can
v2: added some missing includes
---
 lib/igt_kmod.c  | 57 ++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_sysfs.c | 52 --------------------------------------------
 lib/igt_sysfs.h |  1 -
 3 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 4785d724aec8..63801778de7f 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -22,13 +22,16 @@
  */
 
 #include <ctype.h>
-#include <signal.h>
+#include <dirent.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <pthread.h>
+#include <signal.h>
 #include <stdlib.h>
 #include <string.h>
 #include <sys/utsname.h>
+#include <sys/types.h>
+#include <sys/stat.h>
 #include <unistd.h>
 
 #include "assembler/brw_compat.h"	/* [un]likely() */
@@ -437,6 +440,58 @@ igt_intel_driver_load(const char *opts, const char *driver)
 	return 0;
 }
 
+/**
+ * kick_snd_hda_intel:
+ *
+ * This function unbinds the snd_hda_intel driver so the module can be
+ * unloaded.
+ *
+ */
+static void kick_snd_hda_intel(void)
+{
+	DIR *dir;
+	struct dirent *snd_hda;
+	int fd; size_t len;
+
+	const char *dpath = "/sys/bus/pci/drivers/snd_hda_intel";
+	const char *path = "/sys/bus/pci/drivers/snd_hda_intel/unbind";
+	const char *devid = "0000:";
+
+	fd = open(path, O_WRONLY);
+	if (fd < 0) {
+		return;
+	}
+
+	dir = opendir(dpath);
+	if (!dir)
+		goto out;
+
+	len = strlen(devid);
+	while ((snd_hda = readdir(dir))) {
+		struct stat st;
+		char fpath[PATH_MAX];
+
+		if (*snd_hda->d_name == '.')
+			continue;
+
+		snprintf(fpath, sizeof(fpath), "%s/%s", dpath, snd_hda->d_name);
+		if (lstat(fpath, &st))
+			continue;
+
+		if (!S_ISLNK(st.st_mode))
+			continue;
+
+		if (!strncmp(devid, snd_hda->d_name, len)) {
+			igt_ignore_warn(write(fd, snd_hda->d_name,
+					strlen(snd_hda->d_name)));
+		}
+	}
+
+	closedir(dir);
+out:
+	close(fd);
+}
+
 static int igt_always_unload_audio_driver(char **who)
 {
 	int ret;
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 83182020b498..567b4f6d5f03 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -856,58 +856,6 @@ void bind_fbcon(bool enable)
 	bind_con("frame buffer device", enable);
 }
 
-/**
- * kick_snd_hda_intel:
- *
- * This functions unbinds the snd_hda_intel driver so the module cand be
- * unloaded.
- *
- */
-void kick_snd_hda_intel(void)
-{
-	DIR *dir;
-	struct dirent *snd_hda;
-	int fd; size_t len;
-
-	const char *dpath = "/sys/bus/pci/drivers/snd_hda_intel";
-	const char *path = "/sys/bus/pci/drivers/snd_hda_intel/unbind";
-	const char *devid = "0000:";
-
-	fd = open(path, O_WRONLY);
-	if (fd < 0) {
-		return;
-	}
-
-	dir = opendir(dpath);
-	if (!dir)
-		goto out;
-
-	len = strlen(devid);
-	while ((snd_hda = readdir(dir))) {
-		struct stat st;
-		char fpath[PATH_MAX];
-
-		if (*snd_hda->d_name == '.')
-			continue;
-
-		snprintf(fpath, sizeof(fpath), "%s/%s", dpath, snd_hda->d_name);
-		if (lstat(fpath, &st))
-			continue;
-
-		if (!S_ISLNK(st.st_mode))
-			continue;
-
-		if (!strncmp(devid, snd_hda->d_name, len)) {
-			igt_ignore_warn(write(fd, snd_hda->d_name,
-					strlen(snd_hda->d_name)));
-		}
-	}
-
-	closedir(dir);
-out:
-	close(fd);
-}
-
 static int fbcon_cursor_blink_fd = -1;
 static char fbcon_cursor_blink_prev_value[2];
 
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 0087c03b706a..e804cf8e109d 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -135,7 +135,6 @@ bool __igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 
 void bind_fbcon(bool enable);
-void kick_snd_hda_intel(void);
 void fbcon_blink_enable(bool enable);
 
 /**
-- 
2.41.0
