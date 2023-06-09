Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2185E10E674
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 09:36:56 +0000 (UTC)
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 11:36:41 +0200
Message-Id: <20230609093641.2075459-2-christoph.manszewski@intel.com>
In-Reply-To: <20230609093641.2075459-1-christoph.manszewski@intel.com>
References: <20230609093641.2075459-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] lib: Let gen7 inherit gen4_render.h
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

Instead of redefining pipe selects, use them from gen4_render.h

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/gen7_media.h | 2 +-
 lib/gen8_media.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/gen7_media.h b/lib/gen7_media.h
index b5e49cae..93dc7312 100644
--- a/lib/gen7_media.h
+++ b/lib/gen7_media.h
@@ -3,6 +3,7 @@
 
 #include <stdint.h>
 #include "surfaceformat.h"
+#include "gen4_render.h"
 
 #define GEN7_FLOATING_POINT_IEEE_754		0
 #define GEN7_FLOATING_POINT_NON_IEEE_754	1
@@ -13,7 +14,6 @@
 						((Subopcode) << 16))
 
 #define GEN7_PIPELINE_SELECT			GFXPIPE(1, 1, 4)
-# define PIPELINE_SELECT_3D			(0 << 0)
 # define PIPELINE_SELECT_GPGPU			(2 << 0)
 
 #define GEN7_STATE_BASE_ADDRESS			GFXPIPE(0, 1, 1)
diff --git a/lib/gen8_media.h b/lib/gen8_media.h
index b5c19e50..01aaa9be 100644
--- a/lib/gen8_media.h
+++ b/lib/gen8_media.h
@@ -13,7 +13,6 @@
 						((Subopcode) << 16))
 
 #define GEN8_PIPELINE_SELECT			GFXPIPE(1, 1, 4)
-# define PIPELINE_SELECT_3D			(0 << 0)
 
 #define GEN8_STATE_BASE_ADDRESS			GFXPIPE(0, 1, 1)
 
-- 
2.40.1
