Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8733AC3DA4B
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 15:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2976810E41F;
	Mon, 15 Jul 2024 15:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJV98IJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F2A10E40F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 15:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721058138; x=1752594138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dw/WK4Q9Pw89foxHiY0SZLXgNHQHU6m3CsE1z/v2Ajo=;
 b=RJV98IJ3tLcr2lFSHAs9g5NWZjC5Mi+m26wQWY8LMTMq7E0szMSv3M9D
 f1hohyfhzAUsBjaNwVPPSGaWgH7VO/bUtS2HYukN0l8uBdwPbqy2FG+/x
 Vaty3Qcds9HDH3NOCx7fQI5IhRL+NOvSRQZTnocGMaiPvio5zlAsj8StI
 I39dE2361lFmqpMB2CihcTKy9515RCgFK03+krA4gwLABndZxjW3rltvu
 NSQAinSUV1n9R46PfFX/ls0Y0kSRB+CpZTHE7jZaz1s0kUZckkX4RRzta
 mWIx3ZE/+esWjwSemjMuidYsTGUiGaARiph7cHmlgItc5YHnPd9n6ESG/ Q==;
X-CSE-ConnectionGUID: t7IFg+U6SL6NlR5/DpOCdw==
X-CSE-MsgGUID: 8VQUvvFSR2Ooeuk4KLY5Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="35987952"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="35987952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:42:18 -0700
X-CSE-ConnectionGUID: CZwukF4XRQa0aaSxAZ8jeA==
X-CSE-MsgGUID: 54baYeS+REGc7W9UT6wfgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49408696"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 08:42:16 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 0/5] tests/kms_plane_scaling: Improvise the scaling BW
 issues.
Date: Mon, 15 Jul 2024 21:16:23 +0530
Message-ID: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (5):
  tests/kms_plane_scaling: Update the single plane scaling function
    arguments
  tests/kms_plane_scaling: Update the multi plane scaling function
    arguments
  tests/kms_plane_scaling: Improvise the planes scaling BW issues
  tests/kms_plane_scaling: Improvise the plane scaling BW issues
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 201 ++++----------
 tests/intel-ci/xe-fast-feedback.testlist | 317 ++++-------------------
 tests/kms_plane_scaling.c                | 236 +++++++++--------
 3 files changed, 227 insertions(+), 527 deletions(-)

-- 
2.43.0

