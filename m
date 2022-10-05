Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597510E4D4
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 07:46:03 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.61.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0A0D6580C23
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 00:46:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ofz6F-000Ega-2x
 for igt-dev@lists.freedesktop.org; Wed, 05 Oct 2022 09:45:51 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Oct 2022 09:45:41 +0200
Message-Id: <20221005074546.55955-73-mauro.chehab@linux.intel.com>
In-Reply-To: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
References: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 72/77] feature_discovery: Close device
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
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/feature_discovery.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/feature_discovery.c b/tests/feature_discovery.c
index 1978ce890de2..d369812ae614 100644
--- a/tests/feature_discovery.c
+++ b/tests/feature_discovery.c
@@ -29,15 +29,16 @@
 #include "igt_kms.h"
 #include "igt_psr.h"
 #include "igt_sysfs.h"
+#include "igt_types.h"
 
-static int fd;
-static int debugfs_fd;
 static igt_display_t display;
 
 IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. "
 		     "The subtests here should only skip or pass, "
 		     "anything else means we have a serious problem.");
 igt_main {
+	igt_fd_t(debugfs_fd);
+	igt_fd_t(fd);
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.37.3
