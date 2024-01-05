Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA79610E5F1
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 12:53:47 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/i915/perf: include i915_pciid_local.h
Date: Fri,  5 Jan 2024 18:16:40 +0530
Message-Id: <20240105124641.784371-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240105124641.784371-1-chaitanya.kumar.borah@intel.com>
References: <20240105124641.784371-1-chaitanya.kumar.borah@intel.com>
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
