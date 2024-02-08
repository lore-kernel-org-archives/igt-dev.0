Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAB6C48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 14:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420210E62C;
	Thu,  8 Feb 2024 14:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hetAYLyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E1D10E62C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 14:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707403495; x=1738939495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wp66mHuM4oaCR0dm8dxezrFEbUtwnoUIa2+QCN9aQJw=;
 b=hetAYLynXJeKEWrVXYwSBKO+edP2+t5eCyotS6cl30ZXVbCPD1SiruAm
 VaO68L8Y7owzcNs0KmKpdXngjv5KFxrSeH6XXmWtY0O9q5WVoT37ffeMB
 Euz9kvXMlvUKuJfLdsaIT/ihyWhrS8a46irH/VVmkY6Wf4D8wAm/0zwp2
 hK8m92tR0Fwjc1UqAeAiBgoARuLhESkp8Yf08wf7+CfvxV6fmwvlK3AMI
 vMRIeCtIsnoGf0qxhvMlFTgfInt8IbxOJyFVTn4gjEIFgc21BUcf70Jud
 i1AQkHudDVf1UFdb2NlWwZS7kx4+7EsQ+sCN516Y9HEbDSexz+L7mm242 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="436365210"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="436365210"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:44:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="32736918"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:44:54 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] extend psr2_sf test for pr_sf
Date: Thu,  8 Feb 2024 20:24:23 +0530
Message-Id: <20240208145425.1940941-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

kmd series [1] adds supports for panel replay selective fetch,
modify lib and kms_psr2_sf to extend kms_psr2_sf tests to validate
panel replay selective fetch as well.

[1] https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3

Kunal Joshi (2):
  lib/igt_psr: add support for PR selective update
  tests/intel/kms_psr2_sf: extend tests for panel replay sf

 lib/igt_psr.c                          |  98 +++++++++-------
 lib/igt_psr.h                          |  14 +--
 tests/intel/kms_dirtyfb.c              |   4 +-
 tests/intel/kms_fbcon_fbt.c            |   4 +-
 tests/intel/kms_frontbuffer_tracking.c |   4 +-
 tests/intel/kms_pm_dc.c                |   6 +-
 tests/intel/kms_psr.c                  |   4 +-
 tests/intel/kms_psr2_sf.c              | 155 +++++++++++++++++++------
 tests/intel/kms_psr2_su.c              |   2 +-
 tests/intel/kms_psr_stress_test.c      |   4 +-
 tests/kms_async_flips.c                |   4 +-
 tests/kms_cursor_legacy.c              |   4 +-
 12 files changed, 204 insertions(+), 99 deletions(-)

-- 
2.25.1

