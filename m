Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BD410E515
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 06:18:31 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C688D580CBC
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 23:18:29 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ochRj-000RdI-2w
 for igt-dev@lists.freedesktop.org; Mon, 26 Sep 2022 08:18:27 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:17:06 +0200
Message-Id: <50da9d5c006ba73f8464eb0cee1e40257a00486e.1664173031.git.mchehab@kernel.org>
In-Reply-To: <cover.1664173031.git.mchehab@kernel.org>
References: <cover.1664173031.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 01/76] lib: Introduce typed cleanups
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

From: Chris Wilson <chris@chris-wilson.co.uk>

Start introducing standard types with automatic cleanup courtesy of
gcc's __attribute__((cleanup)). As an example, we start with an fd
that will automatically call close() on going out of scope, and
crucially before atexit where we will want to check for resource leaks.

Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.mchehab@kernel.org/

 lib/igt_core.c               |   6 ++
 lib/igt_core.h               |   2 +
 lib/igt_types.c              |  17 +++++
 lib/igt_types.h              |  47 ++++++++++++
 lib/meson.build              |   1 +
 lib/tests/bad_subtest_type.c |  19 +++++
 lib/tests/igt_types.c        | 136 +++++++++++++++++++++++++++++++++++
 lib/tests/meson.build        |   2 +
 8 files changed, 230 insertions(+)
 create mode 100644 lib/igt_types.c
 create mode 100644 lib/igt_types.h
 create mode 100644 lib/tests/bad_subtest_type.c
 create mode 100644 lib/tests/igt_types.c

diff --git a/lib/igt_core.c b/lib/igt_core.c
index e7425326b7f0..dc6486c841f0 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -624,6 +624,12 @@ uint64_t igt_nsec_elapsed(struct timespec *start)
 		(uint64_t)NSEC_PER_SEC*(now.tv_sec - start->tv_sec));
 }
 
+void __igt_assert_in_outer_scope(void)
+{
+	internal_assert(!in_subtest,
+			"must only be called outside of a subtest");
+}
+
 bool __igt_fixture(void)
 {
 	internal_assert(!in_fixture,
diff --git a/lib/igt_core.h b/lib/igt_core.h
index aa98e8ed8deb..f21723dec4bc 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -135,6 +135,8 @@ struct _GKeyFile *igt_load_igtrc(void);
  */
 #define IGT_EXIT_ABORT 112
 
+void __igt_assert_in_outer_scope(void);
+
 bool __igt_fixture(void);
 void __igt_fixture_complete(void);
 __noreturn void __igt_fixture_end(void);
diff --git a/lib/igt_types.c b/lib/igt_types.c
new file mode 100644
index 000000000000..392f30fcab23
--- /dev/null
+++ b/lib/igt_types.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: MIT
+/*
+* Copyright © 2022 Intel Corporation
+*/
+
+#include <unistd.h>
+
+#include "igt_types.h"
+
+void igt_cleanup_fd(volatile int *fd)
+{
+	if (!fd || *fd < 0)
+		return;
+
+	close(*fd);
+	*fd = -1;
+}
diff --git a/lib/igt_types.h b/lib/igt_types.h
new file mode 100644
index 000000000000..c4bc01ecdb3b
--- /dev/null
+++ b/lib/igt_types.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef IGT_TYPES_H
+#define IGT_TYPES_H
+
+/*
+ * GCC can automatically cleanup variables that go out of scope, but only
+ * through normal means. Breaking out of scope using longjmp (i.e. igt_skip)
+ * is not handled automatically by GCC. Such scoped variables must be tracked
+ * in an outer scope to the skipping subtest.
+ *
+ * BAD:
+ * 	igt_subtest("bad") {
+ * 		igt_fd_t(fd);
+ *
+ * 		fd = drm_open_driver();
+ * 	}
+ *
+ * GOOD:
+ * 	igt_subtest_group() {
+ * 		igt_fd_t(fd);
+ *
+ * 		igt_fixture {
+ * 			fd = drm_open_driver();
+ * 		}
+ *
+ * 		igt_subtest("good")
+ * 			;
+ * 	}
+ *
+ * A rule of thumb is that anything that is initialised through a fixture can
+ * be combined with automatic cleanup.
+ */
+
+#define cleanup_with(fn) __attribute__((__cleanup__(fn)))
+
+/* Prevent use within the inner scope subtests, it will be broken by igt_skip */
+#define IGT_OUTER_SCOPE_INIT(x) ({ __igt_assert_in_outer_scope(); x; })
+
+void igt_cleanup_fd(volatile int *fd);
+#define igt_fd_t(x__) \
+	volatile int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
+
+#endif /* IGT_TYPES_H */
diff --git a/lib/meson.build b/lib/meson.build
index 548835b5833f..c665bd25073a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -38,6 +38,7 @@ lib_sources = [
 	'igt_sysrq.c',
 	'igt_taints.c',
 	'igt_thread.c',
+	'igt_types.c',
 	'igt_vec.c',
 	'igt_vgem.c',
 	'igt_x86.c',
diff --git a/lib/tests/bad_subtest_type.c b/lib/tests/bad_subtest_type.c
new file mode 100644
index 000000000000..7f5efdfba8e2
--- /dev/null
+++ b/lib/tests/bad_subtest_type.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: MIT
+/*
+* Copyright © 2022 Intel Corporation
+*/
+
+#include "igt_core.h"
+#include "igt_types.h"
+
+igt_main
+{
+	igt_subtest("bad-scoped-variable") {
+		/*
+		 * Not allowed to nest a scoped variable inside a subtest as
+		 * we expect to longjmp out of the subtest on failure/skip
+		 * and automatic cleanup is not invoked for such jmps.
+		 */
+		igt_fd_t(f);
+	}
+}
diff --git a/lib/tests/igt_types.c b/lib/tests/igt_types.c
new file mode 100644
index 000000000000..2bd74df3a7d6
--- /dev/null
+++ b/lib/tests/igt_types.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: MIT
+/*
+* Copyright © 2022 Intel Corporation
+*/
+
+#include "igt_core.h"
+#include "igt_types.h"
+
+/* a lookalike of igt_fd_t for testing */
+#define scoped_int_t(x__) \
+	volatile int x__ cleanup_with(cleanup) = IGT_OUTER_SCOPE_INIT(-1)
+
+static int cleanup_called;
+
+static void cleanup(volatile int *x)
+{
+	cleanup_called++;
+	*x = -1;
+}
+
+static void delegate(void)
+{
+	scoped_int_t(x);
+
+	igt_fixture
+		x = 1;
+
+	igt_subtest("empty-subtest")
+		x = 2;
+
+	igt_fixture {
+		/* Check that we went through both blocks without cleanup */
+		igt_assert(!cleanup_called);
+		igt_assert(x == 2);
+	}
+}
+
+static void skip_delegate(void)
+{
+	scoped_int_t(x);
+
+	igt_fixture
+		x = 1;
+
+	igt_subtest("skipped-subtest") {
+		igt_skip("Early skip for testing\n");
+		x = 2; /* not reached due to lonjmp from igt_skip */
+	}
+
+	igt_fixture {
+		/* Check that we went through both blocks without cleanup */
+		igt_assert(!cleanup_called);
+		igt_assert(x == 1);
+	}
+}
+
+igt_main
+{
+	/* Basic check that scopes will call their destructor */
+	cleanup_called = 0;
+	igt_fixture {
+		scoped_int_t(x);
+	}
+	igt_subtest("cleanup-after-fixture")
+		igt_assert(cleanup_called);
+
+	/* But not before we go out of scope! */
+	cleanup_called = 0;
+	igt_subtest_group {
+		scoped_int_t(x);
+
+		igt_fixture {
+			x = 0xdeadbeef;
+		}
+
+		igt_subtest("cleanup-not-before-subtest-group") {
+			/* Check no scope destructor was called */
+			igt_assert(cleanup_called == 0);
+			/* Confirm that we did pass through a scoped block */
+			igt_assert_eq_u32(x, 0xdeadbeef);
+		}
+	}
+	igt_subtest("cleanup-after-subtest-group")
+		igt_assert(cleanup_called);
+
+	/* longjmp and __attribute__(cleanup) do not mix well together */
+#if 0 /* See bad_subtest_type, this is caught by an internal assertion */
+	cleanup_called = 0;
+	igt_subtest("skip-subtest") {
+		scoped_int_t(x);
+
+		igt_skip("Checking scoped cleanup on skip\n");
+	}
+	igt_subtest("cleanup-after-skip")
+		igt_assert_f(!cleanup_called,
+				"scoped closure was not compatible with igt_skip\n");
+#endif
+
+	/*
+	 * However, if we igt_skip inside another block (subtest-group), then we
+	 * will get cleanup on the outer scope.
+	 */
+	cleanup_called = 0;
+	igt_subtest_group {
+		scoped_int_t(x);
+
+		igt_subtest("skip-subtest-group")
+			igt_skip("Checking scoped cleanup after skip\n");
+	}
+	igt_subtest("cleanup-after-skip-group")
+		igt_assert(cleanup_called);
+
+	/* Check the same holds true for function calls */
+	cleanup_called = 0;
+	delegate();
+	igt_subtest("cleanup-after-delegation")
+		igt_assert(cleanup_called);
+
+	cleanup_called = 0;
+	igt_subtest_group
+		delegate();
+	igt_subtest("cleanup-after-group-delegation")
+		igt_assert(cleanup_called);
+
+	/* Check what happens with a igt_skip inside a function */
+	cleanup_called = 0;
+	skip_delegate();
+	igt_subtest("cleanup-after-skipped-delegation")
+		igt_assert(cleanup_called);
+
+	cleanup_called = 0;
+	igt_subtest_group
+		skip_delegate();
+	igt_subtest("cleanup-after-group-skipped-0delegation")
+		igt_assert(cleanup_called);
+}
diff --git a/lib/tests/meson.build b/lib/tests/meson.build
index ceaf548b2b2f..d5666c246146 100644
--- a/lib/tests/meson.build
+++ b/lib/tests/meson.build
@@ -19,10 +19,12 @@ lib_tests = [
 	'igt_stats',
 	'igt_subtest_group',
 	'igt_thread',
+	'igt_types',
 	'i915_perf_data_alignment',
 ]
 
 lib_fail_tests = [
+	'bad_subtest_type',
 	'igt_no_subtest',
 	'igt_simple_test_subtests',
 	'igt_timeout',
-- 
2.37.3
