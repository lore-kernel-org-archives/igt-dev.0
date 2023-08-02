Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7049210E0AC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 21:20:03 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bc02bd4eafso3031315ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Aug 2023 14:20:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 14:19:54 -0700
Message-ID: <20230802211958.7027-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/msm: Add submitoverhead benchmark
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

Something for profiling CPU overhead of submit ioctl.  Not really a
functional test, but it is convenient to re-use the i-g-t infrastructure
for this.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/meson.build              |   3 +-
 tests/msm/msm_submitoverhead.c | 104 +++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 tests/msm/msm_submitoverhead.c

diff --git a/tests/meson.build b/tests/meson.build
index 944a0941f9fd..ca918337ebf6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -302,7 +302,8 @@ msm_progs = [
 	'msm_mapping',
 	'msm_recovery',
 	'msm_shrink',
-	'msm_submit'
+	'msm_submit',
+        'msm_submitoverhead',
 ]
 
 chamelium_progs = [
diff --git a/tests/msm/msm_submitoverhead.c b/tests/msm/msm_submitoverhead.c
new file mode 100644
index 000000000000..d88d6d999ab9
--- /dev/null
+++ b/tests/msm/msm_submitoverhead.c
@@ -0,0 +1,104 @@
+/*
+ * Copyright © 2023 Google, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include "igt.h"
+#include "igt_msm.h"
+
+/*
+ * Not as much a test, as a kernel submit overhead benchmark.  Generates lots
+ * of submit ioctls with various size #s of buffers attached for measuring
+ * and profiling kernel submit CPU overhead.
+ */
+
+#define MAX_BOS 1000
+
+igt_main
+{
+	struct msm_device *dev = NULL;
+	struct msm_pipe *pipe = NULL;
+	struct msm_bo *bos[MAX_BOS];
+	struct drm_msm_gem_submit_bo bos_table[MAX_BOS];
+	static const int sizes[] = {
+		10, 100, 250, 500, 1000,
+	};
+
+	igt_fixture {
+		struct drm_msm_gem_submit req;
+
+		dev = igt_msm_dev_open();
+		pipe = igt_msm_pipe_open(dev, 0);
+		for (int i = 0; i < MAX_BOS; i++) {
+			bos[i] = igt_msm_bo_new(dev, 0x1000, MSM_BO_WC);
+			bos_table[i] = (struct drm_msm_gem_submit_bo) {
+				.handle = bos[i]->handle,
+				/*
+				 * We don't bother testing BO_READ since
+				 * mesa doesn't use that anymore
+				 */
+				.flags  = MSM_SUBMIT_BO_WRITE,
+			};
+		}
+
+		/*
+		 * Prime the pump, so first submit doesn't take the overhead
+		 * of allocating backing pages:
+		 */
+		req = (struct drm_msm_gem_submit) {
+			.flags   = pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT,
+			.queueid = pipe->submitqueue_id,
+			.nr_bos  = ARRAY_SIZE(bos_table),
+			.bos     = VOID2U64(bos_table),
+		};
+		do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+		igt_wait_and_close(req.fence_fd);
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(sizes); i++) {
+		for (int mode = 0; mode < 2; mode++) {
+			const char *modestr = mode ? "-no-implicit-sync" : "";
+			const uint32_t modeflags = mode ? MSM_SUBMIT_NO_IMPLICIT : 0;
+			igt_subtest_f("submitbench-%u-bos%s", sizes[i], modestr) {
+				struct drm_msm_gem_submit req = {
+					.flags   = pipe->pipe | modeflags,
+					.queueid = pipe->submitqueue_id,
+					.nr_bos  = sizes[i],
+					.bos     = VOID2U64(bos_table),
+				};
+				unsigned iterations = 0;
+				igt_for_milliseconds(2000) {
+					do_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req);
+					iterations++;
+				}
+				igt_info("%u-bos: %u iterations\n", sizes[i], iterations);
+			}
+		}
+	}
+
+	igt_fixture {
+		for (int i = 0; i < MAX_BOS; i++) {
+			igt_msm_bo_free(bos[i]);
+		}
+		igt_msm_pipe_close(pipe);
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.41.0
