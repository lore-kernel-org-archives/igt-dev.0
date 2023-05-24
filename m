Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB9A10E2D2
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 14:30:10 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 24 May 2023 16:29:29 +0200
Message-Id: <20230524142931.119823-8-dominik.grzegorzek@intel.com>
In-Reply-To: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
References: <20230524142931.119823-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/9] xe/staging/xe_eudebug: add vm events
 sanity check
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

Add basic test validating eudebug vm events.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/xe/staging/xe_eudebug.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tests/xe/staging/xe_eudebug.c b/tests/xe/staging/xe_eudebug.c
index 771089179..0f81dcd7e 100644
--- a/tests/xe/staging/xe_eudebug.c
+++ b/tests/xe/staging/xe_eudebug.c
@@ -7,13 +7,26 @@
 #include <xe_drm_tmp.h>
 
 #include "igt.h"
+#include "xe/xe_ioctl.h"
 #include "xe/staging/xe_eudebug.h"
 
+#define CREATE_VMS	(1 << 0)
 static void run_basic_client(struct xe_eudebug_client *c)
 {
-	int fd;
+	int fd, i;
 
 	fd = xe_eudebug_client_open_driver(c);
+
+	if (c->flags & CREATE_VMS) {
+		uint32_t vms[igt_fls(DRM_XE_VM_CREATE_ASYNC_BIND_OPS)];
+
+		for (i = 0; (1 << i) <= DRM_XE_VM_CREATE_ASYNC_BIND_OPS; i++)
+			vms[i] = xe_eudebug_client_vm_create(c, fd, 1 << i, 0);
+
+		for (i--; i >= 0; i--)
+			xe_eudebug_client_vm_destroy(c, fd, vms[i]);
+	}
+
 	xe_eudebug_client_close_driver(c, fd);
 }
 
@@ -296,7 +309,10 @@ igt_main
 		test_basic_sessions(fd, 0, 1);
 
 	igt_subtest("multiple-sessions")
-		test_basic_sessions(fd, 0, 4);
+		test_basic_sessions(fd, CREATE_VMS, 4);
+
+	igt_subtest("basic-vms")
+		test_basic_sessions(fd, CREATE_VMS, 1);
 
 	igt_fixture
 		close(fd);
-- 
2.34.1
