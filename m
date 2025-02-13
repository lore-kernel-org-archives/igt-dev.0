Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659FCC02198
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 02:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF6610E1C0;
	Thu, 13 Feb 2025 02:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkL3l3kv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10EC10E1C0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 02:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412222; x=1770948222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0y22Ctrvuqx1cb4l00U0vAiV3H3LFyqr06zO2BJWpPA=;
 b=PkL3l3kvzcRsIykaKDAda+HUoOYV/mxsgD2RNvMAgATeRtsXjIOsnz06
 raXauFBjQ7uPM+hZkAfIZ+d7cjNsE7KAjT2fa9f6dDGra3CPNPEyAwhox
 TsGTdKgx0883Wmj8wjPFNAvSzZWEjZIdRgEz4a8kKupsQm7ZJkSvxG1sT
 VLjooKhWzra6TiHTap38zu7hMEllxexDEO/1Kavl30n4NwmeeFiEs1fxn
 V+MzRHkBQjdwberdqGAs6GARYU+Y861d+awjc64rgj/Vv0HjCBeX/K+At
 RpFibaoAgLYzTzUF9WTdzGi63NHTkZ7XPMcZlRGx+Z8wPNvfoHb5QEB9B g==;
X-CSE-ConnectionGUID: J7g1ozT7SSmml1BwgNZw/w==
X-CSE-MsgGUID: HPbxdMFARu+vnlQBirBgqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39329684"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39329684"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:03:41 -0800
X-CSE-ConnectionGUID: BIt4NEpnTYyBt98+OfJNSQ==
X-CSE-MsgGUID: G3zKX89zT9W+EGuRR5uAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="112856257"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:03:41 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 3/4] tests/intel/xe_vm: Exclude invalid_flags tests from LNL
 and BMG
Date: Wed, 12 Feb 2025 21:19:14 -0500
Message-Id: <20250213021915.264978-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250213021915.264978-1-oak.zeng@intel.com>
References: <20250213021915.264978-1-oak.zeng@intel.com>
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

