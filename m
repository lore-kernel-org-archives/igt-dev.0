Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBAC7115D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 05:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3433910E34A;
	Thu, 29 Aug 2024 05:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOEuNBaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC2E10E348
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724909050; x=1756445050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mPNfngQsEVxC/O270xDPhUfd5y46t5YytErTfoxB4OA=;
 b=FOEuNBaE0lZF+lnj0xY7U/DhXONh4w/YqKgctkawPdiqjOLqUoZBwG69
 ZCgwmHoJ2TXGXAIwAbM0Od9d4l/nHiX5403AqIztvT533m97mFar+BF5s
 rPHQKa3YtbasVpnC+NyYOsO8QgIiwPnhPHACvOuTxokXoVzpN6nXRzP4W
 bkoVT5jQh89+zoL8qaVohh/ZY2g8ZLD3pgKLlu2u2KjC32WpZ97R/u8vy
 U6BrIb5vL/vrfIytM9Iz62CFAgzfAua+Q2kAuFk84zU0iYVc/Kf7Iu6M/
 mayBukDbpzTTmHxN/x/9TBeDbrQF/IbaCq3nQDeD+hCGziLVMaS3D/rE6 w==;
X-CSE-ConnectionGUID: jyiqve+ETgmyLCbjAW/0+Q==
X-CSE-MsgGUID: DDJxBro1S0u3DNWZC1n5IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27352871"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="27352871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:08 -0700
X-CSE-ConnectionGUID: 4wuskCThQSSvKr5wl5cGAg==
X-CSE-MsgGUID: NOvMrVORRrmorAfA4merKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="94200507"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t 5/5] tests/intel/xe_drm_fdinfo: Half the execution time
Date: Wed, 28 Aug 2024 22:23:54 -0700
Message-ID: <20240829052354.1872909-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829052354.1872909-1-lucas.demarchi@intel.com>
References: <20240829052354.1872909-1-lucas.demarchi@intel.com>
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

No need to do 500 msec per subtest. As we add more tests, the total
execution time of ~ 2.5 sec per subtest make it take too long. Sleep
half the time to lower the execution time.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 7879dff34..de8a2dbce 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
 
 static const char *engine_map[] = {
 	"rcs",
-- 
2.43.0

