Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90155E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 12:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3265410EB24;
	Wed, 11 Dec 2024 12:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acX4ivKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D734810EB24
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 12:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733921335; x=1765457335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CsinhunKlIafzxIdgl7JuRBjDcQtqXOZyT2mV3cGAEU=;
 b=acX4ivKdGFoPkPJV6+LyNuK8H7lheWmQkSmhR5WCGYBTzMaeBX5mNXLS
 TYop8zskcb5nQBy2u2X5ZLI+abx/UqdWN/f9O3JM9Hrp7SYSZWaVb/s75
 pU1ia5CuoRkLg+QAkwl0Aum20Gq2qVzY+u4f6SsPIapQyEnC53hjvt8nW
 PLtpyQRYowSbLKx9GRamTE84sahZd9/wWK+NQmoeNh+++pHtdcFGyzp8s
 EPvHOOz8A9tnoZWHq7HwONBLwqUsdK7bEo5hPsWVla/SJr09OmqCw2lb8
 Bg71GLQUwGyeG/8NZpm8ogLBxa1xN2m+v0O9XlMRUhbaiUKTBBZS3oi8H g==;
X-CSE-ConnectionGUID: BB3JemEBSrGv4SpL0jqXBQ==
X-CSE-MsgGUID: wrhUNAdIQJW+fn260ZJgMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44970561"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="44970561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 04:48:55 -0800
X-CSE-ConnectionGUID: i+k24wngQp+b+oLGpAgxYA==
X-CSE-MsgGUID: Mj1vL6/fQOe5vTzg2iCE+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96605677"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa008.jf.intel.com with ESMTP; 11 Dec 2024 04:48:54 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] uutests/intel/kms_frontbuffer_tracking: Add skip
 condition for bmg platform
Date: Wed, 11 Dec 2024 18:18:30 +0530
Message-ID: <20241211124830.128488-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113175219.162926-1-mohammed.thasleem@intel.com>
References: <20241113175219.162926-1-mohammed.thasleem@intel.com>
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

FBC test isn't supported on bmg, skip the test on this platform.

v2: Add workaround id: Wa_16023588340. (Swati)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e41ee0a80..64da04895 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4229,6 +4229,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		setup_environment();
 		drm.devid = intel_get_drm_devid(drm.fd);
 		drm.display_ver = intel_display_ver(drm.devid);
+		igt_require_f(drm.display_ver != 14,
+			      "FBC isn't supported on BMG\n");
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
-- 
2.43.0

