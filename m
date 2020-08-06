Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  6 Aug 2020 16:19:38 +0100
Message-Id: <20200806151938.198105-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] syncobj_timeline: Tell the compiler to read
 from the thread
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

32bits-limit waits for the thread to indicate it has started by busy
spinning on a common variable. The compiler is clever and knows that the
variable cannot change within the thread, and turns it into an infinite
loop!

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/syncobj_timeline.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index be7dd2d1c..20375cdd3 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -1245,9 +1245,11 @@ test_32bits_limit(int fd)
 	uint64_t value, last_value;
 	int i;
 
-	igt_assert_eq(pthread_create(&thread, NULL, checker_thread_func, &thread_data), 0);
+	igt_assert_eq(pthread_create(&thread, NULL,
+				     checker_thread_func, &thread_data), 0);
 
-	while (!thread_data.started);
+	while (!READ_ONCE(thread_data.started))
+		;
 
 	for (i = 0; i < ARRAY_SIZE(points); i++) {
 		int fence = sw_sync_timeline_create_fence(timeline, i + 1);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
