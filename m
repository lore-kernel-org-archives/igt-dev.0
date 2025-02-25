Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F44BC021B8
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 00:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AB510E0A6;
	Tue, 25 Feb 2025 00:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXh+fgMM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012FB10E09F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 00:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740443513; x=1771979513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/b38dL1Np5pqFTiSCMdDza4R8aqpwCw/8hh6JD6X8Uk=;
 b=iXh+fgMMn/lsqwM2kVelmD+GbDXVt/cNIw4ugbMrM1zbhMwjPxa1bW8y
 M2ub1OpP6eIJqL3msfJySeHP+pyFtO9ckyOQUSjFoRZX+Kqt33hXLdtzF
 VIarXhpl+WkxPqwjXSBqUZjnL/pCnE3eZ0/1LoPTVQ9CyRha5LIkCAv15
 DzRauRsNfaRcPbTtpNvXPIJo3C54TXHR9jF2o2uQHQUtcoK2Uan1aP0ew
 G/xX+RyVqAB4jY0s9ySP06uTZ1gl3tS7aKymwOBOsVYJBEf5H9OlU4ghf
 xqNLJvxEztlDULSp6oefqeEHTGnkJDzGanX1QUkw+vLrk0FLZaztONw0n w==;
X-CSE-ConnectionGUID: 2LFKRNDmRSmRWV6nhYW3NA==
X-CSE-MsgGUID: ucq+supjSVarM/nmheCgMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51863657"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="51863657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:31:53 -0800
X-CSE-ConnectionGUID: N3TqmyC3Rnq/hmck/FkN6Q==
X-CSE-MsgGUID: btmsL5MzTNiX2GUvUGhM0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="120840113"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 16:31:53 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v4 2/7] tests/intel/xe_vm: Update invalid flag subtest
 with valid PXP flag
Date: Mon, 24 Feb 2025 16:31:33 -0800
Message-ID: <20250225003140.2738645-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225003140.2738645-1-daniele.ceraolospurio@intel.com>
References: <20250225003140.2738645-1-daniele.ceraolospurio@intel.com>
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
index 0730dd3d3..40e92d805 100644
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
-- 
2.43.0

