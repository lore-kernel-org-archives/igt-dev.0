Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ACAF433E1
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 03:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052C110E172;
	Thu, 16 Apr 2026 03:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXR278MN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A28A10E172
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 03:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776311733; x=1807847733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=llcJOY4eXxBFUGGEw2yoJ/etO1+4+7s7cwJfH0IFtj0=;
 b=VXR278MN908DZfpNLzHPfwSA8+txZmFN+sMWwDJpxFOiZc189okUxA3K
 h0lGx4/zCvyN0Q6osKh7iUaUTRxRrkww/cciiKmktMRrJuiReOpnlzCeZ
 R2bgNmgFI48UK/8pr26W/PGHC7Wferg6nFTP04daQuACp+PAAaMr6+qu3
 uPihfnoqqHesa3G+1a6jO7fe3bvMY0spcP9j7A1j3yaSvENPCbJLuUnh1
 jQNmDlLUT4LMx0kXnq7i4PnxEv6e7shLEy7o01Hory8gi7n04A9UR9nW7
 8mXP5YdsPf6ra+Sq7c9n1TM++sY5uvANDbtPa6FXwDDmczlYD+aZ9wIA1 Q==;
X-CSE-ConnectionGUID: HIufyhHkTAmgR+PJ0gT/tA==
X-CSE-MsgGUID: Z8dhn593STmQdUUZegm1eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77002037"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77002037"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:55:32 -0700
X-CSE-ConnectionGUID: BdRaxIkUQHGDaqhxyxGfCQ==
X-CSE-MsgGUID: RBLw7xGEQLSsIQI5CD2pZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253867751"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 20:55:30 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3 0/4] Fix PSR handling for multi-eDP systems
Date: Thu, 16 Apr 2026 09:23:29 +0530
Message-ID: <20260416035333.69004-1-jeevan.b@intel.com>
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

PSR handling in a few tests currently relies on global checks by
passing NULL to PSR helper functions. This works on single eDP
systems, but breaks on platforms with multiple eDP panels where PSR
capability can differ per output.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Jeevan B (4):
  tests/intel/kms_fbc_dirty_rect: Use per-output PSR check before
    disabling
  tests/kms_vrr: Avoid unnecessary PSR disable
  tests/intel/kms_psr_stress_test: Select PSR-capable output
  tests/intel/kms_pm_dc: Scope PSR handling to output

 tests/intel/kms_fbc_dirty_rect.c  | 14 +++++++++-----
 tests/intel/kms_pm_dc.c           | 28 ++++++++++++++++------------
 tests/intel/kms_psr_stress_test.c | 14 +++++++-------
 tests/kms_vrr.c                   |  7 ++++---
 4 files changed, 36 insertions(+), 27 deletions(-)

-- 
2.43.0

