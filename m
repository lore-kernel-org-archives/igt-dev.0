Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068DBC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 20:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562F910E7E9;
	Mon, 25 Mar 2024 20:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QINa9QB0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948BB10E7CA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711397509; x=1742933509;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Fa28UWTF/+V0msOQzkCkc6ZAFtxR4wMRUnMPivybH8k=;
 b=QINa9QB0bd4z+FA7udS9bTR3XhPJB2zT5zfo3OEOBbI5YSbUjs8n40mu
 FMaOsxBZ1DvUeHDFU7vh1WXAqbqjSzwONOcRknJ8hJjZdIkOIk2MPThPo
 ZOgpYcVI9TjtGxXTN+D8O7ohHLhix9JO3W/QXFr2S9N9/tOegxydD4UTo
 Nr9k/gBTmNkTDroYeZYvC/LvKmaYRmnwiWcTlfwRgXkHOyYE9hVghFyM9
 nN/RH48dREwFRzKwwUFsAuOJuWQrTjd0Np9znn67kgnhYdDApYqZxkiEt
 5/LpLM33FoU3CrA+zn+Rplv13pTsIXLHXqKXy/Oz2oCaP8XpJqp4aHkIy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6289291"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6289291"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 13:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="16400502"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 13:11:46 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH i-g-t 1/3] tests/intel/xe_pm: Test validates vm-bind userptr
 flag with suspend and resume
Date: Tue, 26 Mar 2024 01:40:43 +0530
Message-Id: <20240325201045.25805-2-sai.gowtham.ch@intel.com>
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

Test validates vm bind usertpr functionality, by suspend and resuming the device
after binding VM to a VA.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 78 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 3aa247353..8659e87cc 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -33,6 +33,8 @@
 #define MAGIC_1 0xc0ffee
 #define MAGIC_2 0xdeadbeef
 
+#define USERPTR         (0x1 << 0)
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
+ * @usrptr:     usrptr
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
+	} else {
+		bo = xe_bo_create(device.fd_xe, vm, bo_size,
+				  vram_if_possible(device.fd_xe, eci->gt_id),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(device.fd_xe, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
 
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
@@ -398,9 +424,10 @@ NULL));
 			xe_exec_queue_destroy(device.fd_xe, bind_exec_queues[i]);
 	}
 
-	munmap(data, bo_size);
-
-	gem_close(device.fd_xe, bo);
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(device.fd_xe, bo);
+	}
 
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
@@ -583,6 +610,13 @@ igt_main
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
@@ -593,7 +627,7 @@ igt_main
 
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
+			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -610,7 +644,7 @@ igt_main
 		igt_subtest_f("%s-basic-exec", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, s->state,
-					  NO_RPM);
+					  NO_RPM, 0);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
@@ -618,13 +652,21 @@ igt_main
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
@@ -632,7 +674,7 @@ igt_main
 				igt_assert(setup_d3(device, d->state));
 				xe_for_each_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 1, 2, s->state,
-						  NO_RPM);
+						  NO_RPM, 0);
 				cleanup_d3(device);
 			}
 		}
@@ -649,7 +691,7 @@ igt_main
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 1,
-					  NO_SUSPEND, d->state);
+					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
 
@@ -657,7 +699,7 @@ igt_main
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

