Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACBBC369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 15:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B75110E96A;
	Wed, 16 Apr 2025 15:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBeDFg38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20B810E96A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744816262; x=1776352262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kx+6kDVyZ4me1uBkcetrjOoWqwQUKtwJdsuavb7sK5Y=;
 b=dBeDFg38l3MCk9S+DBIWIAnzQlEzKkn7fKKf4aRd2rohggpR2N7KY6+2
 l/KTmn4z9M6s2X+BtJmSlGitF2IeuwvJgz6nJLaE6bINgxx2tL3VPdX6G
 mdvVkp1DiRykm+HZ8hkBQ6jMu/pYd1keCMvNuTXMp7P+Zlj783iux7VcN
 VcbC+bLp012jQ+llH9aS0vbwhMJHy0Wq4ihut7vdK8BRFW+BXogPx2LKJ
 sHUMlGXQWH1o0JYdpB+x6rEyRV7JDLhSNsZXDurlF5ccxcojk6MvNS1ZL
 NKjjEGtC4LM4DWEerFlnhrYJygXZ/kslnjewc0mgYSyF7cU03g9Nauey0 w==;
X-CSE-ConnectionGUID: dhsAsgA5RjOzXdYuY/1Oow==
X-CSE-MsgGUID: QwFFoBgYTuu2loXWHSMybQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68859625"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="68859625"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:11:02 -0700
X-CSE-ConnectionGUID: CFG/JWe/RPOO1OkBsXnyRA==
X-CSE-MsgGUID: 1F3wmBoDR0OIRsCDNsANnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130828839"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 08:10:54 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
Date: Wed, 16 Apr 2025 20:33:48 +0530
Message-Id: <20250416150348.2901159-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
References: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
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
---
 tests/kms_async_flips.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a3defe604..51afae8e9 100644
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

