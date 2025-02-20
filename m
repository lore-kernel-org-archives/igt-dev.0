Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81B8C021B2
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 12:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E64D10E954;
	Thu, 20 Feb 2025 12:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N14gaTaR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E631E10E954
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 12:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740054120; x=1771590120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qx6Ol9tzLRfnDkGxESgw9Oi9nU0+pIhua19q6j6F7Ho=;
 b=N14gaTaRhjXQL8rlb3DCCqMXyOipaWHrYEUCN2u6N6/EfnhOXvxhZA/z
 D7JpZyMIEI2EpqzBFH+MUZeSQbduILeLyvZ015JaL21baNelpUhhiXot1
 w6083xL+i8YVKpu9ZPHW39y5Wz9gV4xfSRovXUFXUIyocanFBi1PPBFNw
 nCXDxIV1jVjWUrjdk+t0R397dYJwtGPCH23dDSLYWM7tAferMwkkSyTIY
 QvrKMM2k2VGaa3b7+o2+ScybHX/PsELhGiRuSFsi+3TcX5RqtNafpuBFA
 PXFA1i/IQNFx5eWLiSZJntjvALg5OQMJ3JG9jPkrRIOAa/T9s0zhNaZSo A==;
X-CSE-ConnectionGUID: xS6rmZqsQ1C1opTgIzWMwQ==
X-CSE-MsgGUID: yxKKs/PgRduD5Z1QMb5Lug==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40697041"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40697041"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:22:00 -0800
X-CSE-ConnectionGUID: zqzt+rSLSU+/M1GLc8R92g==
X-CSE-MsgGUID: LOLP/28BS5igmGqkThT4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120251400"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:21:58 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v1 4/5] tests/intel/kms_psr2_sf: update to FBC support
 check
Date: Thu, 20 Feb 2025 14:21:30 +0200
Message-ID: <20250220122131.221907-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220122131.221907-1-vinod.govindapillai@intel.com>
References: <20250220122131.221907-1-vinod.govindapillai@intel.com>
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

Utilize the library function to check if the FBC PSR combination
is supported in a platform and re-roder the condition check.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_psr2_sf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index cd4226070..16acff4cd 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1225,10 +1225,9 @@ igt_main
 
 		display_init(&data);
 
-		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
-		    (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))) {
+		if (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe) &&
+		    intel_fbc_psr_combo_supported(data.drm_fd))
 			data.fbc_flag = true;
-		}
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
-- 
2.43.0

