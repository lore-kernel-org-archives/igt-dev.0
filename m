Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B4DC982D4
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 15:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C033C10E8CE;
	Fri, 16 Jan 2026 15:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVYx3xdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0314810E8CE
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768578424; x=1800114424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9l0pkB1Ho0DDExpLH70cJqIEujapKbyW2FfvtOWf3Mo=;
 b=ZVYx3xdTOp667XkRH7wIKjKvhd3KJVc5B+qlUGLNo87KsNf1VvxQT/yU
 yz7JIqG4L0YWcoS/Kf+lsIWiMGK8LPScofUXfKsad11HT56kFoFrUDgWV
 u1hz6cN7v+aXFqlX2UBViw6OjrWuQiC2WfZHynWiG41Zie5VdB1slsMiw
 qvRyhGUjsB/ZbP4tR5mZMEMSZgpUFVpGbC+cdxNCr3Gn9+DOd1UllNO9l
 JADhT/qJNkePeXt9IVSJsZ4l0+Ir5sNqJNXJVyid5URxZcfK6wnAqOAox
 7ZZyEX0HS5xBSF5dMzhacZ54blI1y0t34AA/l51g+IsbWoyZK+N+otAf2 w==;
X-CSE-ConnectionGUID: C5X/Y4GOQq6EfSPxqkgmng==
X-CSE-MsgGUID: MXD/SzR8TxapCIO3r6f2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68905322"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="68905322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 07:47:04 -0800
X-CSE-ConnectionGUID: U8LPj/t8QF2bjPfNmGxeOw==
X-CSE-MsgGUID: /RtzXYIuQUCXsI6zPmJAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="209749565"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.180])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 07:47:03 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 5/5] lib/intel_compute: Add loop_kernel_duration
 support for xe3p
Date: Fri, 16 Jan 2026 16:46:42 +0100
Message-ID: <20260116154636.204553-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
References: <20260116154636.204553-7-zbigniew.kempczynski@intel.com>
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

