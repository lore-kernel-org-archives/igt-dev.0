Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7010E933
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 15:56:32 +0000 (UTC)
From: Isabella Basso <isabbasso@riseup.net>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jun 2022 12:47:53 -0300
Message-Id: <20220617154753.30175-3-isabbasso@riseup.net>
In-Reply-To: <20220617154753.30175-1-isabbasso@riseup.net>
References: <20220617154753.30175-1-isabbasso@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/amdgpu/amd_kunit: add KUnit
 AMDGPU tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com, maira.canal@usp.br,
 Daniel Latypov <dlatypov@google.com>, n@nfraprado.net,
 leandro.ribeiro@collabora.com, David Gow <davidgow@google.com>,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, brendanhiggins@google.com,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This adds an IGT runner for the kernel's newly introduced KUnit tests
under the AMDGPU driver.

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
---
 tests/amdgpu/amd_kunit.c | 34 ++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 tests/amdgpu/amd_kunit.c

diff --git a/tests/amdgpu/amd_kunit.c b/tests/amdgpu/amd_kunit.c
new file mode 100644
index 00000000..258c8383
--- /dev/null
+++ b/tests/amdgpu/amd_kunit.c
@@ -0,0 +1,34 @@
+/*
+ * Copyright © 2022 Isabella Basso do Amaral <isabbasso@riseup.net>
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
+#include <libkmod.h>
+
+#include "igt.h"
+#include "igt_kmod.h"
+
+IGT_TEST_DESCRIPTION("KUnit AMDGPU module testing");
+
+igt_simple_main
+{
+	igt_kunit("amdgpu", NULL, NULL, 0);
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 12c2ba99..0b864e75 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -10,6 +10,7 @@ if libdrm_amdgpu.found()
 			  'amd_cs_nop',
 			  'amd_hotplug',
 			  'amd_info',
+			  'amd_kunit',
 			  'amd_prime',
 			  'amd_max_bpc',
 			  'amd_module_load',
-- 
2.36.1
