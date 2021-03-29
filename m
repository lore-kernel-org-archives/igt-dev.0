Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EF56E44F
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 14:06:36 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 29 Mar 2021 17:07:14 +0300
Message-Id: <20210329140714.3921-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Don't use libdrm_nouveau if not found
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Only #include the libdrm_nouveau headers if HAVE_LIBDRM_NOUVEAU is set
so IGT builds again without it installed.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
---
 lib/igt_nouveau.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_nouveau.h b/lib/igt_nouveau.h
index ea44adb2..c518de3c 100644
--- a/lib/igt_nouveau.h
+++ b/lib/igt_nouveau.h
@@ -26,10 +26,6 @@
 #include <stddef.h>
 #include <inttypes.h>
 
-#include <nouveau/nouveau.h>
-#include <nouveau/nvif/class.h>
-#include <nouveau/nvif/cl0080.h>
-
 #include "igt_core.h"
 
 #define IGT_NOUVEAU_CHIPSET_GV100 0x140
@@ -37,6 +33,10 @@
 typedef struct igt_fb igt_fb_t;
 
 #ifdef HAVE_LIBDRM_NOUVEAU
+#include <nouveau/nouveau.h>
+#include <nouveau/nvif/class.h>
+#include <nouveau/nvif/cl0080.h>
+
 #define DECL(d) d
 #else
 /* There shouldn't be any code that calls igt_nouveau_* functions without libdrm support enabled, as
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
