Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E781D3C525
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1166B10E651;
	Wed, 10 Dec 2025 03:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBDrF5CK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AEB10E651
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337006; x=1796873006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dv+18eHWB5qV1D7cTysGYRhSPPKNhH+pA0zUkk3UShE=;
 b=FBDrF5CKJBykrnSZxjxelBHhS44LewvHfTxGN6CN+rGke1rr3yVs+/mo
 at4+E2AIqb/jC9FHSGaS2evTWhCsepwYBwGAk43+kkNmtebf2NON0W5SX
 5jC/h8Wn+fD0NVofRXI+/3PSEQoE2962to5J0/b/faEquoMpPGbps5TAK
 LKcz5d+NBTNuAUh9osXyQ1WpQTyu7MDL3X9TKvi2WNL5SB6AxJpD1fhPw
 cEpQnCahS6PdEhEtimwUQkqTnkEMeBcgbCvzBVkrislN32iUPs+qcafke
 664RW25I1G0VIuXn+cGO7JKCGbpq1E22TVtElanntI2f9MHWdntkT1cMA g==;
X-CSE-ConnectionGUID: D/pWfW7ARTSvGuZJCCy3RA==
X-CSE-MsgGUID: KMhgNeYfQxS6YAWnM9FW/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66481250"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="66481250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:26 -0800
X-CSE-ConnectionGUID: K72xLTRgSLewiQY7q0megA==
X-CSE-MsgGUID: rZiBKYs+RJ6gEoi6huiTOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200822722"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:25 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 0/4] Add wrappers for painting test patterns to
Date: Wed, 10 Dec 2025 08:53:45 +0530
Message-ID: <20251210032349.2781106-1-karthik.b.s@intel.com>
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

Several tests manually create a cairo context, optionally fill a
background color, paint the standard IGT test pattern, and then
destroy the context.

This series adds helper functions and replace the existing stand alone
calls in test binaries to avoid code duplication and improve readability.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (4):
  lib/igt_fb: Add wrappers for painting test patterns to framebuffers
  tests/intel/kms_mmap_write_crc: Use lib function to paint fb
  tests/kms_hdr: Use lib function to paint fb
  tests/amdgpu/amd_assr: Use lib function to paint fb

 lib/igt_fb.c                     | 38 ++++++++++++++++++++++++--------
 lib/igt_fb.h                     |  3 +++
 tests/amdgpu/amd_assr.c          |  5 +----
 tests/intel/kms_mmap_write_crc.c |  9 ++------
 tests/kms_hdr.c                  |  7 +-----
 5 files changed, 36 insertions(+), 26 deletions(-)

-- 
2.43.0

