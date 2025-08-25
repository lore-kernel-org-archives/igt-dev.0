Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3A9CA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 11:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7731710E449;
	Mon, 25 Aug 2025 11:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtsHz5+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FB910E23F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 11:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756122943; x=1787658943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Gg+ODb9l+tScDEhSpKWgzy8blPqFVGTFqblrz/CHxno=;
 b=LtsHz5+/o+Y8x8ovi9BciayreZsx9+Wk86QqiAALV2Mw0DAtDklCLgz+
 BcppdIQa+aA5zIg7MkASSuXOE91fWcF2Of+gvdLsOuG8ZIm+7M3hZ/UE9
 AU3DpQs2eO86ehLBT4o/pIgC1T/TdnTR2qpMiTriR+53XY1Wu5tlX+Mof
 iwIgtf2YzT9DlLpJZTVYo7oH9k5ALDG5qdGBjOry/xs4QaNm8tu2y4t9c
 gTxpEpujHGr7YCrYQZQBFCg2OybQvnxZZva2iIuoWfU1OirMYCRJvLYCC
 c+jF8nfdwYOPyaiO5Ij1hOWEtjjtJJDSU311FuQvnRS27olltEHjicrzJ w==;
X-CSE-ConnectionGUID: 9C1wNVdcSCaYK9Pu2BQlIA==
X-CSE-MsgGUID: kdXnUd1IRmyCVzdtRwI/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58392495"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58392495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:55:43 -0700
X-CSE-ConnectionGUID: 4OMtMS8UTGCx/6AbqaUzaw==
X-CSE-MsgGUID: 9HKUJ5X2SA2u41W2bxePpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168887920"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by orviesa009.jf.intel.com with ESMTP; 25 Aug 2025 04:55:42 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH 1/3] lib/intel_compute: loop_kernel_duration in Pipeline
Date: Mon, 25 Aug 2025 11:55:36 +0000
Message-ID: <20250825115538.321253-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825115538.321253-1-nishit.sharma@intel.com>
References: <20250825115538.321253-1-nishit.sharma@intel.com>
MIME-Version: 1.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

To execute KERNEL in GPU for specific duration a brief sleep is
required. New variable loop_kernel_duration is introduced in
struct user_execenv which holds duration for sleep and during this
duration the GPU will be running kernel. xe_run_intel_compute_xxx()
calls are synchronous hence to execute workload on GPU for sometime
sleep has been called. loop_kernel_duration acts as sleep duration.
loop_kernel_duration is checked for all pipelines. Currently xe2lpg and
xe3lpg pipeline support loop_kernel shader hence loop_kernel_duration
works in these pipelines only.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_compute.c | 25 ++++++++++++++++++++++++-
 lib/intel_compute.h |  2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..5a919deb8 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -849,6 +849,9 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	uint16_t devid = intel_get_drm_devid(fd);
 	int entries = ARRAY_SIZE(bo_dict);
 
+	if (user && (user->kernel || user->loop_kernel_duration))
+		igt_skip("Pipeline doesn't support loop_kernel\n");
+
 	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Set dynamic sizes */
@@ -1131,6 +1134,9 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	int entries = ARRAY_SIZE(bo_dict);
 
+	if (user && (user->kernel || user->loop_kernel_duration))
+		igt_skip("Pipeline doesn't support loop_kernel\n");
+
 	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Set dynamic sizes */
@@ -1343,6 +1349,9 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	int entries = ARRAY_SIZE(bo_dict);
 
+	if (user && (user->kernel || user->loop_kernel_duration))
+		igt_skip("Pipeline doesn't support loop_kernel\n");
+
 	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Set dynamic sizes */
@@ -1731,6 +1740,9 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	int entries = ARRAY_SIZE(bo_dict);
 
+	if (user && (user->kernel || user->loop_kernel_duration))
+		igt_skip("Pipeline doesn't support loop_kernel\n");
+
 	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Set dynamic sizes */
@@ -1818,6 +1830,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	int entries = ARRAY_SIZE(bo_dict);
+	int64_t timeout_one_ns = 1;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1849,7 +1862,17 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				    OFFSET_KERNEL, 0, false,
 				    execenv.array_size);
 
-	bo_execenv_exec(&execenv, ADDR_BATCH);
+	if (user && user->loop_kernel_duration) {
+		bo_execenv_exec_async(&execenv, ADDR_BATCH);
+		igt_measured_usleep(user->loop_kernel_duration);
+		/* Check that the loop kernel has not completed yet */
+		igt_assert_neq(0, __xe_wait_ufence(fd, &execenv.bo_sync->sync, USER_FENCE_VALUE,
+					execenv.exec_queue, &timeout_one_ns));
+		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
+		bo_execenv_sync(&execenv);
+		user->skip_results_check = 1;
+	} else
+		bo_execenv_exec(&execenv, ADDR_BATCH);
 
 	if (!user || (user && !user->skip_results_check))
 		bo_check_square(input_data, output_data, execenv.array_size);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 412791d07..54a1c7f82 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -63,6 +63,8 @@ struct user_execenv {
 	uint64_t input_addr;
 	/** @output_addr: override default address of the output array if provided */
 	uint64_t output_addr;
+	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
+	uint64_t loop_kernel_duration;
 };
 
 enum execenv_alloc_prefs {
-- 
2.43.0

