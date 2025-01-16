Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DC9C02185
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 00:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4436310E85B;
	Thu, 16 Jan 2025 00:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjMxW3Xw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3894710E537
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 00:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736986810; x=1768522810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWS8dOI5uCp8wGln7z31BVTo+/kcM9Cr3bw+2nMHDrw=;
 b=JjMxW3Xw/CdlCGMr4NIESRrgw2uUoVf3dIdsq5oYEqu1rIje3btHbgza
 mOz2J+bo/kLSduw//ePIiS15K3n8LEiJaTCt3eJepSNbdIhKq53sRUdJK
 MUgZpTrl94ALHcuJ/HtlhObw7XRauXBfd1w3uyZnb/3o1mgaJVTOM9R0f
 ObQljEaNAi/G6zCkxr75nfEgWpbfIELd/KzWYarsJJnU/4b4UkciBDGUs
 8urmFbjWBZ3wQyDlkNqd0TF9tlOHvnWXqNmriIGGgBsGDFI5zEiPBwHqe
 Rq4st4WKl7MUmbOi1FG/ZHWH7tndzj0GposwFF/1hm0jHAorJ1czGsUke A==;
X-CSE-ConnectionGUID: CEk73cctRJmK3l19gvr8QQ==
X-CSE-MsgGUID: DT4KRPpQT3+6kiRjjyVlOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37374271"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="37374271"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:10 -0800
X-CSE-ConnectionGUID: jhng3kkbTGyDtqBqK9lCLg==
X-CSE-MsgGUID: KIEYmCZ8Tl+OaasXdQ/fOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105146780"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:10 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t v2 2/9] tests/intel/xe_vm: Update invalid flag subtest
Date: Wed, 15 Jan 2025 16:19:33 -0800
Message-ID: <20250116001951.4159243-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
References: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
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

PXP introduced a new valid flag, so we need to add it to the test and
shift the first invalid bit left by one.

v2: only test the new flag if the kernel supports it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_vm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 6ee3f4634..40e92d805 100644
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
  * Description:
@@ -2221,6 +2237,13 @@ static void bind_flag_invalid(int fd)
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
@@ -2234,7 +2257,7 @@ static void bind_flag_invalid(int fd)
 	syncobj_reset(fd, &sync[0].handle, 1);
 
 	/* Using invalid flags should not work */
-	bind.bind.flags = 1 << 4;
+	bind.bind.flags = 1 << 5;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
 
-- 
2.43.0

