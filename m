Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A970D10E218
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 12:01:10 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 13:00:41 +0100
Message-Id: <20230404120042.146323-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/xe_query: fix vram_memory()
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

It looks like this is meant to return VRAM if supported. If we call this
on igpu it should return zero. There is at least one user relying on
this in xe_mmap@vram, where we want to skip if the mask here is zero.

Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 24a258a5e..253164d6b 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -380,7 +380,7 @@ uint64_t vram_memory(int fd, int gt)
 	igt_assert(xe_dev);
 	igt_assert(gt >= 0 && gt < xe_dev->number_gt);
 
-	return native_region_for_gt(xe_dev->gts, gt);
+	return native_region_for_gt(xe_dev->gts, gt) & (~0x1);
 }
 
 /**
-- 
2.39.2
