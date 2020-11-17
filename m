Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA24C89DE3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 22:35:15 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 17 Nov 2020 22:35:07 +0000
Message-Id: <20201117223507.1970938-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_flink_race: Show range of races
 between threads
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

As processor counts steadily increase, showing the number of cycles in
every thread is less interesting than the shape of the overall
distribution, which is what was important.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_flink_race.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
index c1f5d5d51..000f6ed67 100644
--- a/tests/i915/gem_flink_race.c
+++ b/tests/i915/gem_flink_race.c
@@ -24,7 +24,6 @@
  *    Daniel Vetter <daniel.vetter@ffwll.ch>
  */
 
-#include "igt.h"
 #include <sys/ioctl.h>
 #include <stdlib.h>
 #include <string.h>
@@ -33,6 +32,8 @@
 #include <pthread.h>
 #include <errno.h>
 
+#include "igt.h"
+#include "igt_stats.h"
 #include "intel_bufmgr.h"
 
 IGT_TEST_DESCRIPTION("Check for flink/open vs. gem close races.");
@@ -83,9 +84,8 @@ static void test_flink_name(int timeout)
 	struct flink_name *threads;
 	int r, i, num_threads;
 	unsigned long count;
-	char buf[256];
+	igt_stats_t stats;
 	void *status;
-	int len;
 
 	num_threads = sysconf(_SC_NPROCESSORS_ONLN) - 1;
 	if (!num_threads)
@@ -114,14 +114,18 @@ static void test_flink_name(int timeout)
 
 	pls_die = 1;
 
-	len = snprintf(buf, sizeof(buf), "Completed %lu cycles with [", count);
+	igt_stats_init_with_size(&stats, num_threads);
 	for (i = 0;  i < num_threads; i++) {
 		pthread_join(threads[i].thread, &status);
 		igt_assert(status == 0);
-		len += snprintf(buf + len, sizeof(buf) - len, "%lu, ", threads[i].count);
+		igt_stats_push(&stats, threads[i].count);
 	}
-	snprintf(buf + len - 2, sizeof(buf) - len + 2, "] races");
-	igt_info("%s\n", buf);
+	igt_info("Completed %lu cycles with a median of %.0f [%"PRIu64", %"PRIu64"] races",
+		 count,
+		 igt_stats_get_median(&stats),
+		 igt_stats_get_min(&stats),
+		 igt_stats_get_max(&stats));
+	igt_stats_fini(&stats);
 
 	close(fd);
 }
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
