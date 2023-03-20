Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D977710E5ED
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 16:33:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Mar 2023 17:32:59 +0100
Message-Id: <20230320163259.67310-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/xe_query: Recover original vram_*
 macros semantics
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

On multi tile vram_possible() semantics was changed what was wrong
and must be recover.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_query.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 1835232804..4598c0d5a1 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -356,13 +356,9 @@ uint64_t system_memory(int fd)
  */
 uint64_t vram_memory(int fd, int gt)
 {
-	struct xe_device *xe_dev;
-
-	xe_dev = find_in_cache(fd);
-	igt_assert(xe_dev);
-	igt_assert(gt >= 0 && gt < xe_dev->number_gt);
+	uint64_t regions = all_memory_regions(fd);
 
-	return native_region_for_gt(xe_dev->gts, gt);
+	return regions & (0x2 << gt);
 }
 
 /**
@@ -375,11 +371,10 @@ uint64_t vram_memory(int fd, int gt)
  */
 uint64_t vram_if_possible(int fd, int gt)
 {
-	uint64_t regions = all_memory_regions(fd);
-	uint64_t system_memory = regions & 0x1;
-	uint64_t vram = regions & (~0x1);
+	uint64_t smemory = system_memory(fd);
+	uint64_t vram = vram_memory(fd, gt);
 
-	return vram ? vram : system_memory;
+	return vram ? vram : smemory;
 }
 
 /**
-- 
2.34.1
