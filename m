Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565FED637D1
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66E10E777;
	Wed, 13 Nov 2024 23:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loYDPwi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27DB10E29B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538986; x=1763074986;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OxpWR52rgQ/vmMsk/eW4tvh2I3hFNczZvk/6TKXn+VY=;
 b=loYDPwi+yR/LGT/qKzKPZA9NTE0XaIX68791uIM2gIEg9BNSoSM/7Jaq
 qUsMkAfG4M4yiJHa9FQsRP3lsvVXHkEvJi+EBtl/kkxEpifqWgjdib+KD
 MH8iFiuEj5Ta8dZq9jpFKMkQPIW2xfMJtUfjCqf92OwZRn+FUpQRlFP3o
 25agI3/McfC+k2nGx7+skasawuPTWQmZCH+C/CGv0lFlC9DZe2IydQcK1
 LycetQ9VX6232HJpP/Q3sMmpdRDRqYLnwtn6mNR4J7mtpJi+kHbepw0s2
 EAyM7Q6PM+v65cv+s0+lt1ciWn3Z5SVTIjx4btr6UKRfm5Hq4yP23BTna g==;
X-CSE-ConnectionGUID: Mdbk4PhRTIaPwckdIv2zDw==
X-CSE-MsgGUID: t0UQOEJnSdSZYy58C/QtJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999378"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:06 -0800
X-CSE-ConnectionGUID: oZXOu35HSNeIhzr3rL3zEQ==
X-CSE-MsgGUID: jsZC+WfXRweEkTnQbbb6UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074717"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/9] XE3: tests/intel/kms_draw_crc: fix x-tiled tests
 for case when there is no x-tile
Date: Wed, 13 Nov 2024 15:02:58 -0800
Message-Id: <20241113230301.655499-8-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113230301.655499-1-clinton.a.taylor@intel.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
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

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/kms_draw_crc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index e3d1c0ba9..3084e9c9b 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -243,8 +243,10 @@ static void fill_fb_subtest(void)
 	get_fill_crc(DRM_FORMAT_MOD_LINEAR, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
-	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
-	igt_assert_crc_equal(&crc, &base_crc);
+	if (intel_display_ver(intel_get_drm_devid(drm_fd)) <= 20) {
+		get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
+		igt_assert_crc_equal(&crc, &base_crc);
+	}
 
 	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
 		get_fill_crc(has_4tile ?
-- 
2.25.1

