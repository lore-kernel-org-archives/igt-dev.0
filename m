Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:44:46 +0200
Message-ID: <20230908104438.125454-26-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
References: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/17] lib/ktap: Don't ignore interrupt
 signals
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

While reading KTAP data from /dev/kmsg we now ignore interrupt signals
that may occur during read() and we continue reading the data.  No
explanation has been provided on what that could be needed for.

Always return with an error code to the caller when read() fails with
errno == EINTR, so igt_runner has no problems with killing us promptly
on timeout.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_ktap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 84fb13218f..3cfb55ec97 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -67,7 +67,7 @@ static int log_to_end(enum igt_log_level level, int fd,
 			}
 
 			if (errno == EINTR)
-				continue;
+				return -2;
 
 			if (errno == EPIPE) {
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
@@ -189,7 +189,7 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
 			}
 
 			if (errno == EINTR)
-				continue;
+				return -2;
 
 			if (errno == EPIPE) {
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
@@ -233,7 +233,7 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
 			}
 
 			if (errno == EINTR)
-				continue;
+				return -2;
 
 			if (errno == EPIPE) {
 				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
@@ -388,7 +388,7 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
 			}
 
 			if (errno == EINTR)
-				continue;
+				return -1;
 
 			if (errno == EAGAIN)
 				/* No records available */
@@ -541,7 +541,7 @@ igt_ktap_parser_start:
 			continue;
 
 		if (errno == EINTR)
-			continue;
+			goto igt_ktap_parser_end;
 
 		if (errno == EPIPE) {
 			igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
-- 
2.41.0
