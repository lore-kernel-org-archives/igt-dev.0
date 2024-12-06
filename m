Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBDEE7717D
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4502010F1CF;
	Fri,  6 Dec 2024 21:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJvK50T3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66A410F1CF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520603; x=1765056603;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EBMnHyq0gPkH2awOyo+1qFvxaWuIxsR9w50SJLr/uRE=;
 b=NJvK50T3N2Pkqjei44K8/lj576JphixgG/Vu1fSwJR1dWo2yVifmMEqN
 rsJyi1mPDktCaqc/20iLxyr8h22md+F9rznSG1Dhf5iKvN9S8NWgTy8A6
 8Mqy+GOHPcMW6CfGBLBF3CcfK/Jz5Qep3MEe0XaarlrAa9bNDHT7Rla8s
 P1PqaSMjtbzRbAZlbyIuVep2vqNxzg9udDgGP3mKA/VjuXtk5spoObZrm
 TjofcEyHrdfs2piVigXKBzaVfJhwQgxOhTsOdWeNXO07CnJwCMWZXTqLX
 MN9XFVfOkmPnYfloPdx/2mOXlQIQxxHLFeVJ4yAbNSb7DsiROrC+8Ouo9 A==;
X-CSE-ConnectionGUID: /Q5QJWwAT+WK9e6/m2pAAQ==
X-CSE-MsgGUID: Ze2gWeCzTX6n4CGuOJ27Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304467"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304467"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
X-CSE-ConnectionGUID: pHdObAxBT3+Z3FeYDHAywQ==
X-CSE-MsgGUID: 0GsooqNoSS+1Uhe/Nctm3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306721"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 0/8] Initial PTL support
Date: Fri,  6 Dec 2024 13:27:40 -0800
Message-Id: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
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

Initial set of patches to enable testing Pantherlake.

Heikkila, Juha-pekka (4):
  XE3: tests/kms_addfb_basic: fix x-tiled tests for case when there is
    no x-tile
  XE3: tests/intel/kms_draw_crc: fix x-tiled tests for case when there
    is no x-tile
  XE3: tests/kms_cursor_legacy: flip_vs_cursor_busy_crc was requiring
    any driver but used intel x-tile
  XE3: tests/intel/kms_frontbuffer_tracking: fix x-tiled tests for case
    when there is no x-tile

Matt Atwood (1):
  PTL: lib/intel_chipset: add pantherlake definition and support

Matthew Auld (2):
  XE3: lib/intel_pat: extend for xe3
  XE3: tests/intel/xe_pat: extend for xe3

Vinod Govindapillai (1):
  XE3: tests/intel/kms_frontbuffer_tracking: platform based handling of
    x-tile cases

 lib/intel_chipset.h                    |  2 ++
 lib/intel_device_info.c                | 13 +++++++++++++
 lib/intel_pat.c                        |  3 ++-
 tests/intel/kms_draw_crc.c             |  6 ++++--
 tests/intel/kms_frontbuffer_tracking.c | 20 ++++++++++++++++----
 tests/intel/xe_pat.c                   |  4 ++--
 tests/kms_addfb_basic.c                | 22 ++++++++++++----------
 tests/kms_cursor_legacy.c              |  2 +-
 8 files changed, 52 insertions(+), 20 deletions(-)

-- 
2.25.1

