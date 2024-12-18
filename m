Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAFAE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 16:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03BD10E331;
	Wed, 18 Dec 2024 16:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jr8jOCrF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65710E331
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734538090; x=1766074090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zL8GH65J/ML3oUUZcym/vUYpjT2nf92LcARE7EMjefU=;
 b=Jr8jOCrFzFvidwfeqBbBznGExS1ySwvk7Fc8CFZNxi9K4PmBhfF+U0Kg
 tNxAkkQOaDuRR6wbe7eYeJb0IXvYt59D+wemfWn/UJRmTfnh4wubgM3zt
 +EqqTxs7cQWtL4JIeTVJkd+c9lKGj2OXG6DlVzOWD533iAxn3cXy4Svg2
 eskwFsS1373QLvucaxGJgZWJUpHRiy6l/iTBL5noEWIq7w81a9vKlNAJb
 wZemMdnNEpzQsFBByu7sWiQAvtu9N58D/xCfcyM+g1AmUDfA2lasNQmyy
 Y0FC6oFOebKjj2Lttr/hfLnX2AGZpoApKvOPaOmEYOD5u4D54TqDPyx/5 g==;
X-CSE-ConnectionGUID: E5i0JjqFRXWmcZvqoPiiYA==
X-CSE-MsgGUID: 4Ea4P2xcTcOkp2MaA5p1zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35236010"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="35236010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:08:10 -0800
X-CSE-ConnectionGUID: 81jIX6aMQyCgKdAu5T5AkA==
X-CSE-MsgGUID: bJvblwObTnyUzBXCz0fHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="97973149"
Received: from dut4413lnl.fm.intel.com ([10.105.8.56])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:08:09 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 zbigniew.kempczynski@intel.com, pravalika.gurram@intel.com
Subject: [PATCH] tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork
Date: Wed, 18 Dec 2024 16:08:08 +0000
Message-ID: <20241218160808.65340-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Several xe_cork functionalities were recently unified into the xe_spin
library.  During this process, it was asserted that we always pass a
valid cork to the various xe_cork helper functions (namely,
xe_cork_sync_start, xe_cork_sync_end, and xe_cork_destroy).

While this assertion should normally hold, in xe_drm_fdinfo
specifically, some subtests declare the existence of an xe_cork but
bypass its initialization through xe_cork_create because the cork is
otherwise unused.  However, the cork itself is unconditionally destroyed
at the end of the tests, as prior to the unification under xe_spin,
passing a NULL pointer to the destroy function (previously
spin_ctx_destroy) would simply exit the function early.  Unfortunately,
passing a NULL pointer to the destroy function now (xe_cork_destory)
hits the new assertion, resulting in an error.

Do not run xe_cork_destroy on a NULL pointer if a NULL pointer is
expected in the subtest.

Fixes: 2feb1d6718a ("lib/xe/xe_spin: move the spinner related functions to lib")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3869
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Pravalika Gurram <pravalika.gurram@intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 66a181d5ba..e83c55c646 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -447,7 +447,9 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 		close(new_fd);
 	}
 
-	xe_cork_destroy(fd, ctx);
+	if (flags & TEST_BUSY)
+		xe_cork_destroy(fd, ctx);
+
 	xe_vm_destroy(fd, vm);
 }
 
@@ -663,7 +665,8 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 		close(fd_spill);
 	}
 
-	xe_cork_destroy(fd, ctx);
+	if (flags & TEST_BUSY)
+		xe_cork_destroy(fd, ctx);
 
 	xe_vm_destroy(fd, vm);
 }
-- 
2.43.0

