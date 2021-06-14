Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2041.outbound.protection.outlook.com [40.107.101.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BBC89C8D
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 15:36:22 +0000 (UTC)
From: Anson Jacob <Anson.Jacob@amd.com>
Date: Mon, 14 Jun 2021 11:35:56 -0400
Message-ID: <20210614153557.19934-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/amdgpu: Introduced new amdgpu
 module reload test
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
To: igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com, Rodrigo.Siqueira@amd.com, markyacoub@google.com
Cc: Anson Jacob <Anson.Jacob@amd.com>, Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

Based off of i915/i915_module_load, unloads and loads the
amdgpu module.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
---
 lib/igt_kmod.c                 | 41 ++++++++++++++++++
 lib/igt_kmod.h                 |  3 ++
 tests/amdgpu/amd_module_load.c | 77 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build       |  1 +
 4 files changed, 122 insertions(+)
 create mode 100644 tests/amdgpu/amd_module_load.c

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 55295fa5..69bdc810 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -433,6 +433,47 @@ igt_i915_driver_unload(void)
 	return IGT_EXIT_SUCCESS;
 }
 
+int
+igt_amdgpu_driver_load(const char *opts)
+{
+	if (opts)
+		igt_info("Reloading amdgpu with %s\n\n", opts);
+
+	if (igt_kmod_load("amdgpu", opts)) {
+		igt_warn("Could not load amdgpu\n");
+		return IGT_EXIT_FAILURE;
+	}
+
+	bind_fbcon(true);
+
+	return IGT_EXIT_SUCCESS;
+}
+
+int
+igt_amdgpu_driver_unload(void)
+{
+	bind_fbcon(false);
+
+	if (igt_kmod_is_loaded("amdgpu")) {
+		if (igt_kmod_unload("amdgpu", 0)) {
+			igt_warn("Could not unload amdgpu\n");
+			igt_kmod_list_loaded();
+			igt_lsof("/dev/dri");
+			return IGT_EXIT_SKIP;
+		}
+	}
+
+	igt_kmod_unload("drm_kms_helper", 0);
+	igt_kmod_unload("drm", 0);
+
+	if (igt_kmod_is_loaded("amdgpu")) {
+		igt_warn("amdgpu.ko still loaded!\n");
+		return IGT_EXIT_FAILURE;
+	}
+
+	return IGT_EXIT_SUCCESS;
+}
+
 static void kmsg_dump(int fd)
 {
 	char record[4096 + 1];
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index c71ec147..04c87516 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -39,6 +39,9 @@ int igt_kmod_unload(const char *mod_name, unsigned int flags);
 int igt_i915_driver_load(const char *opts);
 int igt_i915_driver_unload(void);
 
+int igt_amdgpu_driver_load(const char *opts);
+int igt_amdgpu_driver_unload(void);
+
 void igt_kselftests(const char *module_name,
 		    const char *module_options,
 		    const char *result_option,
diff --git a/tests/amdgpu/amd_module_load.c b/tests/amdgpu/amd_module_load.c
new file mode 100644
index 00000000..e682d2c5
--- /dev/null
+++ b/tests/amdgpu/amd_module_load.c
@@ -0,0 +1,77 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#include "igt.h"
+#include "igt_kmod.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <sys/ioctl.h>
+
+/**
+ * Adapted from /tests/i915/i915_module_load.c
+ */
+static void
+sanity_check(void)
+{
+	int err = 0;
+	int fd;
+	int arg_ret;
+	struct drm_amdgpu_info args = {0};
+	args.return_pointer = (uintptr_t) &arg_ret;
+	args.return_size = sizeof(int);
+	args.query = AMDGPU_INFO_HW_IP_INFO;
+
+	fd = drm_open_driver(DRIVER_AMDGPU);
+	igt_set_timeout(1, "Module reload timeout!");
+
+	if (ioctl(fd, DRM_IOCTL_AMDGPU_INFO, &args) < 0)
+		err = -errno;
+
+	igt_set_timeout(0, NULL);
+	close(fd);
+
+	igt_assert_f(err, 0);
+}
+
+igt_main
+{
+	igt_subtest("reload") {
+		int err;
+		igt_amdgpu_driver_unload();
+
+		err = igt_amdgpu_driver_load(NULL);
+
+		igt_assert_eq(err, 0);
+
+		sanity_check();
+
+		igt_amdgpu_driver_unload();
+	}
+
+	igt_fixture
+	{
+		/* load the module back in */
+		igt_amdgpu_driver_load(NULL);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index b92aa22b..84179410 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -9,6 +9,7 @@ if libdrm_amdgpu.found()
 			  'amd_cs_nop',
 			  'amd_info',
 			  'amd_prime',
+			  'amd_module_load',
 			]
 	amdgpu_deps += libdrm_amdgpu
 endif
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
