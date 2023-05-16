Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA5610E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:45:57 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 17:44:32 +0200
Message-Id: <20230516154434.810356-7-dominik.grzegorzek@intel.com>
In-Reply-To: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
References: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] xe/xe_eudebug: add vm events sanity
 check
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
 tests/xe/xe_eudebug.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tests/xe/xe_eudebug.c b/tests/xe/xe_eudebug.c
index 31f0f274d..6a4198841 100644
--- a/tests/xe/xe_eudebug.c
+++ b/tests/xe/xe_eudebug.c
@@ -6,13 +6,26 @@
 
 #include <xe_drm_tmp.h>
 #include "xe/xe_eudebug.h"
+#include "xe/xe_ioctl.h"
 #include "igt.h"
 
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
 
@@ -295,7 +308,10 @@ igt_main
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
