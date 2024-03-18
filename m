Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220E6C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 13:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465610F723;
	Mon, 18 Mar 2024 13:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eX/wiWMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC43D10F723
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710768406; x=1742304406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g4hioP71BrwSRK2+jD2FzAnfj3C9AioettItNFlbKGI=;
 b=eX/wiWMFk6Q/gIOVCAGGumv1gYGGr/FB+Ekh2eUmXOgjmGy5eK5ReF7Y
 9VpUhCZdprMLiTws4ZX3MF/JpnHzGaAvODMs041kfUHuU59cNLjz+vbiX
 Vw14/7DutEvEeQzYhvucX4kwAl3Puj1UTJXqrdz1DLtz+AMJcMCDl8Yb6
 pBeZler2dtSqz+MUHQsIwMRiZ20ZasOd8KfN6UbZSHUNADJNsWXs/C8Ad
 3NvdzoNNc8tWP3ZlRdCr5jNDqkwqQVggvBMdm/HkP/aTkgP5T109xqJ1/
 g+6kckVQcXL/vqlwJPIy9G1WEgroJDtLi6ZJTVVlPbzubTZBUKzUhRspl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9386927"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9386927"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13501405"
Received: from unknown (HELO localhost) ([10.245.246.221])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:26:44 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v13 4/5] tests/intel/xe_exec_basic: add multigpu subtests
Date: Mon, 18 Mar 2024 14:26:22 +0100
Message-ID: <20240318132624.110746-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
References: <20240318132624.110746-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a few multi-gpu subtests:

multigpu-once-*
multigpu-many-execqueues-many-vm-*
multigpu-no-exec-*

run on two or more GPUs. Many variant was limited to take at most
few seconds.

v10: use new renamed macro multi_fork_foreach_gpu_chip (Zbigniew)
v13: use igt_multi_fork_foreach_gpu (Janusz)

Cc: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_basic.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index e6f8db5b0..f0230a9ca 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -11,6 +11,7 @@
  */
 
 #include "igt.h"
+#include "igt_multigpu.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
@@ -54,6 +55,18 @@
  * Description: Run no-exec %arg[1] test
  * Test category: functionality test
  *
+ * SUBTEST: multigpu-once-%s
+ * Description: Run %arg[1] test only once on multiGPU
+ * Test category: functionality test
+ *
+ * SUBTEST: multigpu-many-execqueues-many-vm-%s
+ * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
+ * Test category: stress test
+ *
+ * SUBTEST: multigpu-no-exec-%s
+ * Description: Run no-exec %arg[1] test on multiGPU
+ * Test category: functionality test
+ *
  * arg[1]:
  *
  * @basic:				basic
@@ -368,4 +381,27 @@ igt_main
 
 	igt_fixture
 		drm_close_driver(fd);
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("multigpu-once-%s", s->name) {
+			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
+				xe_for_each_engine(gpu_fd, hwe)
+					test_exec(gpu_fd, hwe, 1, 1, 1, s->flags);
+			igt_waitchildren();
+		}
+
+		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s->name) {
+			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
+				xe_for_each_engine(gpu_fd, hwe)
+					test_exec(gpu_fd, hwe, 16, 32, 16, s->flags);
+			igt_waitchildren();
+		}
+
+		igt_subtest_f("multigpu-no-exec-%s", s->name) {
+			igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
+				xe_for_each_engine(gpu_fd, hwe)
+					test_exec(gpu_fd, hwe, 1, 0, 1, s->flags);
+			igt_waitchildren();
+		}
+	}
 }
-- 
2.42.0

