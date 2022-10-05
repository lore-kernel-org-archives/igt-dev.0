Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4788210E49C
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 07:46:04 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.61.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 13A6D580C23
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 00:45:55 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1ofz6F-000Egp-38
 for igt-dev@lists.freedesktop.org; Wed, 05 Oct 2022 09:45:51 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Oct 2022 09:45:45 +0200
Message-Id: <20221005074546.55955-77-mauro.chehab@linux.intel.com>
In-Reply-To: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
References: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 76/77] i915/gem_ctx_isolation: Close
 device before exit
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
Reviewed-by: Nirmoy Das<nirmoy.das@intel.com>
Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/i915/gem_ctx_isolation.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 95d13969fa61..dc52a9a03130 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -25,6 +25,7 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_dummyload.h"
+#include "igt_types.h"
 
 #define MAX_REG 0x200000
 #define NUM_REGS (MAX_REG / sizeof(uint32_t))
@@ -979,7 +980,7 @@ igt_main
 	unsigned int has_context_isolation = 0;
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg;
-	int i915 = -1;
+	igt_fd_t(i915);
 
 	igt_fixture {
 		int gen;
-- 
2.37.3
