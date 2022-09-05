Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D2A10E14C
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:54:00 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oV53V-007p83-3k
 for igt-dev@lists.freedesktop.org; Mon, 05 Sep 2022 07:53:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 07:52:38 +0200
Message-Id: <803df363b6db271f401c01abe155933bd456d14e.1662357022.git.mchehab@kernel.org>
In-Reply-To: <cover.1662357022.git.mchehab@kernel.org>
References: <cover.1662357022.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 04/77] i915/gem_linear_blits: Close device
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/77] at: https://lore.kernel.org/all/cover.1662357022.git.mchehab@kernel.org/

 tests/i915/gem_linear_blits.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index 1fd5b733c3ce..d02751be9232 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -47,6 +47,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_types.h"
 
 IGT_TEST_DESCRIPTION("Test doing many blits with a working set larger than the"
 		     " aperture size.");
@@ -236,7 +237,7 @@ igt_main
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	uint64_t count = 0;
 	bool do_relocs;
-	int fd = -1;
+	igt_fd_t(fd);
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
-- 
2.37.2
