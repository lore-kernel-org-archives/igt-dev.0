Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF7C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 07:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE8C10E776;
	Thu, 24 Apr 2025 07:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbdG40qC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03D110E76A
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745481194; x=1777017194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJla95RrV8vDLc/V19FKP60S2mdHb+xS7f2KwX+cEHI=;
 b=gbdG40qCZVAoN6wqJS1WXG2/Vcew94JBcKosRtaR5Ops8kTzP0Kms4cI
 YOFKAJDMiii9RobaeYfXiYaKkLzAKr9QdYyOj2AeNcm+rCQ3MPWvyaR/s
 0glu+aclW7KlnVv1jn72Bkbq23GVuQMihX16Fowr6MXusjQP3/hEedF0A
 Qms7rl60OiopiM+NLtG+RCxx/P2mHQYZb59mnFmQ8Licqt2k5oM6mkEDB
 yP2lm5t1x5eMXLYpfvRbY4TvdD8uAopAlAr0FCgZBrLqFJqdB00C9Fs7t
 Yp5y1WZlhr+1P970J7Rkf1Xh+tLmSxbppt7U+iKIDWZioV/6vggg968Vu Q==;
X-CSE-ConnectionGUID: 2a+u+UN3RX+OZvyIFdqikg==
X-CSE-MsgGUID: 1nFV47+6TVKOYPq+XpWPYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64512705"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="64512705"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:53:14 -0700
X-CSE-ConnectionGUID: LFChQKfIQ96hsJsCnITb7A==
X-CSE-MsgGUID: qMBoCo93SNeYJm1op8zgaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137712989"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 00:53:12 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/kms_async_flips: Use tiling modifiers
Date: Thu, 24 Apr 2025 13:15:06 +0530
Message-Id: <20250424074506.2946884-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424074506.2946884-1-santhosh.reddy.guddati@intel.com>
References: <20250424074506.2946884-1-santhosh.reddy.guddati@intel.com>
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

As async with linear modifiers is not a practical and common use case,
override the default modifier with tiled for all the async flip subtests

V2:
move handling to default_modifier (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index d8708d803..97128cfad 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -194,6 +194,9 @@ static void wait_flip_event(data_t *data)
 static uint64_t default_modifier(data_t *data)
 {
 	if (igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
+				       I915_FORMAT_MOD_4_TILED))
+		return I915_FORMAT_MOD_4_TILED;
+	else if (igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
 				       I915_FORMAT_MOD_X_TILED))
 		return I915_FORMAT_MOD_X_TILED;
 	else
-- 
2.34.1

