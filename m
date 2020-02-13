Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Dale B Stimson <dale.b.stimson@intel.com>
Date: Wed, 12 Feb 2020 17:28:39 -0800
Message-Id: <20200213012840.31472-5-dale.b.stimson@intel.com>
In-Reply-To: <20200213012840.31472-1-dale.b.stimson@intel.com>
References: <20200213012840.31472-1-dale.b.stimson@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v2 4/5] lib/igt_core.c - Introduce
 igt_exit_early()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Call igt_exit() after dealing with assumptions not valid for early calls.

In particular:

igt_exit() assumes that subtests have been considered for execution.
With --run-subtest, for an early exit (where subtests had not yet been
considered):
- igt_exit() would complain about "Unknown subtest"
- igt_exit() would exit prematurely.

Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
---
 lib/igt_core.c | 27 +++++++++++++++++++++++++++
 lib/igt_core.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 70465130c..78704b93a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2028,6 +2028,33 @@ void igt_exit(void)
 	exit(igt_exitcode);
 }
 
+/**
+ * igt_exit_early()
+ *
+ * Call igt_exit() after dealing with assumptions not valid for early calls.
+ *
+ * In particular:
+ * igt_exit() assumes that subtests have been considered for execution
+ * and complains if a subtest specified by --run-subtest was not executed.
+ * (The expectation is that the subtest would have been executed if it existed).
+ *
+ * In particular:
+ * igt_exit() assumes that subtests have been considered for execution.
+ * With --run-subtest, for an early exit (where subtests had not yet been
+ * considered):
+ * - igt_exit() would complain about "Unknown subtest"
+ * - igt_exit() would exit prematurely.
+ */
+void igt_exit_early(void)
+{
+	if (run_single_subtest) {
+		free(run_single_subtest);
+		run_single_subtest = NULL;
+	}
+
+	igt_exit();
+}
+
 /* fork support code */
 static int helper_process_count;
 static pid_t helper_process_pids[] =
diff --git a/lib/igt_core.h b/lib/igt_core.h
index c17a7ba81..a1fe4c361 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -500,6 +500,7 @@ void __igt_fail_assert(const char *domain, const char *file,
 		       const char *format, ...)
 	__attribute__((noreturn));
 void igt_exit(void) __attribute__((noreturn));
+void igt_exit_early(void) __attribute__((noreturn));
 void igt_fatal_error(void) __attribute__((noreturn));
 
 /**
-- 
2.25.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
