Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E5710E8D7
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 15:26:00 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_mmap: sanity check partial munmap
Date: Thu,  7 Dec 2023 15:25:46 +0000
Message-ID: <20231207152546.360422-1-matthew.auld@intel.com>
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

Make sure we have some basic coverage for partial munmap, since this can
lead to multiple vm_close calls per mmap, and therefore anything we do
in vm_close should be mirrored in vm_open, otherwise we should expect
explosions.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_mmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 63fdf46a8..8faacdb5c 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -57,7 +57,12 @@ test_mmap(int fd, uint32_t placement, uint32_t flags)
 
 	map = xe_bo_map(fd, bo, bo_size);
 	strcpy(map, "Write some data to the BO!");
+	munmap(map, bo_size);
 
+	/* Also try partial munmap */
+	map = xe_bo_map(fd, bo, bo_size);
+	munmap(map, bo_size/2);
+	strcpy(map + bo_size/2, "More data to the BO!");
 	munmap(map, bo_size);
 
 	gem_close(fd, bo);
-- 
2.43.0
