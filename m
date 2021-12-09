Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED8F10E116
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 08:34:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu,  9 Dec 2021 09:34:28 +0100
Message-Id: <20211209083429.20441-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211209083429.20441-1-zbigniew.kempczynski@intel.com>
References: <20211209083429.20441-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/gem_exec_predicate: Leave
 predicate set before bbe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kenneth Graunke <kenneth@whitecape.org>
List-ID: <igt-dev@lists.freedesktop.org>

Unfortunately I'm not able to reproduce this within single igt yet
so reproduction path is:

1. start X
2. glxgears    or     while true; do glxgears; done
3. while true; do gem_exec_predicate; done

In my case I mostly get glxgears -EIO, but to exercise Xorg abort
glxgears must be called in a loop until X will crash.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
---
 tests/i915/gem_exec_predicate.c | 61 +++++++++++++++++++++++++++++++++
 tests/meson.build               |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 tests/i915/gem_exec_predicate.c

diff --git a/tests/i915/gem_exec_predicate.c b/tests/i915/gem_exec_predicate.c
new file mode 100644
index 000000000..53ed32138
--- /dev/null
+++ b/tests/i915/gem_exec_predicate.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt.h"
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/ioctl.h>
+
+#include "drm.h"
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+
+#define WIDTH 512
+#define HEIGHT 512
+
+static void predicate(int i915)
+{
+	struct drm_i915_gem_exec_object2 obj = {0};
+	struct drm_i915_gem_execbuffer2 execbuf = {0};
+	const uint32_t bbe[3] = {
+		1 << 23 | 0xf,
+		0,
+		MI_BATCH_BUFFER_END
+	};
+	uint32_t bb = gem_create(i915, 4096);
+	gem_write(i915, bb, 0, bbe, sizeof(bbe));
+	obj.handle = bb;
+	obj.offset = 0x100000;
+	obj.flags = EXEC_OBJECT_PINNED;
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	execbuf.buffer_count = 1;
+	execbuf.flags = I915_EXEC_RENDER;
+
+	__gem_execbuf(i915, &execbuf);
+	gem_close(i915, bb);
+}
+
+igt_main
+{
+	int i915;
+
+	igt_fixture {
+		i915 = drm_open_driver(DRIVER_INTEL);
+	}
+
+	igt_subtest("predicate")
+		predicate(i915);
+
+	igt_fixture {
+		close(i915);
+
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index c14acf993..de765a017 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -139,6 +139,7 @@ i915_progs = [
 	'gem_exec_nop',
 	'gem_exec_parallel',
 	'gem_exec_params',
+	'gem_exec_predicate',
 	'gen7_exec_parse',
 	'gen9_exec_parse',
 	'gem_exec_reloc',
-- 
2.26.0
