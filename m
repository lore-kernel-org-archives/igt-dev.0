Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4199FC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 18:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782AB10E5DE;
	Fri, 10 May 2024 18:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lbykgif+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D3010E305
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715366396; x=1746902396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/xYhli9MSalRfZfi+3K+yjcvftLU4GKWUOwrRzCIbCs=;
 b=Lbykgif+bV3yomUjU3BSbdhVKvurrV829pUvS3fij7SMx5aIzickWyhE
 6rnS0dWwBCtm358Cc95KhvUKPI6Xg0FpI/jMhQMPnSKDBKJ5uezUVa3D7
 LupnD2LzUt/JYSblHorMhcM6syuKPcpdJXsbA1szuN818ZIMlZfDgZlvT
 1U5bnY9WLu3emJrjmTHkTQYLt5V9URTvjXarYO2Lyd0KhSYHbX5OHpXO9
 yXJSH0K7bRbFkajBghQDZr8dQ31f1zBTTyq9NeP/2x6sR7rITyvdmlE1O
 jjJTTMzDmbhLSrtiACyvLBbVYBZC975Vtz53KdkSyYBqrZkTePcMWepPI Q==;
X-CSE-ConnectionGUID: x54Hna87SwOxnbCkIO/WrA==
X-CSE-MsgGUID: DdryS1hYRS6F36esn7ceeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11489596"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:39:55 -0700
X-CSE-ConnectionGUID: 0zyGH30vSaSVfFjJYaBKFw==
X-CSE-MsgGUID: LOsM7UL3RC2cnDHcCmtBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29764430"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:39:55 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2 1/2] lib/xe/xe_query: return errno from
 xe_supports_faults check
Date: Fri, 10 May 2024 11:24:37 -0700
Message-Id: <20240510182438.3178575-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240510182438.3178575-1-jonathan.cavitt@intel.com>
References: <20240510182438.3178575-1-jonathan.cavitt@intel.com>
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

Return the exact error value from the ioctl used in xe_supports_faults.
This is done because it is possible that faults are supported on the
system but are temporarily unavailable due to VM usage.  This change
allows the user to determine if they are willing to wait for fault
support to become active again.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_query.c | 15 ++++++++-------
 lib/xe/xe_query.h |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

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
-- 
2.25.1

