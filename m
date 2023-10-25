Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5878610E2FC
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 02:22:47 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Wed, 25 Oct 2023 07:50:50 +0530
Message-Id: <20231025022050.14282-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_copy_basic: Fix validating
 the mem set values.
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Avoid crash by memory un mapping the dst.ptr after validating the set
values.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_copy_basic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 059c54488..fe78ac50f 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -113,13 +113,14 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	result = (uint8_t *)mem.dst.ptr;
 
 	intel_allocator_bind(ahnd, 0, 0);
-	munmap(mem.dst.ptr, size);
 	gem_close(fd, bb);
 	put_ahnd(ahnd);
 
 	igt_assert(result[0] == fill_data);
 	igt_assert(result[width - 1] == fill_data);
 	igt_assert(result[width] != fill_data);
+
+	munmap(mem.dst.ptr, size);
 }
 
 static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t region)
-- 
2.39.1
