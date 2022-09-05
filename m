Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF6110E2EB
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:54:02 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oV53W-007pCW-84
 for igt-dev@lists.freedesktop.org; Mon, 05 Sep 2022 07:53:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 07:53:47 +0200
Message-Id: <02baa5a498e801ed8198549328a4df4c8412084e.1662357022.git.mchehab@kernel.org>
In-Reply-To: <cover.1662357022.git.mchehab@kernel.org>
References: <cover.1662357022.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 73/77] feature_discovery: Close device before
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
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/77] at: https://lore.kernel.org/all/cover.1662357022.git.mchehab@kernel.org/

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
2.37.2
