Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA7DC79F8A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 12:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3E10E395;
	Mon,  5 Jan 2026 12:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqhR7w0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248FA10E395
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 12:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767617307; x=1799153307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+hjJG6calFm2QLUu0FwyiBlsT9yKLUuQsF/9zcSV9g=;
 b=XqhR7w0tR3d6Re+AKZjAgqoNQJ1Ce+mrfIqqEeLGik4hayyjUPrEMHha
 KTvnOe8YA8BojbGUeMmqi5DkxxpDPhH1ZKF86vvVA3ZEyJuB5TXTSxgS4
 KUBz6VCIhdEgebQ4ulUjRztQVq9ce4Ma0IuhY+1/4XIHLJ88if0cnhg5t
 Wpa65Ju9ft3F/bd581I5FB2YKRpApy+2y54Uw/IRG3HIF/wlBX3xaZ+El
 S5ZdL7bsRLRmwTakdNP03Oji65ot6hkzVotNy4cfgdhP88RUI0Yb0ifCD
 uIJGS0yGcg39TfnqHANw7S2qSNIwUWHuTyFYguzySMoCA9CFUDI7nkZlF g==;
X-CSE-ConnectionGUID: hkEeDtRXS/ChCrCNSdAu1Q==
X-CSE-MsgGUID: ld/wmwqYSIq2lXiddv/4zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68961097"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="68961097"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 04:48:27 -0800
X-CSE-ConnectionGUID: rOm8MBcCRse7r5glQFcrrQ==
X-CSE-MsgGUID: meR2syLoTruAycjlk4FSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="206943505"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.165])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 04:48:26 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 5/5] lib/intel_compute: Add loop_kernel_duration
 support for xe3p
Date: Mon,  5 Jan 2026 13:48:03 +0100
Message-ID: <20260105124757.1421059-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
References: <20260105124757.1421059-7-zbigniew.kempczynski@intel.com>
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
index 306e1c2df0..e8b8867d02 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2101,6 +2101,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
 	int entries = ARRAY_SIZE(bo_dict);
+	int64_t timeout_one_ns = 1;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -2127,7 +2128,18 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 				  ADDR_STATE_CONTEXT_DATA_BASE, 0, false);
 
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

