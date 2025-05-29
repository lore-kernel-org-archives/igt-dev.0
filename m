Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE89FC5B543
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 11:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFEC10E088;
	Thu, 29 May 2025 11:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPvrIJNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C1410E73B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748519563; x=1780055563;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3BsFTtKcQlzvGFeUpPZleAu7fUo4oXdvz3TbCzNNHCg=;
 b=aPvrIJNTQTOvytAJNGcGDyVecIqYTWXgSOfFQ1oAynMp85s16IVvipgE
 F3g5XHYT+4pjOxFhTqq/cqRbCHjaF7jT6o1XBdH7yNs7Fh1d7+ganSWAA
 OMwIBjdRmM442gGSB72Y1nEOK5Ni2pCRoucDL7k+fpl7KT98X1LkAuCoq
 YdioriwaSh/fPlZ+N6l+9vtfWIukX2Zv1nTWHNXlaip+Hi29KqeR5SZ8c
 ODnlkDFfS1eN66aNBL2r1H6m5+3J5t7qLZNRRzLGH22tX3XXiQpIjNvkw
 fXP6Bbq+4NCgVXxYRCY9staRGTDGzsauYx/15qxFd71pt5WNdsrI6yl7S g==;
X-CSE-ConnectionGUID: 8Ix41/MhSR2ozvUFu4E8lA==
X-CSE-MsgGUID: XQcI+aNzTz+6w7yyx/3iEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50630503"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50630503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:52:43 -0700
X-CSE-ConnectionGUID: NSS2Id55SWatbUI6pqUdzQ==
X-CSE-MsgGUID: wb8v/I52SPOzqNUolg51KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="144008384"
Received: from dut1130bmgfrd.igk.intel.com ([10.211.178.45])
 by fmviesa010.fm.intel.com with ESMTP; 29 May 2025 04:52:41 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH 2/2] tests/intel/xe_exec_system_allocator: Rebind the prefetch
 ranges
Date: Thu, 29 May 2025 11:52:37 +0000
Message-Id: <20250529115237.25974-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
References: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
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

v3: integrate prefetch rebind tests in test_exec. (Matthew Brost)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 9596f7be3..fb4db77c3 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -773,6 +773,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define MULTI_FAULT		(0x1 << 21)
 #define PREFETCH		(0x1 << 22)
 #define VRAM			(0x1 << 23)
+#define BIND			(0x1 << 24)
 
 #define N_MULTI_FAULT		4
 #define MAX_BATCH_DWORDS	16
@@ -978,6 +979,12 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
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
 struct test_exec_data {
 	uint32_t batch[32];
@@ -1392,6 +1399,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		sync[0].addr = to_user_pointer(exec_ufence);
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
 		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		if (flags & BIND) {
+			exec_ufence[0] = 0;
+			sync[0].addr = to_user_pointer(exec_ufence);
+			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 0 : 1);
+			xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+			exec_ufence[0] = 0;
+		}
 
 		for (i =0; i < n_execs; i++) {
 			int e = i % n_exec_queues;
@@ -1667,6 +1681,12 @@ igt_main
 		{ "vram-SZ_4K", PREFETCH, SZ_4K},
 		{ "vram-SZ_64K", PREFETCH | VRAM, SZ_64K},
 		{ "vram-SZ_2M", PREFETCH | VRAM, SZ_2M},
+		{ "bind-smem-SZ_4K", VRAM | BIND, SZ_4K},
+		{ "bind-smem-SZ_64K", VRAM | BIND, SZ_64K},
+		{ "bind-smem-SZ_2M", VRAM | BIND, SZ_2M},
+		{ "bind-vram-SZ_4K", BIND, SZ_4K},
+		{ "bind-vram-SZ_64K", BIND, SZ_64K},
+		{ "bind-vram-SZ_2M", BIND, SZ_2M},
 		{ NULL },
 	}, *m;
 	const struct section sections[] = {
-- 
2.34.1

