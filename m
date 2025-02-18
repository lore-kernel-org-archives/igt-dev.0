Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8559DC021B6
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4B410E76D;
	Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJEDWEOe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72DC10E761
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910496; x=1771446496;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pc284ZzKuKS80YDfFPgECJfYenYtRbHU4MvfKRzP8rY=;
 b=OJEDWEOeoxsmiEtDqEbhAzo8cvzBaqbCyjKQXhBaO6RW9lTzhUjgcSx7
 sTM856aB5U1dgNVDefNawIcZ1cOH4t+oH0sYR7VymQAbDZy7uV24ZFZDd
 FpEs4S5rMQ43svPRl20P+pNC++ot1VEOPokzF5oTU8vCaeA4JDSKeXAR5
 jcT8vEg2jLCSTqoC+yQK3u66FxIljlG0J7/zAy5Dsc0AllmNuzEbZyBhH
 cFjS7+g2Jqkl/8Vr9w3N8UDxr54rUkgRIQn/eAzrVp76LwgGM0pv7wQDv
 h/2eHlMGBKPEkRx+sHR1rXaSuG9kRcqD84pqd50bYTb3HYdTnbfNBUQfg w==;
X-CSE-ConnectionGUID: PxSi0Ki5TD2VClh77gJP/w==
X-CSE-MsgGUID: g2cCE/hRSAmNXF6XwEYJ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545834"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: wRpBvgFvRqSKhRSC2Y68qw==
X-CSE-MsgGUID: N8CUqZ5bQwaoIvh0vo+lUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367439"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 02/14] tests/intel/xe_oa: Drop unused macro
Date: Tue, 18 Feb 2025 12:28:00 -0800
Message-Id: <20250218202812.1679653-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

Drop unused for helper

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 3274d472d..9c74315df 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4788,13 +4788,6 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance, str)
 
-#define __for_one_render_engine_0(hwe) \
-	xe_for_each_engine(drm_fd, hwe) \
-		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
-			break; \
-	for_each_if(hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
-		igt_dynamic_f("rcs-%d", hwe->engine_instance)
-
 #define __for_one_render_engine(hwe)	      \
 	for (int m = 0, done = 0; !done; m++) \
 		for_each_if(m < xe_number_engines(drm_fd) && \
-- 
2.34.1

