Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C7E7718A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9784110EC53;
	Wed, 18 Dec 2024 21:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZ83jSb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C560710E460
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557820; x=1766093820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z3WJCfit5ZCWnLf4R4EytTcvaCX8f+89JgeLPthGeW0=;
 b=nZ83jSb3CpH6hV9EqGwLGWTJ+rRzch3hMBwJRKhcqQOkpKWL35H/eEBR
 /F9PsbJHkwJHiKM4eLt61kr/IKiM6b5Ob1N20H4OdFlxyL5ypcTmi8+SJ
 DDQc4nsCY+etDaB3V7qiK+bnAOa/Jft+Qeo+mOtx1z5gby7ZyYQU36UZ7
 Vvn+INNh9tWbvtRbbT6KdlsQ5trOLXv79NPM/V1B3UJOIZSDajh65w7OJ
 fAj1dmMT5cG0n3xRPjtv6JHpG2PczBGHjNaO+W3PZ4sicgREaUpSA3bge
 MSG4WAf/SyNi7y0L5uAZyF6jg+bnA3ir2RRUZFhFTzq2asxNa3RQHdyi7 g==;
X-CSE-ConnectionGUID: rkNyMY+DRHyC9Gi2ov2YdQ==
X-CSE-MsgGUID: hfrxSwW6QAaEugLKwRkpPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379760"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379760"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: /T5eUXucR1K0orzJNBdR4g==
X-CSE-MsgGUID: TgJK1t4aQmyoqIVvWt8YQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973920"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 5/7] tests/intel/kms_draw_crc: fix x-tiled tests for
 case when there is no x-tile
Date: Wed, 18 Dec 2024 13:36:52 -0800
Message-Id: <20241218213654.2734573-6-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

On Xe3 display no more support x-tile and will disable such framebuffers

v2: Optimize display_ver check (Sai Teja)

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/kms_draw_crc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index e3d1c0ba9..7d1cc2da5 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -243,8 +243,10 @@ static void fill_fb_subtest(void)
 	get_fill_crc(DRM_FORMAT_MOD_LINEAR, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
-	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
-	igt_assert_crc_equal(&crc, &base_crc);
+	if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED)) {
+		get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
+		igt_assert_crc_equal(&crc, &base_crc);
+	}
 
 	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
 		get_fill_crc(has_4tile ?
-- 
2.25.1

