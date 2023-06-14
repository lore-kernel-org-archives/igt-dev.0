Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C04D10E44A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 10:58:38 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Jun 2023 12:58:10 +0200
Message-Id: <20230614105811.3429-10-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230614105811.3429-1-dominik.karol.piatkowski@intel.com>
References: <20230614105811.3429-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/10] tests/xe: Add a test that launches
 the xe driver live kunit tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The xe driver live kunit tests live in the xe driver tests/
subdirectory and are intended to be launched by this igt test.

To begin with we only have one test ("dma-buf").

[mchehab: updated to reflect current KUnit tests]

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/meson.build        |  1 +
 tests/xe/xe_live_ktest.c | 52 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 tests/xe/xe_live_ktest.c

diff --git a/tests/meson.build b/tests/meson.build
index f908ae885..61dcc0769 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -259,6 +259,7 @@ xe_progs = [
 	'xe_guc_pc',
 	'xe_huc_copy',
 	'xe_intel_bb',
+	'xe_live_ktest',
 	'xe_mmap',
 	'xe_mmio',
 	'xe_module_load',
diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
new file mode 100644
index 000000000..7dcf67906
--- /dev/null
+++ b/tests/xe/xe_live_ktest.c
@@ -0,0 +1,52 @@
+#include "igt.h"
+#include "igt_kmod.h"
+
+/**
+ * TEST: Xe driver live kunit tests
+ * Description: Xe driver live dmabuf unit tests
+ * Category: Software building block
+ * Sub-category: kunit
+ * Functionality: kunit
+ * Test category: functionality test
+ * Run type: BAT
+ *
+ * SUBTEST: bo
+ * Functionality: bo
+ *
+ * SUBTEST: dmabuf
+ * Functionality: dmabuf
+ *
+ * SUBTEST: migrate
+ * Functionality: migrate
+ *
+ * SUBTEST: pci
+ * Functionality: pci
+ *
+ * SUBTEST: rtp
+ * Functionality: rtp
+ *
+ * SUBTEST: wa
+ * Functionality: workarounds
+ */
+
+struct kunit_tests {
+	const char *kunit;
+	const char *name;
+};
+
+static const struct kunit_tests live_tests[] = {
+	{ "xe_bo_test",		"bo" },
+	{ "xe_dma_buf_test",	"dmabuf" },
+	{ "xe_migrate_test",	"migrate" },
+	{ "xe_pci_test",	"pci" },
+	{ "xe_rtp_test",	"rtp" },
+	{ "xe_wa_test",		"wa" },
+};
+
+igt_main
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
+		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
+}
-- 
2.34.1
