Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334EB10E0EE
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 08:22:06 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Apr 2023 09:21:57 +0100
Message-Id: <20230406082157.258722-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib/xe_query: fix vram_memory() and
 vram_if_possible()
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

vram_memory() is meant to return VRAM if supported. If we call this on
igpu it should return zero. There is at least one user relying on this
in xe_mmap@vram, where we want to skip if the mask here is zero.

vram_if_possible() should account for the per GT VRAM when returning
the mask. Currently it just returns the mask for all VRAM instances.

v2 (Niranjana):
  - Squash into a single patch
  - Fold in the differences from the version by Matt Brost & Zbigniew

Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_query.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 24a258a5e..2b627a78a 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -380,7 +380,7 @@ uint64_t vram_memory(int fd, int gt)
 	igt_assert(xe_dev);
 	igt_assert(gt >= 0 && gt < xe_dev->number_gt);
 
-	return native_region_for_gt(xe_dev->gts, gt);
+	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gts, gt) : 0;
 }
 
 /**
@@ -393,11 +393,7 @@ uint64_t vram_memory(int fd, int gt)
  */
 uint64_t vram_if_possible(int fd, int gt)
 {
-	uint64_t regions = all_memory_regions(fd);
-	uint64_t system_memory = regions & 0x1;
-	uint64_t vram = regions & (~0x1);
-
-	return vram ? vram : system_memory;
+	return vram_memory(fd, gt) ?: system_memory(fd);
 }
 
 /**
-- 
2.39.2
