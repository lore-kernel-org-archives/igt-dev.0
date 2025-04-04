Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF79C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 12:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B4310EBA8;
	Fri,  4 Apr 2025 12:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPyXPg6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D689A10EBA8
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743769910; x=1775305910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z0ff2lWetTaTZi1HMsZ57c6Ebf7Ag1mXvA2XSNv2zjw=;
 b=NPyXPg6A9JFpslrc00VIepLYXJtR/imwArc88YBGS6EEGl5v032rv0Lb
 djJ4psTLgLAesYOIUW6OmAir8c3IYPWIhqbOWOPZHdUewhTAzOUvhHSex
 isvr8qpsM6he48b2ZpC7LZlMiWJRBF4J3zy9GBfsuh4pO3+7mOGdTi2Kk
 eJeMB3Lov9sN1VhaMaUHhK7S85I/SzLOgYTA5Qj48MH+dHUCOLZM8sImn
 2sPXc9t7Tt/m24ep9OKCAkbosgMLn4xzcqs6try3a7u2n1SBPSybSu/gA
 Cuj513ZuNnjo9pz1GyFYDBQyISS/eFWQMqsnZ2ZHt92UIy4H5IKr96NpN g==;
X-CSE-ConnectionGUID: uUJm9lcCSs6CT+ekqmY1tA==
X-CSE-MsgGUID: swwfVBloRLCAvmVkwtm+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55841466"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="55841466"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 05:31:49 -0700
X-CSE-ConnectionGUID: CqC2COR0R+SUrg+4Cii6Nw==
X-CSE-MsgGUID: s/qqpX8GTeeMk8mWAK921Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127281658"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.53])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 05:31:48 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v2 1/5] lib/intel_compute: add support for stoppable loop
Date: Fri,  4 Apr 2025 14:31:36 +0200
Message-Id: <20250404123140.260143-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
References: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
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

Current loop used for long running job in wmtp case has a drawback
in which we tweak number of loops.

Lets add loop which allows to be stopped from cpu write to first
input data dword. This requires to use volatile for input buffer
and uc.uc send to avoid checking cache instead of direct memory
read.

Before submitting short (compute square) job I've added 1 second
delay to allow other processes to just start many long running
jobs (loops) to make gpu really busy. Previously submission
long / short would complete before another process started same
long / short pair so concurency was more random.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_compute.c | 39 ++++++++++++++++++++++++++++++++-------
 lib/intel_compute.h |  2 ++
 opencl/loop.cl      |  9 +++++++++
 3 files changed, 43 insertions(+), 7 deletions(-)
 create mode 100644 opencl/loop.cl

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 28149db53e..50e134c8a5 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -46,7 +46,7 @@
 #define OFFSET_STATE_SIP			0xFFFF0000
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
-
+#define MAGIC_LOOP_STOP			0x12341234
 /*
  * TGP  - ThreadGroup Preemption
  * WMTP - Walker Mid Thread Preemption
@@ -1874,6 +1874,8 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
  * @short_kernel_size: size of @short_kernel
  * @sip_kernel: WMTP sip kernel which does save restore during preemption
  * @sip_kernel_size: size of @sip_kernel
+ * @loop_kernel: loop kernel binary stoppable by cpu write
+ * @loop_kernel_size: size of @loop_kernel
  */
 static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel,
 					unsigned int long_kernel_size,
@@ -1881,6 +1883,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 					unsigned int short_kernel_size,
 					const unsigned char *sip_kernel,
 					unsigned int sip_kernel_size,
+					const unsigned char *loop_kernel,
+					unsigned int loop_kernel_size,
 					struct drm_xe_engine_class_instance *eci,
 					bool threadgroup_preemption)
 {
@@ -1975,7 +1979,10 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	bo_sync_short->sync = 0;
 	sync_short.addr = ADDR_SYNC2;
 
-	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
+	if (loop_kernel)
+		bo_dict_long[0].size = ALIGN(loop_kernel_size, 0x1000);
+	else
+		bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
 	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
 
 	bo_dict_long[10].size = ALIGN(sip_kernel_size, 0x1000);
@@ -1984,7 +1991,10 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	bo_execenv_bind(&execenv_long, bo_dict_long, XE2_BO_PREEMPT_DICT_ENTRIES);
 	bo_execenv_bind(&execenv_short, bo_dict_short, XE2_BO_PREEMPT_DICT_ENTRIES);
 
-	memcpy(bo_dict_long[0].data, long_kernel, long_kernel_size);
+	if (loop_kernel)
+		memcpy(bo_dict_long[0].data, loop_kernel, loop_kernel_size);
+	else
+		memcpy(bo_dict_long[0].data, long_kernel, long_kernel_size);
 	memcpy(bo_dict_short[0].data, short_kernel, short_kernel_size);
 
 	memcpy(bo_dict_long[10].data, sip_kernel, sip_kernel_size);
@@ -2024,13 +2034,22 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
+
+	/* Wait until multiple LR jobs will start to occupy gpu */
+	if (loop_kernel)
+		sleep(1);
+
 	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
 
 	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
 		       INT64_MAX);
+
 	/* Check that the long kernel has not completed yet */
 	igt_assert_neq(0, __xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE,
 					   execenv_long.exec_queue, &timeout_short));
+	if (loop_kernel)
+		((int *)bo_dict_long[4].data)[0] = MAGIC_LOOP_STOP;
+
 	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
 		       INT64_MAX);
 
@@ -2040,7 +2059,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	munmap(bo_sync_short, bo_size_short);
 	gem_close(fd, bo_short);
 
-	for (int i = 0; i < SIZE_DATA; i++) {
+	for (int i = loop_kernel ? 1 : 0; i < SIZE_DATA; i++) {
 		float input = input_data[i];
 		float output = output_data[i];
 		float expected_output = input * input;
@@ -2067,9 +2086,11 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 			 */
 			igt_assert(f1 > long_kernel_loop_count);
 		} else {
-			if (f1 != long_kernel_loop_count)
-				igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
-			igt_assert(f1 == long_kernel_loop_count);
+			if (!loop_kernel) {
+				if (f1 != long_kernel_loop_count)
+					igt_debug("[%4d] f1: %f != %u\n", i, f1, long_kernel_loop_count);
+				igt_assert(f1 == long_kernel_loop_count);
+			}
 		}
 	}
 
@@ -2088,6 +2109,8 @@ static const struct {
 			     unsigned int short_kernel_size,
 			     const unsigned char *sip_kernel,
 			     unsigned int sip_kernel_size,
+			     const unsigned char *loop_kernel,
+			     unsigned int loop_kernel_size,
 			     struct drm_xe_engine_class_instance *eci,
 			     bool threadgroup_preemption);
 	uint32_t compat;
@@ -2149,6 +2172,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 							  kernels->kernel, kernels->size,
 							  kernels->sip_kernel,
 							  kernels->sip_kernel_size,
+							  kernels->loop_kernel,
+							  kernels->loop_kernel_size,
 							  eci,
 							  threadgroup_preemption);
 
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index dc0fe2ec20..8310536a96 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -31,6 +31,8 @@ struct intel_compute_kernels {
 	const unsigned char *sip_kernel;
 	unsigned int long_kernel_size;
 	const unsigned char *long_kernel;
+	unsigned int loop_kernel_size;
+	const unsigned char *loop_kernel;
 };
 
 /**
diff --git a/opencl/loop.cl b/opencl/loop.cl
new file mode 100644
index 0000000000..7fd2c13368
--- /dev/null
+++ b/opencl/loop.cl
@@ -0,0 +1,9 @@
+__kernel void loop(volatile __global int *input,
+		   __global int *output,
+		   unsigned int count)
+{
+	while (1) {
+		if (input[0] == 0x12341234)
+			break;
+	}
+}
-- 
2.34.1

