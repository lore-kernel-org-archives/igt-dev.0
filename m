Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B9C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 19:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DCA10F2D6;
	Wed,  8 May 2024 19:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNTD0M1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B55B10FA66
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 19:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715197862; x=1746733862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=luhMTqsbBA13sggioSLoPciF/t8k5n0+A7XYffuuibU=;
 b=SNTD0M1cL/rpQ1hIyBGIviRay5UYSdywYpSKN1/NogKlKCRECmbsmwIu
 i2W2fEwZAVHtpUfN/6u9X0QxkjVI23MXF9x30AZ4/s7o11b1LMrh7ddmU
 Z7rqDsAdqOSdC9/Gw/7KdGoW6DlIJfjv014GhLzUGLJ38g1y2svQnoyiD
 Qi9IH2hI7PFLLKB7jgEnoBhI73MSgp5AVL5CWXBashenG7RFLbKsnqsLt
 +zabU8f9ssZJvMBAu49ZI2y5UpfGDorx7B728hq/vOPrgOprP0TdjI8pC
 jsG4W43bRP6CKanxWczUJx520ScJUrD+VZVREmNdB8DvVq8c3GO6EmzBa g==;
X-CSE-ConnectionGUID: kD21F8zcSHekrePS1ZD8+w==
X-CSE-MsgGUID: lH73dEuMRzmMGyLBxoUTcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11239933"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11239933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:51:02 -0700
X-CSE-ConnectionGUID: rYGj8NynQgW+en7g+cmJxg==
X-CSE-MsgGUID: bhvwrNQpQbuVOxvzUPJcag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33798503"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:51:02 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Date: Wed,  8 May 2024 12:35:45 -0700
Message-Id: <20240508193545.2735209-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508193545.2735209-1-jonathan.cavitt@intel.com>
References: <20240508193545.2735209-1-jonathan.cavitt@intel.com>
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

It's possible for xe_supports_faults to return false if the system is
busy with multiple running tests.  This is because the check looks for
all active VMs and searches for VMs that do not have faults enabled,
returning false if any exist.  Recently, this check has been changed to
return EBUSY when the check fails in this way, so wait for up to ten
seconds for all the active VMs to flush out before proceeding.

Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_query.c                | 15 ++++++++-------
 lib/xe/xe_query.h                |  2 +-
 tests/intel/xe_exec_fault_mode.c |  9 ++++++++-
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 6df8f42649..145dee8142 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -300,27 +300,28 @@ void xe_device_put(int fd)
  * xe_supports_faults:
  * @fd: xe device fd
  *
- * Returns true if xe device @fd allows creating vm in fault mode otherwise
- * false.
+ * Returns the return value of the ioctl.  This can either be 0 if the
+ * xe device @fd allows creating a vm in fault mode, or an error value
+ * if it does not.
  *
  * NOTE: This function temporarily creates a VM in fault mode. Hence, while
  * this function is executing, no non-fault mode VMs can be created.
  */
-bool xe_supports_faults(int fd)
+int xe_supports_faults(int fd)
 {
-	bool supports_faults;
+	int ret;
 
 	struct drm_xe_vm_create create = {
 		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
 	};
 
-	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
 
-	if (supports_faults)
+	if (!ret)
 		xe_vm_destroy(fd, create.vm_id);
 
-	return supports_faults;
+	return ret;
 }
 
 static void xe_device_destroy_cache(void)
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index f91d16bdf5..54115f8f7c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -94,7 +94,7 @@ uint64_t xe_visible_available_vram_size(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
-bool xe_supports_faults(int fd);
+int xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 0b3f4cb8de..c1402889d9 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -406,8 +406,15 @@ igt_main
 	int fd;
 
 	igt_fixture {
+		struct timespec tv = {};
+		bool supports_faults;
+		int ret;
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(xe_supports_faults(fd));
+		do {
+			ret = xe_supports_faults(fd);
+		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < 10);
+		supports_faults = !ret;
+		igt_require(supports_faults);
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.25.1

