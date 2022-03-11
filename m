Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966C010E927
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 11:37:35 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Mar 2022 13:37:12 +0200
Message-Id: <20220311113712.159192-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt: don't include i915_pciids.h
 everywhere
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Macros from i915_pciids.h are only needed in one place,
intel_device_info.c, and that already includes the header. Remove an
unnecessary global include.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt.h b/lib/igt.h
index 0bf98aa5d767..96a368e11bbf 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -26,7 +26,6 @@
 
 #include "drmtest.h"
 #include "i915_3d.h"
-#include "i915_pciids.h"
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_core.h"
-- 
2.30.2
