Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BDCC0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 11:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3EB10EA55;
	Thu, 13 Feb 2025 11:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3M5EydK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B19410EA55
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739444630; x=1770980630;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AkjFgODuf+h7glrY+v2NGKN8o0GVmN5BDuXTnC/3W7Q=;
 b=S3M5EydKEWUf5DtFRJXHif8zIJSkCOZ8kDz/zdqL9olix1WahyhKQ2+u
 2tABZ6plNHULitsFB/Q1fnX4LGMkjPL3GlLn3XDFm6Rwc731FilEi7xcp
 fzXc9w47dHrqWYZI/QUZW6yUpdd/C5LUew3pQNbkxn98Q7NVCioMji3PN
 7TWIRzq2mK2smtm56EU1/UY9Uy45exaTTLJkHfVXwuEaTv0uzXiD4vGGw
 Ho/5pxPHesmosD+oWGMDcfIbXpmZ4DaoTuju6x6V+ALlGHoLPD+WNfkYw
 fgzMBgS2sbkhRjsN6FBIQqMdeFBaITo6exYCYvDlpf6oPHLdeXzWCzK36 w==;
X-CSE-ConnectionGUID: YiEbYLjiQryn1IIHX7qagg==
X-CSE-MsgGUID: 8Ipc6axzQGeIQrR1NIvD8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62609474"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62609474"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:49 -0800
X-CSE-ConnectionGUID: Czur/gduRmOh13FpxbWDFg==
X-CSE-MsgGUID: J3LkS1emSqCkccvUwDs8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113094039"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:47 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/5] tests/intel/kms_cdclk: Refactor mode setting and CD
 clock verification
Date: Thu, 13 Feb 2025 16:38:09 +0530
Message-Id: <20250213110814.351186-1-swati2.sharma@intel.com>
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

Based on the review comments received, add highres and lowres
functions to lib and made corresponding changes in the lib.
On top, broken initial patches into smaller patches to better
review.

Swati Sharma (5):
  lib/igt_kms: Add highres() and lowres() func
  tests/intel/kms_cdclk: Add conditions to filter valid outputs
  tests/intel/kms_cdclk: Introduce set_mode()
  lib/igt_kms: Add igt_get_max_cdclk()
  tests/intel/kms_cdclk: Use igt_get_max_cdclk()

 lib/igt_kms.c             |  83 +++++++++++++++++++
 lib/igt_kms.h             |   3 +
 tests/intel/kms_cdclk.c   | 166 +++++++++++++++++---------------------
 tests/intel/kms_dsc.c     |  14 +---
 tests/kms_display_modes.c |  14 +---
 5 files changed, 162 insertions(+), 118 deletions(-)

-- 
2.25.1

