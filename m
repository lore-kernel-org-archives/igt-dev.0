Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFD1C369A5
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82A010E2BE;
	Tue,  8 Apr 2025 18:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghg+nK60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB0910E29E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744135946; x=1775671946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lzg9t6YW6ZV3ki9F9PH2xcv+0nUIQ6Lj+o1yVRLoxEs=;
 b=ghg+nK60QdpgnFQGTO6g9lcDc+0mn99i0de5c/wOVkLCv8z9f8PneIoV
 kyGzMJAluE2sdLpCWd3UV4ov4CkxEDKLGYogIOUwSNtKGYbdAH10QhKKA
 AEXbnUvEjOaYkyXbBL9QgCZ9AVo5/z11YSE1I+CdMNEBhhP+CZyMLKOa6
 HrY34gnJZotuMSYMZVxPU8S04fETyjH1WZvDYcSHpmYz8sAjZv6eGbiZK
 fC7uxCnkfBuhBRvMuZ5jAoc0YDI8CuboJIultMBLpY7cLUjQ1+2ecAwY6
 J1hA6ygqVOLc5MB1szNLktR5y8M6Mpd9vEC5tha1eKzMkLva272S0Cx/+ g==;
X-CSE-ConnectionGUID: zn5PFr45RvSgoi57LJrlNA==
X-CSE-MsgGUID: TzbdjsuyQjWlsGICeikhmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45479361"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45479361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
X-CSE-ConnectionGUID: g24/HJC4RZWpf7HoOB1gxA==
X-CSE-MsgGUID: XlYhksfxS0+mdpaQ68n1NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128683617"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_oa: Use TestOa metric set also for
 OAM
Date: Tue,  8 Apr 2025 11:12:10 -0700
Message-ID: <20250408181210.1052760-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
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

The only means available for testing OA data is the TestOa metric set, so
use that also for media OA.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f3ce37ff5a..0914054460 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -338,7 +338,7 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
 	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
 		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
 		 HAS_OAM(devid))
-		test_set_name = "MediaSet1";
+		test_set_name = "TestOa";
 	else
 		igt_assert(!"reached");
 
-- 
2.48.1

