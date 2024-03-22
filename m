Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB12C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F393112773;
	Fri, 22 Mar 2024 20:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXbUsGeN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7B112773
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140852; x=1742676852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lYB4sCjVJaGY/RNX2zN2+gUih9oRsJYMsHWpAxgjiDs=;
 b=LXbUsGeNBrFnOTozgFUgt3/bBKrmIbCuj98YeF2QCjk3ZnGvwT1IxkN+
 m2x2c43f5TdPuWDBMm1z3rAR2SCckQ+Z93iwUWQerWhTvSEZfIkMSVKpN
 jmd4sH+GyuqI7S9aV0JwB8hWltLh/MeXQgdR9K3hHr9cRKvqrFHtT1kt0
 1CbqZlpJP/GqgdqvdjWnaqJE7DtZuIGBzesJ9YW3FizaPw6ssn1QQWWqj
 HYCF1MasR78mtOG3UiCiWuRmeJHaBGaHg4zqQGeX9+wZokiKUcbBGMW1r
 WKYEoe1gd8yV6PFqRuM8/ijrbRLwPBoR/5if9F1PtUfzDLZ2ygxKaPEBV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6324866"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6324866"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="15090769"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:54:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/xe_vm: DRM_XE_VM_BIND_FLAG_DUMPABLE is now a
 valid flag
Date: Fri, 22 Mar 2024 13:53:27 -0700
Message-ID: <20240322205327.850864-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
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

igt@xe_vm@bind-flag-invalid should no longer consider BIT(3) an invalid
flag and expect failure since that is now used by
DRM_XE_VM_BIND_FLAG_DUMPABLE.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1285
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_vm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7c061c497..00c428bb5 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1805,6 +1805,11 @@ static void bind_flag_invalid(int fd)
 	syncobj_reset(fd, &sync[0].handle, 1);
 	bind.bind.obj = bo;
 
+	bind.bind.flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &sync[0].handle, 1);
+
 	/* Using invalid flags should not work */
 	bind.bind.flags = 1 << 0;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
@@ -1814,10 +1819,6 @@ static void bind_flag_invalid(int fd)
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
 
-	bind.bind.flags = 1 << 3;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
-
 	/* Using valid flags should still work */
 	bind.bind.flags = 0;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-- 
2.43.0

