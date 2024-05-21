Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9604BC25B7A
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE8210E563;
	Tue, 21 May 2024 09:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dyH2adl4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC7D10E563
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282182; x=1747818182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LO/+yOzgjAjB3CgRJlT1Td7gmX4xpksR3Bo3lllDIa0=;
 b=dyH2adl4sbL4Qw3kePZ1m76sUF0t089P0Pu0w24Qb8/NkfoCqH0H9rF3
 OLzjdtFstUXJJpQTTKJyARuHur+5SV4Wbuyw099pR4ON45OCq0jXwpefu
 YPKUIWFnJeFTFWVLCC2pfVG4JMVD1BmaFVKb64iE/gXlkW/f5X5ScWgku
 OyKDbUPbqIzEqRE2f/y80fR3gc9NHR18/b1xLZqePASYyWITbjvkV+1d7
 1ujhwwvarxPNtmN6If80jyO5sR6wWpCIHVIkBGR4fyfVN0t/s4llj2hN0
 Phj+d/iGkVP9eICBw+7Z7BlvnS09U2k8kS8rOLBUVVVcMYTDY3QrM9dF1 A==;
X-CSE-ConnectionGUID: q1bawwwoTEa7/xlgeSoSEQ==
X-CSE-MsgGUID: /en7gCH4Q+mKV8vufeWjOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12327347"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12327347"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:50 -0700
X-CSE-ConnectionGUID: mThDJISyQNqGZFLeg3qc6g==
X-CSE-MsgGUID: rznu4KqYQsuazZ/tLeaIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37804157"
Received: from mathiasj-mobl.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.157])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:45 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 0/4] Panel Replay eDP changes
Date: Tue, 21 May 2024 12:02:29 +0300
Message-Id: <20240521090233.1998323-1-jouni.hogander@intel.com>
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
patches from following patch sets applied:

https://patchwork.freedesktop.org/series/133648/
https://patchwork.freedesktop.org/series/133684/

Jouni Högander (4):
  lib/igt_psr: Set Panel Replay disable bit for PSR modes
  lib/igt_psr: Psr status debugfs interface print "enabled" not
    "Enabled"
  lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active
    check
  tests/intel/kms_psr_stress_test: Provide output to psr_wait_entry

 lib/igt_psr.c                     | 54 ++++++++++++++++++++++---------
 tests/intel/kms_psr_stress_test.c |  2 +-
 2 files changed, 39 insertions(+), 17 deletions(-)

-- 
2.34.1

