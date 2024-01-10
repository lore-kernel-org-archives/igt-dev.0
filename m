Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D7510E565
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 08:22:40 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/3] lib/i915/perf: include i915_pciids_local.h
Date: Wed, 10 Jan 2024 13:45:30 +0530
Message-Id: <20240110081532.1378038-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
References: <20240110081532.1378038-1-chaitanya.kumar.borah@intel.com>
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

perf.c uses PCI ID macros not found in kernel header i915_pciids.h.
Therefore include i915_pciids_local.h so that we can move these
macros from i915_pciids.h to this file. That way we don't lose
them when lib/i915_pciids.h is synced with kernel.

v2: Retain i915_pciids.h inclusion (Kamil Konieczny)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index ddadb53b6..bbfa36060 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -38,6 +38,7 @@
 #include <i915_drm.h>
 
 #include "i915_pciids.h"
+#include "i915_pciids_local.h"
 
 #include "intel_chipset.h"
 #include "perf.h"
-- 
2.25.1
