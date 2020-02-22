Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DB16E907
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Feb 2020 17:05:14 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 22 Feb 2020 17:05:06 +0000
Message-Id: <20200222170506.3003366-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rpm: Show the slowest debugfs
 read
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

Show which debugfs file takes longest to read and suspend afterwards.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/i915_pm_rpm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 36416a9db..5b51bb273 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -931,15 +931,24 @@ static void i2c_subtest(void)
 	enable_one_screen(&ms_data);
 }
 
+struct read_entry_elapsed {
+	uint64_t elapsed;
+	char *path;
+} max_read_entry;
+
 static int read_entry(const char *filepath,
 		      const struct stat *info,
 		      const int typeflag,
 		      struct FTW *pathinfo)
 {
+	struct timespec tv = {};
+	uint64_t elapsed;
 	char buf[4096];
 	int fd;
 	int rc;
 
+	igt_nsec_elapsed(&tv);
+
 	igt_assert_f(is_suspended(), "Before opening: %s (%s)\n",
 		     filepath + pathinfo->base, filepath);
 
@@ -958,13 +967,29 @@ static int read_entry(const char *filepath,
 	igt_assert_f(wait_for_suspended(), "After closing: %s (%s)\n",
 		     filepath + pathinfo->base, filepath);
 
+	elapsed = igt_nsec_elapsed(&tv);
+	if (elapsed > max_read_entry.elapsed) {
+		max_read_entry.elapsed = elapsed;
+		free(max_read_entry.path);
+		max_read_entry.path = strdup(filepath);
+	}
+
 	return 0;
 }
 
 static void walk_fs(char *path)
 {
+	max_read_entry.elapsed = 0;
+
 	disable_all_screens_and_wait(&ms_data);
 	nftw(path, read_entry, 20, FTW_PHYS | FTW_MOUNT);
+
+	if (max_read_entry.path) {
+		igt_info("Slowest file + suspend: %s took %.2fms\n",
+			 max_read_entry.path, max_read_entry.elapsed * 1e-6);
+		free(max_read_entry.path);
+		max_read_entry.path = NULL;
+	}
 }
 
 /* This test will probably pass, with a small chance of hanging the machine in
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
