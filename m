Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B30C2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C43B10E582;
	Tue, 18 Jun 2024 06:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJ3b3tyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFDE10E570
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692323; x=1750228323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iOSPpt0qQxIuQut9D34duLIfBAuKQDu0tkg/eS57jB0=;
 b=TJ3b3tyx1BortFwVenWdMGFWeKbJFElXKVQ8w4wlv+jtbuqLKvFyu1Kg
 GjaLLEn0vvQdRM84PDHDcFo3IdqbAe2Xduai7lxvy3Bhenh+YkfoggnZl
 lo4/rHoz4b6hTUxGo854YOyoPJMrrj9rekN94JViT22x5xhFEkLkgaun3
 3Ixg+1ZGH6XqPayMBnuq2SlHKLevu9CWHforG6RK6JkzZW33cJIbHyTxv
 ZiQjF9NAnWqwvx2qFaflvXGqrJqTeLzqWzsg/vRCUPg7Va1y88MH4nkel
 W4PXxUZEhXJpvJrCxShmkCQ1f6E3OpgxNIrIEZjQjt/Wz0btsVO+TQks8 g==;
X-CSE-ConnectionGUID: SGZl8OExQACVTKmsRoBd5g==
X-CSE-MsgGUID: 0epgUdpqStWREJvVkYYAlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26960436"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26960436"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:03 -0700
X-CSE-ConnectionGUID: /LqueLblT5S51k+5Xz5h8Q==
X-CSE-MsgGUID: 5rqBh3EdSkSeyuvd/LmP6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41304940"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:01 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V6 0/6] Check the validity of selected pipe/output combo
Date: Tue, 18 Jun 2024 11:53:59 +0530
Message-ID: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Use IGT lib helper to make sure the selected pipe/output/mode combo is valid.

Bhanuprakash Modem (6):
  lib/igt_kms: Check validity of the selcted pipe/output combo
  tests/kms: Drop redundant check for pipe/output combo validity
  tests/chamelium: Use lib helper to check the pipe/output combo
    validity
  tests/intel/kms: Use lib helper to check the pipe/output combo
    validity
  tests/kms_dither: Use lib helper to check the pipe/output combo
    validity
  tests/kms_hdr: Use lib helper to check the pipe/output combo validity

 lib/igt_kms.c                          |  9 ++-
 tests/chamelium/kms_chamelium_helper.c | 12 +++-
 tests/chamelium/kms_chamelium_hpd.c    |  5 +-
 tests/intel/kms_pm_backlight.c         |  7 +-
 tests/intel/kms_psr.c                  | 17 +++--
 tests/kms_content_protection.c         |  3 -
 tests/kms_dither.c                     | 24 ++++---
 tests/kms_hdr.c                        | 90 +++++++++++++++-----------
 tests/kms_properties.c                 |  3 -
 tests/kms_vrr.c                        | 22 +++----
 10 files changed, 108 insertions(+), 84 deletions(-)

-- 
2.43.2

