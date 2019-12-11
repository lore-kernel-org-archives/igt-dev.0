Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654016EA32
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:50 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:25 -0800
Message-Id: <20191211005235.67897-20-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 19/29] Use ETIMEDOUT in place of ETIME on
 FreeBSD
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
List-ID: <igt-dev@lists.freedesktop.org>

FreeBSD does not provide ETIME, and the drm interface is uniformly
patched on that platform to use ETIMEDOUT in its place.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt.h                        | 4 ++++
 lib/sw_sync.c                    | 1 +
 tests/i915/gem_ctx_persistence.c | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/igt.h b/lib/igt.h
index a6c4e44d..18f55139 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -56,4 +56,8 @@
 #include "i915/gem_mman.h"
 #include "i915/gem_engine_topology.h"
 
+#if defined(__FreeBSD__)
+#define ETIME ETIMEDOUT
+#endif
+
 #endif /* IGT_H */
diff --git a/lib/sw_sync.c b/lib/sw_sync.c
index d671923c..6edcafcd 100644
--- a/lib/sw_sync.c
+++ b/lib/sw_sync.c
@@ -35,6 +35,7 @@
 
 #include "sync_file.h"
 
+#include "igt.h"
 #include "igt_debugfs.h"
 #include "igt_kmod.h"
 #include "sw_sync.h"
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index d68431ae..4c957f99 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -28,7 +28,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
-#include "drmtest.h" /* gem_quiescent_gpu()! */
+#include "igt.h"
 #include "i915/gem_context.h"
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_ring.h"
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
