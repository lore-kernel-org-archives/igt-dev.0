Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A3A10EB38
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 04:48:26 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Mar 2022 10:18:37 +0530
Message-Id: <20220309044837.2747689-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] igt/gem_mmap_offset: Adding subtest oob_read
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tejaskumarx.surendrakumar.upadhyay@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This test will Detect A missing bounds check in vm_access().
can lead to an out-of-bounds read or write in the adjacent memory area.

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_mmap_offset.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 8148f0a2..9723f4e3 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -289,6 +289,40 @@ static void *memchr_inv(const void *s, int c, size_t n)
 	return NULL;
 }
 
+static void
+test_oob_read(int i915)
+{
+
+	int memfd;
+	unsigned char p_init[4096];
+	unsigned char p_read_buf[4096];
+	void *ptr;
+	uintptr_t p_addr;
+	int ret;
+	uint32_t handle;
+
+	handle = gem_create(i915, 4096);
+
+	memset(p_init, 0x41, sizeof(p_init));
+	gem_write(i915, handle, 0, &p_init, sizeof(p_init));
+
+	ptr = __gem_mmap_offset__wc(i915, handle, 0, 4096, PROT_READ|PROT_WRITE);
+	igt_assert(ptr != MAP_FAILED);
+
+	memfd = open("/proc/self/mem", O_RDWR, 0);
+	igt_require_f(memfd != -1, "/proc/self/mem\n");
+
+	p_addr = (uintptr_t)((unsigned long)ptr + 4092);
+	ret = lseek64(memfd, p_addr, SEEK_SET);
+	igt_assert_f(ret != -1, "lseek failed\n");
+
+	/* Triggering the buf (out of bound read) */
+	ret = read(memfd, p_read_buf, sizeof(p_read_buf));
+	igt_assert(ret == -1 && errno ==  EIO);
+	munmap(ptr, 4096);
+	close(memfd);
+}
+
 static void test_ptrace(int i915)
 {
 	const unsigned int SZ = 3 * 4096;
@@ -692,6 +726,9 @@ igt_main
 	igt_subtest_f("pf-nonblock")
 		pf_nonblock(i915);
 
+	igt_subtest("oob-read")
+		test_oob_read(i915);
+
 	igt_subtest_with_dynamic("ptrace")
 		test_ptrace(i915);
 
-- 
2.25.1
