Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015910E676
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 12:01:11 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 13:00:42 +0100
Message-Id: <20230404120042.146323-2-matthew.auld@intel.com>
In-Reply-To: <20230404120042.146323-1-matthew.auld@intel.com>
References: <20230404120042.146323-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/xe_query: fix vram_if_possible()
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

It looks like this is meant to return the per-GT VRAM bit of the passed
in GT. Currently this just returns the mask for all GTs. i.e if we ask
for gt1 we still get back the region mask for all GTs.

Reported-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_query.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 253164d6b..5856255bf 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -393,11 +393,7 @@ uint64_t vram_memory(int fd, int gt)
  */
 uint64_t vram_if_possible(int fd, int gt)
 {
-	uint64_t regions = all_memory_regions(fd);
-	uint64_t system_memory = regions & 0x1;
-	uint64_t vram = regions & (~0x1);
-
-	return vram ? vram : system_memory;
+	return vram_memory(fd, gt) ?: 0x1;
 }
 
 /**
-- 
2.39.2
