Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1BFC021AE
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD3A10ED55;
	Sat, 15 Feb 2025 01:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyOyJDQ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E60B10E4B3
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581589; x=1771117589;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pc284ZzKuKS80YDfFPgECJfYenYtRbHU4MvfKRzP8rY=;
 b=WyOyJDQ2eRmPE6rmHEK+8W6uwGIKJcANmVym3FoOcF21o2Qu0VsRUTtw
 LedIfarlKLLq9Z+ciHfL+Q6hs/h6hQmsPrLnIOfZSqnFW0JshPacpMHWU
 E+fIBJ5XCB0AccB/dS5CoGN0Xlg+cYMvEzB2uN8SibwXt6UyJrJjoCypj
 YluDdJc5sJ6IvPj4B7/Gu7vefDXlhRMeeNeZjEFVZB/VKAR3qnL+sWqNY
 EftvL8miV2ta+cUdn1f82gmuO4TfRFMtapM0/aKCljSXPsXpjGeQGWFw+
 hIyN+XwQDmc/fDzQZiwV6rUxfHOUYnFBTUpIPVSbnb+4jeQgf/UM8l04E A==;
X-CSE-ConnectionGUID: WPUdAoAHQMSPYSjJ5p0D2Q==
X-CSE-MsgGUID: 0dszb6+pQ3e5TxWwVdNZeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555110"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555110"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:29 -0800
X-CSE-ConnectionGUID: byZd7ScNQju4L/+7qPa4vA==
X-CSE-MsgGUID: 6IYoU/tiRAWXp/0ld84S+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711238"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 02/13] tests/intel/xe_oa: Drop unused macro
Date: Fri, 14 Feb 2025 17:06:17 -0800
Message-Id: <20250215010628.1639986-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

