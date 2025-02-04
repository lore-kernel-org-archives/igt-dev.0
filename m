Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5FAC02197
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 18:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D82E10E36D;
	Tue,  4 Feb 2025 18:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIfEJSPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4F410E36D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692138; x=1770228138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0y22Ctrvuqx1cb4l00U0vAiV3H3LFyqr06zO2BJWpPA=;
 b=EIfEJSPT+o5zUqT4dCzYobuvyCHi9cGwO8AmW1ry0/rch6JkIswvsb+A
 fbCnIKL59lQSrdX8Kv9E/CYJLkroC5vP2nqHZ4SyRPtLimBqu+XVU0uiY
 dsm/lhrGCTnfRrn8I7Qfs01xGW5vMZU/jh38FzqG0WIuHqHQrg/Y6bCyE
 jD/IJaAPKcHHUJIgZosjKvxVwnGln6gpm/3uwkvb9ThKHABD0GunQB11y
 Pzl6jMl1tOCv2XzO/DL48Tav5vz9/cvA5QpMELHtkGfVrgsMD7BdOPPLe
 eke/UyjWzPvNSQihnAwTYnfuiUy4ECGOhW4meXJfMSkeEbv1qIKo2ZpiG w==;
X-CSE-ConnectionGUID: 6bxGAEe2RM2prUnB7WbrWw==
X-CSE-MsgGUID: +FvkRgJwRJ+ZHjaCUMP7gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39373152"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39373152"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:02:18 -0800
X-CSE-ConnectionGUID: /67mMz4lQCSPoOAPN7B3eg==
X-CSE-MsgGUID: 1S/+WABBQES6Tkp36FiSgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110653733"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:02:18 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 1/2] tests/intel/xe_vm: Exclude invalid_flags tests from LNL
 and BMG
Date: Tue,  4 Feb 2025 13:17:41 -0500
Message-Id: <20250204181742.4055152-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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
 tests/intel/xe_vm.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 0730dd3d3..3b74717a3 100644
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
@@ -2444,8 +2445,12 @@ igt_main
         const struct vm_create_section {
                 const char *name;
                 __u32 flags;
-        } xe_vm_create_invalid_flags[] = {
+        } xe_vm_create_invalid_flags1[] = {
                 { "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+                { }
+        };
+
+        const struct vm_create_section xe_vm_create_invalid_flags2[] = {
                 { "xe_vm_create_scratch_fault",
                         DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
                         DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
@@ -2458,6 +2463,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
 
 		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
@@ -2715,11 +2721,19 @@ igt_main
 		}
 	}
 
-	for (const struct vm_create_section *s = xe_vm_create_invalid_flags; s->name; s++) {
+	for (const struct vm_create_section *s = xe_vm_create_invalid_flags1; s->name; s++) {
 		igt_subtest_f("invalid-flag-%s", s->name)
 			invalid_flag(fd, s->flags);
 	}
 
+	for (const struct vm_create_section *s = xe_vm_create_invalid_flags2; s->name; s++) {
+		igt_subtest_f("invalid-flag-%s", s->name) {
+			igt_skip_on_f(IS_LUNARLAKE(dev_id) || IS_BATTLEMAGE(dev_id),
+				      "Skip test on this platform\n");
+			invalid_flag(fd, s->flags);
+		}
+	}
+
 	igt_subtest("invalid-extensions")
 		invalid_extensions(fd);
 
-- 
2.26.3

