Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8228D37E3F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 15:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DDA10E581;
	Wed, 14 Jan 2026 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/fnKyWu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1735610E581
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768404004; x=1799940004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=86zunRXwH1BXiKmLVHSjNmU2DI5jSvFyOOq/LEnuRig=;
 b=J/fnKyWutMwAwEXletrwyihikA0OnCpD/MxQWd0qJstQSFZKh25w2a8t
 ydkfNxxg9zsBHbc0ejJE+copFP07jO2TGd29ygNd2s6VzvofaB4XnZAwV
 p2fN+LH/Cl5qX6FiGFQKHrhwrPAFIvoi7gZ6ektLyO1ymhISbXg1nU0dw
 NDBrz/j77L+WYUu9yfRF3Yq9sXYPx8IAGePnA1UKeoek4lMPDOU7v+DxT
 r0I5zHyxbzKGr+QLcXx9ovcDz4RB+jOKOnT/WLYOPZiSi1T7+NPW3MbB7
 b6IsP4dcFkuiqnCfXpGYRaRYCfRsUrzX9WHYASK8p5BeS/Wasi37aposZ Q==;
X-CSE-ConnectionGUID: AZ6SQxp+QEKRNKmvfa7/Kg==
X-CSE-MsgGUID: xc91HtbcRhO17F8RnoeFnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69764387"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69764387"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:20:04 -0800
X-CSE-ConnectionGUID: Vr2vvBuIQBeLnZYKUuk9rw==
X-CSE-MsgGUID: VckDZpdCRg2sDRaJTSp87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204595971"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.77])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 07:20:02 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 5/5] lib/intel_compute: Add loop_kernel_duration
 support for xe3p
Date: Wed, 14 Jan 2026 16:19:36 +0100
Message-ID: <20260114151930.211512-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
References: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
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

From: Shuicheng Lin <shuicheng.lin@intel.com>

Xe3p is missing loop_kernel_duration. Port the implementation from
xe2lpg_compute_exec(). It stops failing "xe_compute@loop-duration-2s"
for xe3p platform.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_compute.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index c1fe027339..7b675ba51c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2098,6 +2098,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
 	int entries = ARRAY_SIZE(bo_dict);
+	int64_t timeout_one_ns = 1;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -2124,7 +2125,18 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, 0, false);
 
-	bo_execenv_exec(&execenv, ADDR_BATCH);
+	if (user && user->loop_kernel_duration) {
+		bo_execenv_exec_async(&execenv, ADDR_BATCH);
+		igt_measured_usleep(user->loop_kernel_duration);
+		/* Check that the loop kernel has not completed yet */
+		igt_assert_neq(0, __xe_wait_ufence(fd, &execenv.bo_sync->sync, USER_FENCE_VALUE,
+						   execenv.exec_queue, &timeout_one_ns));
+		((int *)bo_dict[2].data)[0] = MAGIC_LOOP_STOP;
+		bo_execenv_sync(&execenv);
+		user->skip_results_check = 1;
+	} else {
+		bo_execenv_exec(&execenv, ADDR_BATCH);
+	}
 
 	if (!user || (user && !user->skip_results_check))
 		bo_check_square(input_data, output_data, execenv.array_size);
-- 
2.43.0

