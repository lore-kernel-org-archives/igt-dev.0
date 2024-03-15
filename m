Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94189C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 05:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE910F2D6;
	Fri, 15 Mar 2024 05:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKQvW4M3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED25910E08C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 05:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710479186; x=1742015186;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jhwGwrnlrh/WxWHh8R9Dh9E6EnfhZ5Zv6c3V66ub0rA=;
 b=nKQvW4M3Z7CryezZajyTv2RAKRSKztGvLuT8kFOFrxoknMFz1B+Q62+H
 ey6q8hb89x6RQxEd1lLtH0CL0QMHs+4dRcJxlKqcOS1lsBlt9KWk7SBPL
 NddEwpR2NT94H3Gfeb6Bj9Vf6tHjxZW1E6ouZsIArYL4B0ry8oLOATWFy
 4M33Knn+Ua0H3C1nL5f+1H88h4I86CFVeSc3WOIUQQRNgtynuaNAZKUNn
 adbvoc+GfBo0pRs8b2JinOT8YurNT4KPhY9bASUg3rnmFRCBY2gbhXX+9
 zoWEahcNY38Sa4elLq6pbyCWtGdWaavSg7vamjVVN95kPNfNgIMOVfiFj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16788380"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="16788380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 22:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12582866"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa009.jf.intel.com with ESMTP; 14 Mar 2024 22:06:24 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_pm: Test to validate vm bind
 functionality with suspend and resume
Date: Fri, 15 Mar 2024 10:35:35 +0530
Message-Id: <20240315050536.21319-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
References: <20240315050536.21319-1-sai.gowtham.ch@intel.com>
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

Test validates vm bind functionality, by suspend and resuming the device
after binding VM to a VA.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_pm.c | 103 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index fcbed6249..ac402e757 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -33,6 +33,9 @@
 #define MAGIC_1 0xc0ffee
 #define MAGIC_2 0xdeadbeef
 
+#define USERPTR         (0x1 << 0)
+#define PREFETCH        (0x1 << 5)
+
 typedef struct {
 	int fd_xe;
 	struct pci_device *pci_xe;
@@ -273,10 +276,28 @@ static void close_fw_handle(int sig)
  * @d3cold:	d3cold
  */
 
+/**
+ * SUBTEST: %s-vm-bind-%s
+ * DESCRIPTION: Test to check suspend/autoresume on %arg[1] state
+ * 		with vm bind %arg[2] combination
+ * Functionality: pm - %arg[1]
+ *
+ * arg[1]:
+ *
+ * @s2idle:	s2idle
+ * @s3:         s3
+ * @s4:         s4
+ *
+ * arg[2]:
+ *
+ * @basic:	basic
+ * @usrptr:	usrptr
+ * @prefetch:	prefetch
+ */
 static void
 test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
-	  enum igt_acpi_d_state d_state)
+	  enum igt_acpi_d_state d_state, unsigned int flags, bool test_vm)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -308,7 +329,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 
 	if (check_rpm)
 		igt_assert(in_d3(device, d_state));
-
 	vm = xe_vm_create(device.fd_xe, 0, 0);
 
 	if (check_rpm)
@@ -320,21 +340,45 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
-	bo = xe_bo_create(device.fd_xe, vm, bo_size,
-			  vram_if_possible(device.fd_xe, eci->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	data = xe_bo_map(device.fd_xe, bo, bo_size);
+	if (flags & USERPTR)
+		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
+	else {
+		if (flags & PREFETCH)
+			bo = xe_bo_create(device.fd_xe, 0, bo_size,
+					  all_memory_regions(device.fd_xe) |
+					  vram_if_possible(device.fd_xe, 0),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		else
+			bo = xe_bo_create(device.fd_xe, 0, bo_size,
+					  vram_if_possible(device.fd_xe, eci->gt_id),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(device.fd_xe, bo, bo_size);
+	}
+	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
 		bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(device.fd_xe, 0);
-	};
+	}
 
 	sync[0].handle = syncobj_create(device.fd_xe, 0);
 
-	xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
-			 bo_size, sync, 1);
+	if (bo) {
+		xe_vm_bind_async(device.fd_xe, vm, bind_exec_queues[0], bo, 0, addr,
+				 bo_size, sync, 1);
+	} else {
+		xe_vm_bind_userptr_async(device.fd_xe, vm, bind_exec_queues[0],
+					 to_user_pointer(data), addr,
+					 bo_size, sync, 1);
+	}
+
+	if (flags & PREFETCH)
+		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
+								bo_size, sync, 1, 0);
+
+	if (test_vm)
+		igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);
 
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
@@ -398,9 +442,10 @@ NULL));
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
@@ -585,6 +630,16 @@ igt_main
 		{ NULL },
 	};
 
+	const struct vm_op {
+		const char *name;
+		unsigned int flags;;
+	} vm_op[] = {
+		{ "basic", 0 },
+		{ "usrptr", USERPTR },
+		{ "prefetch", PREFETCH },
+		{ NULL },
+	};
+
 	igt_fixture {
 		memset(&device, 0, sizeof(device));
 		device.fd_xe = drm_open_driver(DRIVER_XE);
@@ -594,7 +649,7 @@ igt_main
 
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
+			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0, 0);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -611,7 +666,7 @@ igt_main
 		igt_subtest_f("%s-basic-exec", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, s->state,
-					  NO_RPM);
+					  NO_RPM, 0, 0);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
@@ -619,13 +674,13 @@ igt_main
 						      SUSPEND_TEST_NONE);
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
-					  NO_RPM);
+					  NO_RPM, 0, 0);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32, s->state,
-					  NO_RPM);
+					  NO_RPM, 0, 0);
 		}
 
 		for (const struct d_state *d = d_states; d->name; d++) {
@@ -633,10 +688,20 @@ igt_main
 				igt_assert(setup_d3(device, d->state));
 				xe_for_each_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 1, 2, s->state,
-						  NO_RPM);
+						  NO_RPM, 0, 0);
 				cleanup_d3(device);
 			}
 		}
+
+		for (const struct vm_op *op = vm_op; op->name; op++) {
+			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
+				xe_for_each_engine(device.fd_xe, hwe)
+					test_exec(device, hwe, 16, 32, s->state,
+						  NO_RPM, op->flags, 1);
+			}
+		}
+
+
 	}
 
 	for (const struct d_state *d = d_states; d->name; d++) {
@@ -650,7 +715,7 @@ igt_main
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 1,
-					  NO_SUSPEND, d->state);
+					  NO_SUSPEND, d->state, 0, 0);
 			cleanup_d3(device);
 		}
 
@@ -658,7 +723,7 @@ igt_main
 			igt_assert(setup_d3(device, d->state));
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32,
-					  NO_SUSPEND, d->state);
+					  NO_SUSPEND, d->state, 0, 0);
 			cleanup_d3(device);
 		}
 	}
-- 
2.39.1

