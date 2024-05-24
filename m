Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D752C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F2E10E13E;
	Fri, 24 May 2024 08:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8qn5FlE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9764410E1EB
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540489; x=1748076489;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y4mod2561YoRpsHtaSzkHWdBiTJxUM6pYxRhu047p+0=;
 b=P8qn5FlEhubZJ7eKgUahMn1VgfT9sqNjNx9H4xmvkqe2DAUNuErFxvhE
 6hUJN32DxxZSKRuFOZZMTygV7fvH7+Z3xHHRqeNIbtolo34a2o7RtvfOz
 fA3k/Gl4MTfzeMuXrPXgEuLmb1o8Ly8m7vVhUMJDHYUmmVwvI7+Ln+TQ1
 K+r8AD5lbK+hvYN8kV68YR8Awaq4YNKre6b5d0jtn14mChbBfKAzsl9U0
 eLQglaFxNcZgEBFAc/7KO0rZ3tpAQ5qcv6XK+Jp15sZCfifUGbet5OwcC
 ZqHoSiwIKXCc16sTVkYu80pO6Z5P+CCZzVNYr/u3ucAHyQpCeYPd80onS w==;
X-CSE-ConnectionGUID: WGAiQy2XRLmuLu7b5CMAfw==
X-CSE-MsgGUID: Rl1UDZ5QQ76ygj2sDnL8zg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692272"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692272"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:48:08 -0700
X-CSE-ConnectionGUID: 3HIvDpP3RcuQpKGwaZsrrg==
X-CSE-MsgGUID: ftwHna+yTbeaecrQaIAvAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940847"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 24 May 2024 01:48:06 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] Update kms_plane test
Date: Fri, 24 May 2024 14:18:05 +0530
Message-Id: <20240524084807.480971-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

First patch reduces the CI loggings.
Second patch converts the test structure to execute on multiple planes
on dynamic level.

Pranay Samala (2):
  tests/kms_plane: Reduce CI logging
  tests/kms_plane: Convert to dynamic subtests

 tests/kms_plane.c | 72 +++++++++++++++++++++++++++--------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

-- 
2.34.1

