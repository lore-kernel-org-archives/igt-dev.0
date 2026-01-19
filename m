Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1968CD29C4C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 17:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09F710E4D4;
	Mon, 19 Jan 2026 17:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TreoNrA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CDF10E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768842639; x=1800378639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9l0pkB1Ho0DDExpLH70cJqIEujapKbyW2FfvtOWf3Mo=;
 b=TreoNrA+FIc6k8YZX9+pa+WPj6jZ/86uUmtRKU3MqJdGlTO13hZZ+upC
 0pxNGrI31qP0E9kkgXOixuYmfgti0qnjMI5ybOXlw0glVFNC/tjilohWD
 bkRBU+DloH8BTVLGGJ2Ngw+R+NP0NdYam80xhd1u2Ng8P1YHF8rDM4xRg
 QB8qHvzMBGRi+WS58Bj0+1YYN6RpaMzkFJcrNfAJXsxEAXGhTkeKr0cky
 KeXfn3B2bbwa4VaSklo+173SMq4aoSMQUV1D5M8mJSvmoEDRUPGNm4qZL
 OIffgimk+QPY8O+volUyqE3k/Mi3fa+FChTa42w03mrUhT0MYMBJsBR/F Q==;
X-CSE-ConnectionGUID: gilP50EdQfuFMAQycbfRaw==
X-CSE-MsgGUID: Ue5E6W1YQaeZVolhXUH/rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73911306"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="73911306"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 09:10:39 -0800
X-CSE-ConnectionGUID: IMsllqcWR92jpmtyeIsJTw==
X-CSE-MsgGUID: uDs2rJQXQeCRyTIZxzfp1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205165277"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.142])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 09:10:38 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 5/5] lib/intel_compute: Add loop_kernel_duration
 support for xe3p
Date: Mon, 19 Jan 2026 18:10:19 +0100
Message-ID: <20260119171013.442579-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119171013.442579-7-zbigniew.kempczynski@intel.com>
References: <20260119171013.442579-7-zbigniew.kempczynski@intel.com>
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
index f27344e717..3244d4fde5 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2098,6 +2098,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
 	int entries = ARRAY_SIZE(bo_dict);
+	int64_t timeout_one_ns = 1;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -2125,7 +2126,18 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
 				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, 0, false,
 				  execenv.array_size);
 
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

