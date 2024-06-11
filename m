Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0217C25B76
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 08:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F8D10E570;
	Tue, 11 Jun 2024 08:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJpLBbwQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB810E56C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 08:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718093076; x=1749629076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5H1tmi6EvdxnoYanDBuRv6XQtr9oP+VLpd3oQxZHrf0=;
 b=UJpLBbwQ8pVRB1Tq1DnI+yh3TJ7k8Nim7cV2dRzir16iLkOmlFeqcwzh
 gU2C9EPpPlv+pWMJGLS6Pd1kJCpupOsJqq1oT0gitfgbLnTmqoM4TX4r+
 k4n8nIEYP5FNInuppJYjPAvvECvQD0+XCVtbfVJsS0T0HD+7PZGosvGHd
 HKYkV0uzDBB/3bL7D4nv5z3BrBBpBcc0nFTJAZ0OQ6EnfvPPFLQo9DUek
 hk16JLunJqxxLqfGktXoFzwciRbjVm15goumvnOT0kjAmeguJlqh1V0iX
 kUNmkMcAoibx4Jzqihk8oWsTEMWiNZcu/xmBGOwxI9aQSVQXCodHQBG/d w==;
X-CSE-ConnectionGUID: ypqsM32CR/ugvyHuXPBz1g==
X-CSE-MsgGUID: /f5h+QNCRZm8Q/fb6++ZoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25907320"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="25907320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:36 -0700
X-CSE-ConnectionGUID: 6iaxhJLaSRu8lF0hTjfciQ==
X-CSE-MsgGUID: WVnYI1FERFG9IzonwpPitg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39336144"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:35 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v3 3/5] tests/kms_dirtyfb: disable psr feature only if
 psr possible
Date: Tue, 11 Jun 2024 11:04:14 +0300
Message-Id: <20240611080416.56878-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611080416.56878-1-vinod.govindapillai@intel.com>
References: <20240611080416.56878-1-vinod.govindapillai@intel.com>
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

