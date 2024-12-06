Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AEDE7717B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA7610F1D4;
	Fri,  6 Dec 2024 21:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATFWsxRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CA210F1D2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520604; x=1765056604;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HIM8PyYAjuB9fxdL4BoM0inDr97fjLNXayuqMVyTM14=;
 b=ATFWsxRjq7GXBvkR9xP5p3iXqI6Tx1q/dmsBXz/1CpMjyJImSh6S2T8+
 p9dVOWEHla09lhjinLh/Kup4CTFW7QqOPf9gtl9Fnzg9zH8YPGVrivUax
 59zyHHlDvPSlHNA1RCGcF2AqoHaao45Gp5q3vxc4dZZ2++4sJa0hBmbOg
 aO0xYPKIDMt44LAyuQbLngpwyBkWUPcUO8LTjuLU85jD/4yxyiv8D3P2v
 3a9slamHvutTS/vZGXD1GOhpfQGF94CpdjyJxX73MqDzpXlSfQcnpUpgh
 eN7xJGEJcVzt5IaX/eQZMqLcQSe74d70Kjbrvej/ML0To29SAQvvISqNX w==;
X-CSE-ConnectionGUID: ct5P8D5GQpWJGL+zgVLTsg==
X-CSE-MsgGUID: rrbQc3cgSouQ5h4+5GLkWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304473"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304473"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
X-CSE-ConnectionGUID: 6oT9EVANS0CSEAsmRsbM0w==
X-CSE-MsgGUID: 0cgVW1iTTwmIXYxyPZwVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306726"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 5/8] XE3: tests/intel/kms_draw_crc: fix x-tiled tests
 for case when there is no x-tile
Date: Fri,  6 Dec 2024 13:27:45 -0800
Message-Id: <20241206212748.2101217-6-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

On Xe3 display no more support x-tile and will disable such framebuffers

v2: Optimize display_ver check (Sai Teja)

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/kms_draw_crc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index e3d1c0ba9..8af0d475c 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -243,8 +243,10 @@ static void fill_fb_subtest(void)
 	get_fill_crc(DRM_FORMAT_MOD_LINEAR, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
-	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
-	igt_assert_crc_equal(&crc, &base_crc);
+	if (intel_display_ver(intel_get_drm_devid(drm_fd)) < 30) {
+		get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
+		igt_assert_crc_equal(&crc, &base_crc);
+	}
 
 	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
 		get_fill_crc(has_4tile ?
-- 
2.25.1

