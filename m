Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 20 Jan 2022 17:09:28 -0800
Message-Id: <20220121010928.3021085-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: Fix memory
 object size in gem_exec_capture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The capture tests require knowing exactly how big the test allocation
is. Part of the test is to compare the captured size against the
allocated size to make sure they match. That doesn't work if the
allocator creates an object of a different size than was requested
without reporting the larger size.

Fixes: 85a593809 ("tests/i915/gem_exec_capture: Add support for local memory")
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/gem_exec_capture.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 5b2482518..60f8df04c 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -387,10 +387,9 @@ static void capture(int fd, int dir, const intel_ctx_t *ctx,
 		    const struct intel_execution_engine2 *e, uint32_t region)
 {
 	uint32_t handle;
-	uint64_t ahnd;
-	int obj_size = 4096;
+	uint64_t ahnd, obj_size = 4096;
 
-	handle = gem_create_in_memory_regions(fd, obj_size, region);
+	igt_assert_eq(__gem_create_in_memory_regions(fd, &handle, &obj_size, region), 0);
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, region);
-- 
2.25.1
