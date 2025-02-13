Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AF9C021A5
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 15:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F8810EB0D;
	Thu, 13 Feb 2025 15:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCMITyUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAF910E3C0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 15:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739460312; x=1770996312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0y22Ctrvuqx1cb4l00U0vAiV3H3LFyqr06zO2BJWpPA=;
 b=DCMITyULgKLb21i+RsPVYYPCI9ldlma6FAFk3aUK8khM/QGqroJ89SLK
 Be40hEWiVQTnljghcT1B3l3GD02yEDas8ag6SJUCy6ROC5AElcDlGChkK
 2qjlk3hFwXfyJjKQ5aXEYtvyOGv8++yhZN4VkT4k5yOCt4x2+yPbuBfz+
 E6oDlo2lahvDRXyJKDkoC6q7n/UFeEIOLuZ9QB+y54cPS7ueIp/NIppDE
 BwwQg3B5nNYGx7Rynu3i4DWIC7LoTGH3uw9dtDAYD0I+H+4s91R3xGdCV
 0j1cGZH2dy3h3TTkNi3MPv1OLwYeBcDtKhsLzF4ZAP4Wn0l8RmW1ts9Xg g==;
X-CSE-ConnectionGUID: rrYs9X/YT1ykm1lyhBVtiQ==
X-CSE-MsgGUID: LnGLW/qkSnyxuGuc3fGSLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57572637"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="57572637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:25:11 -0800
X-CSE-ConnectionGUID: /9LWgXvKSyuPdppN8WI9wQ==
X-CSE-MsgGUID: K/+9U+fsSWqJhVLN+zsyGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144120256"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 07:25:10 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 3/4] tests/intel/xe_vm: Exclude invalid_flags tests from LNL
 and BMG
Date: Thu, 13 Feb 2025 10:40:47 -0500
Message-Id: <20250213154048.273437-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250213154048.273437-1-oak.zeng@intel.com>
References: <20250213154048.273437-1-oak.zeng@intel.com>
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

