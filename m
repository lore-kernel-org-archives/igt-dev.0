Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3210E557
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 22:07:32 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 15:07:27 -0700
Message-Id: <20230615220727.552-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_vm: Initialize variable in
 test_bind_array()
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

Initialize bind_ops array to 0 in test_bind_array() function.

This addresses the vm_bind ioctl failure with below dmesg error.
"[drm] Ioctl argument check failed at drivers/gpu/drm/xe/xe_vm.c:2955: (*bind_ops)[i].pad"

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 861822b48..819dbaab7 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -875,7 +875,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	};
 	uint32_t engine, bind_engine = 0;
 #define BIND_ARRAY_MAX_N_EXEC	16
-	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_MAX_N_EXEC];
+	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_MAX_N_EXEC] = { };
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct {
-- 
2.21.0.rc0.32.g243a4c7e27
