Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0E7C021A6
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 22:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3570710E14B;
	Thu, 13 Feb 2025 22:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlrIpFjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E7910E076
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739484691; x=1771020691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=krT6dsey6RSBzD4ud569RNfs19+4RPlj4DauAQPN+xQ=;
 b=ZlrIpFjzD+5RWMQEFNcoBjrq7XwLc+PE3Zw9Chg1xZQR5fJ7K3h6ZU3z
 9PZxhLDe1TgCul4Vc38OYuAGbm1ucgvqB9gSwnxZg0I8m2Yl4Cxfn3uV3
 8tkEoazgDq+LSfxdRNoCKH8nIFlk6Y4qCbIJ4hU1FvUofq27Y+AE0lxri
 QofrjGXUnBi3c8H1IQRH9WkBuVL5rp3klN1AfX9HxVDv3CzOKWzaRNaOQ
 tu6YpfIBk9urt+5EPMuKfITsiOqhfJWuMsphiphvVJxF/LkbySEFNZunb
 qsDDSWdV7G9deemRqPiZRrWE+X6GXbuqTOEMSWVOGdG6KDEe9CazzbCLR g==;
X-CSE-ConnectionGUID: cWonFYtvRXmxdDRNYHqfVw==
X-CSE-MsgGUID: CAnvIH1xR8SXQeXa9NGZDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39920737"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="39920737"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:11:30 -0800
X-CSE-ConnectionGUID: XXii4KpmSPWDEOYwqY1mcA==
X-CSE-MsgGUID: Jf9zx1/GT4qOfpYbkeczaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136509089"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:11:29 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 3/4] tests/intel/xe_vm: Exclude invalid_flags tests from LNL
 and BMG
Date: Thu, 13 Feb 2025 17:27:04 -0500
Message-Id: <20250213222705.275364-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250213222705.275364-1-oak.zeng@intel.com>
References: <20250213222705.275364-1-oak.zeng@intel.com>
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

