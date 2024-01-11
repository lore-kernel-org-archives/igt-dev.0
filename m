Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB7210E7D7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 06:24:59 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 1/3] tests/xe_waitfence: Rename invalid_engine to
 invalid-exec_queue
Date: Thu, 11 Jan 2024 11:55:16 +0530
Message-Id: <20240111062518.393544-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20240111062518.393544-1-krishnaiah.bommu@intel.com>
References: <20240111062518.393544-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Rename invalid_engine to invalid-exec_queue subtest and changed return value
as per kernel implementation.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_waitfence.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 7ba20764c..fd515a151 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -151,8 +151,8 @@ waitfence(int fd, enum waittype wt)
  * SUBTEST: invalid-ops
  * Description: Check query with invalid ops returns expected error code
  *
- * SUBTEST: invalid-engine
- * Description: Check query with invalid engine info returns expected error code
+ * SUBTEST: invalid-exec_queue
+ * Description: Check query with invalid exec_queue info returns expected error code
  *
  * SUBTEST: exec_queue-reset-wait
  * Description: Don’t wait till timeout on user fence when exec_queue reset is detected and return return proper error
@@ -207,7 +207,7 @@ invalid_ops(int fd)
 }
 
 static void
-invalid_engine(int fd)
+invalid_exec_queue(int fd)
 {
 	uint32_t bo;
 
@@ -218,7 +218,7 @@ invalid_engine(int fd)
 		.value = 1,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = -1,
-		.exec_queue_id = 0,
+		.exec_queue_id = -1,
 	};
 
 	uint32_t vm = xe_vm_create(fd, 0, 0);
@@ -227,7 +227,7 @@ invalid_engine(int fd)
 
 	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
 
-	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EFAULT);
+	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, ENOENT);
 }
 
 static void
@@ -329,8 +329,8 @@ igt_main
 	igt_subtest("invalid-ops")
 		invalid_ops(fd);
 
-	igt_subtest("invalid-engine")
-		invalid_engine(fd);
+	igt_subtest("invalid-exec_queue")
+		invalid_exec_queue(fd);
 
 	igt_subtest("exec_queue-reset-wait")
 		exec_queue_reset_wait(fd);
-- 
2.25.1
