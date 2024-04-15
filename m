Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB98EC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 08:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4CF1123A4;
	Mon, 15 Apr 2024 08:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cidCi2qq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAFF11239C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713170523; x=1744706523;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JQh+y6WVe+w1iXWuIQNks2CD4w+5iiY2+C7r+vj/xnM=;
 b=cidCi2qqBKoHEIJICw3f5YCg/GchMCZnnYX9uPPk0wr4aLUFhPFnxOOp
 MFvjErOt5LzKo/W97KI/HX1JdzTW3edZ1wXD4ZbckI4AbhwI/VWqJyPoc
 qCrVENu5nHVzuSN3gvCsshd8sQTKN3XjGfDIgYxvOTkZhwANuwgKIxp3z
 AtV2Mpa7/eH4If5kP99IZYImZnxVeRjQ18O709v506lbDup8+d6YflwEs
 ItM44JwvdtnNqALmIKtRqPeVtPcUrNMV9mazxp5v4ufmsmy4YQbVaZ9/j
 0g0TBeT2kiQ3P39buu9yv0dL1IvIbmU7i9dc6AbXhBvz49a006285p4Nl w==;
X-CSE-ConnectionGUID: vfLHft3FTZmxt/3HTALiiA==
X-CSE-MsgGUID: /Selc+rbQ66R0INThVwQaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12395210"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="12395210"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:42:03 -0700
X-CSE-ConnectionGUID: 5bUXrR4/QD+/XABSDfl3sg==
X-CSE-MsgGUID: 94o4EikhR8m+R6/uRnePcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21941388"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2024 01:42:01 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 1/3] tests/intel/xe_pm: Test validates vm-bind userptr
 flag with suspend and resume
Date: Mon, 15 Apr 2024 14:10:33 +0530
Message-Id: <20240415084035.2603-2-sai.gowtham.ch@intel.com>
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

Test validates vm bind usertpr functionality, by suspend and resuming the device
after binding VM to a VA.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 80 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 62 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c8a5cc6de..fafd7a52e 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -33,6 +33,8 @@
 #define MAGIC_1 0xc0ffee
 #define MAGIC_2 0xdeadbeef
 
+#define USERPTR (0x1 << 0)
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -272,11 +274,26 @@ static void close_fw_handle(int sig)
  * @d3hot:	d3hot
  * @d3cold:	d3cold
  */
-
+/**
+ * SUBTEST: %s-vm-bind-%s
+ * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
+ * 		with vm bind %arg[2] combination
+ * Functionality: pm - %arg[1]
+ *
+ * arg[1]:
+ *
+ * @s2idle:     s2idle
+ * @s3:         s3
+ * @s4:         s4
+ *
+ * arg[2]:
+ *
+ * @usrptr:	usrptr
+ */
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
-	  enum igt_acpi_d_state d_state)
+	  enum igt_acpi_d_state d_state, unsigned int flags)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -320,10 +337,15 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
-	bo = xe_bo_create(device.fd_xe, vm, bo_size,
-			  vram_if_possible(device.fd_xe, eci->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	data = xe_bo_map(device.fd_xe, bo, bo_size);
+	if (flags & USERPTR) {
+		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
+		memset(data, 0, bo_size);
+	} else {
+		bo = xe_bo_create(device.fd_xe, vm, bo_size,
+				  vram_if_possible(device.fd_xe, eci->gt_id),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(device.fd_xe, bo, bo_size);
+	}
 
 	for (i = 0; i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
@@ -333,8 +355,12 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 
 	sync[0].handle = syncobj_create(device.fd_xe, 0);
 
-	xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
-			 bo_size, sync, 1);
+	if (bo)
+		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
+				 bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
+					 to_user_pointer(data), addr, bo_size, sync, 1);
 
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
@@ -398,9 +424,12 @@ NULL));
 			xe_exec_queue_destroy(device.fd_xe, bind_exec_queues[i]);
 	}
 
-	munmap(data, bo_size);
-
-	gem_close(device.fd_xe, bo);
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(device.fd_xe, bo);
+	} else {
+		free(data);
+	}
 
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
@@ -583,6 +612,13 @@ igt_main
 		{ "d3cold", IGT_ACPI_D3Cold },
 		{ NULL },
 	};
+	const struct vm_op {
+		const char *name;
+		unsigned int flags;
+	} vm_op[] = {
+		{ "usrptr", USERPTR },
+		{ NULL },
+	};
 
 	igt_fixture {
 		memset(&device, 0, sizeof(device));
@@ -593,7 +629,7 @@ igt_main
 
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
+			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -610,7 +646,7 @@ igt_main
 		igt_subtest_f("%s-basic-exec", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, s->state,
-					  NO_RPM);
+					  NO_RPM, 0);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
@@ -618,13 +654,21 @@ igt_main
 						      SUSPEND_TEST_NONE);
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
-					  NO_RPM);
+					  NO_RPM, 0);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32, s->state,
-					  NO_RPM);
+					  NO_RPM, 0);
+		}
+
+		for (const struct vm_op *op = vm_op; op->name; op++) {
+			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
+				xe_for_each_engine(device.fd_xe, hwe)
+					test_exec(device, hwe, 16, 32, s->state,
+						  NO_RPM, op->flags);
+			}
 		}
 
 		for (const struct d_state *d = d_states; d->name; d++) {
@@ -632,7 +676,7 @@ igt_main
 				igt_assert(setup_d3(device, d->state));
 				xe_for_each_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 1, 2, s->state,
-						  NO_RPM);
+						  NO_RPM, 0);
 				cleanup_d3(device);
 			}
 		}
@@ -649,7 +693,7 @@ igt_main
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 1,
-					  NO_SUSPEND, d->state);
+					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
 
@@ -657,7 +701,7 @@ igt_main
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32,
-					  NO_SUSPEND, d->state);
+					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
 	}
-- 
2.39.1

