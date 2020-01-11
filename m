Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A857E6E1F3
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Jan 2020 05:36:54 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 10 Jan 2020 21:36:52 -0800
Message-Id: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915/gem_mman: Prioritize GTT
 mappings over WC
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

In order to preserve legacy behavior for devices with a mappable
aperture try a GTT mapping first. Use a WC mapping only for devices
without a mappable aperture.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/gem_mman.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index c98f02aee..cdebf44a6 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -347,18 +347,19 @@ void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
  * @prot: memory protection bits as used by mmap()
  *
  * Returns: A pointer to a block of linear device memory mapped into the
- * process with WC semantics. When no WC is available try to mmap using GGTT.
+ * process via GTT. When GTT is not available try WC mapping.
  */
 void *__gem_mmap__device_coherent(int fd, uint32_t handle, uint64_t offset,
 				  uint64_t size, unsigned prot)
 {
-	void *ptr = __gem_mmap_offset(fd, handle, offset, size, prot,
-				      I915_MMAP_OFFSET_WC);
+	void *ptr = __gem_mmap__gtt(fd, handle, size, prot);
+
 	if (!ptr)
-		ptr = __gem_mmap__wc(fd, handle, offset, size, prot);
+		ptr = __gem_mmap_offset(fd, handle, offset, size, prot,
+					I915_MMAP_OFFSET_WC);
 
 	if (!ptr)
-		ptr = __gem_mmap__gtt(fd, handle, size, prot);
+		ptr = __gem_mmap__wc(fd, handle, offset, size, prot);
 
 	return ptr;
 }
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
