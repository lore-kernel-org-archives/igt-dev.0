Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7000AC2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 05:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF54610E103;
	Mon,  1 Jul 2024 05:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPlHVinm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B2410E103
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719810870; x=1751346870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1Re4Hy9GZ3CZbSCiLnjQ1uMvreRzftZoxdCColzvhA=;
 b=LPlHVinm3Nm13cKe9fXIItLd0nXSFPAWKx0RBqAODsfTvB/OoyZh4ocm
 Wvt+rF8AVzrbIFtVNEdDbOWxUCrpLFPYxKDH0+InOdaGt2VqhogzzCj/M
 xS6KJYbPsnAI/eT3Crfto4rd2RyVMdcHIZsrSvTkISghZj2f/3lioJ0of
 fB0s+ltQnvqkXd5sdlqKgRmP9CafPcAj6WTKsXGxGeDFPmIhZqiEQzCtV
 4f9l4PWep52gy7xjkJ1vUtPRStj3ZBYiJdNSCB/eHwwamaO6S8hluuytU
 ngVDybDTUC4ojuLAH5ORqrq+K2MCBZrODoT46ET8GcCaTrNi+Eibs1jqj w==;
X-CSE-ConnectionGUID: Ug/xSTkuT0CCZMENagQaDA==
X-CSE-MsgGUID: nqJwbmbSQ/S0vsSvTef4aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="17046089"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="17046089"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 22:14:30 -0700
X-CSE-ConnectionGUID: J7vMzAKtQHeAFwBTRkgBQw==
X-CSE-MsgGUID: w0pgiQTkRMqtgbT1HGIHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="46129552"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.15])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 22:14:28 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 0/3] PSR testing improvement by checking sink status
Date: Mon,  1 Jul 2024 08:12:58 +0300
Message-Id: <20240701051301.3344927-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently we are not checking panel status in our PSR testcases. This
might lead to situation where panel is not even aware of PSR being
used. Also possible errors detected by a sink are ignored by our
testcase. This patch set is trying to address this.

Jouni Högander (3):
  lib/igt_psr: Add mechanism to check sink status as well
  tests/intel/kms_psr*: Add psr_sink_error_check to PSR tests
  tests/intel/kms_dirtyfb: Check features after rendering

 lib/igt_psr.c                          | 52 +++++++++++++++++++++++++-
 lib/igt_psr.h                          |  1 +
 tests/intel/kms_dirtyfb.c              | 33 +++++++++++++++-
 tests/intel/kms_frontbuffer_tracking.c |  5 ++-
 tests/intel/kms_pm_dc.c                |  2 +
 tests/intel/kms_psr.c                  |  2 +
 tests/intel/kms_psr2_sf.c              |  2 +
 tests/intel/kms_psr2_su.c              |  2 +
 tests/intel/kms_psr_stress_test.c      |  1 +
 9 files changed, 95 insertions(+), 5 deletions(-)

-- 
2.34.1

