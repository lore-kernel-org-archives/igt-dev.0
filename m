Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F53010E06C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 23:54:06 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 15:43:12 -0800
Message-Id: <20231116234312.3045053-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel: Do not error on -ECANCELED in
 xe_vm tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In the hammer class of unbind tests in xe_vm, a thread is created that
submits jobs to an exec queue initialized on a VM page that is later
unbound.  Because of the unbind, a job is timing out and marking the
exec queue as "banned", which causes all subsequent job submissions to
report as -ECANCELED (-125).

This is expected behavior.  The test should not fail when this is the
case, so use __xe_exec instead of the error-sensitive xe_exec in
hammer_thread, ignoring -ECANCELED and catching all other errors
manually.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index f1ccd6c21d..d16bb45892 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1118,6 +1118,7 @@ static void *hammer_thread(void *tdata)
 	uint32_t exec_queue = xe_exec_queue_create(t->fd, t->vm, t->eci, 0);
 	int b;
 	int i = 0;
+	int err = 0;
 
 	sync[0].handle = syncobj_create(t->fd, 0);
 	pthread_barrier_wait(t->barrier);
@@ -1140,14 +1141,15 @@ static void *hammer_thread(void *tdata)
 		exec.address = batch_addr;
 		if (i % 32) {
 			exec.num_syncs = 0;
-			xe_exec(t->fd, &exec);
+			err = __xe_exec(t->fd, &exec);
 		} else {
 			exec.num_syncs = 1;
-			xe_exec(t->fd, &exec);
+			err = __xe_exec(t->fd, &exec);
 			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
 						INT64_MAX, 0, NULL));
 			syncobj_reset(t->fd, &sync[0].handle, 1);
 		}
+		igt_assert(!err || err == -ECANCELED);
 		++i;
 	}
 
-- 
2.25.1
