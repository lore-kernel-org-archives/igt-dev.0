Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 14:32:44 +0200
Message-ID: <20230908123233.137134-29-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/17] lib/ktap: Read /dev/kmsg in
 blocking mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We obtain KTAP report from /dev/kmsg.  That file is now opened from
igt_ktest_begin(), a function originally designed for i915 selftests and
now reused with kunit tests.  The original intention of opening that file
was to dump kernel messages to stderr on selftest error.  For that
purpose, the file is now opened in non-blocking mode so we don't end up
waiting for more kernel messages than already available.  Since our ktap
parser code reuses the file descriptor, we now have to loop over
EAGAIN responses, waiting for more KTAP data.  Since we have no sleeps
inside those loops, extremely high CPU usage can be observed.

Simplify reading KTAP reports by first switching the file descriptor back
to blocking mode.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c |  7 ++++-
 lib/igt_ktap.c | 81 ++++++++++++++------------------------------------
 2 files changed, 28 insertions(+), 60 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index fb0bd21ee5..020df286b8 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -24,6 +24,7 @@
 #include <ctype.h>
 #include <signal.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <sys/utsname.h>
 
 #include "igt_aux.h"
@@ -758,12 +759,16 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 {
 	struct kmod_module *kunit_kmod;
 	bool is_builtin;
-	int ret;
 	struct ktap_test_results *results;
 	struct ktap_test_results_element *temp;
+	int flags, ret;
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
 
+	flags = fcntl(tst->kmsg, F_GETFL, 0) & ~O_NONBLOCK;
+	igt_skip_on_f(fcntl(tst->kmsg, F_SETFL, flags) == -1,
+		      "Could not set /dev/kmsg to blocking mode\n");
+
 	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
 
 	igt_skip_on(kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod));
diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index fe77b62680..165f6b2cce 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -59,20 +59,12 @@ static int log_to_end(enum igt_log_level level, int fd,
 	while (*lend == '\0') {
 		igt_log(IGT_LOG_DOMAIN, level, "%s", record);
 
-		while (read(fd, record, BUF_LEN) < 0) {
-			if (errno == EINTR)
-				return -2;
-
-			if (errno == EPIPE) {
+		if (read(fd, record, BUF_LEN) < 0) {
+			if (errno == EPIPE)
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
-				return -2;
-			}
+			else if (errno != EINTR)
+				igt_warn("an error occurred while reading kmsg: %m\n");
 
-			if (errno == EAGAIN)
-				/* No records available */
-				continue;
-
-			igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -2;
 		}
 
@@ -176,20 +168,12 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
 		return -1;
 
 	if (is_builtin) {
-		while (read(fd, record, BUF_LEN) < 0) {
-			if (errno == EINTR)
-				return -2;
-
-			if (errno == EPIPE) {
+		if (read(fd, record, BUF_LEN) < 0) {
+			if (errno == EPIPE)
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
-				return -2;
-			}
+			else if (errno != EINTR)
+				igt_warn("an error occurred while reading kmsg: %m\n");
 
-			if (errno == EAGAIN)
-				/* No records available */
-				continue;
-
-			igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -2;
 		}
 	}
@@ -215,20 +199,12 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
 		if (cutoff)
 			cutoff[0] = '\0';
 
-		while (read(fd, record, BUF_LEN) < 0) {
-			if (errno == EINTR)
-				return -2;
-
-			if (errno == EPIPE) {
+		if (read(fd, record, BUF_LEN) < 0) {
+			if (errno == EPIPE)
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
-				return -2;
-			}
+			else if (errno != EINTR)
+				igt_warn("unknown error reading kmsg (%m)\n");
 
-			if (errno == EAGAIN)
-				/* No records available */
-				continue;
-
-			igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -2;
 		}
 
@@ -365,20 +341,12 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
 	char base_test_name_for_next_level[BUF_LEN + 1];
 
 	for (int i = 0; i < test_count; i++) {
-		while (read(fd, record, BUF_LEN) < 0) {
-			if (errno == EINTR)
-				return -1;
-
-			if (errno == EAGAIN)
-				/* No records available */
-				continue;
-
-			if (errno == EPIPE) {
+		if (read(fd, record, BUF_LEN) < 0) {
+			if (errno == EPIPE)
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
-				return -1;
-			}
+			else if (errno != EINTR)
+				igt_warn("error reading kmsg (%m)\n");
 
-			igt_warn("kmsg truncated: unknown error (%m)\n");
 			return -1;
 		}
 
@@ -506,18 +474,13 @@ igt_ktap_parser_start:
 	test_name[0] = '\0';
 	test_name[BUF_LEN] = '\0';
 
-	while (read(fd, record, BUF_LEN) < 0) {
-		if (errno == EAGAIN)
-			/* No records available */
-			continue;
-
-		if (errno == EINTR)
-			goto igt_ktap_parser_end;
-
-		if (errno == EPIPE) {
+	if (read(fd, record, BUF_LEN) < 0) {
+		if (errno == EPIPE)
 			igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
-			goto igt_ktap_parser_end;
-		}
+		else if (errno != EINTR)
+			igt_warn("error reading kmsg (%m)\n");
+
+		goto igt_ktap_parser_end;
 	}
 
 	test_count = find_next_tap_subtest(fd, record, test_name, is_builtin);
-- 
2.41.0
