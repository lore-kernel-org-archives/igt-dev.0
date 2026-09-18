Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF245C982D2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7091310E86B;
	Fri, 18 Sep 2026 08:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDm4qXBT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0B610E95F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789719893; x=1821255893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nzCGVYUlS7mPAaebN03Qx8ZX4aBFuum9FrPP+8JvEoY=;
 b=nDm4qXBT3vPnh+RpaW0mEsE9n90R7Qy3oyZQdH3DDwu4vaKr1exvdYaf
 soL2Dww6qDwFTEEc2ow3FlMwonuVUNvES+MgDUsXd4FRaW0srIJKoXqsy
 6rblVQIejsaKKYkeZ0HtpSpWCCD5a7+4Bo6mueaJbUz8WdlSN6PgDifFg
 AtJAf4BD7kZf1wTA2rYUMPM2TbNP/iJUeILQcCv5jq0+D8cmSoljBJiQG
 cO1bk1cEJFmzGnjQPOsKwR+xzmpWCsSxLIsu0r3PWG2Abf1I2W+fxN6g5
 RlOkAhbkIkjpw98fEWIGqR2klsVXbBzMYhNtfjmfREflIE44oHHLTDKru w==;
X-CSE-ConnectionGUID: dwcQ5mJmTzW6kYtIw/FjIg==
X-CSE-MsgGUID: zMB2axgCT9yAo2cQblewwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100870715"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100870715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:24:53 -0700
X-CSE-ConnectionGUID: FkhPAm4XS+KGQCq+VfwO9Q==
X-CSE-MsgGUID: /+OvgW2yS7KnBXTXw+G0hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270965444"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:24:51 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t,
 v6 5/6] tests/kms_color_pipeline: Remove unused color_depth and
 drm_format
Date: Fri, 18 Sep 2026 14:03:49 +0530
Message-Id: <20260918083350.1021184-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260918083350.1021184-1-swati2.sharma@intel.com>
References: <20260918083350.1021184-1-swati2.sharma@intel.com>
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

Remove the data->color_depth and data->drm_format assignments from
run_tests_for_plane() as they are not used anywhere in the color
pipeline test path.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 693a0faed..2b4e8c82a 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -349,9 +349,6 @@ run_tests_for_plane(data_t *data)
 				test_setup(data,
 					   crtc);
 
-				data->color_depth = 8;
-				data->drm_format = DRM_FORMAT_XRGB8888;
-
 				test_plane_colorops(data, crtc,
 						    plane_colorops_tests[i].fb_colors,
 						    plane_colorops_tests[i].exp_colors,
-- 
2.25.1

