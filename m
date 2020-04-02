Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  2 Apr 2020 15:00:57 +0100
Message-Id: <20200402140057.330937-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Exercise mixing perf reads
 into i915 mmaps
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Feed a fresh i915 mmap into a read(perf_fd) to teach lockdep about the
potential lock chains should we take a pagefault into our vm_fault
handlers from within perf.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/perf_pmu.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
index 259670f4b..1d6681d80 100644
--- a/tests/perf_pmu.c
+++ b/tests/perf_pmu.c
@@ -1827,6 +1827,35 @@ accuracy(int gem_fd, const struct intel_execution_engine2 *e,
 	assert_within(100.0 * busy_r, 100.0 * expected, 2);
 }
 
+static void *create_mmap(int gem_fd, const struct mmap_offset *t, int sz)
+{
+	uint32_t handle;
+	void *ptr;
+
+	handle = gem_create(gem_fd, sz);
+	ptr = __gem_mmap_offset(gem_fd, handle, 0, sz, PROT_WRITE, t->type);
+	gem_close(gem_fd, handle);
+
+	return ptr;
+}
+
+static void
+faulting_read(int gem_fd, const struct mmap_offset *t)
+{
+	void *ptr;
+	int fd;
+
+	ptr = create_mmap(gem_fd, t, 4096);
+	igt_require(ptr != NULL);
+
+	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(0, 0));
+	igt_require(fd != -1);
+	igt_assert_eq(read(fd, ptr, 4096), 2 * sizeof(uint64_t));
+	close(fd);
+
+	munmap(ptr, 4096);
+}
+
 #define test_each_engine(T, i915, e) \
 	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
 		igt_dynamic_f("%s", e->name)
@@ -1860,6 +1889,16 @@ igt_main
 	igt_subtest("invalid-init")
 		invalid_init(fd);
 
+	igt_subtest_with_dynamic("faulting-read") {
+		for_each_mmap_offset_type(fd, t) {
+			if (!gem_has_mmap_offset_type(fd, t))
+				continue;
+
+			igt_dynamic_f("%s", t->name)
+				faulting_read(fd, t);
+		}
+	}
+
 	/**
 	 * Test that a single engine metric can be initialized or it
 	 * is correctly rejected.
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
