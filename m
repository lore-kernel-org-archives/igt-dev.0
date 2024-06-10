Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2479C27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 12:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DC610E345;
	Mon, 10 Jun 2024 12:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvjEA/q/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AC810E454
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718020806; x=1749556806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5H1tmi6EvdxnoYanDBuRv6XQtr9oP+VLpd3oQxZHrf0=;
 b=WvjEA/q/mtLmLn0WVGWE790zwUsORd76Gj+tpJxmiAJeShIHDFAiu6wM
 c2IrWpC9Oy4JQx9ykKrKiI+TmAwcy64mWO7ht+aYgkRIqrHYXsMxQiMWo
 wmKFb3IWABwrFWzlL2+R3hg6s1Z2znSwKxrNylFjKwRysmPCqogDttCRW
 g0ERLNTo38jm0NKZc0NSAQiSER/SmyBGqbmLIJA2HijXCFgCAMoM8yY8y
 jS7cDFelYIqDwobUuhGaTc4b74JhZV0fTxPSck3w+OUBS/e8d7MoD/qC7
 seHfx0naChbbbNMK5QTXltBq2vZGuA54tuDRkvC8DpMwgI15gcRDAfbZJ w==;
X-CSE-ConnectionGUID: XusSvlSvRxqfAhtMA/2b9g==
X-CSE-MsgGUID: dI7tsTJ8RoK8yHFclge63w==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14626151"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14626151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:06 -0700
X-CSE-ConnectionGUID: I73saVeZTjqhjYYWmYMJPw==
X-CSE-MsgGUID: PYQ61VnxRbqKFwk6O8nLWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43472083"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:03 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 3/5] tests/kms_dirtyfb: disable psr feature only if
 psr possible
Date: Mon, 10 Jun 2024 14:59:39 +0300
Message-Id: <20240610115941.35279-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610115941.35279-1-vinod.govindapillai@intel.com>
References: <20240610115941.35279-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

When kms_dirtyfb tests are executed on cases where PSR is not
possible the tests are getting skipped. This is because igt_skip
is use in psr_set function. So avoid calling the psr_disable if
not necessary.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 6121599ec..2a32fab56 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -169,7 +169,10 @@ static void check_feature(data_t *data)
 static void disable_features(data_t *data)
 {
 	intel_fbc_disable(data->drm_fd);
-	psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
+		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+
 	intel_drrs_disable(data->drm_fd, data->pipe);
 }
 
-- 
2.34.1

