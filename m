Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 17 Jan 2020 21:11:29 +0000
Message-Id: <20200117211129.3303428-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap_offset: Exercise many,
 many mmap_offset
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Just keep on generating a new mmap_offset for the same old buffer, but
for different handles and so exercise the scaling of the obj->mmo lists.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
---
 tests/i915/gem_mmap_offset.c | 66 ++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 95e1e3e6c..005839c38 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -326,6 +326,69 @@ static void close_race(int i915, int timeout)
 	munmap(handles, len);
 }
 
+static void open_flood(int i915, int timeout)
+{
+	unsigned long count;
+	uint32_t handle;
+	int dmabuf;
+	int *ctl;
+
+	ctl = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(ctl != MAP_FAILED);
+
+	handle = gem_create(i915, 4096);
+	dmabuf = prime_handle_to_fd(i915, handle);
+
+	for_each_mmap_offset_type(t) {
+		struct drm_i915_gem_mmap_offset arg = {
+			.handle = handle,
+			.flags = t->type,
+		};
+
+		if (mmap_offset_ioctl(i915, &arg))
+			continue;
+
+		igt_fork(child, 1) {
+			i915 = gem_reopen_driver(i915);
+			arg.handle = prime_fd_to_handle(i915, dmabuf);
+
+			do {
+				igt_assert_eq(mmap_offset_ioctl(i915, &arg), 0);
+			} while (!READ_ONCE(*ctl));
+		}
+	}
+	gem_close(i915, handle);
+
+	count = 0;
+	igt_until_timeout(timeout) {
+		int tmp;
+
+		tmp = gem_reopen_driver(i915);
+		handle = prime_fd_to_handle(i915, dmabuf);
+
+		for_each_mmap_offset_type(t) {
+			struct drm_i915_gem_mmap_offset arg = {
+				.handle = handle,
+				.flags = t->type,
+			};
+
+			mmap_offset_ioctl(i915, &arg);
+		}
+
+		close(tmp);
+		count++;
+	}
+
+	igt_info("Completed %lu cycles\n", count);
+
+	close(dmabuf);
+	close(i915);
+
+	*ctl = 1;
+	igt_waitchildren();
+	munmap(ctl, 4096);
+}
+
 static uint64_t atomic_compare_swap_u64(_Atomic(uint64_t) *ptr,
 					uint64_t oldval, uint64_t newval)
 {
@@ -488,6 +551,9 @@ igt_main
 	igt_subtest_f("close-race")
 		close_race(i915, 20);
 
+	igt_subtest_f("open-flood")
+		open_flood(i915, 20);
+
 	igt_subtest_f("clear")
 		always_clear(i915, 20);
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
