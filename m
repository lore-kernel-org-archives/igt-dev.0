Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC750C369C1
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 15:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C67110E7EA;
	Tue, 15 Apr 2025 15:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hP2+CM0+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB9D10E7ED
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744732722; x=1776268722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7VjyVDVNXYfvO9XwjD09LHzJl+WwSpamQnMycDoYXHE=;
 b=hP2+CM0+xWL1jzzuOsAPnwV9YmbUOk2qYHBlMJUiF2SqiHDiYqGdmKUL
 aMigg8JZaBViDbPMe81TwDzOhruYH2XLsy1+Bs2O7wIwOy7M71J+BWdNa
 pB9WUUCaVw8W4urm3bh4s8ooiWJNKmxsR3qhXJpzW8broUArQi8Xp1kcY
 1Gkn6ZXgd4wdwGJDWDGVoi4nlTGGpYUWYigvwPsvHT4+ddvrWW61DWPd6
 gUDydvjP+KjGZUBVNqWi2m0UXaprmWGPaYfyNN4ABZDaODQ7rX54iAaPy
 r3IR2WL4dfrFGvDvRsyjpgDUB+7GcrY3Eq1TFzC7JzVl+5xunVLbfCeK8 Q==;
X-CSE-ConnectionGUID: WYTSo/qvQg6yhwuy3ulprA==
X-CSE-MsgGUID: 4Uqyk5OMRKyHtkE49+enTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45965017"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45965017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 08:58:41 -0700
X-CSE-ConnectionGUID: 4uOVBF5xQR2Y+mYnadpXsQ==
X-CSE-MsgGUID: DIw3+i6IQY2OzgyZ+FKn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130135095"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 08:58:39 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_async_flips: Use tiling modifiers
Date: Tue, 15 Apr 2025 21:21:36 +0530
Message-Id: <20250415155136.2879045-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415155136.2879045-1-santhosh.reddy.guddati@intel.com>
References: <20250415155136.2879045-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index df3e136b7..5d84df49a 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -780,6 +780,10 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		test_init(data);
 		data->allow_fail = false;
 		data->modifier = default_modifier(data);
+
+		if (is_intel_device(data->drm_fd) && data->modifier == DRM_FORMAT_MOD_LINEAR)
+			data->modifier = I915_FORMAT_MOD_4_TILED;
+
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 			/*
 			 * FIXME: joiner+async flip is busted currently in KMD.
-- 
2.34.1

