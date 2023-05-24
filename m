Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FA310E226
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 14:30:04 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 16:29:25 +0200
Message-Id: <20230524142931.119823-4-dominik.grzegorzek@intel.com>
In-Reply-To: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
References: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/9] xe/staging/xe_eudebug: test eudebug
 connection
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

Add basic tests checking xe eudebug connection capability.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/meson.build             |   1 +
 tests/xe/staging/xe_eudebug.c | 133 ++++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 tests/xe/staging/xe_eudebug.c

diff --git a/tests/meson.build b/tests/meson.build
index 8c7055ed9..afe3e86a2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -270,6 +270,7 @@ xe_progs = [
 ]
 
 xe_staging_progs = [
+	'xe_eudebug',
 ]
 
 msm_progs = [
diff --git a/tests/xe/staging/xe_eudebug.c b/tests/xe/staging/xe_eudebug.c
new file mode 100644
index 000000000..7202da689
--- /dev/null
+++ b/tests/xe/staging/xe_eudebug.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <xe_drm_tmp.h>
+#include "igt.h"
+
+static int __debug_connect(int fd, int *debugfd, struct drm_xe_eudebug_connect_param *param)
+{
+	int ret = 0;
+
+	*debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, param);
+
+	if (*debugfd < 0) {
+		ret = -errno;
+		igt_assume(ret != 0);
+	}
+
+	errno = 0;
+	return ret;
+}
+
+static void test_connect(int fd)
+{
+	struct drm_xe_eudebug_connect_param param = {};
+	int debugfd, ret;
+	pid_t *pid;
+
+	pid = mmap(NULL, sizeof(pid_t), PROT_WRITE,
+		   MAP_SHARED | MAP_ANON, -1, 0);
+
+	/* get fresh unrelated pid */
+	igt_fork(child, 1)
+		*pid = getpid();
+
+	igt_waitchildren();
+	param.pid = *pid;
+	munmap(pid, sizeof(pid_t));
+
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, param.pid ? -ENOENT : -EINVAL);
+
+	param.pid = 0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	igt_fork(child, 1) {
+		int newfd = drm_open_driver(DRIVER_XE);
+
+		igt_drop_root();
+
+		param.pid = 1;
+		ret = __debug_connect(newfd, &debugfd, &param);
+		igt_assert(debugfd == -1);
+		igt_assert_eq(ret, -EACCES);
+	}
+	igt_waitchildren();
+
+	param.pid = getpid();
+	param.version = -1;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.version = 0;
+	param.flags = ~0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.flags = 0;
+	param.events = ~0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.events = 0;
+	param.extensions = ~0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert(debugfd == -1);
+	igt_assert_eq(ret, -EINVAL);
+
+	param.extensions = 0;
+	ret = __debug_connect(fd, &debugfd, &param);
+	igt_assert_neq(debugfd, -1);
+	igt_assert_eq(ret, 0);
+
+	close(debugfd);
+}
+
+static void test_close(int fd)
+{
+	struct drm_xe_eudebug_connect_param param = { 0,  };
+	int debug_fd1, debug_fd2;
+	int fd2;
+
+	param.pid = getpid();
+
+	igt_assert_eq(__debug_connect(fd, &debug_fd1, &param), 0);
+	igt_assert(debug_fd1 >= 0);
+	igt_assert_eq(__debug_connect(fd, &debug_fd2, &param), -EBUSY);
+	igt_assert_eq(debug_fd2, -1);
+
+	close(debug_fd1);
+	fd2 = drm_open_driver(DRIVER_XE);
+
+	igt_assert_eq(__debug_connect(fd2, &debug_fd2, &param), 0);
+	igt_assert(debug_fd2 >= 0);
+	close(fd2);
+	close(debug_fd2);
+	close(debug_fd1);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("basic-connect")
+		test_connect(fd);
+
+	igt_subtest("basic-close")
+		test_close(fd);
+
+	igt_fixture
+		close(fd);
+}
-- 
2.34.1
