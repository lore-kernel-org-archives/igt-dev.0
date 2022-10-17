Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E174410E341
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 07:59:05 +0000 (UTC)
From: vikassri07 <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	chris.p.wilson@intel.com
Date: Mon, 17 Oct 2022 13:28:22 +0530
Message-Id: <20221017075822.2655487-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Avoid caching ioctl during fork
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com, fei.yang@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

    Both gem_exec_flush and gem_ctx_engines require the SET_CACHING ioctl
    for some subtests.  The ioctl itself, called by gem_set_caching, is
    wrapped in an igt_require, forcing a skip when the ioctl fails.  MTL
    currently fails this check with -EOPNOTSUPP 100% of the time.

    Normally, the ioctl failing and causing a test skip wouldn't be a
    problem.  Howerver, the failing call to the ioctl is made within a
    forked child process in some cases, which causes an error to occur.  By
    checking whether or not caching is supported before these cases occur,
    the resulting error can be downgraded to a graceful skip.

    v2: The gem_ctx_engines subtest does not require using gem_set_caching
    if the domain is moved from CPU to WC, so the ioctl was removed from
    the execution path.
    v3: Replace gem_mmap__cpu with gem_mmap__device_coherent instead of
    gem_mmap__wc in gem_ctx_engines.c
    v4: Fix formatting

    References: VLK-34086
    Signed-off-by: vikas.srivastava <vikas.srivastava@intel.com> 
    CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Fei Yang <fei.yang@intel.com>
    CC: Chris Wilson <chris.p.wilson@intel.com>

---
 tests/i915/gem_ctx_engines.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index b0646516..e9cc25d6 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -492,12 +492,10 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
 	}
 	param.ctx_id = gem_context_create(i915);
 	gem_context_set_param(i915, &param);
-
-	if (!gem_has_lmem(i915))
-		gem_set_caching(i915, results.handle, I915_CACHING_CACHED);
-	map = gem_mmap__cpu(i915, results.handle, 0, 4096, PROT_READ);
+	
+	map = gem_mmap__device_coherent(i915, results.handle, 0, 4096, PROT_READ);
 	gem_set_domain(i915, results.handle,
-		       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
+		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 
 	for (int i = 0; i < I915_EXEC_RING_MASK + 1; i++) {
 		struct drm_i915_gem_exec_object2 obj[2] = {
@@ -515,8 +513,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
 		uint32_t *cs;
 		int j = 0;
 
-		cs = gem_mmap__cpu(i915, obj[1].handle, 0, 4096, PROT_WRITE);
-
+		cs = gem_mmap__device_coherent(i915, obj[1].handle, 0, 4096, PROT_WRITE);
 		cs[j] = 0x24 << 23 | 1; /* SRM */
 		if (has_64bit_reloc)
 			cs[j]++;
-- 
2.25.1
