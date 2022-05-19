Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D38A10F474
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 12:23:51 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 19 May 2022 14:23:45 +0200
Message-Id: <20220519122345.386119-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20220519122345.386119-1-mauro.chehab@linux.intel.com>
References: <20220519122345.386119-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] benchmarks/gem_syslatency: make
 realtime mode optional
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Use a logic similar to the one at gem_latency in order to setup
the device to realtime, as, depending on the Kernel and on
CGroup settings, trying to setup realtime may return EPERM.
For more details, see:

	https://www.kernel.org/doc/html/latest/scheduler/sched-rt-group.html?highlight=cgroup%20realtime

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 benchmarks/gem_syslatency.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 4b097e1c9316..db95cbcc6048 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -47,6 +47,8 @@
 #include "i915/gem_create.h"
 #include "i915/gem_ring.h"
 
+#define REALTIME	0x1
+
 #define sigev_notify_thread_id _sigev_un._tid
 
 static volatile int done;
@@ -234,7 +236,7 @@ static void bind_cpu(pthread_attr_t *attr, int cpu)
 static void rtprio(pthread_attr_t *attr, int prio)
 {
 #ifdef PTHREAD_EXPLICIT_SCHED
-	struct sched_param param = { .sched_priority = 99 };
+	struct sched_param param = { .sched_priority = prio };
 	pthread_attr_setinheritsched(attr, PTHREAD_EXPLICIT_SCHED);
 	pthread_attr_setschedpolicy(attr, SCHED_FIFO);
 	pthread_attr_setschedparam(attr, &param);
@@ -344,6 +346,7 @@ int main(int argc, char **argv)
 	pthread_t bg_fs = 0;
 	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_stats_t cycles, mean, max;
+	unsigned flags = 0;
 	double min;
 	int time = 10;
 	int field = -1;
@@ -353,7 +356,7 @@ int main(int argc, char **argv)
 	long batch = 0;
 	int ret, n, c;
 
-	while ((c = getopt(argc, argv, "r:t:f:bmni1")) != -1) {
+	while ((c = getopt(argc, argv, "r:t:f:bmni1R")) != -1) {
 		switch (c) {
 		case '1':
 			ncpus = 1;
@@ -374,6 +377,10 @@ int main(int argc, char **argv)
 			/* Duration of each batch (microseconds) */
 			batch = atoi(optarg);
 			break;
+		case 'R':
+			/* Run the producers at RealTime priority */
+			flags |= REALTIME;
+			break;
 		case 'f':
 			/* Select an output field */
 			field = atoi(optarg);
@@ -419,7 +426,8 @@ int main(int argc, char **argv)
 
 	wait = calloc(ncpus, sizeof(*wait));
 	pthread_attr_init(&attr);
-	rtprio(&attr, 99);
+	if (flags & REALTIME)
+		rtprio(&attr, 99);
 	for (n = 0; n < ncpus; n++) {
 		igt_mean_init(&wait[n].mean);
 		bind_cpu(&attr, n);
-- 
2.36.1
