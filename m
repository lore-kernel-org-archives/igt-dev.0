Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0C6CA5FF0
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 06:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAC610E30F;
	Mon, 19 Jan 2026 06:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWE5VjVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F3B10E30F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 06:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768803975; x=1800339975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gy1W8PUOYJ0jHbJfSo2VwLVJSImhNJLnNw/cBHquSh0=;
 b=kWE5VjVka2YjI6opf/z3SIe4Lg1CVUiukG/wUHxAdXc1c8mMBl47M7hm
 dMCLvPurjNuFkg13FTx2q6I8RyyeJ7wsSSh/osLRRsNhByaiXg2ayz73k
 JMeiu0a14IvuDpKU0Vm1XSndLLS2RU1ad9FA4bx26ofFCIWd0pfc8gpIm
 PZeo5taxeWqwbT2itOFQliPR49DDxgQoaPL8YuWw4Q0KamcyEn5NOCnuj
 qDRd6fTDkjV1CVgcp2BtEUJk2ElHFuSEuz1slYjFgXx70zOmjankWlqqH
 ng9NnLmZcatGOzkFLEmxxQTL15GURxE8Jfl2pIuOcdXFCvmDl/ZooIAn8 g==;
X-CSE-ConnectionGUID: RiOrafHbRrOUWDY76cV9mA==
X-CSE-MsgGUID: IEjY4ufeSjm1amIUJpS4Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73864266"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="73864266"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:26:14 -0800
X-CSE-ConnectionGUID: /u7gBL1jRGWjgJZEDdsdkQ==
X-CSE-MsgGUID: 6GZJBb/KT4SsGwfThv/aVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205688243"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 18 Jan 2026 22:26:12 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, swati2.sharma@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
Date: Mon, 19 Jan 2026 11:56:04 +0530
Message-Id: <20260119062604.591288-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116060932.523060-1-suraj.kandpal@intel.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
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

Add the vblank wait even for i915 as the legacy path uses the
vblank worker to unpin cursor fbs.

v2
- Add closes tag [Jeevan]

v3
- Pretty up the comment [Karthik]
- Use is_intel_device condition for the vblank wait [Karthik]

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_universal_plane.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index aa5927cdf..49dceb1af 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -703,14 +703,15 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
-	/* Since unpinning of cursor fb occurs during vblank in xe, we need
-	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
-	 * 1 additional vblank because vblank event is scheduled before
-	 * unpinning. Therefore add 2 vblank wait to ensure that all
-	 * cursor-related framebuffers can be removed before counting the
-	 * framebuffer.
+	/*
+	 * Since unpinning of cursor fb occurs during vblank in Intel
+	 * specially in case of legacy commit we need to wait atleast 1
+	 * vblank for driver to remove cursor fb. We need 1 additional
+	 * vblank because vblank event is scheduled before unpinning.
+	 * Therefore add 2 vblank wait to ensure that all cursor-related
+	 * framebuffers can be removed before counting the framebuffer.
 	 */
-	if (is_xe_device(data->drm_fd))
+	if (is_intel_device(display->drm_fd))
 		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
 					  2);
 
-- 
2.34.1

