Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Thu,  5 Mar 2020 20:53:25 +0000
Message-Id: <20200305205325.218702-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2] i915/gem_exec_params: add test_invalid_batch
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

Sanity check that kernel rejects invalid batch_start_offset and
batch_len.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_params.c | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index cf7ea306..45581738 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -268,6 +268,50 @@ static void mmapped(int i915)
 	gem_close(i915, buf);
 }
 
+static uint32_t batch_create_size(int fd, uint32_t size)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t handle;
+
+	handle = gem_create(fd, size);
+	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
+
+	return handle;
+}
+
+static void __invalid_batch_start(int fd,
+				  struct drm_i915_gem_execbuffer2 *execbuf,
+				  uint32_t start_offset,
+				  uint32_t batch_len)
+{
+	execbuf->batch_start_offset = start_offset;
+	execbuf->batch_len = batch_len;
+	igt_assert_eq(__gem_execbuf(fd, execbuf), -EINVAL);
+}
+
+static void test_invalid_batch_start(int fd)
+{
+	uint32_t size = 4096;
+	struct drm_i915_gem_exec_object2 exec = {
+		.handle = batch_create_size(fd, size),
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&exec),
+		.buffer_count = 1,
+	};
+
+	__invalid_batch_start(fd, &execbuf, 0, -1);
+	__invalid_batch_start(fd, &execbuf, -1, 0);
+	__invalid_batch_start(fd, &execbuf, -1, -1);
+	__invalid_batch_start(fd, &execbuf, -1U & ~0x7, 0);
+	__invalid_batch_start(fd, &execbuf, 0, -1U & ~0x7);
+	__invalid_batch_start(fd, &execbuf, size, 0);
+	__invalid_batch_start(fd, &execbuf, size, size);
+
+	gem_sync(fd, exec.handle);
+	gem_close(fd, exec.handle);
+}
+
 struct drm_i915_gem_execbuffer2 execbuf;
 struct drm_i915_gem_exec_object2 gem_exec[1];
 uint32_t batch[2] = {MI_BATCH_BUFFER_END};
@@ -507,6 +551,9 @@ igt_main
 	igt_subtest("batch-first")
 		test_batch_first(fd);
 
+	igt_subtest("invalid-batch-start-offset")
+		test_invalid_batch_start(fd);
+
 #define DIRT(name) \
 	igt_subtest(#name "-dirt") { \
 		execbuf.flags = 0; \
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
