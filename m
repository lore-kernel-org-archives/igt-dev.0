Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A35C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3573610E2A7;
	Wed, 20 Mar 2024 15:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaeJGxav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04D810E2A7
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950241; x=1742486241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g4hioP71BrwSRK2+jD2FzAnfj3C9AioettItNFlbKGI=;
 b=TaeJGxavlawOHgq8QFF+2jDn0LKAvjcFgzIcpeGIKMdDAc/OgUWS5Y1r
 9JF5puM0Vns9DHfDkiIgUepWhlcOs3FG2/zTNuT7qnR72O/zggxvbPuji
 0dh2jgvXeyTRSgahbOdEdDLOo+PnUMlG/0VCOdxfX8wmTgozv3kDuW8+A
 kN09jKdhqjJNev+2tY9kV+xuuvkx22Ponf/ve75jG93qD/72QKGkBYsWW
 1lt38ag3hT7P3uuDcB1ibiMZyr/Mkp4X/DqhrYHCp6VB4QokBdAuS/T4v
 JsUdi2D5YgEoQDqhO1vif764EIvu7dwcSky8nynoQrM0xuwjkSpbyZSPa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6002399"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6002399"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14076155"
Received: from unknown (HELO localhost) ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:19 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v14 4/5] tests/intel/xe_exec_basic: add multigpu subtests
Date: Wed, 20 Mar 2024 16:56:58 +0100
Message-ID: <20240320155659.33518-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
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

