Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10184C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9966810E2CA;
	Thu, 10 Sep 2026 19:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXHPhbOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0224110E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066767; x=1820602767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UKdRM8JcvqJ2A3YxY1NdB2UfSz4mr4xLo0AUzC4Bdic=;
 b=AXHPhbOd01MzqOWYG8ADdigRTBRdLGGQ0EIpTTtsiDvU7SGZbSlyRc7N
 unJfowWboC+a+aFi/jbVARVdb/dtQr1DluX9Yyn3pmPDN7TSPwLjkp9mQ
 g+06tSfL5mqj3ncSuGU6EDzkpdNWBxO33OyZr2rvONsvoYTsAuuhxsR46
 fTVp3UGcidvJKsbEkohwwdsIKJ5gQAiKFTIUT5kvuXNE4qVpoEzyBmEhN
 hAkwThsZY/Rkuayb25G9uJjrziUJpKBjZ37QJWPYDhcs6UzIl7JVbXFVj
 Jk6hRmfEb1yTfp2EXuU2MPEvvjYcRIVnL9G09MyqgvO30wOgLGd26lGvH A==;
X-CSE-ConnectionGUID: VeJxyodSQyG86GLt4AFk3g==
X-CSE-MsgGUID: samVb2yvQCeTSY8jr7Q3ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400091"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400091"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:26 -0700
X-CSE-ConnectionGUID: AEhqFn66RU2rBx1W3bvcWQ==
X-CSE-MsgGUID: TWuXDa54TLO9j8CIdoWuKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199515"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:25 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 11/17] tests/kms_sharpness_filter: fix typo
Date: Thu, 10 Sep 2026 20:58:56 +0200
Message-ID: <20260910185902.2728276-12-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910185902.2728276-1-michal.grzelak@intel.com>
References: <20260910185902.2728276-1-michal.grzelak@intel.com>
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

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
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

