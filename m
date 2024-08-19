Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C63C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EA610E235;
	Mon, 19 Aug 2024 09:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKXRKek+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB34410E235
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724060890; x=1755596890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NflDJUCN+GsJzeBFly9E/E0flFacDi+PCDu8WSVow+Q=;
 b=UKXRKek+2UB+MlbeyhVH/2rRWSI9gWOm4BqClWmF4vv2URXNoC9iEMg/
 6UfK8v92qeWNHKPmXUcpbO/06lyCi5sFcUB4a6wns/nR5lPj19n0UT/q8
 VdUfxSyvj0t3ZoXv2NLdgfuUTZWiuivI5PrSDKHjlmwV5VB/7mkpdHoWK
 tcA9jwShCc/w/+WzUC5jxEZqRP3KehHJ+4M2A7cMhoYeV3MJ6CfyDpOBb
 VYVNEBc6S/luK7NEcHsoeoGKJcHlLZWTuSOfzGrGBoEydhGBjs2yWMh0J
 wiVxTyM5jyRVyG74J/HpdqutivP6FGGOAqjq3ixLC2pMI5DpRTsekWOkh w==;
X-CSE-ConnectionGUID: hfdb/u0PRMixBLxPVbpkFw==
X-CSE-MsgGUID: YACsQRsVSi+2dAWM1wXPuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22143912"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22143912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:48:09 -0700
X-CSE-ConnectionGUID: eFD2LOgNR3CcCd6annODPA==
X-CSE-MsgGUID: dx7yIK9URJWBixvLqrLjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65150188"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:48:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/xe_gt_freq: Add a wait after gt reset
Date: Mon, 19 Aug 2024 15:31:44 +0530
Message-Id: <20240819100146.3130945-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

After reset min and max takes sometime to get set.
So add a wait of 100ms after gt reset before reading
min and max frequencies.

v2:
 - Rename ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US and use it
   instead of new macro. (Riana)

v3:
 - Split v2 patch to move macro rename to separate patch. (Riana)

Karthik Poosa (2):
  tests/intel/xe_gt_freq: Rename ACT_FREQ_LATENCY_US to
    SLPC_FREQ_LATENCY_US
  tests/intel/xe_gt_freq: Add a wait after gt reset

 tests/intel/xe_gt_freq.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

-- 
2.25.1

