Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Tue, 13 Oct 2020 13:11:39 +0100
Message-Id: <20201013121139.104017-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/gem_exec_params: test overly large batch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

See if can make something explode with too large batch (1ULL << 32),
while also making the batch_len implicit. We should also try each engine
since batch_len seems to have different interactions related to that.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_exec_params.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index f8a94074..e00bbd04 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -273,7 +273,7 @@ static void mmapped(int i915)
 	gem_close(i915, buf);
 }
 
-static uint32_t batch_create_size(int fd, uint32_t size)
+static uint32_t batch_create_size(int fd, uint64_t size)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
@@ -317,6 +317,32 @@ static void test_invalid_batch_start(int fd)
 	gem_close(fd, exec.handle);
 }
 
+static void test_larger_than_life_batch(int fd)
+{
+       uint64_t size = 1ULL << 32; /* batch_len is __u32 as per the ABI */
+       struct drm_i915_gem_exec_object2 exec = {
+               .handle = batch_create_size(fd, size),
+       };
+       struct drm_i915_gem_execbuffer2 execbuf = {
+               .buffers_ptr = to_user_pointer(&exec),
+               .buffer_count = 1,
+       };
+
+       /*
+	* batch_len seems like it can have different interaction depending on
+	* the engine and HW.
+	*/
+       for_each_engine(e, fd) {
+	       execbuf.flags = eb_ring(e);
+	       /* Make the batch_len implicit */
+	       __gem_execbuf(fd, &execbuf);
+
+	       gem_sync(fd, exec.handle);
+       }
+
+       gem_close(fd, exec.handle);
+}
+
 struct drm_i915_gem_execbuffer2 execbuf;
 struct drm_i915_gem_exec_object2 gem_exec[1];
 uint32_t batch[2] = {MI_BATCH_BUFFER_END};
@@ -586,6 +612,9 @@ igt_main
 	igt_subtest("invalid-batch-start-offset")
 		test_invalid_batch_start(fd);
 
+	igt_subtest("larger-than-life-batch")
+		test_larger_than_life_batch(fd);
+
 #define DIRT(name) \
 	igt_subtest(#name "-dirt") { \
 		execbuf.flags = 0; \
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
