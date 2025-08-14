Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D18CA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 15:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FB710E0C5;
	Thu, 14 Aug 2025 15:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5xJsAZx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C0810E0C5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755187098; x=1786723098;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=K+t3M6qslYB5GPy1ajJMxvgAKo2eD7tHmExgC6hYJqQ=;
 b=H5xJsAZxf1FltsdhF+10XZRA/gRlYN9q8HYw0icFpg2ol89akMLhv7vK
 VRSGsCG49j+/pc3OrgRsDVFtBB0xI1v1cNuxgOeAp1FhaWHd20T7kMHb7
 cRfjK7hDXYxJQ2QcMzerCSm5HclNodgiJn/UOIHyNgtyoNlsIzUZ0q02T
 XjaYwMAPvLw0Go7qkiNbhKvrg6Y1rmbD08i2mSLtNKJRFaMSxjmCKmWDi
 6KCSscyojMHjAUMoagStjkMitTtqO09RdYtHp+/N+S4lIzc5UVaeUgifm
 299jDi+rVCkWKS/hdG5kIpdXMPQ5TCraUA8CXeFMP3+QIEQmXHWAgLOeR Q==;
X-CSE-ConnectionGUID: hpjuOH/VR1mxMU9WelhoDg==
X-CSE-MsgGUID: PvbxUetXRX2/9mWeJ+s5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57416448"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57416448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 08:58:18 -0700
X-CSE-ConnectionGUID: rVTpUJcaSJC6p21Uz+ydbA==
X-CSE-MsgGUID: IUWmyQBfTQqumqhh+zW3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="167149812"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2025 08:58:17 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH 1/3] lib/intel_compute: loop_kernel_duration in Pipeline
Date: Thu, 14 Aug 2025 15:58:12 +0000
Message-ID: <20250814155814.130545-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814155814.130545-1-nishit.sharma@intel.com>
References: <20250814155814.130545-1-nishit.sharma@intel.com>
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
duration the GPU will be running kernel.
loop_kernel_duration is checked for all pipelines.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_compute.c | 21 ++++++++++++++++++++-
 lib/intel_compute.h |  2 ++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..125331c53 100644
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
@@ -1849,7 +1861,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				    OFFSET_KERNEL, 0, false,
 				    execenv.array_size);
 
-	bo_execenv_exec(&execenv, ADDR_BATCH);
+	if (user && user->loop_kernel_duration) {
+		bo_execenv_exec_async(&execenv, ADDR_BATCH);
+		igt_measured_usleep(user->loop_kernel_duration);
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

