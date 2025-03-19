Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6782FC36002
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 22:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085E210E27D;
	Wed, 19 Mar 2025 22:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abXn8mrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A562A10E266
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742423159; x=1773959159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AaFS8lfr+lc7c3YVmQ8KWb4gIqKxgqARu3XjM8NTR4I=;
 b=abXn8mrpxKYWZd5/InqDOht2O2whXbG+dhmp2Y0PjVS6PtJ7KWuBFmso
 G8vo7bQcPo13OO1JbieR9iaf9zZ1lsf+Jh6ErF/Lb1/CC7YrjgfHKv0AC
 JTqORhdYlKnJd1duGIhvp1lSZOzFOrQAMGgVpcFm1QI+uGTaOkiPIwOfd
 Z1GW+h9gWzVsNUz3xAiUCIimTRJfbaYlQ3iHjYskSBqyfsahGsKUZJ02Q
 Ty6umiKCsdt1D7H3us+08Xva2PiP0TnrvB3NnOetPqyVf1NEPldr41z9M
 xklJG/eAPXmDW91lJrlL8MudsBSS99rccaHcIiJsJNv83fjSamdqYrKy/ g==;
X-CSE-ConnectionGUID: yEGgWOsTSAae6/rONqS70A==
X-CSE-MsgGUID: qGE3vh5OR9u148KH4EsYHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43510778"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43510778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:58 -0700
X-CSE-ConnectionGUID: j/M4CHC8TQy3lMUeyaXXoQ==
X-CSE-MsgGUID: 0HDtykrOQBOmfXigPuPfuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122540405"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:25:59 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, matthew.brost@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: [i-g-t v7 4/4] tests/intel/xe_vm: Allow scratch page under fault mode
 on LNL and BMG
Date: Wed, 19 Mar 2025 18:42:31 -0400
Message-Id: <20250319224231.1909393-5-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250319224231.1909393-1-oak.zeng@intel.com>
References: <20250319224231.1909393-1-oak.zeng@intel.com>
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
page coexist with fault mode on LNL and BMG. Modify invalid_flag
test to reflect this change.

v1: make the change in invalid_flag (vs caller) (Ashutosh)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 tests/intel/xe_vm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fdf74c114..928baf0de 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2259,10 +2259,17 @@ static void bind_flag_invalid(int fd)
 
 static void invalid_flag(int fd, __u32 flags)
 {
+	uint16_t dev_id = intel_get_drm_devid(fd);
 	struct drm_xe_vm_create create = {
 		.flags = flags,
 	};
 
+	if (IS_LUNARLAKE(dev_id) || IS_BATTLEMAGE(dev_id)) {
+		if ((flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE) &&
+		    (flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
+			return;
+	}
+
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
 }
 
-- 
2.26.3

