Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D02FC88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F2710E1F5;
	Fri, 11 Sep 2026 21:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbZ99ZDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C144E10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160300; x=1820696300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oWJ+YeQuWg5kqRjSq8YkY9sVAccrg8ps3BxFRF+INpc=;
 b=RbZ99ZDSgLHp8poA0ivEXWeuIRcGyXYxOIcQyhDtM/1B5nRgvQiuOL3/
 WmC14HfxUGnfWf6lPfZHLA2BCodDXsQokc3pG+UuqPi10MeeoH+WnJUpY
 mugo5zz1U9TP5OekAY8pMr1kyUNNTzwPfu5Ovp2jFPcvNPRxnf5yjVyS/
 J5pT3BVPox1dKCKi5rL9vvJUf4bi439L8zUKL2/y6UgI/wrX6FW9yZyW7
 xSshvTDXV3AM0ydiUAEzfhnHUUuXVJ7BxFkGOySTgFowCaPXPPokWGBYj
 1qCCQunGL74RDVyXrX41eG2AgDDPxPI4zigah+0Xk4c2ScaaDT7aiBgoj A==;
X-CSE-ConnectionGUID: QaESHLYxQkumivmBMXexpw==
X-CSE-MsgGUID: MljywrWbSQGvl0tjz/VJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138979"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:20 -0700
X-CSE-ConnectionGUID: BB74EpdGT7uwFFy2gAg20w==
X-CSE-MsgGUID: HIvRVl3SS/e+9jYCfVFK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293744"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:20 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 9/9] lib/kms: Add NVL joiner exceptions for 4K high-refresh modes
Date: Sat, 12 Sep 2026 02:37:09 +0530
Message-Id: <20260911210709.943683-10-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911210709.943683-1-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
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

Add the 4K high-refresh modes used by Dell AW2725QF, ASUS
PG32UQXR, and Gigabyte AORUS FO32U2P to the NVL joiner
exception list.

The driver enables bigjoiner for these DSC modes due to DSC
bubble overhead that IGT cannot compute. Without the exception,
the test can select pipe D as a joiner primary, which fails
because no following pipe is available for the joiner secondary.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d78e3bee..6e5c242cb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7094,6 +7094,9 @@ static bool match_joiner_exception(drmModeModeInfo *mode,
  */
 static const struct joiner_mode_exception nvl_joiner_exception_modes[] = {
 	{ 6144, 3456, 1413390 }, /* 6144x3456@60Hz */
+	{ 3840, 2160, 1543000 }, /* 3840x2160@165Hz */
+	{ 3840, 2160, 1398400 }, /* 3840x2160@160Hz */
+	{ 3840, 2160, 2291120 }, /* 3840x2160@240 */
 };
 
 /*
-- 
2.25.1

