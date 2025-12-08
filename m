Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68919D3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 18:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7ABC10E054;
	Mon,  8 Dec 2025 18:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUppOZrt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF14F10E054
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765220265; x=1796756265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=60N4Lt2/w2aBWjIQG+newZzQNbxyjhhrB/3XEVIf6ks=;
 b=hUppOZrtnqccNzi3D0zppr+aLpvyJHm613Ld4iXz1Yn3iz6Iamba69mL
 D+ptQvlukO3+5ktRjVT/ntTIWtvGrNA5PNq6Mq3ANFQJFnPsLtHaK1QkV
 at5F7wLHZQidcxn56j648V3YtkrXCJQkvo7GgMGrBbtVjNUgqreXH1J3J
 92HqxnlrtMoUdONA75NKs7Qb4jR/Gvme8ZLobFbdBH5G0O+OQNuNjOsnq
 rFNYEbs+jszSCzvstMDRStILy/kEk2PkNpzIjzNICDdID1TNMTFUXRBgL
 qXE2eesxFPONcq3IIo7aBp73DvtuW6o7BIN6F/KZCNRn/EDYGRnt8mIzB Q==;
X-CSE-ConnectionGUID: blpzLfyTR1+XxvxzRjAeDw==
X-CSE-MsgGUID: mDzjtrIYRFOSv2Oa5FP4Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67219733"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67219733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:45 -0800
X-CSE-ConnectionGUID: Xg9/fhFfTmCG2iA5aqabLw==
X-CSE-MsgGUID: YBmgauhcTaWotQaISvBjsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="233384667"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:44 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t v3 0/5] OA: Run MMIO trigger tests on all OA units
Date: Mon,  8 Dec 2025 10:57:32 -0800
Message-ID: <20251208185737.966218-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

v2: Same as v1 except that Patch 1 now has a real kernel commit

v3:
- Because MERT OA unit support is now merged into the kernel, I have
  added Patch 5 to add support for MERT OA also to IGT.
- Patch 1 has been updated to also pull in DRM_XE_OA_UNIT_TYPE_MERT
  definition. I have retained Umesh's R-b on the patch.
- Patches 2-4 are same as before and have Umesh's R-b.

Ashutosh Dixit (5):
  drm-uapi/xe: Sync with DRM_XE_OA_UNIT_TYPE_MERT definition
  tests/intel/xe_oa: Return hwe from same gt from oa_unit_engine()
  tests/intel/xe_oa: Run mmio-trigger tests on all OA units
  tests/intel/xe_oa: Use separate oa unit variables for caps and
    iterator
  tests/intel/xe_oa: Add MERT OA unit

 include/drm-uapi/xe_drm.h |  58 ++++++++++++++-
 tests/intel/xe_oa.c       | 153 ++++++++++++++++++++++++++++++++------
 2 files changed, 183 insertions(+), 28 deletions(-)

-- 
2.48.1

