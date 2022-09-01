Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476BF10E5D8
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:35 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpQ-0016S2-TW
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:36:15 +0200
Message-Id: <20220901063722.261828-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/74] i915/gem_create: Close device before
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
Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/gem_create.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index d7d2a017223d..f3e5f15408fe 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -54,6 +54,7 @@
 #include "intel_chipset.h"
 #include "igt_aux.h"
 #include "igt_dummyload.h"
+#include "igt_types.h"
 #include "igt_x86.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
@@ -780,7 +781,7 @@ static void create_ext_cpu_access_big(int fd)
 
 igt_main
 {
-	int fd = -1;
+	igt_fd_t(fd);
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
-- 
2.37.2
