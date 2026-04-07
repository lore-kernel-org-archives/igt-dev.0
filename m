Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAECEDB7E8
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 09:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CC589C5E;
	Tue,  7 Apr 2026 09:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd172NCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB36210E3B1
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555952; x=1807091952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IcnSd/umlJcxZw+MANvNWEdSkqfVcPfYEeXfW4svn3E=;
 b=Yd172NCD46G4pbeVNoq+VppK7MRhmIOlU113OCJoOwa9FDEpUIMeohDt
 F0omAb64XOg6aNfccpPU7+vjRt1kT4xXlESGZAz8zHe3YQ8Vhg+81VNjv
 u5JxErpLaNCHnx40JH8xkmJ9NM/G2OasNaWiw+s56xFW0gb9zNIfc/iVg
 qoGGVGGG82zMZdCpryxQCtf20Aira9Kzs3CIAiszuA5iAl6c40RtRd89G
 QehPDod0NfPd/bFhG5YkSiRdh2hdNjR5DDgmP/WKScDW4sYaX1TXQHL14
 tAgTa0WS7fmURMDjGNLJ1hGRTud6ha5n2G7MoykS0x/skxUJbPTfzYRKx g==;
X-CSE-ConnectionGUID: NOqD4GelTeikBbhPjCNNgQ==
X-CSE-MsgGUID: /W9gPz6qSt2oki2GCcXVBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87589066"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87589066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:12 -0700
X-CSE-ConnectionGUID: 2QzcjtKpTJyrLbq/UNq6LQ==
X-CSE-MsgGUID: AbOr6NCaQwaQ6L8FC8ANAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228400063"
Received: from abityuts-desk.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:59:09 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH i-g-t v2 0/8] updates to fbc tests
Date: Tue,  7 Apr 2026 12:58:35 +0300
Message-ID: <20260407095843.43679-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Some of the fbc status texts are outdated, fix those.
FBC cannot be enabled if the plane size is too big. Such cases
to be treated as skips instead of failures.
And some cleanups where we query the current fbc status from
the debugfs.

v2: a common function to check fbc skip reasons
    avoid multiple fbc status read for skip reasons
    removed the dirty rect patch from this series

Vinod Govindapillai (8):
  tests/intel/kms_frontbuffer_tracking: update the outdated fbc status
    checks
  tests/intel/kms_frontbuffer_tracking: avoid multiple fbc status
    queries
  lib/i915/fbc: extract intel_fbc_get_fbc_status()
  tests/intel/kms_frontbuffer_tracking: use intel_fbc_get_fbc_status()
  tests/intel/kms_frontbuffer_tracking: use a bigger fbc status buffer
  tests/intel/kms_fbcon_fbt: use a bigger fbc status buffer
  tests/intel/kms_fbcon_fbt: update the outdated fbc skip reasons
  tests/intel/kms_fbcon_fbt: use a common source for checking fbc tests
    skips

 lib/i915/intel_fbc.c                   | 37 ++++++++++------
 lib/i915/intel_fbc.h                   | 18 ++++++++
 tests/intel/kms_fbcon_fbt.c            | 27 +++---------
 tests/intel/kms_frontbuffer_tracking.c | 59 ++++++++++----------------
 4 files changed, 72 insertions(+), 69 deletions(-)

-- 
2.43.0

