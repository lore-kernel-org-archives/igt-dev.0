Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790FCC0219B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB9310E5F7;
	Mon, 10 Feb 2025 18:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgaXuoWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A102C10E5F1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212836; x=1770748836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D4XIWrupjHmR5jYbWNnzMjFg/mclr6X/2hkyqCBm6ck=;
 b=ZgaXuoWoiSquMy9j3G0Kraz4gbSfk/sWnxY6GLBFGSl7Dw042dpwwZWn
 tHZnkR0tNaRNwLOSsGMVFroCDGqQhJt+NnLBRjh2UhK2BEHwrJVmk7C6l
 PtBBXHWn46UWxYWuzamn/YSZFLVwBWb2Qd3Otn7zT4uQ8Xx878w0Pp3HL
 MsR50RXDPnhx8WnvvZrr5CMnCsqKeA1SZJ+quakV/z2+y5jFkU2FMemKr
 AxYJ3EWtfR1dZcx6tjVYf8zoJlNSB0pI+7e0L6IVcgdJ9/WuBDYIyIgwN
 dJX0Dt6neab6ZGJfw4ZDweCA7wvPp8grHkK+An+tQhgrY1Zeezp+Vrd6I g==;
X-CSE-ConnectionGUID: xRLcW/czS7WZg2QwiTVf7A==
X-CSE-MsgGUID: VfIT5W5rRFanFt0Hqq7Ksw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39497498"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39497498"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:40:36 -0800
X-CSE-ConnectionGUID: ahA7WmszRp6HmSHNTNLDuA==
X-CSE-MsgGUID: 229rOdFkSJCcCx3phYwg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112229465"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:40:35 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/kms_dp_linktrain_fallback: disable
 ignore long hpd
Date: Tue, 11 Feb 2025 00:26:05 +0530
Message-Id: <20250210185606.1327892-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210185606.1327892-1-kunal1.joshi@intel.com>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
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

Some systems may have environment variable IGT_KMS_IGNORE_HPD
set which will ignore hpd, disable it before starting the test.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 69d48ca21..c8d284e17 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -637,6 +637,12 @@ igt_main
 			if (current_log_level > 10)
 				igt_drm_debug_level_update(10);
 		}
+		/*
+		 * Some environments may have environment
+		 * variable set to ignore long hpd, disable it for this test
+		 */
+		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
+			     "Unable to disable ignore long hpd\n");
 	}
 
 	igt_subtest("dp-fallback") {
-- 
2.25.1

