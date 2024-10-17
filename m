Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19CCD1AD36
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 08:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9237410E1AD;
	Thu, 17 Oct 2024 08:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZX57ehl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450DB10E1AD
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729153254; x=1760689254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BOG+bH8AxvU+kRyRGVK4V4lisFv4j6OrQFJtSXopvks=;
 b=eZX57ehlBInTo2b45IYnOfcRHuW0z8fyQuWK1nGEmvICvI9xLnfKDTbH
 5Lddufea7hz/Vx4DbdDd0rbEoPkkMp/P9GwLprQKuWJ7C2Q031sVJFvJy
 qhb9QvDtCfNlldbjWHJUygddli9SJITIegDZnQINmSnfahOa1JbfnUmUJ
 a26OcxJgq5KUfCtEccbgwnpqfyb9XjJ8gMOrjR3qv6myoGSgPV/mhTOGp
 vPAwaLeSp75ahDHnPkv8rUAwaEtlaYV3R5VMeSFYxx+uGKOdpgMzrLpzZ
 JsPCJVwythdsJ9qS5+8bCPGbHy7JS1S758wk6WvIlQOMfQ3s0hDCc1o8e Q==;
X-CSE-ConnectionGUID: 805FKz0VQgCdmFGYwTM6FA==
X-CSE-MsgGUID: Gu4IMyWzRuW93Q2Nk9H+cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="46124369"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="46124369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:20:54 -0700
X-CSE-ConnectionGUID: /ZLjZyE3R0+8c4QD9toLzg==
X-CSE-MsgGUID: j5MjMJ7GQUmYJviMICFO5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78374838"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 01:20:52 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/psr: update documentation
Date: Thu, 17 Oct 2024 13:53:35 +0530
Message-Id: <20241017082335.1362814-1-swati2.sharma@intel.com>
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

Update mega feature from DP to Panel Replay.
Also, update functionality.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_psr.c     | 32 ++++++++++++++++----------------
 tests/intel/kms_psr2_sf.c | 37 ++++++++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 2badeeddd..ad49c18f0 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -182,46 +182,46 @@
  * SUBTEST: pr-basic
  * Description: Basic check for pr if it is detecting changes made in planes
  * Functionality: pr
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-basic
  * Description: Basic check for fbc with pr if it is detecting changes made in planes
  * Functionality: pr, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: pr-dpms
  * Description: Check if pr is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
  * Functionality: pr, dpms
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-dpms
  * Description: Check if fbc with pr is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
  * Functionality: pr, dpms, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: pr-no-drrs
  * Description: Check if pr is detecting changes when drrs is disabled
  * Functionality: pr, drrs
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-no-drrs
  * Description: Check if fbc with pr is detecting changes when drrs is disabled
  * Functionality: pr, drrs, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: pr-suspend
  * Description: Check if pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: pr, suspend
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-suspend
  * Description: Check if fbc with pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: pr, suspend, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  */
 
 /**
@@ -230,14 +230,14 @@
  * 		performed on %arg[1] planes
  * Driver requirement: i915
  * Functionality: pr, plane
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-%s-%s
  * Description: Check if fbc with pr is detecting memory mapping %arg[2] operations
  *              performed on %arg[1] planes
  * Driver requirement: i915
  * Functionality: pr, plane, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * arg[1]:
  *
@@ -256,25 +256,25 @@
  * Description: Check if pr is detecting page-flipping operation
  * 		performed on primary plane
  * Functionality: pr, plane
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-primary-page-flip
  * Description: Check if fbc with pr is detecting page-flipping operation
  *              performed on primary plane
  * Functionality: pr, plane, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: pr-primary-%s
  * Description: Check if pr is detecting rendering operations %arg[1]
  * 		when performed on primary plane
  * Functionality: pr, plane
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-primary-%s
  * Description: Check if fbc with pr is detecting rendering operations %arg[1]
  *              when performed on primary plane
  * Functionality: pr, plane, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * arg[1]:
  *
@@ -287,13 +287,13 @@
  * Description: Check if pr is detecting rendering and plane
  *              operations %arg[2] performed on %arg[1] planes
  * Functionality: pr, plane
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * SUBTEST: fbc-pr-%s-%s
  * Description: Check if fbc with pr is detecting rendering and plane
  *              operations %arg[2] performed on %arg[1] planes
  * Functionality: pr, plane, fbc
- * Mega feature: DP2.0
+ * Mega feature: Panel Replay
  *
  * arg[1]:
  *
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 2381360cc..e9a8dc141 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -49,8 +49,10 @@
  *              visible area (no update)
  *
  * SUBTEST: pr-%s-plane-move-continuous-%s
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
  *              visible area (no update)
+ * Functionality: plane, pr, selective_fetch
  *
  * SUBTEST: fbc-psr2-%s-plane-move-continuous-%s
  * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
@@ -58,9 +60,10 @@
  * Functionality: plane, psr2, selective_fetch, fbc
  *
  * SUBTEST: fbc-pr-%s-plane-move-continuous-%s
+ * Mega feature: Panel Replay
  * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
  *              visible area (no update)
- * Functionality: plane, psr2, selective_fetch, fbc
+ * Functionality: plane, pr, selective_fetch, fbc
  *
  * arg[1]:
  *
@@ -79,35 +82,43 @@
  * Description: Test that selective fetch works on cursor plane
  *
  * SUBTEST: pr-cursor-plane-update-sf
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on cursor plane
+ * Functionality: plane, pr, selective_fetch
  *
  * SUBTEST: fbc-psr2-cursor-plane-update-sf
  * Description: Test that fbc with selective fetch works on cursor plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
  * SUBTEST: fbc-pr-cursor-plane-update-sf
+ * Mega feature: Panel Replay
  * Description: Test that fbc with selective fetch works on cursor plane
- * Functionality: plane, psr2, selective_fetch, fbc
+ * Functionality: plane, pr, selective_fetch, fbc
  *
  * SUBTEST: psr2-overlay-plane-update-continuous-sf
  * Description: Test that selective fetch works on overlay plane
  *
  * SUBTEST: pr-overlay-plane-update-continuous-sf
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on overlay plane
+ * Functionality: plane, pr, selective_fetch
  *
  * SUBTEST: fbc-psr2-overlay-plane-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on overlay plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
  * SUBTEST: fbc-pr-overlay-plane-update-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that fbc with selective fetch works on overlay plane
- * Functionality: plane, psr2, selective_fetch, fbc
+ * Functionality: plane, pr, selective_fetch, fbc
  *
  * SUBTEST: psr2-overlay-plane-update-sf-dmg-area
  * Description: Test that selective fetch works on overlay plane
  *
  * SUBTEST: pr-overlay-plane-update-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on overlay plane
+ * Functionality: plane, pr, selective_fetch
  *
  * SUBTEST: fbc-psr2-overlay-plane-update-continuous-sf
  * Description: Test that fbc with selective fetch works on overlay plane
@@ -115,15 +126,17 @@
  *
  * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
  * Description: Test that fbc with selective fetch works on overlay plane
- * Functionality: plane, psr2, selective_fetch, fbc
+ * Functionality: plane, pr, selective_fetch, fbc
  *
  * SUBTEST: psr2-overlay-primary-update-sf-dmg-area
  * Description: Test that selective fetch works on primary plane with blended
  *              overlay plane
  *
  * SUBTEST: pr-overlay-primary-update-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on primary plane with blended
  *              overlay plane
+ * Functionality: plane, pr, selective_fetch
  *
  * SUBTEST: fbc-psr2-overlay-primary-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on primary plane with blended
@@ -131,43 +144,53 @@
  * Functionality: plane, psr2, selective_fetch, fbc
  *
  * SUBTEST: fbc-pr-overlay-primary-update-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that fbc with selective fetch works on primary plane with blended
  *              overlay plane
- * Functionality: plane, psr2, selective_fetch, fbc
+ * Functionality: plane, pr, selective_fetch, fbc
  *
  * SUBTEST: psr2-plane-move-sf-dmg-area
  * Description: Test that selective fetch works on moving overlay plane
  *
  * SUBTEST: pr-plane-move-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on moving overlay plane
+ * Functionality: plane, pr, selective_fetch
  *
  * SUBTEST: fbc-psr2-plane-move-sf-dmg-area
  * Description: Test that fbc with selective fetch works on moving overlay plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
  * SUBTEST: fbc-pr-plane-move-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that fbc with selective fetch works on moving overlay plane
- * Functionality: plane, psr2, selective_fetch, fbc
+ * Functionality: plane, pr, selective_fetch, fbc
  *
  * SUBTEST: psr2-primary-plane-update-sf-dmg-area
  * Description: Test that selective fetch works on primary plane
  *
  * SUBTEST: pr-primary-plane-update-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on primary plane
+ * Functionality: plane, pr, selective_fetch
  *
  * SUBTEST: fbc-psr2-primary-plane-update-sf-dmg-area
  * Description: Test that fbc with selective fetch works on primary plane
  * Functionality: plane, psr2, selective_fetch, fbc
  *
  * SUBTEST: fbc-pr-primary-plane-update-sf-dmg-area
+ * Mega feature: Panel Replay
  * Description: Test that fbc with selective fetch works on primary plane
- * Functionality: plane, psr2, selective_fetch, fbc
+ * Functionality: plane, pr, selective_fetch, fbc
  *
  * SUBTEST: psr2-primary-plane-update-sf-dmg-area-big-fb
  * Description: Test that selective fetch works on primary plane with big fb
+ * Functionality: plane, psr2, selective_fetch, big_fbs
  *
  * SUBTEST: pr-primary-plane-update-sf-dmg-area-big-fb
+ * Mega feature: Panel Replay
  * Description: Test that selective fetch works on primary plane with big fb
+ * Functionality: plane, pr, selective_fetch, big_fbs
  */
 
 IGT_TEST_DESCRIPTION("Tests to verify PSR2 selective fetch by sending multiple"
-- 
2.25.1

