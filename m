Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD90C28B22
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 23:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A122010E0D9;
	Wed,  5 Mar 2025 23:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhujK9Uf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E11610E856
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741218013; x=1772754013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jRZn+TgiruiqEdO12/wZVXMKZOxrXjJh4f78WWpdb/g=;
 b=MhujK9UfpDOQ5FftSsXgFrShV3zCbNbsKkD7iDxAiXyocn4Y0jcWIrCW
 zF4tSE9md9gQeQNde0o47MIS6NTqvZvhv+V+zA1LYPNbjgC+Ha/KYVPKS
 Lvg3IrjKA3ZOaABqZs+ioLFKt2uCoJlaOwRxAcxO7L+rjgaf/n3Yl1Pum
 IOwqMVChkWxDnpGSkcoIQd5tN6x7Ldjc13pcwAQos7HtrIhiJiYXtWwHy
 xCkXQMW+dod/5hXhj8nO+2TppyTdwigCcarWhkIhExje2JUvBpmjhAGIH
 /te+O3sYIB3wMAuFCPRPWfGmWkO53ndhhCqt6DpMZGxdoLUrNOckCuNue g==;
X-CSE-ConnectionGUID: puzrGRa8TxSKzlO22FZyzA==
X-CSE-MsgGUID: IPlzaY4cRGCSr6rK5UuE8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41917102"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="41917102"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:13 -0800
X-CSE-ConnectionGUID: LXn6o/hoSveiU4+oPeL6SA==
X-CSE-MsgGUID: YRYZqeRjRaOZ3zBWXSF/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118849511"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 15:40:13 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v5 1/6] tests/intel/xe_vm: Update invalid flag subtest
 with valid PXP flag
Date: Wed,  5 Mar 2025 15:39:42 -0800
Message-ID: <20250305233951.3488609-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
References: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
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

The invalid flag subtest also checks all the valid flags, so add the new
PXP flag to it.

v2: only test the new flag if the kernel supports it.
v3: rebase on the split of the update on the first invalid flag number
to its own patch.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com> #v2
---
 tests/intel/xe_vm.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fdf74c114..5a04835fa 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2173,6 +2173,22 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 }
 
+static bool pxp_interface_supported(int fd)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
+		.size = 0,
+		.data = 0,
+	};
+	int ret = 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
+		ret = -errno;
+
+	return ret != -EINVAL;
+}
+
 /**
  * SUBTEST: bind-flag-invalid
  * Functionality: bind
@@ -2220,6 +2236,13 @@ static void bind_flag_invalid(int fd)
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 	syncobj_reset(fd, &sync[0].handle, 1);
 
+	if (pxp_interface_supported(fd)) {
+		bind.bind.flags = DRM_XE_VM_BIND_FLAG_CHECK_PXP;
+		igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+		syncobj_reset(fd, &sync[0].handle, 1);
+	}
+
 	bind.bind.flags = DRM_XE_VM_BIND_FLAG_NULL;
 	bind.bind.obj = 0;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-- 
2.43.0

