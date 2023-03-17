Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EA910E382
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Mar 2023 12:37:30 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Mar 2023 13:37:08 +0100
Message-Id: <3944eb326b64de5d516c2de166794583d628c006.1679055766.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1679055766.git.karolina.stolarek@intel.com>
References: <cover.1679055766.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 6/9] lib/intel_batchbuffer: Remove unused
 includes
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

The library includes a lot of headers and most of them are
not needed.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_batchbuffer.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index a5157194..1b999ca5 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -25,35 +25,21 @@
  *
  **************************************************************************/
 
-#include <inttypes.h>
-#include <poll.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <assert.h>
 #include <search.h>
+#include <glib.h>
 
-#include "drm.h"
-#include "drmtest.h"
 #include "i915/gem_create.h"
 #include "intel_batchbuffer.h"
 #include "intel_bufops.h"
 #include "intel_chipset.h"
-#include "intel_reg.h"
-#include "veboxcopy.h"
 #include "rendercopy.h"
 #include "media_fill.h"
-#include "ioctl_wrappers.h"
-#include "sw_sync.h"
-#include "i915/gem_mman.h"
 #include "media_spin.h"
+#include "i915/gem_mman.h"
+#include "veboxcopy.h"
+#include "sw_sync.h"
 #include "gpgpu_fill.h"
-#include "igt_aux.h"
-#include "i830_reg.h"
 #include "huc_copy.h"
-#include <glib.h>
-
-#include <i915_drm.h>
 
 #define BCS_SWCTRL 0x22200
 #define BCS_SRC_Y (1 << 0)
-- 
2.25.1
