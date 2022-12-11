Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3910E084
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 19:52:36 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p24so9998168plw.1
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 11:52:36 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 11 Dec 2022 11:52:37 -0800
Message-Id: <20221211195238.120566-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 1/2] lib: Add helper to wait and close fence fd
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

Get rid of some copy/pasta and open coding of a common pattern, waiting
for GPU commands to complete.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_aux.c            | 11 +++++++++++
 lib/igt_aux.h            |  2 ++
 tests/msm/msm_mapping.c  |  4 +---
 tests/msm/msm_recovery.c | 15 ++-------------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 15e30440..672d7d4b 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1919,3 +1919,14 @@ void *igt_memdup(const void *ptr, size_t len)
 
 	return dup;
 }
+
+/**
+ * igt_wait_and_close: helper to wait on a fence-fd and then close it
+ *
+ * @fence_fd: the fence-fd to wait on and close
+ */
+void igt_wait_and_close(int fence_fd)
+{
+	poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
+	close(fence_fd);
+}
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index e734c87b..fb76b031 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -337,4 +337,6 @@ uint64_t vfs_file_max(void);
 
 void *igt_memdup(const void *ptr, size_t len);
 
+void igt_wait_and_close(int fence_fd);
+
 #endif /* IGT_AUX_H */
diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 21cdc8e1..e2461860 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -25,7 +25,6 @@
 #include <fcntl.h>
 #include <glob.h>
 #include <string.h>
-#include <sys/poll.h>
 #include <sys/stat.h>
 
 #include "igt.h"
@@ -197,8 +196,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	fence_fd = igt_msm_cmd_submit(cmd);
 
 	/* Wait for submit to complete: */
-	poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
-	close(fence_fd);
+	igt_wait_and_close(fence_fd);
 
 	igt_msm_bo_free(scratch_bo);
 
diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 890c543a..e01087b4 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -22,7 +22,6 @@
  */
 
 #include <fcntl.h>
-#include <sys/poll.h>
 
 #include "igt.h"
 #include "igt_msm.h"
@@ -52,16 +51,6 @@ mem_write(struct msm_cmd *cmd, uint32_t offset_dwords, uint32_t val)
 	msm_cmd_emit(cmd, val);                            /* VAL */
 }
 
-/*
- * Helper to wait on a fence-fd:
- */
-static void
-wait_and_close(int fence_fd)
-{
-	poll(&(struct pollfd){fence_fd, POLLIN}, 1, -1);
-	close(fence_fd);
-}
-
 /*
  * Helper for hang tests.  Emits multiple submits, with one in the middle
  * that triggers a fault, and confirms that the submits before and after
@@ -107,7 +96,7 @@ do_hang_test(struct msm_pipe *pipe)
 	scratch[0] = 1;
 
 	for (unsigned i = 0; i < ARRAY_SIZE(cmds); i++) {
-		wait_and_close(fence_fds[i]);
+		igt_wait_and_close(fence_fds[i]);
 		igt_msm_cmd_free(cmds[i]);
 		if (i == 10)
 			continue;
@@ -163,7 +152,7 @@ igt_main
 		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
 		msm_cmd_emit(cmd, 0x123);                /* VAL */
 
-		wait_and_close(igt_msm_cmd_submit(cmd));
+		igt_wait_and_close(igt_msm_cmd_submit(cmd));
 	}
 
 	igt_fixture {
-- 
2.38.1
