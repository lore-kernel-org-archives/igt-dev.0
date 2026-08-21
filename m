Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB24AC5DF89
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 13:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBA810E097;
	Fri, 21 Aug 2026 13:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWN0fETw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A2A10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316534; x=1818852534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9hgl6Ek3e6XnyJLdumiuAdzHI5r3+NagPh4FrOrHXkY=;
 b=WWN0fETw2iabgSPV3hKmMJSEXmtNexFdS8Qgwypi2pCtBm3vVKRY5JLl
 Qls68tyrQlH94NRTTuPgMuZbT+QBDT1Fz5Zg0bcONPygt1ORFcD0A7BCj
 PTo8MR2GK3kcQ2Aw4dAg1wCGhpvpQXBR/ETo7pQzOKnlGE+pSx/nkQtTW
 xkzCd7gYTOP4ysu5QZfx41/8mMhoMVmCXtUx6fyyWpEvsdZaBAjXsZGA3
 ScEak7qljAqMK1DphlsToJOJMn5LPfpBfe/dxP1DiWIfoE5GuRXhAHPjN
 ZjfOCsFA+1fLsU3o6AV0nIW3cKDi3pUWcvUB7nWCraq+8c5cE4/9kmwgM A==;
X-CSE-ConnectionGUID: 7U8DrRqGQgCSJ6e+ARn1Yw==
X-CSE-MsgGUID: VZ2DDX6hQHiOpLqlDM8XRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632928"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632928"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:54 -0700
X-CSE-ConnectionGUID: QYX+BULfTmSaXVNL/v1Duw==
X-CSE-MsgGUID: hRwASbWKTOGENMIXWHYFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188381"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 11/17] tests/kms_sharpness_filter: fix typo
Date: Fri, 21 Aug 2026 14:48:28 +0200
Message-ID: <20260821124834.1974029-12-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Refer to the connector instead of connecter.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 8c60736691..f2e3fc9494 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -456,7 +456,7 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	igt_plane_set_fb(data->plane[0], &data->fb[0]);
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
-		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
+		igt_require_f(has_scaling_mode(output), "No connector scaling mode found on %s\n", output->name);
 
 	if (type == TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR)
 		igt_require_f(igt_crtc_has_prop(data->crtc, IGT_CRTC_SCALING_FILTER),
-- 
2.45.2

