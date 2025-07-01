Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B48DC7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 16:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D9810E5F3;
	Tue,  1 Jul 2025 16:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/36bGWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081910E5F3
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751389096; x=1782925096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvLsglNreSUxfjwc8508aMAby5x6WUaVVhDHNxbIoGk=;
 b=E/36bGWJ/mw5RVO7B0Z6RinZIsLDsg6W+vtVHoN3HqdqE+VKxm9m7mAD
 px6NgkTVn+gqGIDK11EYW9DZ0f01LrCqa6eUzF9MJ0JVtQHzKhCRAWRWt
 NjV1L1dOx+RjpKF6xKUChB3Nxm8V3PFd6gimLvpVt8fOBEtnuljnRPp6j
 43aJZjSx99VHmisDUOJVoNZxn4o/5/N0gciGkv5Kwo2WFOeGR8g7Fvmmt
 kFCKIDqoQCo0KxqsXSdwOIuvLEyhBnSLWsLxZg2MLrcA+NDHLq783yF3L
 5zk50MfMvY/Q7f/u+0hVedgGTsSTurJ5WMAtaEDt6Te0+3w/GNRUZgQPH Q==;
X-CSE-ConnectionGUID: gvwsGd/PRg2TWGi2WKsd0w==
X-CSE-MsgGUID: og6r5FYGT0aCGKg1X9WKgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53528102"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53528102"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:58:16 -0700
X-CSE-ConnectionGUID: mzzBlM06Rnu8xMS/fX7sjA==
X-CSE-MsgGUID: 4blF0PwpSdy1nknRZquLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154552537"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2025 09:58:15 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 RERUN 2/2] tests/intel/kms_frontbuffer_tracking: pass
 non-NULL output pointer
Date: Tue,  1 Jul 2025 18:59:12 +0200
Message-ID: <20250701165913.443515-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250701165913.443515-1-michal.grzelak@intel.com>
References: <20250701165913.443515-1-michal.grzelak@intel.com>
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

