Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4776E28B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jan 2021 10:43:38 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  7 Jan 2021 10:43:28 +0000
Message-Id: <20210107104328.4020431-2-chris@chris-wilson.co.uk>
In-Reply-To: <20210107104328.4020431-1-chris@chris-wilson.co.uk>
References: <20210107104328.4020431-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/kmod: Check for kernel taints
 before/after selftests
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
Cc: petri.latvala@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

If the kernel generates a bad taint during the selftest (e.g. a
warning), declare the selftest to be a failure.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_kmod.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ebeacd6fc..2ae45a1a1 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -29,6 +29,7 @@
 #include "igt_core.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "igt_taints.h"
 
 /**
  * SECTION:igt_kmod
@@ -582,9 +583,12 @@ int igt_kselftest_execute(struct igt_kselftest *tst,
 			  const char *options,
 			  const char *result)
 {
+	unsigned long taints;
 	char buf[1024];
 	int err;
 
+	igt_skip_on(igt_kernel_tainted(&taints));
+
 	lseek(tst->kmsg, 0, SEEK_END);
 
 	snprintf(buf, sizeof(buf), "%s=1 %s", tl->param, options ?: "");
@@ -607,6 +611,8 @@ int igt_kselftest_execute(struct igt_kselftest *tst,
 		     "kselftest \"%s %s\" failed: %s [%d]\n",
 		     tst->module_name, buf, strerror(-err), -err);
 
+	igt_assert_eq(igt_kernel_tainted(&taints), 0);
+
 	return err;
 }
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
