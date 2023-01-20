Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5E710E10C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 17:01:03 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 18:00:27 +0100
Message-Id: <20230120170027.56231-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_fb: add missing include in header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Direct include of lib igt_fb header breaks builds with errors

xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’

Fixed it with adding proper include in header.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

---
Maybe it is worth to put this patch as first, together with
https://patchwork.freedesktop.org/series/113045/
tests/i915/kms_dsc: Reorg
so it can be tested in CI.
---
 lib/igt_fb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 6995b14b..73bdfc86 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -32,6 +32,7 @@
 #include <cairo.h>
 #include <stddef.h>
 #include <stdbool.h>
+#include <stdint.h>
 #include <drm_fourcc.h>
 #include <xf86drmMode.h>
 
-- 
2.37.2
