Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B15C00A94
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 08:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154E611239D;
	Mon, 15 Apr 2024 08:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPO8STbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCA611239C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713170526; x=1744706526;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2vUJ2HW5w4RFx3F6Gkzx6XstvfKb5BrzSHMuOnY+fdw=;
 b=cPO8STbU7dAec9J6XNDxAZW3ckbjxgSwhXM6XcWpo6SiC8ahdTuWcAEq
 ZauWu0uUMsNlKuSa5PKDr86CKenK/owZtlHePN62yhWElhWiIrjjQCbRf
 /VoU4f90/S6JatudEUS7M8eD6ciGfeFayCPRiYwmOsjpjh7x43s94exF6
 wkVohHAS91HcH3gE+SIuLZ5mbYN/NgRc2589PT7P8sHJinIaBE17n11+Z
 n7zf/PDBA8jpS00nRz+l9h9Ph1TMZ24oMEQA6Qe8U7vuSbKZzENEjFGGN
 sc4m2IzAIL1W6Dn8gNNCoSYIGZ3xHFMkZzMCCH1nx5TecMeR1XxGicMS/ g==;
X-CSE-ConnectionGUID: caBKiwP5RLa6NJo6IQLWgQ==
X-CSE-MsgGUID: USRFKUHXQk+KMnBgMKz0ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12395224"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="12395224"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:42:06 -0700
X-CSE-ConnectionGUID: aa6bzOhtSz6QmUYe2ElYbw==
X-CSE-MsgGUID: CXzifhvHSgi8oc/7etC9hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21941414"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2024 01:42:04 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm: Tests vm-unbind all flag
 functionality with S&R
Date: Mon, 15 Apr 2024 14:10:35 +0530
Message-Id: <20240415084035.2603-4-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
References: <20240415084035.2603-1-sai.gowtham.ch@intel.com>
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

Test validates vm unbind all flag functionality with suspend and resume.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 8857265a9..0598bd4c4 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -35,6 +35,7 @@
 
 #define USERPTR (0x1 << 0)
 #define PREFETCH (0x1 << 2)
+#define UNBIND_ALL (0x1 << 3)
 
 typedef struct {
 	int fd_xe;
@@ -219,6 +220,7 @@ static void close_fw_handle(int sig)
 	close(fw_handle);
 }
 
+#define MAX_VMAS 2
 /**
  * SUBTEST: %s-basic
  * Description: set GPU state to %arg[1] and test suspend/autoresume
@@ -291,6 +293,7 @@ static void close_fw_handle(int sig)
  *
  * @usrptr:	usrptr
  * @prefetch:	prefetch
+ * @unbind-all: unbind-all
  */
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
@@ -308,6 +311,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
+	int n_vmas = flags & UNBIND_ALL ? MAX_VMAS : 1;
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
 	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
@@ -363,12 +367,14 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 
 	sync[0].handle = syncobj_create(device.fd_xe, 0);
 
-	if (bo)
-		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
-				 bo_size, sync, 1);
-	else
+	if (bo) {
+		for (i = 0; i < n_vmas; i++)
+			xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0,
+					 addr + i * bo_size, bo_size, sync, 1);
+	} else {
 		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr, bo_size, sync, 1);
+	}
 
 	if (flags & PREFETCH)
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
@@ -420,8 +426,11 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
-			   bo_size, sync, 1);
+	if (n_vmas > 1)
+		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
+	else
+		xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
+				   bo_size, sync, 1);
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 NULL));
 
@@ -630,6 +639,7 @@ igt_main
 	} vm_op[] = {
 		{ "usrptr", USERPTR },
 		{ "prefetch", PREFETCH },
+		{ "unbind-all", UNBIND_ALL },
 		{ NULL },
 	};
 
-- 
2.39.1

