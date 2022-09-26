Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89AD10E63F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 06:18:32 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C2E2D580BE2
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 23:18:29 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ochRj-000RdO-33
 for igt-dev@lists.freedesktop.org; Mon, 26 Sep 2022 08:18:27 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:17:08 +0200
Message-Id: <0a03df0a22365f5a7b8512952b473f871f8821a4.1664173031.git.mchehab@kernel.org>
In-Reply-To: <cover.1664173031.git.mchehab@kernel.org>
References: <cover.1664173031.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 03/76] i915/gem_flink_basic: Close device before
 exit
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.mchehab@kernel.org/

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
2.37.3
