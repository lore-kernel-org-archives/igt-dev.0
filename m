Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4861D46BE1
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 17:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BDF10E74E;
	Wed, 28 Jan 2026 17:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPPMUue5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8EE10E2D2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 17:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769621670; x=1801157670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gN3P1+aRg4C3Mcx636/82+p1UtejqeuvfhR0eFv6JIA=;
 b=VPPMUue5bwMlpdbcIdLpxm32K3PEu09K4bUTZg6YBkEf6WGwFKH9sxYW
 /4JoYg9kYE1o1RJYxOhhuBE9/8BFqc0o0Q9ETvRdnbYamAsxICt/TMrkJ
 CxKYpPUrPtrobwX1l/CuB1QhcAtO9euDqO36xEjR6cQWluAUI2WsyJfbY
 rbm5ENgpV3GAGnisKtL8vhFmcgU/rEKGm36mcSp+4PYv6lCHx5p1zIbRB
 5RHsvkGWXQBdos+PsuLcd9Nahr92pkOnzY3sngMS/OLAJo52zQh9J3Z3A
 sS9mk0j5nfLbdU6kV3TJdabBivq4K1YGTmGLlCOe++/0PqCBv755vHpB5 w==;
X-CSE-ConnectionGUID: 1WvgNPxjQ1G8VLb3VA6tbA==
X-CSE-MsgGUID: MwAA7Ev4Q7SMn9z45lrBTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82213449"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82213449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:30 -0800
X-CSE-ConnectionGUID: h3KS9BoxReSsRUYtAeXoKQ==
X-CSE-MsgGUID: Igh+Z4FBRR2sePgWLzb7kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245927184"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:29 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_exec_system_allocator: Fix compute
 array migration size
Date: Wed, 28 Jan 2026 18:29:06 +0100
Message-ID: <20260128173412.1319610-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128173412.1319610-1-francois.dugast@intel.com>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
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

This fixes an issue where the migrated region size when handling the GPU
page fault did not match test_compute()'s size argument.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 412ad0384..23a429f24 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2220,7 +2220,6 @@ test_compute(int fd, size_t size, unsigned int flags)
 		.array_size = size / sizeof(float),
 	};
 	float *compute_input;
-	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
@@ -2228,7 +2227,7 @@ test_compute(int fd, size_t size, unsigned int flags)
 	bind_system_allocator(&sync, 1);
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
-	compute_input = aligned_alloc(SZ_2M, size);
+	compute_input = aligned_alloc(size, size);
 	igt_assert(compute_input);
 
 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
@@ -2236,8 +2235,7 @@ test_compute(int fd, size_t size, unsigned int flags)
 	env.input_addr = to_user_pointer(compute_input);
 	env.vm = vm;
 
-	for (i = 0; i < env.loop_count; i++)
-		compute_input[i] = rand() / (float)RAND_MAX;
+	memset(compute_input, (rand() & 0xff), size);
 
 	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
 
-- 
2.43.0

