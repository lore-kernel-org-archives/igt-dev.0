Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532E210E169
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jan 2024 03:23:06 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_compute_mode: Fix non-blocking
 subtest
Date: Mon, 15 Jan 2024 08:49:42 +0530
Message-Id: <20240115031942.29658-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Fix submission of exec, Call exec ioctl sperately instead existing
igt wrapper _xe_exec which leads to infinite loop even kernel throws an
error.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 6ebfa1a86..473b11ae9 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -15,6 +15,7 @@
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
+#include <sys/ioctl.h>
 #include "xe_drm.h"
 
 #include "xe/xe_ioctl.h"
@@ -320,7 +321,7 @@ static void non_block(int fd, int expect)
 		uint32_t data;
 		uint64_t exec_sync;
 	} *data = NULL;
-	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
+	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_engine *engine;
 	uint64_t batch_offset = (char *)&data[EXEC_DATA].batch - (char *)data;
 	uint64_t batch_addr = addr + batch_offset;
@@ -350,6 +351,7 @@ static void non_block(int fd, int expect)
 	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
 	data[VM_DATA].vm_sync = 0;
 
+	spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
 	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
 	sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
 	exec.exec_queue_id = exec_queue;
@@ -358,11 +360,11 @@ static void non_block(int fd, int expect)
 	xe_spin_wait_started(&data[SPIN_DATA].spin);
 
 	b = 0;
-	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-	data[0].batch[b++] = sdi_addr;
-	data[0].batch[b++] = sdi_addr >> 32;
-	data[0].batch[b++] = value;
-	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	data[EXEC_DATA].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[EXEC_DATA].batch[b++] = sdi_addr;
+	data[EXEC_DATA].batch[b++] = sdi_addr >> 32;
+	data[EXEC_DATA].batch[b++] = value;
+	data[EXEC_DATA].batch[b++] = MI_BATCH_BUFFER_END;
 	igt_assert(b <= ARRAY_SIZE(data->batch));
 
 	sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
@@ -371,12 +373,15 @@ static void non_block(int fd, int expect)
 	exec.address = batch_addr;
 
 	while (1) {
-		err = __xe_exec(fd, &exec);
 
-		if (err == -EWOULDBLOCK)
+		err = ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+
+		if (err == -1 && errno == EWOULDBLOCK)
 			break;
+
+		igt_assert_eq(err, 0);
 	}
-	igt_assert_eq(err, expect);
+	igt_assert_eq(errno, expect);
 
 	xe_spin_end(&data[SPIN_DATA].spin);
 	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
@@ -454,7 +459,7 @@ igt_main
 	}
 
 	igt_subtest("non-blocking")
-		non_block(fd, -EWOULDBLOCK);
+		non_block(fd, EWOULDBLOCK);
 
 
 	igt_fixture
-- 
2.39.1
