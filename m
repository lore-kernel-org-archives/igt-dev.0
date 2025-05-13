Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0977EC3ABCC
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 12:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6C010E598;
	Tue, 13 May 2025 12:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzIdJkbh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35E110E598
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747138740; x=1778674740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jebi2TS0DG05qFOuqtRfozBw9hxsyzQyMvdPFufhDvI=;
 b=EzIdJkbhQqzaDZVAW8K75YP9eZ68nX8+4OZzzomwJ8R4y1a4OwzG102z
 1dHhtQ3g5OL7lqZmz4oF1IpS7iaWXwv4n71XpreOGzdBsN4gCFX3CHpL7
 NQKXVn9QHjfVR1JhG5U7XjWmdyzwsQyyiEOrVAENeX7+96bzllfcf9X/i
 BlYrM7uNk7AsU1WaQz2NLP701i8wqwhCmcAZoEQnxq3Hhf/XRw+45Ac1r
 0kKFm8X6rWAk0H8ik5c3gW+JCi9vwKFcmQ9ZZncztLy4OrboOPdr4JenK
 38GFMnolcTOw0UG9pROJNsE6+wYAxELjpkoRnbxqZfeJclblIm9ksObUr g==;
X-CSE-ConnectionGUID: IMg0eh9lTeiTvRS0rnte/w==
X-CSE-MsgGUID: kJeCmnwqTrmDJw1v/0Zb1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48911100"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48911100"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 05:18:59 -0700
X-CSE-ConnectionGUID: FY4+TstYSNGhmDdC/RfA6g==
X-CSE-MsgGUID: CeD9VXD7TMiNBMTodKFKsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138669495"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 05:18:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/intel/kms_frontbuffer_tracking: pass
 non-NULL output pointer
Date: Tue, 13 May 2025 14:19:18 +0200
Message-ID: <20250513121918.2758842-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513121918.2758842-1-michal.grzelak@intel.com>
References: <20250513121918.2758842-1-michal.grzelak@intel.com>
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

Currently, NULL pointer is passed as output to the test. Pass
non-NULL output pointer.

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

