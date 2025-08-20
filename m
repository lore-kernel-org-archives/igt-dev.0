Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC9FCA0EED
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 06:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E6810E23B;
	Wed, 20 Aug 2025 06:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="no8wMm4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31D810E23B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 06:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755671401; x=1787207401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KZ73JZxfEN5wZqyV4kq0eanS6t7KbjWTRKp1y9UHLEg=;
 b=no8wMm4TM+Jit/wV7nfO64dtvnbzeqElpZ1jViJTvlYl8VK69dUqNZvw
 aBWwwQFHH7fNm8wfM7lFt+Q3GvhnKdzhDCXZibIZGvaaI7u9GNQ2UIiwd
 vJRUsq5bY9PD4Uav2QvpngLji2z0k8WZ+ogBY4efnEh/t2a9E5pJFcw2X
 mEYpDnmGPJ6wbpSloz9/tsB2EzibwBBMZ1wbDcIzBYzm+Tv7P2bu8VjUU
 3E/sdUDB28MVpz6QIvNm4jDW9G60PSH4dY5oykvUZ8HVsO1xFbMSOfB12
 jKQAdpsU7KevEls077vFAauWz0desMTVUNqxqjPacPGAY7gcTL6ZJ/PN5 A==;
X-CSE-ConnectionGUID: X3fo18PNT1mvS/SA+SNcQA==
X-CSE-MsgGUID: QcZ7DDMOSUK4UoH7doPJCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68637830"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68637830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 23:30:01 -0700
X-CSE-ConnectionGUID: yhMD0hDZQUuGzMFI12ru8g==
X-CSE-MsgGUID: H8O+L06ARJOJZxlcQtJC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="173405333"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 23:29:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: Remove unused format modifier
 checks
Date: Wed, 20 Aug 2025 11:56:56 +0530
Message-Id: <20250820062656.1081253-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

with IN_FORMATS_ASYNC, hardcoded modifiers are no longer needed
for invalid async flip subtest.

Fixes: 4972020ea0f3 ("tests/kms_async_flips: Replace hard coded modifiers with async modifiers")
closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1ac5e6db0..733abf417 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -1186,11 +1186,6 @@ igt_main
 		data.atomic_path = true;
 		/* TODO: support more vendors */
 		igt_require(is_intel_device(data.drm_fd));
-		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
-						       I915_FORMAT_MOD_X_TILED));
-		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
-						       I915_FORMAT_MOD_Y_TILED));
-
 		run_test(&data, test_invalid);
 	}
 
-- 
2.34.1

