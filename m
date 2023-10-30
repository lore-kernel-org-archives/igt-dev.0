Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5F688EBA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 16:26:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 21:38:04 +0530
Message-Id: <20231030160804.4083739-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib/intel_aux_pgtable: Add XE support for
 pagetable mapping
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

For XE device, use XE specific APIs to map pagetable.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/intel_aux_pgtable.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 7c7952134..3cbb0e26f 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -9,6 +9,7 @@
 #include "ioctl_wrappers.h"
 
 #include "i915/gem_mman.h"
+#include "xe/xe_ioctl.h"
 
 #define BITMASK(e, s)		((~0ULL << (s)) & \
 				 (~0ULL >> (BITS_PER_LONG_LONG - 1 - (e))))
@@ -371,10 +372,13 @@ pgt_populate_entries_for_buf(struct pgtable *pgt,
 	}
 }
 
-static void pgt_map(int i915, struct pgtable *pgt)
+static void pgt_map(int drm_fd, struct pgtable *pgt)
 {
-	pgt->ptr = gem_mmap__device_coherent(i915, pgt->buf->handle, 0,
-					     pgt->size, PROT_READ | PROT_WRITE);
+	pgt->ptr = is_i915_device(drm_fd) ?
+			gem_mmap__device_coherent(drm_fd, pgt->buf->handle, 0,
+						  pgt->size, PROT_READ | PROT_WRITE):
+			xe_bo_mmap_ext(drm_fd, pgt->buf->handle,
+				       pgt->size, PROT_READ | PROT_WRITE);
 }
 
 static void pgt_unmap(struct pgtable *pgt)
-- 
2.40.0
