Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0310E955
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 21:00:23 +0000 (UTC)
From: Brian Welty <brian.welty@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 13:00:13 -0800
Message-Id: <20231201210013.16147-3-brian.welty@intel.com>
In-Reply-To: <20231201210013.16147-1-brian.welty@intel.com>
References: <20231201210013.16147-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe/exec_reset: Fix cm-gt-reset
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
by using _xe_wait_ufence().

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 tests/intel/xe_exec_reset.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 195e62911f..6fed0dd19e 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -612,9 +612,14 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		return;
 	}
 
-	for (i = 1; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       NULL, THREE_SEC);
+	for (i = 1; i < n_execs; i++) {
+		int64_t timeout = THREE_SEC;
+		int err;
+
+		err = _xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				      NULL, &timeout);
+		igt_assert_eq(err, flags & GT_RESET ? -ETIME : 0);
+	}
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-- 
2.38.0
