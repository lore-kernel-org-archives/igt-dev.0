Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B54D58D61
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DE310E69C;
	Mon, 25 Nov 2024 16:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGrhRJkP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3805A10E6A1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732550860; x=1764086860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yY2MjfxljAHImdyfJp0FiiS+s2n9AruQ/eToqESsHPY=;
 b=iGrhRJkP4QwkBw2wk5mchiFuvutAUm8YfODcs9AuDnk6J38hOckHcayP
 0FWjynQ5MPaLKZOVg8k9cNAjDl1wBI2XZE1RnP/CN2Vnpewt6TdNNsw3N
 gR10hCv+fQH2pcfasKQCL/WWIx/eX5pNas+sig6WMLsaalZQk50HDh99J
 PutJN/3aIRilb+PneqXPvOHvG7VHXTHySW5MeJkyhjs/30dZrXF08wW7s
 D/9MB3MFccJVRNwQjppnxFB4jELmJpYxX4C41GVP0FtmiExMEJWBLHXB+
 zMUmIOdpYGGgqsYJOWttBd2xZtfpDh+COCnNTqea6FapRApS/OzopbaEX g==;
X-CSE-ConnectionGUID: SlUZo5FWSaeKtpaFH7gleA==
X-CSE-MsgGUID: c4WYT42LTv+FsGJnYLXD/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32040183"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32040183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:07:40 -0800
X-CSE-ConnectionGUID: XRgeReR+RQCT8VRtgl12Rw==
X-CSE-MsgGUID: fEF/V8IHTaCEecT5zDqm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="95407842"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:07:38 -0800
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,0/2] tests/i915/pm_rc6_residency: Replace waitboost with 
Date: Mon, 25 Nov 2024 21:28:55 +0530
Message-Id: <20241125155857.2561292-1-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sk Anirban <sk.anirban@intel.com>

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>


Sk Anirban (2):
  tests/i915/pm_rc6_residency: Replace waitboost with spinner and use
    sysfs to reach peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |  1 +
 tests/intel/i915_pm_rc6_residency.c   | 98 ++++++++++++++++++---------
 2 files changed, 67 insertions(+), 32 deletions(-)

-- 
2.34.1

