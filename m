Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA9FC88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 19:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A481E10F084;
	Thu, 17 Sep 2026 19:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJ0quqU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2647410F08A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 19:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789672176; x=1821208176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUHCoDptHZbqpPRulvf9grZoxxjL8qE14bkl4T+eaGQ=;
 b=jJ0quqU3Q+W5GeKMqnOQbmE8NzVojgEXagmntQ3k5DuKCTJ6F6Uh0u+c
 JPG9r7KdsVkJz4I7T3KtBgcNycXP5XRZ86/2UcoqXGaq1cpZSHtIU7GCh
 QKMX8h+qGBJgmb0OgpoEURRVXa7pu0/G0QypWXLR0xbcG3YbsRHsHu0/S
 sFb1fgCuELC5RVq4Vr7K1uF9tV7exS9rjnYjPNptogv2s4AGmvZ6PG4o2
 gQp8Gyhhp8vYVaATwluXtn+tkJGizB99s/4BM4iw9T6RZxlWoRWiSttKs
 VosXp2/RU1+Ul0RytHfvWPeaCQ+rlmxWk1NYo54HXGJS9MQW7OFjDtWCo A==;
X-CSE-ConnectionGUID: pvrol0SUSZWD0j0r1QLmVg==
X-CSE-MsgGUID: 7ub9b189Rfq+TL5sNgSRsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639304"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:09:36 -0700
X-CSE-ConnectionGUID: A6toj9+jR06ZNbTVqeHUOg==
X-CSE-MsgGUID: X709KkkqRPyrziU0BubSEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270271245"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:09:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 3/3] tests/kms_atomic: skip BACKGROUND_COLOR in CRTC state checks
Date: Fri, 18 Sep 2026 00:48:35 +0530
Message-Id: <20260917191835.977425-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260917191835.977425-1-swati2.sharma@intel.com>
References: <20260917191835.977425-1-swati2.sharma@intel.com>
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

BACKGROUND_COLOR is initialized to opaque black, while the generic CRTC
state snapshot does not read it back. Comparing the property causes
atomic tests to fail during setup. Exclude it from the generic state
comparison while keeping the valid opaque default.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index ce5b00cd3..09b7915af 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -218,7 +218,8 @@ static void plane_commit_atomic_err(igt_plane_t *plane,
 
 static bool crtc_filter(enum igt_atomic_crtc_properties prop)
 {
-	if (prop == IGT_CRTC_MODE_ID || prop == IGT_CRTC_ACTIVE)
+	if (prop == IGT_CRTC_MODE_ID || prop == IGT_CRTC_ACTIVE ||
+	    prop == IGT_CRTC_BACKGROUND_COLOR)
 		return false;
 
 	return true;
-- 
2.25.1

