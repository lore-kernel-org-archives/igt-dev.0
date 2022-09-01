Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4D110E5DE
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:35 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpQ-0016Ro-Rd
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:36:11 +0200
Message-Id: <20220901063722.261828-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/74] i915/gem_flink_basic: Close device
 before exit
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

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/gem_flink_basic.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
index 4e207c2ab546..2620bc55daf0 100644
--- a/tests/i915/gem_flink_basic.c
+++ b/tests/i915/gem_flink_basic.c
@@ -25,7 +25,6 @@
  *
  */
 
-#include "igt.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -34,8 +33,12 @@
 #include <errno.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
+
 #include "drm.h"
 
+#include "igt.h"
+#include "igt_types.h"
+
 IGT_TEST_DESCRIPTION("Tests for flink - a way to export a gem object by name");
 
 static void
@@ -152,12 +155,14 @@ test_flink_lifetime(int fd)
 	ret = ioctl(fd2, DRM_IOCTL_GEM_OPEN, &open_struct);
 	igt_assert_eq(ret, 0);
 	igt_assert(open_struct.handle != 0);
-}
 
-int fd;
+	close(fd2);
+}
 
 igt_main
 {
+	igt_fd_t(fd);
+
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
-- 
2.37.2
