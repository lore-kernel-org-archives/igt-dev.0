Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 15:42:57 +0200
Message-ID: <20230918134249.31645-26-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
References: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 07/17] lib/ktap: Drop checks for EINTR on
 read() failures
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

While reading KTAP data from /dev/kmsg we now ignore EINTR failures that
may occur during read() and we continue reading the data.  No explanation
has been provided on what that could be needed for.

Since we use default SIGINT signal handler, read() should never fail with
errno set to EINTR on user interrupt, only the whole process should be
terminated.  Drop checks for errno == EINTR as not applicable.

v2: Drop handling of EINTR completely, update commit message and
    descripion.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_ktap.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 84fb13218f..ce07f9aed7 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -66,9 +66,6 @@ static int log_to_end(enum igt_log_level level, int fd,
 				return -2;
 			}
 
-			if (errno == EINTR)
-				continue;
-
 			if (errno == EPIPE) {
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
 				return -2;
@@ -188,9 +185,6 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
 				return -2;
 			}
 
-			if (errno == EINTR)
-				continue;
-
 			if (errno == EPIPE) {
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
 				return -2;
@@ -232,9 +226,6 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
 				return -2;
 			}
 
-			if (errno == EINTR)
-				continue;
-
 			if (errno == EPIPE) {
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
 				return -2;
@@ -387,9 +378,6 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
 				return -1;
 			}
 
-			if (errno == EINTR)
-				continue;
-
 			if (errno == EAGAIN)
 				/* No records available */
 				continue;
@@ -540,9 +528,6 @@ igt_ktap_parser_start:
 			/* No records available */
 			continue;
 
-		if (errno == EINTR)
-			continue;
-
 		if (errno == EPIPE) {
 			igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
 			goto igt_ktap_parser_end;
-- 
2.41.0
