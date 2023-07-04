Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2798610E0FF
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 05:28:12 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: krishnaiah.bommu@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Tue,  4 Jul 2023 10:57:17 +0530
Message-Id: <20230704052717.664717-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe/xe_mmap: Optimise code to use xe_bo_mmap
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

Optimise code to use xe_bo_mmap.

Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_mmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 664ed54fc..7fe8f73a4 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -46,11 +46,8 @@ test_mmap(int fd, uint32_t flags)
 	igt_require_f(flags, "Device doesn't support such memory region\n");
 
 	bo = xe_bo_create_flags(fd, 0, 4096, flags);
-	mmo = xe_bo_mmap_offset(fd, bo);
-
-	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
-	igt_assert(map != MAP_FAILED);
 
+	map = xe_bo_map(fd, bo, 4096);
 	strcpy(map, "Write some data to the BO!");
 
 	munmap(map, 4096);
-- 
2.25.1
