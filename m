Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A0D6A221
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D895A10E093;
	Thu, 14 Nov 2024 19:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOSYXVO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A88610E093
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611045; x=1763147045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OxpWR52rgQ/vmMsk/eW4tvh2I3hFNczZvk/6TKXn+VY=;
 b=BOSYXVO2BIMEphcLssNavSNaDw9AJ1lO8zqeha6HnJHu0TVgeW+fESF7
 KmRT8el2DFqGcK7GeZGFHerfckXJCvHRE5whpmdK/GmGWsls9keyJwCoe
 RXL5YOzbzZae7jhBRPlVNbNah6lpAHqvcAMcaisc1Fkb+oQdEMkz7/Jc/
 2i3rhnaFHQ3HL30Mza6BjvPAscNuWyEHRbt+FMx5oFpyzJnMSUMmbrjnW
 wA5y11PuyWS7cz/0tOHdRN60qdK1T8iBWK8dqGTOBuicTkK0Kb1k7a4eT
 WjHgGI1n1+ZAGvBrc1bm1CCU0U6I7RnXFpIBkR86bx4KmJBRaKrmIq9L0 Q==;
X-CSE-ConnectionGUID: ZnOV931GSBWC5Zi/aCdUOg==
X-CSE-MsgGUID: wk7+qud6QsiDh2oVRw5SAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442571"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442571"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: GbD+lHYZRjmKP6PpZl6n0g==
X-CSE-MsgGUID: LhXQCPIAQ9e6FVX31b50Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242109"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 6/9] XE3: tests/intel/kms_draw_crc: fix x-tiled tests
 for case when there is no x-tile
Date: Thu, 14 Nov 2024 11:03:36 -0800
Message-Id: <20241114190339.3885752-7-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

