Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62810E652
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 06:18:33 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E6E67580BF8
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Sep 2022 23:18:30 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ochRl-000Ri0-07
 for igt-dev@lists.freedesktop.org; Mon, 26 Sep 2022 08:18:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 08:18:20 +0200
Message-Id: <11248e9305e8bd5123d1e6584fb24998dba567bd.1664173031.git.mchehab@kernel.org>
In-Reply-To: <cover.1664173031.git.mchehab@kernel.org>
References: <cover.1664173031.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 75/76] i915/gem_exec_balancer: Close device before
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

 tests/i915/gem_exec_balancer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 6e6bf47043d5..4300dbd12f37 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -35,6 +35,7 @@
 #include "igt_gt.h"
 #include "igt_perf.h"
 #include "igt_sysfs.h"
+#include "igt_types.h"
 #include "sw_sync.h"
 
 IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
@@ -3302,7 +3303,7 @@ static bool has_parallel_execbuf(int i915)
 
 igt_main
 {
-	int i915 = -1;
+	igt_fd_t(i915);
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
-- 
2.37.3
