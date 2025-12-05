Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD10D2F7C8
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 09:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377C310EA33;
	Fri,  5 Dec 2025 09:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beJflmRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A1910EA33
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764925642; x=1796461642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eLzjrV2ER7HalEaByv+0PPkJxuXVAhKIkO0pOPNw4Ok=;
 b=beJflmRafJir61bny2tjPoIYjVwKcjgIPYG7o/ce5qI05jDJwveVULpu
 mg6UOvbkJFuLhgwTyRkRc2CV7LQpyKHv1kb0yip/FvXITNvTP6Xc51QLb
 p8H0+BhgLDg9mxx/1J2w6OQFOkxJfQtJPltl+tY5zoh5uLvUhMH2DVKIU
 qTywp/1v/O1GeBvEDrlIysz8NrZku/9eBY5SfAbQElxoNmTDEp9FJC6sT
 jO7mguaV/vr3pW1dBWQPQs19ERYp2ptOzH2OiADcSF1zDpwIk9Fj82rXo
 XPt1lLEXc8A0nL+Osjkhmubte/JxjS4pjGMKGVVKQkPG/HHPFQS6xYZUq g==;
X-CSE-ConnectionGUID: 0R0tpFduQcCOndC9GF+XKg==
X-CSE-MsgGUID: FMW2f8L9QMSEd7PynjwF5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78310207"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78310207"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 01:07:21 -0800
X-CSE-ConnectionGUID: g531lQ72RDK9y2xgqlmErw==
X-CSE-MsgGUID: D1Ozpv8yRNSmOtLL/hrn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195682106"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:07:20 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_prime: Fix display pattern for xe discrete
 modeset
Date: Fri,  5 Dec 2025 14:29:44 +0530
Message-Id: <20251205085944.1037410-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Keep igt_create_pattern_fb() call in test_basic_modeset() XE discrete
path to properly draw pattern into the framebuffer. The fb remains empty
and pattern is not displayed on screen during modeset on discrete Gpus.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_prime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index aa3cc386c..4e486a1b0 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -491,6 +491,9 @@ static void test_basic_modeset(int drm_fd)
 				  DRM_MODE_FB_MODIFIERS, &fb.fb_id);
 		igt_assert_eq(ret, 0);
 
+		igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &fb);
+
 		set_fb(&fb, &display, output);
 		gem_close(drm_fd, bo);
 
-- 
2.34.1

