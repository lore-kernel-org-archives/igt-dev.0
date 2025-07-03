Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA5CC77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 06:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6479410E7CA;
	Thu,  3 Jul 2025 06:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbVemioO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D5410E7CB
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 06:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751524247; x=1783060247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XNNd25RpioCzcXMwLl/rvDtO+HUJ+Ihi7rMj6V9/IB4=;
 b=nbVemioOzsZUHFqUhBfCbVSVaupcqGbb9Sm4u61GprOZZRgJwVHfTXPE
 sEpLexlXhdLtzzdR8A+NhNyf+wrBNt+uMCpuUK2L/fqPchhO1hw5wxtTr
 Dv/omnUNG1pWvxoTCR/5OppYeLqWsb36En2ojFW8w+Z8GpssHbYOdfII/
 SZQwyiWqp/V39UofHpgrIi6zzkqrqnTsdYjNBV1QOChD00RC/2W0YETUP
 S3YvJ+9L4VLGp5MET0LgEIXwMCrc3/v89YTO71B1UUH3fXqOwSuaBFNoE
 3mloOqby20p+VSFhdwCYgVpjJIdJcQQs9VYndHxb0VTKF4wLFVc9yUyY4 Q==;
X-CSE-ConnectionGUID: fQ+goNkiT8Cy/pTd9WxwEQ==
X-CSE-MsgGUID: F/M1HOlOQVauJFjMXyUlKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64886394"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64886394"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:47 -0700
X-CSE-ConnectionGUID: DGouOrn1T/yYpI0akQcUhw==
X-CSE-MsgGUID: 98oQnlq0RcO+yAyAPaq7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154635807"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:46 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/3] lib/intel_compute: use post-sync write to detect
 command level preemption
Date: Thu,  3 Jul 2025 08:30:36 +0200
Message-ID: <20250703063032.553963-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
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

At command level when long job compute walker is finished we might
be immediately switched to short job. This defers signalling of long
job user-fence giving false impression this job is still ongoing.

Add post-sync write to compute walker to allow detect this situation
and fail if command level preemption occurred instead TG preemption.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9549b58fdf..6126bdb3f7 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -53,6 +53,7 @@
 #define OFFSET_STATE_SIP			0xFFFF0000
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
+#define POST_SYNC_VALUE			0xabcdabcdcdefcdefull
 #define MAGIC_LOOP_STOP			0x12341234
 
 #define THREADS_PER_GROUP		32
@@ -63,6 +64,7 @@
 #define ENQUEUED_LOCAL_SIZE_Z		1
 #define DP_SS_CACHE_FLUSH		(1 << 12)
 #define DP_PIPELINE_FLUSH		(1 << 2)
+#define WRITE_IMM_DATA			(1 << 0)
 #define WRITE_TIMESTAMP		(3 << 0)
 
 /*
@@ -1557,7 +1559,7 @@ static void xe2lpg_compute_exec_compute(int fd,
 					bool	 threadgroup_preemption,
 					uint32_t work_size)
 {
-	uint8_t wb_mocs = intel_get_wb_mocs_index(fd);
+	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
 	int b = 0;
 
 	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
@@ -1617,7 +1619,7 @@ static void xe2lpg_compute_exec_compute(int fd,
 	addr_bo_buffer_batch[b++] = addr_surface_state_base >> 32;
 	addr_bo_buffer_batch[b++] = 0x001ff000;
 
-	if (sip_start_pointer) {
+	if (sip_start_pointer && !threadgroup_preemption) {
 		addr_bo_buffer_batch[b++] = XE2_STATE_SIP | 0x1;
 		addr_bo_buffer_batch[b++] = sip_start_pointer;
 		addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1665,12 +1667,12 @@ static void xe2lpg_compute_exec_compute(int fd,
 	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | wb_mocs << 4 |
-				    DP_PIPELINE_FLUSH | WRITE_TIMESTAMP;
+	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
+				    DP_PIPELINE_FLUSH | WRITE_IMM_DATA;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH;
 	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
-	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000000;
+	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;
+	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -2117,6 +2119,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	struct bo_dict_entry bo_dict_short[ARRAY_SIZE(bo_dict_long)];
 	struct bo_execenv execenv_short, execenv_long;
 	float *input_short, *output_short, *input_long;
+	uint64_t *post_data;
 	unsigned int long_kernel_loop_count = 0;
 	int64_t timeout_one_ns = 1;
 	bool use_loop_kernel = loop_kernel && !threadgroup_preemption;
@@ -2165,6 +2168,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	input_long = (float *) bo_dict_long[4].data;
 	input_short = (float *) bo_dict_short[4].data;
 	output_short = (float *) bo_dict_short[5].data;
+	post_data = (uint64_t *) bo_dict_long[8].data;
 
 	bo_randomize(input_short, SIZE_DATA);
 
@@ -2195,6 +2199,12 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	bo_execenv_exec(&execenv_short, ADDR_BATCH);
 	bo_check_square(input_short, output_short, SIZE_DATA);
 
+	/*
+	 * Catch command level preemption instead TG preemption. For TG and WMTP
+	 * post sync can't be visible at this point yet.
+	 */
+	igt_assert_neq_u64(POST_SYNC_VALUE, *post_data);
+
 	/* Check that the long kernel has not completed yet */
 	igt_assert_neq(0, __xe_wait_ufence(fd, &execenv_long.bo_sync->sync, USER_FENCE_VALUE,
 					   execenv_long.exec_queue, &timeout_one_ns));
@@ -2205,6 +2215,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	((int *)input_long)[0] = MAGIC_LOOP_STOP;
 
 	bo_execenv_sync(&execenv_long);
+	igt_assert_eq_u64(POST_SYNC_VALUE, *post_data);
 
 	bo_execenv_unbind(&execenv_short, bo_dict_short, entries);
 	bo_execenv_unbind(&execenv_long, bo_dict_long, entries);
-- 
2.43.0

