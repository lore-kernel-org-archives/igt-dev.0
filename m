Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1688BC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4F210F529;
	Fri, 12 Apr 2024 09:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATHSqt/O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F0110F521
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913107; x=1744449107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rxxF0GKnuMADct4d9XE14T6H/V/Q3mE13oPVn++nDp8=;
 b=ATHSqt/ONqPhW/Kxmhk0dZx57CJRZ/esb083NuI2+n//9rQsUlAcJt3C
 uTa6EqMM5ykv3x3yxc3QynVqlt2Q8K9OWvhUHrFCgngsLB6jgNa3gbu8A
 /OhD5a20SgskwziIkr0HmaC5vRbz0E+PXMCRDealCbX38ieAO1/Gh+nqG
 dnt+rg6AsT5QEQbeDUSydPVbvqp4gbsLgUMpPejFwYiRRtUHJx2DSxWhh
 RAUh5MicAKf+45u7SdcFAGzkbaDgrSFbbdAa1NKf0Zqss3xpMksudc5zN
 ivE5AKrJvcOZChNzWx2R5HhL45xmR9tUdT9f1pYfki8Q9Tbe+WrFPJTOm Q==;
X-CSE-ConnectionGUID: hC2e3EpwRGqu98Fo50XhbA==
X-CSE-MsgGUID: 4X8dO/cURX6ri5hywCwzoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30842830"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="30842830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:46 -0700
X-CSE-ConnectionGUID: pVyoUl/YQvC56HwHWz5dXQ==
X-CSE-MsgGUID: K91yfY0sR6Kv0X3Og3jxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25625069"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 0/4] Tes update for atomics related uAPI changes
Date: Fri, 12 Apr 2024 10:57:36 +0200
Message-ID: <20240412085744.21196-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Update tests as per newly added uAPIs.
https://patchwork.freedesktop.org/series/132290/

Nirmoy Das (4):
  drm-uapi/xe: Add device atomics vm bind flags
  drm-uapi/xe: Add query flag for dev atomics on SMEM
  tests/intel/xe_exec_atomic: Use new vm bind flag
  test/intel/xe_query: Print DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM

 include/drm-uapi/xe_drm.h    | 20 ++++++++++++++++----
 tests/intel/xe_exec_atomic.c | 10 ++++++----
 tests/intel/xe_query.c       |  2 ++
 3 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.42.0

