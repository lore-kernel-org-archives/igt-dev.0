Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7508CC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 20:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151D310E858;
	Mon, 25 Mar 2024 20:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ec+YTNs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE8210E858
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711397512; x=1742933512;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1V1L0p4cBizxncXsI3y6Z0YKMV23Q4uyHNRV1gq+mMA=;
 b=Ec+YTNs+LmYGtzf7urfZPgBp3cwkCyXYB8FYTtJwBuGH3HLuKsoh9gsP
 GQyh/J6qww41LzPO3xlRwqXVqaX2MjQ0VxGmksjy/Wzou+jdCfZ7RDiBN
 KgtkhZzRQoTkAGjY4Mh+2injVty9nufiwnZiWJcXxpIo7s9YyAWDYGsm8
 gQtP6Qxi+n4S+N/6CVKX+kixV/yDRjrFLfwb2aiOwHDZvydogka8E0Xie
 KiibapP5gieOz8JSW10BPsP8dt8c9ElZCETTf8AOaWNpwmgWJss2GwXel
 zoYCw5seoUz8eV9sXbKhuqPqIvyF/8uf9SGG3RrZ/C4oKWBNO0ZHtvznt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6289296"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6289296"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16400513"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 13:11:50 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm: Tests vm-unbind all flag
 functionality with s&R
Date: Tue, 26 Mar 2024 01:40:45 +0530
Message-Id: <20240325201045.25805-4-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
References: <20240325201045.25805-1-sai.gowtham.ch@intel.com>
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

Test validates vm unbind all flag functionality with suspend and resume

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 61 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index e016f2bca..7a9816623 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -292,10 +292,23 @@ static void close_fw_handle(int sig)
  * @usrptr:     usrptr
  * @prefetch:  prefetch
  */
+
+/**
+ * SUBTEST: %s-vm-unbind-all
+ * Description: Validate vm unbind all flag functionality with suspend and resume
+ *
+ * Functionality: pm - %arg[1]
+ *
+ * arg[1]:
+ *
+ * @s2idle:     s2idle
+ * @s3:         s3
+ * @s4:         s4
+ */
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
-	  enum igt_acpi_d_state d_state, unsigned int flags)
+	  enum igt_acpi_d_state d_state, unsigned int flags, int n_vmas)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -364,12 +377,19 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 
 	sync[0].handle = syncobj_create(device.fd_xe, 0);
 
-	if (bo)
-		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
-				 bo_size, sync, 1);
-	else
+	if (bo) {
+		if (n_vmas) {
+			for (i = 0; i < n_vmas; i++)
+				xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
+						 bo_size, sync, 1);
+		} else {
+			xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
+					 bo_size, sync, 1);
+		}
+	} else {
 		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr, bo_size, sync, 1);
+	}
 
 	if (flags & PREFETCH)
 		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
@@ -421,8 +441,13 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
-			   bo_size, sync, 1);
+
+	if (n_vmas)
+		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
+	else
+		xe_vm_unbind_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
+				   bo_size, sync, 1);
+
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
 NULL));
 
@@ -641,7 +666,7 @@ igt_main
 
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
+			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -658,7 +683,7 @@ igt_main
 		igt_subtest_f("%s-basic-exec", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, s->state,
-					  NO_RPM, 0);
+					  NO_RPM, 0, 0);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
@@ -666,29 +691,35 @@ igt_main
 						      SUSPEND_TEST_NONE);
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
-					  NO_RPM, 0);
+					  NO_RPM, 0, 0);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32, s->state,
-					  NO_RPM, 0);
+					  NO_RPM, 0, 0);
 		}
 
 		for (const struct vm_op *op = vm_op; op->name; op++) {
 			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
 				xe_for_each_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 16, 32, s->state,
-						  NO_RPM, op->flags);
+						  NO_RPM, op->flags, 0);
 			}
 		}
 
+		igt_subtest_f("%s-vm-unbind-all", s->name) {
+			xe_for_each_engine(device.fd_xe, hwe)
+				test_exec(device, hwe, 16, 32, s->state, NO_RPM,
+					  0, 2);
+		}
+
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
 				xe_for_each_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 1, 2, s->state,
-						  NO_RPM, 0);
+						  NO_RPM, 0, 0);
 				cleanup_d3(device);
 			}
 		}
@@ -705,7 +736,7 @@ igt_main
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 1,
-					  NO_SUSPEND, d->state, 0);
+					  NO_SUSPEND, d->state, 0, 0);
 			cleanup_d3(device);
 		}
 
@@ -713,7 +744,7 @@ igt_main
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32,
-					  NO_SUSPEND, d->state, 0);
+					  NO_SUSPEND, d->state, 0, 0);
 			cleanup_d3(device);
 		}
 	}
-- 
2.39.1

