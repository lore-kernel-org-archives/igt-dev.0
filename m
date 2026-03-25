Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E48A109C046
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 16:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C65610E831;
	Wed, 25 Mar 2026 16:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3F2dM11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D67210E160
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 16:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774457591; x=1805993591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbxzC83wBFeYqvvpZcEnVVf2T77ImIG4N11dYPSRSVI=;
 b=T3F2dM11x/XmbmkwgAMng5S0vS+bwDhiyQ6wOJQWPeh1QnpCYQdyjd4A
 0wm/i43Nq6nK6lFIdioKtXiP8zNeNQu1jsiQ7vK2q+8uvC2w4GUTaxzpV
 iTBtbxJRGfFcV8HIZyb2hN4k06C2eX7T7tlR/4HYAB/3bfYEadPdL1LGY
 7jL3yLrXJvSBAsuumbVTMp7n6rBg194CpLHeliE0xVr91ftimFzRXzfQ5
 FA4f0T2yUAUvE9jtd3UundxVNTbVDfqCRr7xjpgZg9HMf7kUQfLlu+Ihw
 sL+1Zf1urFZGymw8HKQ+jvQctFNEXMliLf75pxu7EtgNXAQ27Tg1WoCzY A==;
X-CSE-ConnectionGUID: 6gFdykYWTxy4pfeg3PodGQ==
X-CSE-MsgGUID: hsv6+D4vRjyAotZrHkVhQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="92880609"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="92880609"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 09:53:11 -0700
X-CSE-ConnectionGUID: aybFANHyQomfM15W8RcVGg==
X-CSE-MsgGUID: TDe1q9wVShSdioAyArBEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="224991849"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 09:53:10 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 2/4] tests/kms_vrr: Avoid unnecessary PSR disable
Date: Wed, 25 Mar 2026 22:21:38 +0530
Message-ID: <20260325165140.115520-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325165140.115520-1-jeevan.b@intel.com>
References: <20260325165140.115520-1-jeevan.b@intel.com>
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

Use output instead of NULL in PSR helpers so PSR is disabled only
when supported by the sink, avoiding unnecessary global checks and
ensuring correct behavior on multi-eDP setups.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index ec0692b2f..ec17366c8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -912,9 +912,9 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 			igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
 				 igt_output_name(output));
 
-		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
-			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||
+		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output))
+			psr_disable(data->drm_fd, data->debugfs_fd, output);
 	}
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
-- 
2.43.0

