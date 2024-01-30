Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10173C48286
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 17:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF22C113314;
	Tue, 30 Jan 2024 17:10:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7C3113308
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706634656; x=1738170656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yeqKFdkolOC1hnx1zyJ7fgg+hnG3Wlm8tssjTAX0szY=;
 b=carZNZx0P14nszUAtIL8KIgUBeuM+hTu57/TIuWgEeRfbYxOc/xTvcdJ
 GONeKdeDFmGaA7FmhvaXqqJE4+c/9WycStMnbM/GZ7FQcbUsmeu1ue7DB
 nU46xPEJRi2aIZR91y+fAhJbNOmXfvzXlEQn0Ntjh/W0nnoR+ALGL8oQn
 1KJfUjL8E9NK6KZPaCM0Vs+xeMotg5ox/VzFr5d+IcY/3HvOLn87lHC+N
 NwwgCSaqeE21Ms9tV4xDERqfnHWIARAXmqMRK3NxurMptREWHCT6Z1HDR
 Gpm30pALXKDj/qvpK26xnbbdA0JamaU/KaS/XANSN5+bGQjiz4TKp9obm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400488092"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="400488092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:07:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="29960538"
Received: from unknown (HELO localhost) ([10.246.4.20])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:07:57 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 7/8] tests/intel/xe_exec_basic: add multigpu subtests
Date: Tue, 30 Jan 2024 18:07:21 +0100
Message-ID: <20240130170722.44828-8-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
References: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
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

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_basic.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index e6f8db5b0..3defe1d87 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -11,6 +11,7 @@
  */
 
 #include "igt.h"
+#include "intel_multigpu.h"
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
+			xe_multi_fork_foreach_gpu(xe, gpu_idx)
+				xe_for_each_engine(xe, hwe)
+					test_exec(xe, hwe, 1, 1, 1, s->flags);
+			igt_waitchildren();
+		}
+
+		igt_subtest_f("multigpu-many-execqueues-many-vm-%s", s->name) {
+			xe_multi_fork_foreach_gpu(xe, gpu_idx)
+				xe_for_each_engine(fd, hwe)
+					test_exec(fd, hwe, 16, 32, 16, s->flags);
+			igt_waitchildren();
+		}
+
+		igt_subtest_f("multigpu-no-exec-%s", s->name) {
+			xe_multi_fork_foreach_gpu(xe, gpu_idx)
+				xe_for_each_engine(fd, hwe)
+					test_exec(fd, hwe, 1, 0, 1, s->flags);
+			igt_waitchildren();
+		}
+	}
 }
-- 
2.42.0

