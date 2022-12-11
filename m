Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E8510E06A
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 19:52:57 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id v3so6857678pgh.4
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 11:52:57 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 11 Dec 2022 11:53:02 -0800
Message-Id: <20221211195302.120794-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt] tests/msm: Read the devcore back in recovery
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This also adds coverage for codepaths related to reading back the
devcore file from sysfs, to help catch issues like
https://gitlab.freedesktop.org/drm/msm/-/issues/20

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/msm/msm_recovery.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index e01087b4..4c2f2846 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -22,14 +22,54 @@
  */
 
 #include <fcntl.h>
+#include <glob.h>
 
 #include "igt.h"
 #include "igt_msm.h"
+#include "igt_io.h"
 
 static struct msm_device *dev;
 static struct msm_bo *scratch_bo;
 static uint32_t *scratch;
 
+/*
+ * Helper to read and clear devcore.  We want to read it completely to ensure
+ * we catch any kernel side regressions like:
+ * https://gitlab.freedesktop.org/drm/msm/-/issues/20
+ */
+
+static void
+read_and_clear_devcore(void)
+{
+	glob_t glob_buf = {0};
+	int ret, fd;
+
+	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
+	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+		return;
+
+	fd = open(glob_buf.gl_pathv[0], O_RDWR);
+
+	if (fd >= 0) {
+		char buf[0x1000];
+
+		/*
+		 * We want to read the entire file but we can throw away the
+		 * contents.. we just want to make sure that we exercise the
+		 * kernel side codepaths hit when reading the devcore from
+		 * sysfs
+		 */
+		do {
+			ret = igt_readn(fd, buf, sizeof(buf));
+		} while (ret > 0);
+
+		/* Clear the devcore: */
+		igt_writen(fd, "1", 1);
+	}
+
+	globfree(&glob_buf);
+}
+
 /*
  * Helpers for cmdstream packet building:
  */
@@ -102,6 +142,8 @@ do_hang_test(struct msm_pipe *pipe)
 			continue;
 		igt_assert_eq(scratch[1+i], 2+i);
 	}
+
+	read_and_clear_devcore();
 }
 
 /*
-- 
2.38.1
