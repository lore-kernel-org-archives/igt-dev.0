Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B8A10E206
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 19:43:10 +0000 (UTC)
From: Brian Welty <brian.welty@intel.com>
To: igt-dev@lists.freedesktop.org,
	Pallavi Mishra <pallavi.mishra@intel.com>
Date: Mon,  4 Dec 2023 11:43:06 -0800
Message-Id: <20231204194306.12950-3-brian.welty@intel.com>
In-Reply-To: <20231204194306.12950-1-brian.welty@intel.com>
References: <20231204194306.12950-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel/xe_exec_reset: Fix
 cm-gt-reset
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

With use of GT_RESET and forcing GT reset, it is expected for the
xe_wait_ufence to expire. Move the assertion checking into the IGT
by using __xe_wait_ufence().
In addition, we cannot validate the exec operation was successful
for GT_RESET case.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 tests/intel/xe_exec_reset.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 195e62911f..d322cf4bdd 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -612,16 +612,27 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		return;
 	}
 
-	for (i = 1; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       NULL, THREE_SEC);
+	for (i = 1; i < n_execs; i++) {
+		int64_t timeout = THREE_SEC;
+		int err;
+
+		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				       NULL, &timeout);
+		if (flags & GT_RESET)
+			/* exec races with reset: may timeout or complete */
+			igt_assert(err == -ETIME || !err);
+		else
+			igt_assert_eq(err, 0);
+	}
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
 
-	for (i = 1; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & GT_RESET)) {
+		for (i = 1; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
+	}
 
 	for (i = 0; i < n_exec_queues; i++)
 		xe_exec_queue_destroy(fd, exec_queues[i]);
-- 
2.38.0
