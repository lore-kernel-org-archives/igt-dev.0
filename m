Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1203FC3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 05:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C215810E1C1;
	Fri,  9 May 2025 05:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keJsVmFi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEE710E1C1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 05:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767660; x=1778303660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMZ/2ew5BzIfvwZhag/5+JD2CHfqTK17M9x3H/Ce4s8=;
 b=keJsVmFim62jeFgkHei0LgsbwK7C/FFKusa7aavB3RFPutShlzVBbhaO
 XKxXqBLi/zMPxFZoBeogfncBwC5e/l58hrVDuoV6ZkjuywJMU2ozVPOCJ
 jrl6X5GkqcGt6Zcol7xguLi1UNeVURp4Zsl2YLKV7WuuY5WhBRB6MCWxD
 F65HJ8AWqNhE3PFFHFi5bixB9Q7/EH1xSnkIMnzuiyD3gTswLyKn0UJEn
 vU3wVTt8u0hP0Tgqr9pVvW8ZCDf/pNOlENkwJOApuZ65TWEP/Yh3esCIv
 7XsP4aIHkpZQROFabBsNuss+V+xhSX6Ogo4GE9q12/ynOCDYegnzcfxIO Q==;
X-CSE-ConnectionGUID: amEIju8wSuGpqKgAsWmizw==
X-CSE-MsgGUID: GWvhnnpcQtaY57fGcB6F8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48286630"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48286630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:14:20 -0700
X-CSE-ConnectionGUID: PoD3lS5mRaSo6K6uuS570g==
X-CSE-MsgGUID: EeyWt7sxTmq8Rm/KPBP/4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="140566414"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:14:18 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/3] Improve frame timing checks for high refresh
 rates
Date: Fri,  9 May 2025 10:43:49 +0530
Message-ID: <20250509051352.1607604-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

This patch will improve the test timing checks.

Naladala Ramanaidu (3):
  tests/kms_flip: Modify check_state to return true on unexpected
    sequence
  tests/kms_flip: Increase test duration for flip-vs-wf_vblank
  tests/kms_flip: Adjust frame time checks based on refresh rate

 tests/kms_flip.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.43.0

