Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DBD6E167
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 19:56:45 +0000 (UTC)
From: Abhinav Kumar <abhinavk@codeaurora.org>
Date: Tue, 15 Sep 2020 12:56:13 -0700
Message-Id: <20200915195614.7618-5-abhinavk@codeaurora.org>
In-Reply-To: <20200915195614.7618-1-abhinavk@codeaurora.org>
References: <20200915195614.7618-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/5] tools: move terminal utility
 functions to a separate file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, swboyd@chromium.org, khsieh@codeaurora.org, nganji@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Move the terminal utility functions to a separate file so
that other modules can use it as well.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tools/Makefile.sources       |  1 +
 tools/igt_compliance_utils.c | 82 ++++++++++++++++++++++++++++++++++++
 tools/igt_dp_compliance.h    |  8 ++++
 tools/intel_dp_compliance.c  | 47 ---------------------
 tools/meson.build            |  3 +-
 5 files changed, 93 insertions(+), 48 deletions(-)
 create mode 100644 tools/igt_compliance_utils.c

diff --git a/tools/Makefile.sources b/tools/Makefile.sources
index c28bef2f..47171490 100644
--- a/tools/Makefile.sources
+++ b/tools/Makefile.sources
@@ -65,6 +65,7 @@ intel_dp_compliance_SOURCES = \
         intel_dp_compliance.c \
         igt_dp_compliance.h \
         igt_dp_compliance_hotplug.c \
+        igt_compliance_utils.c \
         $(NULL)
 
 amd_hdmi_compliance_SOURCES = \
diff --git a/tools/igt_compliance_utils.c b/tools/igt_compliance_utils.c
new file mode 100644
index 00000000..d6a2e4e5
--- /dev/null
+++ b/tools/igt_compliance_utils.c
@@ -0,0 +1,82 @@
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ * Copyright 2017 Intel Corporation
+ *   Jesse Barnes <jesse.barnes@intel.com>
+ *   Manasi Navare <manasi.d.navare@intel.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include "igt.h"
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <signal.h>
+#include <termios.h>
+
+#include <sys/stat.h>
+
+#include "igt_dp_compliance.h"
+
+static int tio_fd;
+struct termios saved_tio;
+
+void enter_exec_path(char **argv)
+{
+	char *exec_path = NULL;
+	char *pos = NULL;
+	short len_path = 0;
+	int ret;
+
+	len_path = strlen(argv[0]);
+	exec_path = (char *) malloc(len_path);
+
+	memcpy(exec_path, argv[0], len_path);
+	pos = strrchr(exec_path, '/');
+	if (pos != NULL)
+		*(pos+1) = '\0';
+
+	ret = chdir(exec_path);
+	igt_assert_eq(ret, 0);
+	free(exec_path);
+}
+
+static void restore_termio_mode(int sig)
+{
+	tcsetattr(tio_fd, TCSANOW, &saved_tio);
+	close(tio_fd);
+}
+
+void set_termio_mode(void)
+{
+	struct termios tio;
+
+	/* don't attempt to set terminal attributes if not in the foreground
+	 * process group
+	 */
+	if (getpgrp() != tcgetpgrp(STDOUT_FILENO))
+		return;
+
+	tio_fd = dup(STDIN_FILENO);
+	tcgetattr(tio_fd, &saved_tio);
+	igt_install_exit_handler(restore_termio_mode);
+	tio = saved_tio;
+	tio.c_lflag &= ~(ICANON | ECHO);
+	tcsetattr(tio_fd, TCSANOW, &tio);
+}
diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
index bf2b0701..5b168803 100644
--- a/tools/igt_dp_compliance.h
+++ b/tools/igt_dp_compliance.h
@@ -22,6 +22,9 @@
  * IN THE SOFTWARE.
  */
 
+#ifndef __IGT_DP_COMPLIANCE_H__
+#define __IGT_DP_COMPLIANCE_H__
+
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
@@ -32,5 +35,10 @@ extern int drm_fd;
 gboolean igt_dp_compliance_setup_hotplug(void);
 void igt_dp_compliance_cleanup_hotplug(void);
 
+void enter_exec_path(char **argv);
+void set_termio_mode(void);
+
 /* called by the hotplug code */
 int update_display(int mode, bool is_compliance_test);
+
+#endif /* __IGT_DP_COMPLIANCE_H__ */
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index c8c5c841..217a1247 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -172,9 +172,6 @@ uint16_t hdisplay;
 uint16_t vdisplay;
 uint8_t bitdepth;
 
-static int tio_fd;
-struct termios saved_tio;
-
 drmModeRes *resources;
 int drm_fd, modes, gen;
 uint64_t tiling = LOCAL_DRM_FORMAT_MOD_NONE;
@@ -825,50 +822,6 @@ static gboolean input_event(GIOChannel *source, GIOCondition condition,
 	return TRUE;
 }
 
-static void enter_exec_path(char **argv)
-{
-	char *exec_path = NULL;
-	char *pos = NULL;
-	short len_path = 0;
-	int ret;
-
-	len_path = strlen(argv[0]);
-	exec_path = (char *) malloc(len_path);
-
-	memcpy(exec_path, argv[0], len_path);
-	pos = strrchr(exec_path, '/');
-	if (pos != NULL)
-		*(pos+1) = '\0';
-
-	ret = chdir(exec_path);
-	igt_assert_eq(ret, 0);
-	free(exec_path);
-}
-
-static void restore_termio_mode(int sig)
-{
-	tcsetattr(tio_fd, TCSANOW, &saved_tio);
-	close(tio_fd);
-}
-
-static void set_termio_mode(void)
-{
-	struct termios tio;
-
-	/* don't attempt to set terminal attributes if not in the foreground
-	 * process group
-	 */
-	if (getpgrp() != tcgetpgrp(STDOUT_FILENO))
-		return;
-
-	tio_fd = dup(STDIN_FILENO);
-	tcgetattr(tio_fd, &saved_tio);
-	igt_install_exit_handler(restore_termio_mode);
-	tio = saved_tio;
-	tio.c_lflag &= ~(ICANON | ECHO);
-	tcsetattr(tio_fd, TCSANOW, &tio);
-}
-
 int main(int argc, char **argv)
 {
 	int c;
diff --git a/tools/meson.build b/tools/meson.build
index 05f2a172..56877fb3 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -60,7 +60,8 @@ endforeach
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-		'igt_dp_compliance_hotplug.c'
+		'igt_dp_compliance_hotplug.c',
+		'igt_compliance_utils.c'
 	]
 	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
 		   dependencies : [tool_deps, libudev],
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
