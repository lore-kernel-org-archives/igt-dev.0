Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB83FF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 10:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9C310EF27;
	Wed, 29 Apr 2026 10:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBniWLkI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2748B10EF27
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 10:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777456804; x=1808992804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N+JGv7O/jjDseJ8SC8yUihLKj+eS9PVscAeuqVP6Ds4=;
 b=FBniWLkIxV9kaBWiONPfxmh2l+XUGEv15zMldfOKRhZSgNzJIDmjWOiN
 QBaveILsQFHaoBkL524mIokAzu/UgkVGIb+VKbgC7HIxGqtclAo4kXP1Y
 SDDObbPyvPs6+J9wBFtYifH3tJJVBsBHHqpCQbHWi723B3iEKiwiCRWOB
 44nY/gRe1zC17S2qxdWaFPB+8IiF5sGCfRySnosIgJRH+U3x2DvCD8Iaz
 eWiQ+QmjFviYdswXv66bs7ljQYeumIDXZ//i663PwybzlAAXVvjutA3qy
 nIBDVyHE5uP62c8IwclzhR+RyOFUNp+fcOZLmSw//NN6pTIBuOGRkg2WX w==;
X-CSE-ConnectionGUID: CnfI/tfHQOmqynWMmhlMjQ==
X-CSE-MsgGUID: wNkapcgFRnOYLNtd6drGSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="82237141"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="82237141"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:00:03 -0700
X-CSE-ConnectionGUID: iUgtPnI2Sgmk3D3W1hyQDw==
X-CSE-MsgGUID: stcMgpPtSTG4CqNQtLGj4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="231572336"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 03:00:02 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 0/2] Fix 2-display test for MST shared-link BW
Date: Wed, 29 Apr 2026 15:51:23 +0530
Message-ID: <20260429102125.2313449-1-sowmiya.s@intel.com>
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

On MST hubs / daisy-chain setups two display streams
share one DP link; a joint atomic commit can be rejected
by the driver if the combined mode bandwidth exceeds the
link capacity. The driver therefore adjusts per-pipe
settings (for example reducing pipe bpp and enabling
dithering) when both streams are committed together,
so tests must pick a mode combination the driver will accept.

Sowmiya S (2):
  lib/igt_kms: Add MST bandwidth-fitting support and helpers
  tests/kms_plane_multiple: Fix 2-display test for MST shared-link BW

 lib/igt_kms.c              | 37 +++++++++++++++++
 lib/igt_kms.h              |  2 +
 tests/kms_plane_multiple.c | 85 +++++++++++++++++++++++++++++++-------
 3 files changed, 110 insertions(+), 14 deletions(-)

-- 
2.48.1

