Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A83C10E5D9
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:32 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpR-0016Sk-2b
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:36:26 +0200
Message-Id: <20220901063722.261828-19-mauro.chehab@linux.intel.com>
In-Reply-To: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 18/74] i915/gem_request_retire: Close device
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
 tests/i915/gem_request_retire.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
index da9d405ed443..9e163bd3af60 100644
--- a/tests/i915/gem_request_retire.c
+++ b/tests/i915/gem_request_retire.c
@@ -48,6 +48,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_types.h"
 
 IGT_TEST_DESCRIPTION("Collection of tests targeting request retirement code"
 		     " paths.");
@@ -103,10 +104,10 @@ test_retire_vma_not_inactive(int fd)
 	put_ahnd(ahnd);
 }
 
-int fd;
-
 igt_main
 {
+	igt_fd_t(fd);
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
-- 
2.37.2
