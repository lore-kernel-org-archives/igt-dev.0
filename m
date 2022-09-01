Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAAB10E5D9
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:30:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:29:59 +0200
Message-Id: <20220901063000.25640-13-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
References: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/13] i915/gem_mmap_offset: Crudely measure
 read/write to different mmaps
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

From: Chris Wilson <chris.p.wilson@intel.com>

Compare the read/write performance of different mmap types to different
memory regions.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
---
 tests/i915/gem_mmap_offset.c | 74 ++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 24da713589..106072cc06 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -107,6 +107,73 @@ static void make_resident(int i915, uint32_t batch, uint32_t handle)
 		gem_close(i915, obj[1].handle);
 }
 
+static void perf(int i915, const struct gem_memory_region *r)
+{
+#define MiB (1024 * 1024)
+	const unsigned int rep = 1024;
+	const uint64_t sz = 4096;
+	struct timespec tv;
+	uint32_t handle;
+	char buf[4096];
+
+	/*
+	 * Time reading/writing through each mmap type into each
+	 * memory region to have a rough estimate of the memory
+	 * bandwidth exposed to userspace across each link.
+	 *
+	 * For example, we would expect that reading and writing to
+	 * lmem would utilise the full PCIe bandwidth (>3.2GiB/s),
+	 * and notably be symmetric, the same in both directions.
+	 */
+
+	handle = gem_create_in_memory_region_list(i915, 4096, 0, &r->ci, 1);
+	make_resident(i915, 0, handle);
+
+	for_each_mmap_offset_type(i915, t) {
+		double ns;
+		void *ptr;
+
+		ptr = __mmap_offset(i915, handle, 0, sz,
+				    PROT_READ | PROT_WRITE,
+				    t->type);
+		if (!ptr)
+			continue;
+
+		igt_nsec_elapsed(memset(&tv, 0, sizeof(tv)));
+		for (int i = 0; i < rep; i++)
+			memset(ptr, 0, sz);
+		ns = igt_nsec_elapsed(&tv);
+		igt_info("%s: Clear    %12.2fMiB/s\n",
+			 t->name, sz * rep * NSEC_PER_SEC / ns / MiB);
+
+		igt_nsec_elapsed(memset(&tv, 0, sizeof(tv)));
+		for (int i = 0; i < rep; i++)
+			memcpy(ptr, buf, sz);
+		ns = igt_nsec_elapsed(&tv);
+		igt_info("%s: Write    %12.2fMiB/s\n",
+			 t->name, sz * rep * NSEC_PER_SEC / ns / MiB);
+
+		igt_nsec_elapsed(memset(&tv, 0, sizeof(tv)));
+		for (int i = 0; i < rep; i++)
+			memcpy(buf, ptr, sz);
+		ns = igt_nsec_elapsed(&tv);
+		igt_info("%s: Read     %12.2fMiB/s\n",
+			 t->name, sz * rep * NSEC_PER_SEC / ns / MiB);
+
+		igt_nsec_elapsed(memset(&tv, 0, sizeof(tv)));
+		for (int i = 0; i < rep; i++)
+			igt_memcpy_from_wc(buf, ptr, sz);
+		ns = igt_nsec_elapsed(&tv);
+		igt_info("%s: movntqda %12.2fMiB/s\n",
+			 t->name, sz * rep * NSEC_PER_SEC / ns / MiB);
+
+		munmap(ptr, sz);
+	}
+
+	gem_close(i915, handle);
+#undef MiB
+}
+
 static void bad_object(int i915)
 {
 	uint32_t real_handle;
@@ -836,6 +903,13 @@ igt_main
 		}
 	}
 
+	igt_subtest_with_dynamic("perf") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				perf(i915, r);
+		}
+	}
+
 	igt_subtest_f("blt-coherency")
 		blt_coherency(i915);
 
-- 
2.34.1
