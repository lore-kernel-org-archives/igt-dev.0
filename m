Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8515CEB2FD
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 05:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6521110E0C9;
	Tue,  1 Oct 2024 05:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rqq+d+jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDFF10E0C9
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 05:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727759605; x=1759295605;
 h=message-id:date:mime-version:from:subject:to:cc:
 content-transfer-encoding;
 bh=EQhCYm5t3JIuOO+sm7j6yYDmrE/AjmgX31XebOocYhI=;
 b=Rqq+d+jkfPDXBrOFX1s3mSWekFSxEHRKDmGbaB0scP9+AfPmJwX39yvg
 Ct9BTka5ODxavbsfIAzPOmqYRyE63kSoJuoQb7+zbuc0q7+Wq1z3T6mXN
 L31AsYc/eLgTYojMGHm1LtT2tT8uuHyUByZ2usYTTLUqN7g4dN/SJsryg
 qFfrlwSc0XrMA3DflQSdxJSodsDPdAxEPksuXKNBafpZduRbjy3pQ5MPJ
 iCwVWoBwMGwU976yR8HW5lJYmHavQCnAL4HPFFrWSwZU9KQ+FmYNVGSA/
 Nh3DuprF4TqIPSh64qLoJ747fh+SDp1CdAa0ZxCZlHc2R2+N2hLwAg8Am w==;
X-CSE-ConnectionGUID: 4m2iRKioRqyb981/DPYcqw==
X-CSE-MsgGUID: HBqkuXUFT4aGAYnqsospkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26377721"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26377721"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:13:25 -0700
X-CSE-ConnectionGUID: EKQp4rqnRwiAPIkYd3p3MA==
X-CSE-MsgGUID: F/kyDaRIQ8KsKe5odFFGSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73947887"
Received: from cjordan-mobl1.ger.corp.intel.com (HELO [10.213.200.32])
 ([10.213.200.32])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:13:24 -0700
Message-ID: <d779e0b6-46c7-4345-b9f9-75fe61e3cb2b@linux.intel.com>
Date: Tue, 1 Oct 2024 07:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH] tests/intel/xe_pm: Fix code style issues
Content-Language: en-US
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Fix indentation and checkpatch issues that were mostly introduced by
8d2086223.

CC: Kamil Konieczny <kamil.konieczny@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_pm.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index b50d8dbc7..c57a4ec15 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -95,6 +95,7 @@ static void dpms_on_off(device_t device, int mode)
 static bool runtime_usage_available(struct pci_device *pci)
 {
 	char name[PATH_MAX];
+
 	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
 		 pci->domain, pci->bus, pci->dev, pci->func);
 	return access(name, F_OK) == 0;
@@ -215,7 +216,6 @@ static void close_fw_handle(int sig)
 }
 
 #define MAX_VMAS 2
-
 static void*
 child_exec(void *arguments)
 {
@@ -267,7 +267,7 @@ child_exec(void *arguments)
 
 	if (args->flags & USERPTR) {
 		data = aligned_alloc(xe_get_default_alignment(args->device.fd_xe),
-							 bo_size);
+				     bo_size);
 		memset(data, 0, bo_size);
 	} else {
 		if (args->flags & PREFETCH)
@@ -284,7 +284,7 @@ child_exec(void *arguments)
 
 	for (i = 0; i < args->n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(args->device.fd_xe, vm,
-											  args->eci, 0);
+						      args->eci, 0);
 		bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(args->device.fd_xe, 0);
 	};
@@ -294,7 +294,7 @@ child_exec(void *arguments)
 	if (bo) {
 		for (i = 0; i < n_vmas; i++)
 			xe_vm_bind_async(args->device.fd_xe, vm, bind_exec_queues[0], bo,
-							 0, addr + i * bo_size, bo_size, sync, 1);
+					 0, addr + i * bo_size, bo_size, sync, 1);
 	} else {
 		xe_vm_bind_userptr_async(args->device.fd_xe, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr, bo_size, sync, 1);
@@ -302,7 +302,7 @@ child_exec(void *arguments)
 
 	if (args->flags & PREFETCH)
 		xe_vm_prefetch_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
-							 addr, bo_size, sync, 1, 0);
+				     addr, bo_size, sync, 1, 0);
 
 	if (check_rpm) {
 		igt_assert(in_d3(args->device, args->d_state));
@@ -360,16 +360,16 @@ child_exec(void *arguments)
 	}
 
 	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
-			   INT64_MAX, 0, NULL));
+				INT64_MAX, 0, NULL));
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	if (n_vmas > 1)
 		xe_vm_unbind_all_async(args->device.fd_xe, vm, 0, bo, sync, 1);
 	else
 		xe_vm_unbind_async(args->device.fd_xe, vm, bind_exec_queues[0], 0,
-						   addr, bo_size, sync, 1);
+				   addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(args->device.fd_xe, &sync[0].handle, 1,
-			   INT64_MAX, 0, NULL));
+				INT64_MAX, 0, NULL));
 
 	for (i = 0; i < args->n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
@@ -449,8 +449,8 @@ child_exec(void *arguments)
 /**
  * SUBTEST: %s-%s-basic-exec
  * Description:
- *	Setup GPU on %arg[2] state then test exec on %arg[1] state
- * 	without RPM
+ *    Setup GPU on %arg[2] state then test exec on %arg[1] state
+ *    without RPM
  * Functionality: pm - %arg[1]
  * GPU requirements: D3 feature should be supported
  *
@@ -468,7 +468,7 @@ child_exec(void *arguments)
 /**
  * SUBTEST: %s-vm-bind-%s
  * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
- * 		with vm bind %arg[2] combination
+ *              with vm bind %arg[2] combination
  * Functionality: pm - %arg[1]
  *
  * arg[1]:
@@ -499,8 +499,8 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
 		  enum igt_suspend_state s_state, enum igt_acpi_d_state d_state,
 		  unsigned int flags)
 {
-	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ? 
-								SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+				     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
 	struct drm_xe_engine_class_instance *eci;
 	int active_threads = 0;
 	pthread_t threads[65]; /* MAX_ENGINES + 1 */
@@ -519,7 +519,7 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
 		active_threads++;
 
 		pthread_mutex_lock(&child_ready_lock);
-		while(!child_ready)
+		while (!child_ready)
 			pthread_cond_wait(&child_ready_cond, &child_ready_lock);
 		child_ready = false;
 		pthread_mutex_unlock(&child_ready_lock);
@@ -582,7 +582,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 		}
 	}
 
-	threshold = vram_used_mb + (SIZE / 1024 /1024);
+	threshold = vram_used_mb + (SIZE / 1024 / 1024);
 	igt_require(threshold < vram_total_mb);
 
 	bo = xe_bo_create(device.fd_xe, 0, SIZE, placement, 0);
-- 
2.34.1

