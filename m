Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F906EB53
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2020 10:36:13 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Fri,  3 Jul 2020 16:03:52 +0530
Message-Id: <20200703103352.24738-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t]lib/sw_sync:Fixing modprobe for
 sw_sync to return if not supported
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Few tests that use "igt_require_sw_sync" , would not skip or assert the
test if it fails to load sw_sync module.

Mentioned error is seen and test continues executing .
"igt_kmod-DEBUG: Unknown symbol in module sw_sync or unknown parameter"

igt_require for modprobe in this file would skip the test if it fails
to load the module.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 lib/sw_sync.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/sw_sync.c b/lib/sw_sync.c
index e860a2c1..ed8375ca 100644
--- a/lib/sw_sync.c
+++ b/lib/sw_sync.c
@@ -228,16 +228,17 @@ int sync_fence_status(int fence)
 	return info.status;
 }
 
-static void modprobe(const char *driver)
+static int modprobe(const char *driver)
 {
-	igt_kmod_load(driver, NULL);
+	return igt_kmod_load(driver, NULL);
 }
 
 static bool kernel_has_sw_sync(void)
 {
 	char buf[128];
 
-	modprobe("sw_sync");
+	/* Make sure our Kernel supports sw_sync and the module is loaded. */
+	igt_require(modprobe("sw_sync") == 0);
 
 	return kernel_sw_sync_path(buf, sizeof(buf));
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
