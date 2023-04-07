Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC6E10E090
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Apr 2023 11:40:33 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Apr 2023 13:40:16 +0200
Message-Id: <20230407114016.28728-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_vm: Do not assert uninitalized
 variable
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

test_munmap_style_unbind() used wrong, uninitialized variable
in assert of mmap result. That could lead to unextpected failure.
Use correct one.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index ce770f2a9..c09b9714b 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1331,7 +1331,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		map = mmap(from_user_pointer(addr), bo_size, PROT_READ |
 			    PROT_WRITE, MAP_SHARED | MAP_FIXED |
 			    MAP_ANONYMOUS, -1, 0);
-		igt_assert(data != MAP_FAILED);
+		igt_assert(map != MAP_FAILED);
 	} else {
 		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
 		map = xe_bo_map(fd, bo, bo_size);
-- 
2.34.1
