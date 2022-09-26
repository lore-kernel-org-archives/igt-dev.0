Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C189910E63E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 06:18:32 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DE3CC580677
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 23:18:30 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ochRl-000Rhw-04
 for igt-dev@lists.freedesktop.org; Mon, 26 Sep 2022 08:18:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:18:19 +0200
Message-Id: <17eee538fd49c9bcc7cb63d45a461234c5e2332f.1664173031.git.mchehab@kernel.org>
In-Reply-To: <cover.1664173031.git.mchehab@kernel.org>
References: <cover.1664173031.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 74/76] core_auth: Close(master) before exit
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
See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.mchehab@kernel.org/

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
2.37.3
