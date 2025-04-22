Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728CC369D1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 10:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA4510E560;
	Tue, 22 Apr 2025 10:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxIlkdf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5606110E560
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 10:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745319039; x=1776855039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/CsEUK+bP3i2PMgxS+HCOt3NE+RerIlL+68d9PuGiBA=;
 b=gxIlkdf/L43XrAR+hH8IGyvts+bwxpBIxDwNli/ypcWifcLl0Rd4/y8f
 I2xilFl4TluVE1SVIbSOhryFcSOyHvr0HRT58MZLqGm3ZcGyxrOyAjk2o
 X5v3OqfaDDlaQ0bYhuv8lf9Sljv8rtof9YGvOzx/6pHmynSfM+VWivw67
 XiipoBjvlcNeInZbVroLD8WhBczrAOLeSa+rrl+Zd/pXcohmGlDo7H2Gg
 dDhvMyFeaoXPWP1J8G+kuXQgdoZlVyQkMijGZUkgPE6TpZ34/C9SshTN7
 8X2pbD76lfxmh9EqCZhAFEeZruWu2fp/gR1PRy3ACVJ9CytjlIWcvkFtd w==;
X-CSE-ConnectionGUID: 1aDEkk7uRDuSRGVfK9Cbtg==
X-CSE-MsgGUID: KANU4ociQ6yv3EaoY4rLeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46971675"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46971675"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:50:38 -0700
X-CSE-ConnectionGUID: vfErd8r+SG62yUbaOsGd/Q==
X-CSE-MsgGUID: LXKhY9WRQ1qk8JRyp7zv9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132932091"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:50:36 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/kms_async_flips: Use tiling modifiers
Date: Tue, 22 Apr 2025 16:13:03 +0530
Message-Id: <20250422104303.2939858-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422104303.2939858-1-santhosh.reddy.guddati@intel.com>
References: <20250422104303.2939858-1-santhosh.reddy.guddati@intel.com>
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
index 12d1a0f43..71ea94cc8 100644
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

