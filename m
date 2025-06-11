Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513C2C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 10:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0569289316;
	Wed, 11 Jun 2025 10:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlAWXaJt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F06A899B7
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749636129; x=1781172129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I7TJwNIN31Sl2iP/P+u6J24zZ9BzWEogNgYZJR2x4J4=;
 b=BlAWXaJtkcxrPk3erWtvr6/9ucQK+RfALMKFAbtJM8U4ar3B5Bsqd6tN
 wNSd9T6XkWhVGR1C0OO7csu9gVuxS9tWy/XoufHci3+d5NJlC/tJ7h92i
 xMLSio7iOEpP5SJ+7BUJCOmDSrO8lvqQB9cnNBpjqTi8GZhkJ8GtvpRGW
 xlGo8S1qhC9r19Ovqp6VByhbOcgZKmPJo/BmAznji7DUEcGXvVo7qYbSB
 el43ZWcxlazAZJiD+D9VGvVOv47NITMO0P/dxONfl0ynoh5nPJ0VyZjmn
 oR2uaySv1eyPCw4Ft63f1jPJQ2+RbjANmrz2b9UGA4zUXGo7lrCDARCPK g==;
X-CSE-ConnectionGUID: wL7+Zo+NTNepn1CTkYzHqQ==
X-CSE-MsgGUID: kBYRmsEoR5yQQeDOVbfMLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="69335370"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="69335370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:02:06 -0700
X-CSE-ConnectionGUID: WKgfNnMRQKqdDbpzZTBKmw==
X-CSE-MsgGUID: GSDm3S0uSPq5SrripuL+1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="152039973"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:02:05 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix skip condition to account for
 padded BO size
Date: Wed, 11 Jun 2025 12:01:58 +0200
Message-Id: <20250611100158.15197-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Several subtests currently skip when the requested BO size exceeds
visible VRAM, but they don't take into account the padded size that is
actually passed to the kernel when creating BO. As a result, subtest may
attempt to allocate a BO that exceeds the available VRAM, resulting in
-E2BIG error.

Fix this by using the prefetch BO size in the skip condition to ensure
the subtests avoid allocation attempts that are guaranteed to fail.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_vm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 94cca13ba..1a21a6459 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1385,15 +1385,15 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 	vm = xe_vm_create(fd, 0, 0);
 
+	bo_size_prefetch = xe_bb_size(fd, bo_size);
+
 	if (flags & LARGE_BIND_FLAG_USERPTR) {
-		bo_size_prefetch = xe_bb_size(fd, bo_size);
 		map = aligned_alloc(xe_get_default_alignment(fd), bo_size_prefetch);
 		igt_assert(map);
 	} else {
-		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
+		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size_prefetch >
 			    xe_visible_vram_size(fd, 0));
 
-		bo_size_prefetch = xe_bb_size(fd, bo_size);
 		bo = xe_bo_create(fd, vm, bo_size_prefetch,
 				  vram_if_possible(fd, eci->gt_id),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-- 
2.40.0

