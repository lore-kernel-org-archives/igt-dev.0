Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE81510E5C1
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:15:47 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:15 +0200
Message-Id: <20230712171231.290555-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 05/21] tests/api_intel_allocator: Don't
 use allocator ahnd aliasing api
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

There's no tests (apart this one) which are using aliasing ahnd
- intel_allocator_open_vm_as(). Additionally it is problematic
on adopting allocator to xe where I need to track allocations
to support easy vm binding. Let's adopt "open-vm" to not to use
this api.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/api_intel_allocator.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index b7e3efb87f..77c2d25e83 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -612,32 +612,27 @@ static void reopen_fork(int fd)
 
 static void open_vm(int fd)
 {
-	uint64_t ahnd[4], offset[4], size = 0x1000;
+	uint64_t ahnd[3], offset[3], size = 0x1000;
 	int i, n = ARRAY_SIZE(ahnd);
 
 	ahnd[0] = intel_allocator_open_vm(fd, 1, INTEL_ALLOCATOR_SIMPLE);
 	ahnd[1] = intel_allocator_open_vm(fd, 1, INTEL_ALLOCATOR_SIMPLE);
-	ahnd[2] = intel_allocator_open_vm_as(ahnd[1], 2);
-	ahnd[3] = intel_allocator_open(fd, 3, INTEL_ALLOCATOR_SIMPLE);
+	ahnd[2] = intel_allocator_open(fd, 2, INTEL_ALLOCATOR_SIMPLE);
 
 	offset[0] = intel_allocator_alloc(ahnd[0], 1, size, 0);
 	offset[1] = intel_allocator_alloc(ahnd[1], 2, size, 0);
 	igt_assert(offset[0] != offset[1]);
 
-	offset[2] = intel_allocator_alloc(ahnd[2], 3, size, 0);
-	igt_assert(offset[0] != offset[2] && offset[1] != offset[2]);
-
-	offset[3] = intel_allocator_alloc(ahnd[3], 1, size, 0);
-	igt_assert(offset[0] == offset[3]);
+	offset[2] = intel_allocator_alloc(ahnd[2], 1, size, 0);
+	igt_assert(offset[0] == offset[2]);
 
 	/*
-	 * As ahnd[0-2] lead to same allocator check can we free all handles
+	 * As ahnd[0-1] lead to same allocator check we can free all handles
 	 * using selected ahnd.
 	 */
-	intel_allocator_free(ahnd[0], 1);
-	intel_allocator_free(ahnd[0], 2);
-	intel_allocator_free(ahnd[0], 3);
-	intel_allocator_free(ahnd[3], 1);
+	igt_assert_eq(intel_allocator_free(ahnd[0], 1), true);
+	igt_assert_eq(intel_allocator_free(ahnd[1], 2), true);
+	igt_assert_eq(intel_allocator_free(ahnd[2], 1), true);
 
 	for (i = 0; i < n - 1; i++)
 		igt_assert_eq(intel_allocator_close(ahnd[i]), (i == n - 2));
-- 
2.34.1
