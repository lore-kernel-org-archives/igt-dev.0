Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C876F648
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 19:29:21 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed, 29 Jan 2020 11:29:14 -0800
Message-Id: <20200129192914.26341-2-antonio.argenziano@intel.com>
In-Reply-To: <20200129192914.26341-1-antonio.argenziano@intel.com>
References: <20200129192914.26341-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_exec_flush: Require
 mapapble aperture when needed
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
List-ID: <igt-dev@lists.freedesktop.org>

The test goes through multiple mapping so require mappable aperture when
going through GTT. Also use any coherent mapping not just GTT.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_exec_flush.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 28708460..778bc18c 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -152,9 +152,10 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 			       I915_GEM_DOMAIN_WC,
 			       I915_GEM_DOMAIN_WC);
 
-		/* Prepara a mappable binding to prevent pread mighrating */
+		/* Prepare a mappable binding to prevent pread migrating */
 		if (!snoop) {
-			ptr = gem_mmap__gtt(fd, obj[0].handle, 4096, PROT_READ);
+			ptr = gem_mmap__device_coherent(fd, obj[0].handle, 0,
+							4096, PROT_READ);
 			igt_assert_eq_u32(ptr[0], 0xabcdabcd);
 			munmap(ptr, 4096);
 		}
@@ -357,6 +358,9 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 
+	if (mode == BATCH_GTT)
+		gem_require_mappable_ggtt(fd);
+
 	if (flags & CMDPARSER) {
 		int cmdparser = -1;
                 drm_i915_getparam_t gp;
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
