Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7810E5CA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 06:27:41 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Oct 2022 11:56:52 +0530
Message-Id: <20221021062652.3084835-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] Avoid SET_CACHING ioctl during fork
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Some subtests for gem_ctx_engines require the SET_CACHING
ioctl to run.  However, the function that calls it is
wrapped by an igt_require and thus causes a skip when the
ioctl fails.  Unfortunately, MTL currently fails this check
with -EOPNOTSUPP.

While the ioctl failing and resulting in a skip wouldn't
normally be a problem, the failing call is occasionally
made within a forked child process, which causes an error.
Fortunately, use of the ioctl can be avoided by using wc
instead of cpu for mmapping and domain operations.

v2: Use gem_mmap__device_coherent instead of gem_mmap__wc

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
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
