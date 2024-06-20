Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAEBC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 04:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F1910E1CB;
	Thu, 20 Jun 2024 04:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gc6sSfIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03F110E1CB
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 04:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718857512; x=1750393512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dEZz5VmwOjoWtgN6o9ux73gmBuWJrV0GqOcbDaED/Lo=;
 b=Gc6sSfIkGzbNwuLQXIrr9cidEYSCe7ltE/LHbLhuTy81fodDQMCltOWl
 mEm7A/NJ4W+c/1WlPiEl8bGhAu43SSLdS8tscXWh6EWSnxudkn04KhlDH
 ca607mz0+JapVj3m58IWBOMN/CL3Y9xggBl1Mp3X5UtrAuMXvZiKq85xu
 KPkfvb261U5QS59PEpsMd1R+qF79sZ2Ye8KpMMgzh6q6DeRGnSwGxc0eu
 TnQEAvyPMYzR0uN/tnqLSrO0dOr/LrAlZJ8i/rbsjezRkZSeB1j+t2JwL
 r0Cy1pYN1mbBpSu+wAcvmPPT4Df41yBXumlb0QW3IAhS5WtrH7EhMY707 Q==;
X-CSE-ConnectionGUID: ffgpJbZiRg2bXInb7UPhcg==
X-CSE-MsgGUID: OMpoMKzFSWuDNs03ic7l+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19692104"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="19692104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 21:25:11 -0700
X-CSE-ConnectionGUID: 9reAlzVDQzOr7YQzDvWuQg==
X-CSE-MsgGUID: Sz3YcFTmRCinsFYFH3iUoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="72850641"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 21:25:09 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] Early Transport Support
Date: Thu, 20 Jun 2024 10:03:39 +0530
Message-Id: <20240620043341.1438736-1-jeevan.b@intel.com>
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

Add early trasport helper and checks to validate early trasport support
on the supported display.

Jeevan B (2):
  lib/igt_psr: Added library functions for early trasport
  tests/intel/kms_psr2_sf: Add checks for early transport

 lib/igt_psr.c             | 14 ++++++++++++++
 lib/igt_psr.h             |  3 +++
 tests/intel/kms_psr2_sf.c | 18 +++++++++++++++++-
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.25.1

