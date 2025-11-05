Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861CFCCFA13
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 03:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70310E154;
	Wed,  5 Nov 2025 03:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+YqTJrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E67B10E108
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 03:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762314698; x=1793850698;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pRichPbMbq/rKFXraVP7Db3S2TkkCGxQgI22uTa0JVc=;
 b=V+YqTJrRRx4dA/SxOpqmjJI1K5yn6pYWnGtOdaDnblcaOqWm8LN2H83e
 pJiyurSRMGpxICIvF9JCdxmgTZo9OFi5iEEsCDJVe3tf4aB7izDZP/fSE
 B/z6qQCHd0f2o66lv19UDOkZzpZKkAhKm4my7ZX5ghxPmGZULf+AhmTOT
 eBzygBvAO9dEI0RT1ludPea/wGIntBXNdWgEJQYT3FyT4mj0AKmYmeYRf
 Hzlwwdr+9arIeBf5Jt5adgo0AGn8mbVXOTgd+WLimu+eIaJVTBgOyt2Um
 pwD0H4tVGdwWZEsKHHjLT4OFukEVFxohZoX/zdkLvX0iQBQT93lPIj2Sd g==;
X-CSE-ConnectionGUID: IYN6FDcNTSiehtR2rFSg3Q==
X-CSE-MsgGUID: /7OnEFRsRquLtUpnGjIoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64336571"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64336571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 19:51:38 -0800
X-CSE-ConnectionGUID: ettsdUy/RKCruetLdWSUug==
X-CSE-MsgGUID: /JBRWXspR5K7dbIPbHJuOQ==
X-ExtLoop1: 1
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2025 19:51:37 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v10 1/3] lib/intel_compute: loop_kernel_duration in
 Pipeline
Date: Wed,  5 Nov 2025 03:51:32 +0000
Message-ID: <20251105035134.54594-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105035134.54594-1-nishit.sharma@intel.com>
References: <20251105035134.54594-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Incase of multi-ccs it is expected that all ccs engines will be busy.
There's no existing code which keeps GPU busy for a specified duration,
So we need to terminate loop kernel from CPU after the desired time has
elapsed.
Introduce the loop_kernel_duration variable to control kernel execution
duration in compute pipelines. Currently this is supported in xe2lg and
xe3lpg pipelines.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 26 +++++++++++++++++++++++++-
 lib/intel_compute.h |  2 ++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..8d632269c 100644
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
 
@@ -1849,7 +1862,18 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				    OFFSET_KERNEL, 0, false,
 				    execenv.array_size);
 
-	bo_execenv_exec(&execenv, ADDR_BATCH);
+	if (user && user->loop_kernel_duration) {
+		bo_execenv_exec_async(&execenv, ADDR_BATCH);
+		igt_measured_usleep(user->loop_kernel_duration);
+		/* Check that the loop kernel has not completed yet */
+		igt_assert_neq(0, __xe_wait_ufence(fd, &execenv.bo_sync->sync, USER_FENCE_VALUE,
+						   execenv.exec_queue, &timeout_one_ns));
+		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
+		bo_execenv_sync(&execenv);
+		user->skip_results_check = 1;
+	} else {
+		bo_execenv_exec(&execenv, ADDR_BATCH);
+	}
 
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

