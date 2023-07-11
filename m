Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9744510E350
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 09:37:24 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, janga.rahul.kumar@intel.com,
 igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 15:06:02 +0530
Message-Id: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe/xe_create: Modify massive test
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Fix Modify invalid massive test issue.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_create.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index f893381d9..2e29efc90 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -200,7 +200,7 @@ static void create_massive_size(int fd)
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 
 	xe_for_each_mem_region(fd, memreg, region) {
-		ret = __create_bo(fd, vm, -1ULL >> 32, region, &handle);
+		ret = __create_bo(fd, vm, -1ULL << 32, region, &handle);
 		igt_assert_eq(ret, -ENOSPC);
 	}
 }
-- 
2.25.1
