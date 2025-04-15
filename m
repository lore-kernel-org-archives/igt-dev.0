Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BFCC369BA
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 15:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6E610E7E6;
	Tue, 15 Apr 2025 15:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8anc2gU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0DB10E7E6
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744732135; x=1776268135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7VjyVDVNXYfvO9XwjD09LHzJl+WwSpamQnMycDoYXHE=;
 b=d8anc2gUr3dDmUZUXrOGJ2uuMZRXC6kUZoTi7ehX6ruOgoqd1MG31lc2
 v23XiD7JAtSpfGg+W38oqt8nW3uuadNxPgfoH8j1FMFdjKMjR1XquVFvb
 8ZWgpK1UuTbC0geNhL8GhEHiiKLPNlYO7cXBrXTooVME7sWCiMlwroUgP
 2GVOQNfz2dQQ0rZQ+HRFg65ALIZvKGpERpJ1V94oXlu4wrBzWq5hDVdQs
 XHmS47m0V+Dd44wl0CDk9WyMa63wxAK65tg4/uENPPg7TJi2bNVc2c3JL
 HJ30z4YbB9yel1s7dkb2r7pHXuqR9Zbw1V2ooO2TDQ6vXJ/eqwDDyQSzl w==;
X-CSE-ConnectionGUID: adueqpa/QdOa10ks7vVk/w==
X-CSE-MsgGUID: b0R1l0HvQ2eJv561OPly9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="48947363"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="48947363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 08:48:55 -0700
X-CSE-ConnectionGUID: WPMoz1PNRFGcJtkjwo7XOw==
X-CSE-MsgGUID: zi5LI9wqSWihHM0kn3z4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131131586"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 08:48:53 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
Date: Tue, 15 Apr 2025 21:11:48 +0530
Message-Id: <20250415154148.2878850-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415154148.2878850-1-santhosh.reddy.guddati@intel.com>
References: <20250415062901.2872752-1-santhosh.reddy.guddati@intel.com>
 <20250415154148.2878850-1-santhosh.reddy.guddati@intel.com>
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

