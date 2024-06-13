Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A030C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D1810E9C2;
	Thu, 13 Jun 2024 09:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWDjdCYf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88B510E242
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270759; x=1749806759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NGZ1dNaP+FcIbDV9+/GyMC5a3Qm1RvJiKYfwpd441wE=;
 b=EWDjdCYfVTK8RGZ4wujN8GcFEPtIJj5RzOphrbqYxGmNo/+LdntIYLrs
 ST4rFdL8fR7al5aZ6Zvhlq6COgcqsNCJEhbdrt4JY7AnSV1BJOp1SVZ1U
 xSFhxQzvJ/MFOuK+KFR1ztTZmRc6VJK4jvGyboWx1I6hCpmNEsakM3m1w
 A3J2XE0VpHfejyxoQlbTJ0R4f+gOVL8E6Zh4eSXZ5LoLuAHPJ0TCXIuwy
 WfUfaKZpC+UAme0jO0FIPdbMvl9GEG3oJKF7i4zrT7Lndvp3ZDjxGoEBl
 BX9OoZ9e+ttFoIz2CHmtsRUvLCVA6AOCEJ2ZfVwkBgDx+YHY2OZUi06xp w==;
X-CSE-ConnectionGUID: lfmPSU+MTiezBqRoMDPb6Q==
X-CSE-MsgGUID: zbUmXY1YRuikp3NYso0nRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18004692"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18004692"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:58 -0700
X-CSE-ConnectionGUID: 9rEh3/gBRxWK6eyPPXRX/Q==
X-CSE-MsgGUID: 9DPXHf8zQmiajH46uK7l/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40045395"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:27 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 0/6] Panel Replay eDP changes
Date: Thu, 13 Jun 2024 12:25:08 +0300
Message-Id: <20240613092514.1288801-1-jouni.hogander@intel.com>
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

This patch set modifies igt testcases using PSR/Panel Replay to work
on setups having eDP panel supporting Panel Replay. Following
testcases are tested being working:

kms_frontbuffer_tracking
kms_psr2_sf
kms_pm_dc
kms_psr_stress_test
kms_psr

It is tested using current drm-tip without any patches and with
patches from following patch set applied:

https://patchwork.freedesktop.org/series/133684/

v2:
  - Fix PR_MODE sink support check
  - Set stored mode instead of PSR_MODE_2_SEL_FETCH

Jouni Högander (6):
  lib/igt_psr: Set Panel Replay disable bit for PSR modes
  lib/igt_psr: Psr status debugfs interface print "enabled" not
    "Enabled"
  lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active
    check
  tests/intel/kms_psr_stress_test: Provide output to psr_wait_entry
  tests/kms_psr2_sf: Use stored psr mode instead of 
    PSR_MODE_2_SEL_FETCH
  lib/igt_psr: Fix PR_MODE sink support check

 lib/igt_psr.c                     | 56 +++++++++++++++++++++----------
 tests/intel/kms_psr2_sf.c         |  9 +++--
 tests/intel/kms_psr_stress_test.c |  2 +-
 3 files changed, 44 insertions(+), 23 deletions(-)

-- 
2.34.1

