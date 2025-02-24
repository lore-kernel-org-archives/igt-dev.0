Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A04C021BB
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 17:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653BF10E353;
	Mon, 24 Feb 2025 17:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwIinvVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9CF10E356
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740417856; x=1771953856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=krT6dsey6RSBzD4ud569RNfs19+4RPlj4DauAQPN+xQ=;
 b=JwIinvVqxpSN7iErygqO43ZroeIN2JTny63ND7WjE7GlXfVhf3ry7tXL
 F6/E7fnpGHvDuUsJkVmxEOnTJv4LkHpQQyWHmfhwc3M3zN4ll/A92K/YO
 9tM8LAkVMDEwMOmRgejuGe4T/R7WfIp1Mx+WrQao27ElmcfvYawL2YyAA
 OwINgxm3HVrccP+qv2iVJl+X1TXjMuGy+/epwSiaEHVjpysacR9vvZsFp
 6iBtSV9hJz7ToiCgyuaoh6RE1J9cMaEiuyqw35tDEMSiBdvl5aXFFnYSG
 Af2AtAAdk6T00Jv4NSFPDI0Pt/i6RRHYx7+qqzppcAfeY42v/j0WHwUSR g==;
X-CSE-ConnectionGUID: 3ORwg9pZSGC/3bD1jU4ImQ==
X-CSE-MsgGUID: avc9ZS9+RR+r2YxvEXcq0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41307441"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41307441"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:24:15 -0800
X-CSE-ConnectionGUID: J2FdCrCHQuO93RVs6i4dwQ==
X-CSE-MsgGUID: UuFlyVynTFioRVnZ8I32TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117026028"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:24:14 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v6 3/4] tests/intel/xe_vm: Exclude invalid_flags tests from
 LNL and BMG
Date: Mon, 24 Feb 2025 12:40:09 -0500
Message-Id: <20250224174010.594192-4-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250224174010.594192-1-oak.zeng@intel.com>
References: <20250224174010.594192-1-oak.zeng@intel.com>
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

Due to a fix of out of bound prefetch issue, we now allow scratch
page coexist with fault mode on LNL and BMG, thus exclude those
tests on such HW.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 tests/intel/xe_vm.c | 47 ++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 0730dd3d3..834e0afd7 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2349,6 +2349,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
 	uint64_t bind_size;
 	int fd;
+	uint16_t dev_id;
 	const struct section {
 		const char *name;
 		int bo_n_pages;
@@ -2441,23 +2442,28 @@ igt_main
 		{ NULL },
 	};
 
-        const struct vm_create_section {
-                const char *name;
-                __u32 flags;
-        } xe_vm_create_invalid_flags[] = {
-                { "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
-                { "xe_vm_create_scratch_fault",
-                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
-                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
-                { "xe_vm_create_scratch_fault_lr",
-                        ~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
-                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
-                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
-                { }
-        };
+	const struct vm_create_section {
+		const char *name;
+		__u32 flags;
+	} xe_vm_create_invalid_flags1[] = {
+		{ "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+		{ }
+	};
+
+	const struct vm_create_section xe_vm_create_invalid_flags2[] = {
+		{ "xe_vm_create_scratch_fault",
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+		{ "xe_vm_create_scratch_fault_lr",
+			~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
+		{ }
+	};
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
 
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
@@ -2715,11 +2721,22 @@ igt_main
 		}
 	}
 
-	for (const struct vm_create_section *s = xe_vm_create_invalid_flags; s->name; s++) {
+	for (const struct vm_create_section *s = xe_vm_create_invalid_flags1;
+	     s->name; s++) {
 		igt_subtest_f("invalid-flag-%s", s->name)
 			invalid_flag(fd, s->flags);
 	}
 
+	for (const struct vm_create_section *s = xe_vm_create_invalid_flags2;
+	     s->name; s++) {
+		igt_subtest_f("invalid-flag-%s", s->name) {
+			igt_skip_on_f(IS_LUNARLAKE(dev_id) ||
+				      IS_BATTLEMAGE(dev_id),
+				      "Skip test on this platform\n");
+			invalid_flag(fd, s->flags);
+		}
+	}
+
 	igt_subtest("invalid-extensions")
 		invalid_extensions(fd);
 
-- 
2.26.3

