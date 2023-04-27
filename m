Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E9F10EBE7
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 20:04:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 22:02:59 +0200
Message-Id: <20230427200307.240349-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
References: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 08/16] lib/intel_batchbuffer: Update
 intel-bb docs
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

After RANDOM pseudo-allocator was removed and RELOC allocator becomed
stateful docs stays intact and documents old code. Fix this before
adding xe code.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 7dbd6dd582..306b7650e9 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -836,7 +836,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
  *
  * intel-bb assumes it will work in one of two modes - with relocations or
- * with using allocator (currently RANDOM and SIMPLE are implemented).
+ * with using allocator (currently RELOC and SIMPLE are implemented).
  * Some description is required to describe how they maintain the addresses.
  *
  * Before entering into each scenarios generic rule is intel-bb keeps objects
@@ -854,10 +854,10 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  *
  * This mode is valid only for ppgtt. Addresses are acquired from allocator
  * and softpinned. intel-bb cache must be then coherent with allocator
- * (simple is coherent, random is not due to fact we don't keep its state).
+ * (simple is coherent, reloc partially [doesn't support address reservation]).
  * When we do intel-bb reset with purging cache it has to reacquire addresses
  * from allocator (allocator should return same address - what is true for
- * simple allocator and false for random as mentioned before).
+ * simple and reloc allocators).
  *
  * If we do reset without purging caches we use addresses from intel-bb cache
  * during execbuf objects construction.
@@ -967,7 +967,7 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
  * @size: size of the batchbuffer
  * @start: allocator vm start address
  * @end: allocator vm start address
- * @allocator_type: allocator type, SIMPLE, RANDOM, ...
+ * @allocator_type: allocator type, SIMPLE, RELOC, ...
  * @strategy: allocation strategy
  *
  * Creates bb with context passed in @ctx, size in @size and allocator type
@@ -1280,8 +1280,9 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 	gem_close(ibb->fd, ibb->handle);
 	ibb->handle = gem_create(ibb->fd, ibb->size);
 
-	/* Keep address for bb in reloc mode and RANDOM allocator */
-	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE)
+	/* Reacquire offset for RELOC and SIMPLE */
+	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE ||
+	    ibb->allocator_type == INTEL_ALLOCATOR_RELOC)
 		ibb->batch_offset = __intel_bb_get_offset(ibb,
 							  ibb->handle,
 							  ibb->size,
-- 
2.34.1
