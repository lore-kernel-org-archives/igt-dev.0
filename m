Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A191FD2CDF5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFEA10E1FE;
	Tue, 22 Oct 2024 15:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G31MgvU1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76710E1FE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612360; x=1761148360;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PckPfA4m2/wjSpFRcy5Fei6a58HsdVnKG2H5BQsEY5Y=;
 b=G31MgvU1ICqITDavw2fobPmTZ/5pZK2WdMPG475v+PTDFaeLwKXVAfim
 TZo+zvxHW7NVq4PmCiksIKWzqE0xD1dlWZTvL5okE+5rNekcZLkFLZ5NM
 XSrpD+bzq2e6OfyEKOx36gXM5LYQIcpEuxTf48Uczf+5aaS4RP+Q9MmYA
 p3ggar6spmHijeib6z9pavdoo3Ntbm6AQIlySyxTjYK7CrRa9cxFOh8to
 VSLfsvv48CQI1rb8q3s2kNPVDZW70e1MO3lJSNwp9YoaZWFyZVfGw0KQl
 vwJzfxPSa80goluimpeUv7jz4kXvQfVGj73U5tn8+r61DXCTd2ioJQ9U2 g==;
X-CSE-ConnectionGUID: uc39fFWQR4KBxzGosBpdJA==
X-CSE-MsgGUID: GE8k4EhrQmu/5bwnGAL5GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29268523"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29268523"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:40 -0700
X-CSE-ConnectionGUID: tkEXgp9XTLWdY1CqcgDovg==
X-CSE-MsgGUID: RWI6hAACSqmMVVQ4TtFJgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80248393"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:39 -0700
From: Imre Deak <imre.deak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 0/3] tests/i915/kms_flip_tiling: Fix timeouts with low
 vrefresh modes
Date: Tue, 22 Oct 2024 18:53:08 +0300
Message-ID: <20241022155311.2797257-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

This patchset fixes the following timeout failure, when using modes with
a low (<60Hz) vrefresh rate:

(kms_flip_tiling:3623) igt_kms-CRITICAL: Test assertion failure function kmstest_wait_for_pageflip, file ../../../usr/src/igt-gpu-tools/lib/igt_kms.c:2363:
(kms_flip_tiling:3623) igt_kms-CRITICAL: Failed assertion: !(ret == 0)
(kms_flip_tiling:3623) igt_kms-CRITICAL: Exceeded timeout (50ms) while waiting for a pageflip

Imre Deak (3):
  lib/igt_kms: Add igt_kms_frame_time_from_vrefresh()
  lib/igt_kms: Add kmstest_wait_for_pageflip_timeout()
  tests/i915/kms_flip_tiling: Fix pageflip timeout for low vrefresh
    modes

 lib/igt_kms.c                 | 33 +++++++++++++++++++++++++++----
 lib/igt_kms.h                 |  3 +++
 tests/intel/kms_flip_tiling.c | 14 ++++++++++++-
 tests/kms_vrr.c               | 37 ++++++++++++++++-------------------
 4 files changed, 62 insertions(+), 25 deletions(-)

-- 
2.44.2

