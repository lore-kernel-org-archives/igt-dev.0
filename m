Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D88FCD128D
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 18:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED0010F3E0;
	Mon,  1 Apr 2024 18:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggqV5UXH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AC710F3E0
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2024 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711997266; x=1743533266;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UBd9hWk2n1EkmfLAlVuI0VacQzHlz/WbeTTeqt2JfeI=;
 b=ggqV5UXHds6ZtirOykt1fSQCIQUk2xIfRxg4/UysHMJHXvibtBYTGh2D
 4iwxdf3gu1GQziG1weWFm/5pMbampJstRVmxomLn45qhsf+2PyQ0LpKDJ
 5sJbHgevKWfDi8H5+r088XRRllMqluwj3Kl3n7Cy8rKbJJNVtRVniTNIW
 MoQkYk7ATjQjjlcd8sks8c1mpX2L5+VGnMru8SGA+U4QUds81Uh9I31eq
 9lSQVQcimFurcW+bDMAW1bC6xOEgkFM6cRu6xh50J3RRPwviqzu7QiK+e
 fw9M9NY0COWim77adRO0F+mb8k0YX/2sRydMPcSkp+91cjTivHeoBzvbp g==;
X-CSE-ConnectionGUID: XYcuTAUwS76EPb+cR7XtQg==
X-CSE-MsgGUID: BlYSQZAmSD+Mu945fIAdhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7349563"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7349563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 11:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="18260688"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa006.jf.intel.com with ESMTP; 01 Apr 2024 11:47:45 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm: Tests vm-unbind all flag
 functionality with S&R
Date: Tue,  2 Apr 2024 00:16:31 +0530
Message-Id: <20240401184631.346-4-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240401184631.346-1-sai.gowtham.ch@intel.com>
References: <20240401184631.346-1-sai.gowtham.ch@intel.com>
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
 tests/intel/xe_pm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 839540f5c..6776f5505 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -35,6 +35,7 @@
 
 #define USERPTR         (0x1 << 0)
 #define PREFETCH        (0x1 << 2)
+#define UNBIND_ALL	(0x1 << 3)
 
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
  * @usrptr:     usrptr
  * @prefetch:	prefetch
+ * @unbind-all:	unbind-all
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
@@ -358,8 +362,9 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	sync[0].handle = syncobj_create(device.fd_xe, 0);
 
 	if (bo)
-		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
-				 bo_size, sync, 1);
+		for (i = 0; i < n_vmas; i++)
+			xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0,
+					 addr + i * bo_size, bo_size, sync, 1);
 	else
 		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr, bo_size, sync, 1);
@@ -414,8 +419,13 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
-			   bo_size, sync, 1);
+
+	if (n_vmas == MAX_VMAS)
+		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
+	else
+		xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
+				   bo_size, sync, 1);
+
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 NULL));
 
@@ -624,6 +634,7 @@ igt_main
 	} vm_op[] = {
 		{ "usrptr", USERPTR },
 		{ "prefetch", PREFETCH },
+		{ "unbind-all", UNBIND_ALL },
 		{ NULL },
 	};
 
-- 
2.39.1

