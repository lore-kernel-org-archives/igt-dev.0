Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D95E10E171
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:34:07 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Apr 2023 12:33:58 +0200
Message-Id: <20230403103359.165928-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230403103359.165928-1-zbigniew.kempczynski@intel.com>
References: <20230403103359.165928-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] xe/xe_create: Use system configuration
 page size
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

During the review Maarten asked to use _SC_PAGESIZE, unfortunately
this left on branch I didn't merge. Fix this to be page size
independent.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/xe/xe_create.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index ae841f8092..74833639f4 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -50,6 +50,7 @@ static void create_invalid_size(int fd)
 {
 	struct drm_xe_query_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(fd), region;
+	const uint32_t page_size = sysconf(_SC_PAGESIZE);
 	uint32_t vm;
 	uint32_t handle;
 	int ret;
@@ -72,9 +73,9 @@ static void create_invalid_size(int fd)
 		 * second try, add page size to min page size if it is
 		 * bigger than page size.
 		 */
-		if (memregion->min_page_size > PAGE_SIZE) {
+		if (memregion->min_page_size > page_size) {
 			ret = __create_bo(fd, vm,
-					  memregion->min_page_size + PAGE_SIZE,
+					  memregion->min_page_size + page_size,
 					  region, &handle);
 			if (!ret) {
 				gem_close(fd, handle);
-- 
2.34.1
