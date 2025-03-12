Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932B4C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 08:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E8210E0CD;
	Wed, 12 Mar 2025 08:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSA7LqSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6BA10E0CD
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741768609; x=1773304609;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3JdnTXATzsNZTz5yG3oTnplapO9FOXfsifETCnHDLY4=;
 b=gSA7LqSaGGrN0mGOQSnkLU2nzC7SThT+HmxyVM/BDd+L8z5+jLCbDoiG
 tIFa1K6HQ3JUw1urOWupQWZ6tthk7zN5AjKn1Lsah+e5VJ+MabnCSncZ8
 0K7y+pEEenG05aAbgWinUI4LifksqIaDLlOCEe7wz0FHZMnWuhypYWF67
 rR32646PldIOhTOpU/2VIrwy+mS63bipcakgSqly/meLNGS7i1NaEtPu7
 5Kk6eivcFbL2zZWagvFK3bEVzh1mO0UHWKxAEbtMd+0V4KLZK34ySFqaB
 3a3Rl2tz3bL3yggKHzggGkYkzBLhCTXlBKmD3O0ioSGbOo+Vs9V8cwMUU A==;
X-CSE-ConnectionGUID: 3Gl3auzdQoy2ZNDAn9XDdw==
X-CSE-MsgGUID: 6/D+ebNBRkKld7/xL7LGJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42968972"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42968972"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:36:48 -0700
X-CSE-ConnectionGUID: Z5jk7Oc+QY6Ov8FdmzLB7A==
X-CSE-MsgGUID: ML1DYjPRR/O3xeraNhiEuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="124741146"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:36:48 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms: Fix documentation
Date: Wed, 12 Mar 2025 14:12:08 +0530
Message-Id: <20250312084208.550521-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Missed few KMS binaries, drop 'Functionality' and 'Test category'
from them too.

Fixes: 25039689b609 ("tests/kms: Drop 'Functionality' and 'Test category' from
documentation")
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_psr2_su.c   | 3 ---
 tests/kms_prime.c           | 3 ---
 tests/kms_rmfb.c            | 2 --
 tests/kms_universal_plane.c | 3 ---
 4 files changed, 11 deletions(-)

diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 0099daf1d..e9bc6f6c6 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -28,7 +28,6 @@
  * Description: Test PSR2 selective update
  * Driver requirement: i915, xe
  * Mega feature: PSR
- * Test category: functionality test
  */
 
 #include "igt.h"
@@ -43,11 +42,9 @@
 /**
  * SUBTEST: frontbuffer-XRGB8888
  * Description: Test that selective update works when screen changes
- * Functionality: fbt, psr2, selective_update
  *
  * SUBTEST: page_flip-%s
  * Description: Test the selective update with %arg[1] when screen changes
- * Functionality: pixel_formats, psr2, selective_update
  *
  * arg[1]:
  *
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 7f46c6842..1d011327c 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -26,9 +26,7 @@
  * Category: Display
  * Description: Prime tests, focusing on KMS side
  * Driver requirement: i915, xe
- * Functionality: hybrid, kms_gem_interop
  * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #include "igt.h"
@@ -51,7 +49,6 @@
  * SUBTEST: basic-crc-%s
  * Description: Make a dumb color buffer, export to another device and compare
  *              the CRCs with a buffer native to that device
- * Functionality: crc, hybrid, kms_gem_interop
  *
  * arg[1]:
  *
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index e4203bdd4..acda4b528 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -27,9 +27,7 @@
  * Description: This tests rmfb and close-fd behavior. In these cases the
  *              framebuffers should be removed from the crtc.
  * Driver requirement: i915, xe
- * Functionality: kms_gem_interop
  * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #include "igt.h"
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 7e80b1389..8e0b4dda0 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -26,9 +26,7 @@
  * Category: Display
  * Description: Check pageflip & modeset on universal plane
  * Driver requirement: i915, xe
- * Functionality: plane
  * Mega feature: General Display Features
- * Test category: functionality test
  */
 
 #include "igt.h"
@@ -41,7 +39,6 @@
 /**
  * SUBTEST: cursor-fb-leak
  * Description: Check for cursor leaks after performing cursor operations
- * Functionality: cursor, plane
  *
  * SUBTEST: disable-primary-vs-flip
  * Description: Check pageflips while primary plane is disabled before IOCTL or
-- 
2.25.1

