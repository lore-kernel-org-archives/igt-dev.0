Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F8510E0BA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 06:16:47 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] lib/i915/perf: include i915_pciid_local.h
Date: Tue,  9 Jan 2024 11:39:41 +0530
Message-Id: <20240109060943.1236373-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240109060943.1236373-1-chaitanya.kumar.borah@intel.com>
References: <20240109060943.1236373-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

perf.c uses PCI ID macros not found in kernel header i915_pciid.h.
Therefore include i915_pciid_local.h instead of i915_pciid.h so that
we can move these macros to the local file. That way we don't lose
them when i915_pciid.h is synced with kernel.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com> 
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

---
 lib/i915/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index ddadb53b6..2006dd4ad 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -37,7 +37,7 @@
 
 #include <i915_drm.h>
 
-#include "i915_pciids.h"
+#include "i915_pciids_local.h"
 
 #include "intel_chipset.h"
 #include "perf.h"
-- 
2.25.1
