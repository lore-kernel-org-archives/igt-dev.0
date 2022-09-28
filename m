Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8440F10E566
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 18:06:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 20:06:37 +0200
Message-Id: <20220928180638.52913-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220928180638.52913-1-zbigniew.kempczynski@intel.com>
References: <20220928180638.52913-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] tests/gem_exec_basic: Don't use
 hardcoded batch size
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

Instead of using hardcoded batch size use kernel altered object size.
Change allows removing confusing gem_get_batch_size() function.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_basic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index ab4c159764..ca4fc7b961 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -28,12 +28,12 @@
 
 IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
 
-static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
+static uint32_t batch_create(int fd, uint64_t *batch_size, uint32_t region)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, batch_size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, batch_size, region) == 0);
 	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
 
 	return handle;
@@ -44,7 +44,7 @@ igt_main
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_query_memory_regions *query_info;
 	struct igt_collection *regions, *set;
-	uint32_t batch_size;
+	uint64_t batch_size;
 	const intel_ctx_t *ctx;
 	int fd = -1;
 
@@ -71,9 +71,9 @@ igt_main
 			struct drm_i915_gem_exec_object2 exec;
 			uint32_t region = igt_collection_get_value(regions, 0);
 
-			batch_size = gem_get_batch_size(fd, MEMORY_TYPE_FROM_REGION(region));
+			batch_size = 4096;
 			memset(&exec, 0, sizeof(exec));
-			exec.handle = batch_create(fd, batch_size, region);
+			exec.handle = batch_create(fd, &batch_size, region);
 
 			for_each_ctx_engine(fd, ctx, e) {
 				igt_dynamic_f("%s-%s", e->name, sub_name) {
-- 
2.34.1
