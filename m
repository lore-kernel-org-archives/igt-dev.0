Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0033BCA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 16:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADF810E18B;
	Mon,  8 Sep 2025 16:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFkaU3ul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4049110E18B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757347654; x=1788883654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sg/DphMDLgXEmKMZ/QIFTPQ6xccarve2YqusXMJhHlk=;
 b=GFkaU3ulzNbBEr4FnJj6mrKkReBnczIN6WjY/bOhSiZDN3tPgZ0pgjan
 bjzbM2Kv1WwIP0DihaggkEv0p3gfo2n4Fd6MuUBLF4UKadpxKa4SDQkcE
 DCeq5QvdvvQFGKdyekIbUoLNH6enekHhnFOiUCOTQgvwV4pFcNEGvSjWc
 zARKiFH8lHOVylXRaLKPzbLTEqTDy9clLfeMWBg/LhZ2SL3Mua4BfPHcC
 ta88tKI8p3DzXs8e13Ay09fyMCb5UN6CbufoI16QvuYG77wXvsLdMBWo0
 KDakHwCQgkbnjb/cfwDZx6Q94bwO1Zr72QAx/9DbX3uhpSGnrmXW0W+QR A==;
X-CSE-ConnectionGUID: BkU2SxHcQ7Wh9V2nVbtUaw==
X-CSE-MsgGUID: X7phgpKTQ82IJF1XtGpSJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59718398"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59718398"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:07:34 -0700
X-CSE-ConnectionGUID: EsA7jiOMQ7CUZuc/WzYTMw==
X-CSE-MsgGUID: YLW41LOyRVSAkFUvlMbcqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173284527"
Received: from unknown (HELO localhost) ([172.28.180.168])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 09:07:32 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 0/2] Don’t assume sequential GT IDs
Date: Mon,  8 Sep 2025 18:07:21 +0200
Message-Id: <20250908160723.1723178-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Patch 1 fixes xe_gt_type() to use drm_xe_get_gt() with gt_mask checks
instead of direct gt_list indexing.

Patch 2 updates xe_sriov_flr tests to use xe_for_each_gt(), avoiding
assumptions about sequential GT numbering.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Marcin Bernatowicz (2):
  lib/xe/xe_query: Don’t assume sequential GT IDs in xe_gt_type()
  tests/intel/xe_sriov_flr: Use xe_for_each_gt() for GT iteration

 lib/xe/xe_query.c          | 9 ++++++---
 tests/intel/xe_sriov_flr.c | 7 ++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.31.1

