Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219EEC021A4
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E0010E39C;
	Mon, 17 Feb 2025 08:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHHv/C5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782C410E39C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739780342; x=1771316342;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GuyyaZFoGEv3RoqBxUERaY8uRqY2f/kKc1ci/OlZxDU=;
 b=LHHv/C5aJq2Pt8bwM0kSQ1GKxGyHf06cDP7NMiVGrNjTmz2RgiZUB/sl
 ieK3t+SStOBUCPmmgRWt+kVfJ1ngTEOhW3kxTpcSB7CCVLxuGKiLwyOFb
 2YR8e/4IXfXBQg02shAgBekuEqo1qLjVthDnHWskVGZuI2EsdkwjMraeY
 CFP9TaPstjpSCLi+kXXPyd/yOhnKLE4EVglj7A/NRh04k+On1mHFlUkVT
 mukFyGIwc0RgN1LlhKn0ZT0r1Lh9RQg72X3wq0v3sEUoA+/P332ynlVoR
 OICygh7Ykfw1KOJ9Xm1LJHRi5POJInqokFdlLillwGtErYo/5G7HdrJAM Q==;
X-CSE-ConnectionGUID: AixcJzN4SNKwHCrntZsjRw==
X-CSE-MsgGUID: 8bQJ6elaQm25vTF4fyPMCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40157778"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40157778"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:19:02 -0800
X-CSE-ConnectionGUID: 7F2spDGfSwmcJGgvEHiUVw==
X-CSE-MsgGUID: Rb5omVc3RIesWnAanBDn3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144978442"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2025 00:19:00 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/5] lib/intel_chipset.h: Add macro for PTL device id
Date: Mon, 17 Feb 2025 08:18:53 +0000
Message-Id: <20250217081854.3219791-5-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add macro for PTL which helps for the tests to check for the platform.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_chipset.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index c93ad9f75..2f6bf788a 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -209,6 +209,7 @@ void intel_check_pch(void);
 #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
 #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
 #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
+#define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 
-- 
2.34.1

