Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC339CF6C1C
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397D10E579;
	Wed,  7 Jan 2026 09:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4ne0Q5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F3E10E584
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767778042; x=1799314042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ikjQWswCu2aGNpiVFUc8TFDoBYrNjdZF5y0tXB2Wg/I=;
 b=U4ne0Q5u/9OwHVhD8UhNO1kuxez6bZjJpdROMmxjmxruzcNswkTOCgLs
 P4+M3ZZ6GumVXAu6HfMSgJ0BBvLMvQ8w3k9T2yxdbW6iZcssTv9mMsDrp
 Mp/juaNqUONGXb3XvdzyzLA36Vn1d2hKWeNInY+hLEPT+kN1LCxVyFmVC
 TVvHZg4RD8FxsivGA4fAbrD5lo++AgQBqwVWlian4FWlinh+EAJVKHLKb
 XjT2SsnP1IEVpQ/JvQ6pvzFV7KyHxPPDudem+4DAuwS5af18nL1MAeYR3
 jd6BQd3CukhbXILvAvmM+WfXYTcUvmUgproFqyQlZT0dwv5gVgrHrQ8Nt Q==;
X-CSE-ConnectionGUID: +WxnFbNkRjanHN0HX63b2Q==
X-CSE-MsgGUID: YR9uqNK7Sk2RF/pBSKsydA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68337789"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68337789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:27:21 -0800
X-CSE-ConnectionGUID: j6xKc7NHSf+4A7u0Wf/KTg==
X-CSE-MsgGUID: 4olrtrbKQhOti9+bNi6OYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207412564"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:27:19 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t,
 v2 4/7] tests/kms_plane: modify the condition for odd pan
Date: Wed,  7 Jan 2026 15:05:32 +0530
Message-Id: <20260107093535.70116-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107093535.70116-1-swati2.sharma@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
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

From: Nemesa Garg <nemesa.garg@intel.com>

NVL onwards there is support for odd horizontal
panning so add a platform check so that expected
return value is 0 instead of EINVAL.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index cbc006d7e..ec3245c9f 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1322,6 +1322,9 @@ static void test_planar_settings(data_t *data)
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
+		if (display_ver >= 35)
+			expected_rval = 0;
+
 		igt_create_fb(data->drm_fd, 810, 590,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
-- 
2.25.1

