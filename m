Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E806EA30
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:42 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:10 -0800
Message-Id: <20191211005235.67897-5-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/29] Include <sys/wait.h>, <limits.h>,
 and <signal.h> where appropriate
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On FreeBSD, sys/wait.h is needed for WIFEXITED and friends,
limits.h is needed for PATH_MAX, and signal.h is needed for
SIGTERM and friends.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_eld.c                        | 1 +
 lib/tests/igt_describe.c             | 1 +
 lib/tests/igt_dynamic_subtests.c     | 1 +
 lib/tests/igt_exit_handler.c         | 1 +
 lib/tests/igt_fork.c                 | 1 +
 lib/tests/igt_invalid_subtest_name.c | 1 +
 lib/tests/igt_no_exit.c              | 1 +
 lib/tests/igt_tests_common.h         | 1 +
 runner/job_list.c                    | 1 +
 tests/i915/gem_exec_fence.c          | 1 +
 tests/perf.c                         | 1 +
 tools/intel_gvtg_test.c              | 1 +
 12 files changed, 12 insertions(+)

diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index ef6625df..d3144851 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -28,6 +28,7 @@
 #include <dirent.h>
 #include <errno.h>
 #include <glob.h>
+#include <limits.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
index 6f3a4319..d1103954 100644
--- a/lib/tests/igt_describe.c
+++ b/lib/tests/igt_describe.c
@@ -22,6 +22,7 @@
  */
 
 #include <sys/wait.h>
+#include <signal.h>
 #include <string.h>
 #include <stdlib.h>
 
diff --git a/lib/tests/igt_dynamic_subtests.c b/lib/tests/igt_dynamic_subtests.c
index 606104c5..8740827e 100644
--- a/lib/tests/igt_dynamic_subtests.c
+++ b/lib/tests/igt_dynamic_subtests.c
@@ -23,6 +23,7 @@
 
 #include <errno.h>
 #include <sys/wait.h>
+#include <signal.h>
 
 #include "igt_core.h"
 #include "drmtest.h"
diff --git a/lib/tests/igt_exit_handler.c b/lib/tests/igt_exit_handler.c
index 892a7f14..c1219e6b 100644
--- a/lib/tests/igt_exit_handler.c
+++ b/lib/tests/igt_exit_handler.c
@@ -25,6 +25,7 @@
 #include <fcntl.h>
 #include <sys/types.h>
 #include <sys/wait.h>
+#include <signal.h>
 #include "igt_core.h"
 #include "drmtest.h"
 
diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index 7e8b4f9b..a25f2edc 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -23,6 +23,7 @@
  */
 
 #include <errno.h>
+#include <signal.h>
 #include <stdint.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/lib/tests/igt_invalid_subtest_name.c b/lib/tests/igt_invalid_subtest_name.c
index 92e767ab..ed78a90c 100644
--- a/lib/tests/igt_invalid_subtest_name.c
+++ b/lib/tests/igt_invalid_subtest_name.c
@@ -23,6 +23,7 @@
 
 #include <errno.h>
 #include <sys/wait.h>
+#include <signal.h>
 
 #include "igt_core.h"
 #include "drmtest.h"
diff --git a/lib/tests/igt_no_exit.c b/lib/tests/igt_no_exit.c
index 82f00b52..58131828 100644
--- a/lib/tests/igt_no_exit.c
+++ b/lib/tests/igt_no_exit.c
@@ -26,6 +26,7 @@
  */
 
 #include <sys/wait.h>
+#include <signal.h>
 
 #include "drmtest.h"
 
diff --git a/lib/tests/igt_tests_common.h b/lib/tests/igt_tests_common.h
index e66ee37c..9b98e256 100644
--- a/lib/tests/igt_tests_common.h
+++ b/lib/tests/igt_tests_common.h
@@ -25,6 +25,7 @@
 #ifndef IGT_LIB_TESTS_COMMON_H
 #define IGT_LIB_TESTS_COMMON_H
 
+#include <sys/wait.h>
 #include <assert.h>
 
 /*
diff --git a/runner/job_list.c b/runner/job_list.c
index 93cede75..bc10a1bf 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -7,6 +7,7 @@
 #include <string.h>
 #include <sys/stat.h>
 #include <sys/types.h>
+#include <sys/wait.h>
 #include <unistd.h>
 
 #include "job_list.h"
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 0fc7301a..dc32967f 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -31,6 +31,7 @@
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <sys/signal.h>
+#include <signal.h>
 
 IGT_TEST_DESCRIPTION("Check that execbuf waits for explicit fences");
 
diff --git a/tests/perf.c b/tests/perf.c
index f5dd6051..e6b77b0d 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -33,6 +33,7 @@
 #include <sys/time.h>
 #include <sys/times.h>
 #include <sys/types.h>
+#include <sys/wait.h>
 #include <dirent.h>
 #include <time.h>
 #include <poll.h>
diff --git a/tools/intel_gvtg_test.c b/tools/intel_gvtg_test.c
index ad5ee6a6..ec185885 100644
--- a/tools/intel_gvtg_test.c
+++ b/tools/intel_gvtg_test.c
@@ -44,6 +44,7 @@
 #include <sys/ioctl.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <sys/wait.h>
 #include <string.h>
 #include <stdlib.h>
 #include <signal.h>
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
