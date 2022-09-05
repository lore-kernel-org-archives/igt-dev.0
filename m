Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC8710E180
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:54:01 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oV53W-007pCd-9F
 for igt-dev@lists.freedesktop.org; Mon, 05 Sep 2022 07:53:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 07:53:49 +0200
Message-Id: <df2549ea0cc1c1faa3a586bea684b53db85cde60.1662357022.git.mchehab@kernel.org>
In-Reply-To: <cover.1662357022.git.mchehab@kernel.org>
References: <cover.1662357022.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 75/77] core_auth: Close(master) before exit
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

Add a missing close(master) to the subtest group fixture to prevent a
leak during later tests.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/77] at: https://lore.kernel.org/all/cover.1662357022.git.mchehab@kernel.org/

 tests/core_auth.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index c9ad3fb9c875..257f124820a4 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -25,7 +25,6 @@
  * Testcase: drmGetMagic() and drmAuthMagic()
  */
 
-#include "igt.h"
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdint.h>
@@ -48,6 +47,9 @@
 # include <pthread.h>
 #endif
 
+#include "igt.h"
+#include "igt_types.h"
+
 IGT_TEST_DESCRIPTION("Call drmGetMagic() and drmAuthMagic() and see if it behaves.");
 
 static bool
@@ -192,8 +194,6 @@ static void test_basic_auth(int master)
 
 igt_main
 {
-	int master;
-
 	/* root (which we run igt as) should always be authenticated */
 	igt_describe("Check drm client is always authenticated.");
 	igt_subtest("getclient-simple") {
@@ -220,6 +220,8 @@ igt_main
 
 	/* above tests require that no drm fd is open */
 	igt_subtest_group {
+		igt_fd_t(master);
+
 		igt_fixture
 			master = drm_open_driver_master(DRIVER_ANY);
 	
-- 
2.37.2
