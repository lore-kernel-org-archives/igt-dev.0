Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4449EF01837
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE2910ED40;
	Fri,  6 Mar 2026 13:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHAHK8T5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E3610ED39
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803878; x=1804339878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7KDe9m7Fe3cm4dWCfe2QVTZwTBsBKhHGzLeOgY25M7o=;
 b=aHAHK8T5zk5Wz9I4C/AbyjB4C+YtXpLw6EtDOBOvy/YarN2xA1tuA43O
 Idt3aTBkzzuj3K2EtSDgyYElVEsVf/an7TjOKE/UYVhuOOlJ94SQuvtFl
 dSgRK3WTb6h8vGUXx4jB656BmymmetwiD2SQwDiuhBX6auhY+WYvzqC8t
 RClRV7+QjtwrI2JNINTkFqw2/uEEw9undyTfv3S5K/1sD7dSmbFi2R7WN
 KF09f/CCECm+sK0kWOusjH0ihEDFiJ0T1ajAhFcmvxndADP7qnvAquwZZ
 xj6WM7P0Yyb/NiLPY/sVGCUrv/AXY+3qY5UPm+dgm5K/oRi9LUbyteKFw A==;
X-CSE-ConnectionGUID: DJGawYfXQA+DXaf84kOkqg==
X-CSE-MsgGUID: s8zmvB0ISL2+DI76l23++Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84236847"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84236847"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:18 -0800
X-CSE-ConnectionGUID: cvkMb5RySRmWCRPY/ktEdw==
X-CSE-MsgGUID: MA5/jwM6SOuyX24m88znkg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:16 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v2 1/4] tests/intel/xe_exec_system_allocator: Fix compute array
 migration size
Date: Fri,  6 Mar 2026 14:29:09 +0100
Message-ID: <20260306133059.859625-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306133059.859625-1-francois.dugast@intel.com>
References: <20260306133059.859625-1-francois.dugast@intel.com>
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

This fixes an issue where the migrated region size when handling the GPU
page fault did not match test_compute()'s size argument.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 14f5e358f..73603a27c 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2258,7 +2258,6 @@ test_compute(int fd, size_t size, unsigned int flags)
 		.array_size = size / sizeof(float),
 	};
 	float *compute_input;
-	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
@@ -2266,7 +2265,7 @@ test_compute(int fd, size_t size, unsigned int flags)
 	bind_system_allocator(&sync, 1);
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
-	compute_input = aligned_alloc(SZ_2M, size);
+	compute_input = aligned_alloc(size, size);
 	igt_assert(compute_input);
 
 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
@@ -2274,8 +2273,7 @@ test_compute(int fd, size_t size, unsigned int flags)
 	env.input_addr = to_user_pointer(compute_input);
 	env.vm = vm;
 
-	for (i = 0; i < env.loop_count; i++)
-		compute_input[i] = rand() / (float)RAND_MAX;
+	memset(compute_input, rand() % 255 + 1, size);
 
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
-- 
2.43.0

