Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9029CC77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 14:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E0A10E856;
	Thu,  3 Jul 2025 14:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daeR8YFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5AC10E856
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751551440; x=1783087440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvLsglNreSUxfjwc8508aMAby5x6WUaVVhDHNxbIoGk=;
 b=daeR8YFTJtcWYANHL1HwtLSoAA4UyHIlpmCRBsK6Ldjy2B1IQU2ScH5/
 m7LnZal3efsonmeqPiuhTBzt9g8JcWxuQFrdiH+77dBckHLZK48vX3lRj
 9pB1FgBZEjX/soFjQQiKHff0dvRZPsjNvjAzFQVXbP+GIVUwIvg0HmU0x
 PSXEi6+04HVQi4tQrQZFgi8tdVn9j69Yk+6FFlEHFnO2JAAFw7LwrrWtT
 F4zxCyiJUmuz3jy+wDSZ12Os/KTw8TAp08FBjGmlf2WnMCFG4lWRFAtCo
 aRxn/jlvZJ4r+atauiI4L/+uCNmqSccPdoSU5jBsHLIUO0ZRffFU/25Ju w==;
X-CSE-ConnectionGUID: PvyPkAhHQoWTAP2aZCfx1w==
X-CSE-MsgGUID: X8bV168aSleYNabqSSmN4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53993355"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53993355"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:03:59 -0700
X-CSE-ConnectionGUID: 16wIaYTMSFa+6mcEDzVbBQ==
X-CSE-MsgGUID: t+oCRLH0Qg+riCOJr27XrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="159879206"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2025 07:03:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 2/2] tests/intel/kms_frontbuffer_tracking: pass
 non-NULL output pointer
Date: Thu,  3 Jul 2025 16:04:51 +0200
Message-ID: <20250703140451.491593-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250703140451.491593-1-michal.grzelak@intel.com>
References: <20250703140451.491593-1-michal.grzelak@intel.com>
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

Currently, there is NULL pointer passed to the test as output. Pass
non-NULL output pointer to the test.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..d0b21b694 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2329,7 +2329,7 @@ static void do_status_assertions(int flags)
 	}
 
 	if (flags & ASSERT_PSR_ENABLED) {
-		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
+		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, prim_mode_params.output),
 			     "PSR still disabled\n");
 		psr_sink_error_check(drm.debugfs, PSR_MODE_1, prim_mode_params.output);
 	} else if (flags & ASSERT_PSR_DISABLED)
-- 
2.45.2

