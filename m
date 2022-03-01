Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Mar 2022 11:03:59 +0000
Message-Id: <20220301110359.663637-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_params: check available
 memory earlier
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The shmem mmap and pwrite interfaces conveniently let us probe just a
few pages, without needing to populate the entire object. On discrete
and newer platforms the kernel has dropped support for both, leaving us
with MMAP_OFFSET, which will always populate the entire object, for now
at least. Luckily we can just move the batch creation to after checking
the available memory to ensure we don't hit -ENOMEM on such platforms.

Also it seems that doing a massive allocation(filling much of system
memory) and then calling intel_purge_vm_caches() seems to take 40+
seconds, like when calling intel_require_memory(). Hence switching the
ordering here should also help with that.

For reference the larger-than-life test is just a simple regression test
to ensure that some very large batch buffer(greater than ~4G) can't
overflow the batch_len, causing all kinds of issues. See 57b2d834bf23
("drm/i915/gem: Support parsing of oversize batches").

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 tests/i915/gem_exec_params.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index d247b8a6..da36af74 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -332,9 +332,7 @@ static void test_larger_than_life_batch(int fd)
 	const struct intel_execution_engine2 *e;
 	uint64_t size = 1ULL << 32; /* batch_len is __u32 as per the ABI */
 	const intel_ctx_t *ctx = intel_ctx_create_all_physical(fd);
-	struct drm_i915_gem_exec_object2 exec = {
-		.handle = batch_create_size(fd, size),
-	};
+	struct drm_i915_gem_exec_object2 exec = {};
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&exec),
 		.buffer_count = 1,
@@ -350,6 +348,8 @@ static void test_larger_than_life_batch(int fd)
 	igt_require(size < gem_aperture_size(fd));
 	intel_require_memory(2, size, CHECK_RAM); /* batch + shadow */
 
+	exec.handle = batch_create_size(fd, size);
+
 	for_each_ctx_engine(fd, ctx, e) {
 		/* Keep the batch_len implicit [0] */
 		execbuf.flags = e->flags;
-- 
2.34.1
