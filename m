Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9B510E0A1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 14:54:22 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 16:54:08 +0200
Message-Id: <20230418145408.39730-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Fall back to no
 scheduling policy if SCHED_FIFO unavailable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Petri Latvala <petri.latvala@intel.com>

From: Petri Latvala <petri.latvala@intel.com>

If pthread_create with SCHED_FIFO fails, try creating the thread
without a policy before bailing out.

Cc: Petri Latvala <adrinael@adrinael.net>
Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_dummyload.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index b3dc18ee7..740a58f3d 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -528,6 +528,7 @@ void igt_spin_set_timeout(igt_spin_t *spin, int64_t ns)
 	struct itimerspec its;
 	pthread_attr_t attr;
 	int timerfd;
+	int err;
 
 	if (!spin)
 		return;
@@ -547,8 +548,13 @@ void igt_spin_set_timeout(igt_spin_t *spin, int64_t ns)
 	pthread_attr_setschedpolicy(&attr, SCHED_FIFO);
 	pthread_attr_setschedparam(&attr, &param);
 
-	igt_assert(pthread_create(&spin->timer_thread, &attr,
-				  timer_thread, spin) == 0);
+	err = pthread_create(&spin->timer_thread, &attr, timer_thread, spin);
+	if (err) {
+		igt_debug("Cannot create thread with SCHED_FIFO (%s), trying without scheduling policy...\n",
+			  strerror(err));
+		igt_assert_eq(pthread_create(&spin->timer_thread, NULL,
+					     timer_thread, spin), 0);
+	}
 	pthread_attr_destroy(&attr);
 
 	memset(&its, 0, sizeof(its));
-- 
2.37.2
