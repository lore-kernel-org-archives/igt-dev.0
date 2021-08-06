Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB436EB78
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:47:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:45:55 +0200
Message-Id: <20210806094649.21162-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 02/56] lib/intel_allocator: Add few
 helper functions for common use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Add few helper functions which can be used in reloc/no-reloc tests.

Common name is get_<ALLOCATOR_TYPE>_ahnd(i915, ctx), like:
get_reloc_ahnd(), get_simple_ahnd(). As simple allows acquiring
offsets starting from top or bottom of vm additional two were added:
get_simple_l2h_ahnd() and get_simple_h2l_ahnd(). put_ahnd() closes
allocator handle (if it is valid).

To acquire / release an offset get_offset() and put_offset() were
added. When allocator handle is invalid (equal to zero) get_offset()
just returns 0, put_offset() does nothing in this case. We can then
call them regardless reloc/no-reloc code keeping conditional code in
these functions.

Be aware that each get_..._ahnd() functions calls checking kernel
relocation capabilities. This generates extra execbuf ioctl() call (but
without queueing job to gpu). If that is a problem and we want to avoid
additional execbuf calls, checking relocation caps should be done on the
beginning of the test. Allocator handle (open()) should be acquired then
conditionally according to the result of this check.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_allocator.h | 55 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h
index c14f57b4d..f6511ffbf 100644
--- a/lib/intel_allocator.h
+++ b/lib/intel_allocator.h
@@ -11,6 +11,7 @@
 #include <pthread.h>
 #include <stdint.h>
 #include <stdatomic.h>
+#include "i915/gem_submission.h"
 
 /**
  * SECTION:intel_allocator
@@ -228,4 +229,58 @@ static inline uint64_t CANONICAL(uint64_t offset)
 
 #define DECANONICAL(offset) (offset & ((1ull << GEN8_GTT_ADDRESS_WIDTH) - 1))
 
+static inline uint64_t get_simple_ahnd(int fd, uint32_t ctx)
+{
+	bool do_relocs = gem_has_relocations(fd);
+
+	return do_relocs ? 0 : intel_allocator_open(fd, ctx, INTEL_ALLOCATOR_SIMPLE);
+}
+
+static inline uint64_t get_simple_l2h_ahnd(int fd, uint32_t ctx)
+{
+	bool do_relocs = gem_has_relocations(fd);
+
+	return do_relocs ? 0 : intel_allocator_open_full(fd, ctx, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH);
+}
+
+static inline uint64_t get_simple_h2l_ahnd(int fd, uint32_t ctx)
+{
+	bool do_relocs = gem_has_relocations(fd);
+
+	return do_relocs ? 0 : intel_allocator_open_full(fd, ctx, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH);
+}
+
+static inline uint64_t get_reloc_ahnd(int fd, uint32_t ctx)
+{
+	bool do_relocs = gem_has_relocations(fd);
+
+	return do_relocs ? 0 : intel_allocator_open(fd, ctx, INTEL_ALLOCATOR_RELOC);
+}
+
+static inline bool put_ahnd(uint64_t ahnd)
+{
+	return !ahnd || intel_allocator_close(ahnd);
+}
+
+static inline uint64_t get_offset(uint64_t ahnd, uint32_t handle,
+				  uint64_t size, uint64_t alignment)
+{
+	if (!ahnd)
+		return 0;
+
+	return intel_allocator_alloc(ahnd, handle, size, alignment);
+}
+
+static inline bool put_offset(uint64_t ahnd, uint32_t handle)
+{
+	if (!ahnd)
+		return 0;
+
+	return intel_allocator_free(ahnd, handle);
+}
+
 #endif
-- 
2.26.0
