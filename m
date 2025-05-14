Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A19C3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 20:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC69A10E744;
	Wed, 14 May 2025 20:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTu5w3yL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B392C10E748
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 20:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747256289; x=1778792289;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AnBPeWeLjbjWv9P0XBsrVBG0vm8p6Z3yE3fn/YJdSvs=;
 b=DTu5w3yLom/ZHsCdvN1qLS9ER19x83WZb7WDelEKNeQObhWNFPRUs+Eo
 +2IBmmZmZvUbYHtq65G5U30imtH9yUyjxYI0Tyyfnn48rhoSadg843fPP
 nEJ5HgYTJbW9LPRQbyU60j0MJ/lD0PBXUlWvhlqHodhqTYK8xPaj6tEUd
 +rpOmGt7TfHkP9iH9rfx/UVJybm5sSAp2XQ+PvK3zES5S6dzna98P+fmx
 JXe1EPHYleAGtffkPCI2qgq8VVZ1wWzkMSv8B1FASxPH0ZVK767WZdert
 ZxAYCoUF0laZofwGrbvuyJi9D1+WRHdFQ27mOjYJONelTREckNo50Ti5s A==;
X-CSE-ConnectionGUID: ZydAMU9mRXmk/rndCMtfwg==
X-CSE-MsgGUID: EapvTSyYTUmQzbGYqbICYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49067628"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49067628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:58:08 -0700
X-CSE-ConnectionGUID: n9K7sFCETn6+X2ksNXviFQ==
X-CSE-MsgGUID: jvgOIusYSNi0HelwszoC8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138573983"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by fmviesa008.fm.intel.com with ESMTP; 14 May 2025 13:58:07 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the prefetch
 ranges
Date: Wed, 14 May 2025 20:58:01 +0000
Message-Id: <20250514205801.40253-4-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514205801.40253-1-sai.gowtham.ch@intel.com>
References: <20250514205801.40253-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test rebinds the prefetch ranges to check the ideal behaviour of prefetch mechanism,
expecting address ranges in the corresponding mem regions has to be created again and
use those address ranges to submit workloads.

v2: Enhance VRAM/SMEM/BIND flags in the selection loop of this test. (Jonathan Cavitt)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index d4f2e8d98..227c60d76 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -141,6 +141,7 @@ static void signal_pdata(struct process_data *pdata)
 #define CPU_FAULT_PROCESS	(0x1 << 3)
 #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
 #define VRAM			(0x1 << 5)
+#define BIND			(0x1 << 6)
 
 static void process_check(void *ptr, uint64_t alloc_size, uint64_t stride,
 			  unsigned int flags)
@@ -484,6 +485,12 @@ static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
  * @vram-SZ_4K: with size of SZ_4K on vram region
  * @vram-SZ_64K: with size of SZ_64K on vram region
  * @vram-SZ_2M: with size of SZ_2M on vram region
+ * @bind-smem-SZ_4K: with size of SZ_4K on vram and rebinding of smem region
+ * @bind-smem-SZ_64K: with size of SZ_64K on vram and rebinding of smem region
+ * @bind-smem-SZ_2M: with size of SZ_2M on vram and rebinding of smem region
+ * @bind-vram-SZ_4K: with size of SZ_4K on smem and rebinding of vram region
+ * @bind-vram-SZ_64K: with size of SZ_64K on smem and rebinding of vram region
+ * @bind-vram-SZ_2M: with size of SZ_2M on smem and rebinding of vram region
  */
 #define MAX_BATCH_DWORDS 16
 static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
@@ -538,6 +545,13 @@ static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
 	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 	exec.exec_queue_id = exec_queues;
+	if (flags & BIND) {
+		exec_ufence[0] = 0;
+		sync[0].addr = to_user_pointer(exec_ufence);
+		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 0 : 1);
+		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		exec_ufence[0] = 0;
+	}
 
 	for (int i = 0; i < num_dwords; i++) {
 		result_ptr = (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
@@ -1765,6 +1779,13 @@ igt_main
 		{ "vram-SZ_4K", VRAM, SZ_4K},
 		{ "vram-SZ_64K", VRAM, SZ_64K},
 		{ "vram-SZ_2M", VRAM, SZ_2M},
+		{ "bind-smem-SZ_4K", VRAM | BIND, SZ_4K},
+		{ "bind-smem-SZ_64K", VRAM | BIND, SZ_64K},
+		{ "bind-smem-SZ_2M", VRAM | BIND, SZ_2M},
+		{ "bind-vram-SZ_4K", BIND, SZ_4K},
+		{ "bind-vram-SZ_64K", BIND, SZ_64K},
+		{ "bind-vram-SZ_2M", BIND, SZ_2M},
+		{ NULL },
 		{},
 	}, *m;
 
-- 
2.34.1

