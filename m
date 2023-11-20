Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A09E10E20E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 18:25:04 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 18:24:26 +0000
Message-ID: <20231120182430.88753-12-matthew.auld@intel.com>
In-Reply-To: <20231120182430.88753-1-matthew.auld@intel.com>
References: <20231120182430.88753-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 11/15] lib/intel_allocator: treat
 default_alignment as the minimum
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

If something overrides the default alignment, we should only apply the
alignment if it is larger than the default_alignment.

v2 (Niranjana):
  - Simplify slightly
v3:
  - Also update the default-alignment testcase

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_allocator.c             | 4 ++--
 tests/intel/api_intel_allocator.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 01e025b46..341db2a50 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -584,8 +584,8 @@ static int handle_request(struct alloc_req *req, struct alloc_resp *resp)
 			break;
 
 		case REQ_ALLOC:
-			if (!req->alloc.alignment)
-				req->alloc.alignment = ial->default_alignment;
+			req->alloc.alignment = max(ial->default_alignment,
+						   req->alloc.alignment);
 
 			resp->response_type = RESP_ALLOC;
 			resp->alloc.offset = ial->alloc(ial,
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index d19be3ce9..8e13a8808 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -206,7 +206,7 @@ static void reserve(int fd, uint8_t type)
 static void default_alignment(int fd)
 {
 	struct test_obj obj[3];
-	uint64_t ahnd, default_alignment = 0x4000;
+	uint64_t ahnd, default_alignment = SZ_4K;
 
 	ahnd = intel_allocator_open_full(fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
 					 ALLOC_STRATEGY_LOW_TO_HIGH,
@@ -214,13 +214,13 @@ static void default_alignment(int fd)
 
 	for (int i = 0; i < ARRAY_SIZE(obj); i++) {
 		obj[i].handle = gem_handle_gen();
-		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle, 4096,
-				i == 2 ? 4096 : 0);
+		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
+						      SZ_4K, i == 2 ? 0 : SZ_16K);
 		igt_debug("obj[%d].offset: %llx, handle: %u\n", i,
 			 (long long) obj[i].offset, obj[i].handle);
 	}
 
-	igt_assert_eq(obj[1].offset - obj[0].offset, default_alignment);
+	igt_assert_eq(obj[1].offset - obj[0].offset, SZ_16K);
 	/* obj[2] should be between obj[0] and obj[1] */
 	igt_assert(obj[0].offset < obj[2].offset);
 	igt_assert(obj[2].offset < obj[1].offset);
-- 
2.42.0
