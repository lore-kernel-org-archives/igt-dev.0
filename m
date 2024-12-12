Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B49E77182
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 00:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E289C10EC89;
	Thu, 12 Dec 2024 00:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edYpxRTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0978210E1DB
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733962721; x=1765498721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Ep8gP8U8Z/sILV/TqPAq16rBGuArJ0K/mR06ctimak=;
 b=edYpxRTwQIlowZZyOapY4B4rH0/6wxJEwHiOwtPAg3YwkDTXpXZ4oJuU
 n1DrA5H+VgcNw1ZRWnsryT08Y+NaNpFJmKh2g6rZI1ftgRzRQV8kZlrJJ
 +lTWWQ9iSo6R9XhzqokUoqRntqHFBjMiFGPAnq05tFe6VNN8xz4EFKKGB
 Ej2k6+uA3Iq6vq3ZUyEbD+o64bUL1FyHwn+It7IR3gkpwV/GH1brWUbG5
 EOaGSgxzlVNkMLSmE+b3IFbrMXhJwKV913oT1Px6HGV86ZIygOCHYwezK
 Uuov86g1u7WuDi3IeQ0EQOEfpzQhEE421LY/eZ9qnD6y+2BF/S2h6S9Zi A==;
X-CSE-ConnectionGUID: kACyZvtER4Wrah38vPvrvQ==
X-CSE-MsgGUID: dVNBsd5zQZGJUb2p+Ov15Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45040480"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="45040480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:41 -0800
X-CSE-ConnectionGUID: duuUyd3RTpGKn0alSOABjQ==
X-CSE-MsgGUID: PyXUg37lSf6pzPYbOM2Khw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126840869"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:40 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t 2/7] tests/intel/xe_vm: Update invalid flag subtest
Date: Wed, 11 Dec 2024 16:18:23 -0800
Message-ID: <20241212001829.2082490-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_vm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index e78ddd0e5..741dc0c7a 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2216,6 +2216,11 @@ static void bind_flag_invalid(int fd)
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 	syncobj_reset(fd, &sync[0].handle, 1);
 
+	bind.bind.flags = DRM_XE_VM_BIND_FLAG_CHECK_PXP;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &sync[0].handle, 1);
+
 	bind.bind.flags = DRM_XE_VM_BIND_FLAG_NULL;
 	bind.bind.obj = 0;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
@@ -2229,7 +2234,7 @@ static void bind_flag_invalid(int fd)
 	syncobj_reset(fd, &sync[0].handle, 1);
 
 	/* Using invalid flags should not work */
-	bind.bind.flags = 1 << 4;
+	bind.bind.flags = 1 << 5;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
 
-- 
2.43.0

