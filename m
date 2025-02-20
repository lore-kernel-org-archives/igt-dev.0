Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EE9C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 19:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2233F10E07E;
	Thu, 20 Feb 2025 19:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9FDwOoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532410E07E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 19:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740078097; x=1771614097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3bbdk384f78jXOq8eWYg/OE+sKWXL1ERqECm+zEP5JM=;
 b=J9FDwOoj4r48zS30h5bxM/5yZqjHjPMO8wG8LI2CAcZRvXvnGgDZF3g/
 V99j6cdqgccUfvwtrj9r2PPAs8tz8mjhrR8NEKY3SIxHbI76vt/09a5Tw
 rrCTkB0/wgqa8v4IQAaE+j30zfkMSpA1AXJ5OBwiljxR1w8T0ouUIziOl
 XpO/YyIpgaNHyGL2J5/hKHX92eYWVPXj2GsbQX1KcukFEDk1ix2T1rhUP
 CFcYff3+gjBrGU6/FE8AOP57jWyHDguRaPVZ5fjkgt8SQF1vZR9seRUFf
 crmJr63Bln01kYmnOtj5WRGE+EGdgMwDMU8hazxFijXVU7TF0cLMp7in2 g==;
X-CSE-ConnectionGUID: 7gwLYUWPQESbRNbgNLctHA==
X-CSE-MsgGUID: hRTVgOMfRLCYgXJaUAGYOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="63352776"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="63352776"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 11:01:37 -0800
X-CSE-ConnectionGUID: 0jTLoiyPSSOIAhT4x8AY7g==
X-CSE-MsgGUID: Wd+dps8ATDmQ/ESvGBFm4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115113592"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 11:01:34 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 juha-pekka.heikkila@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v10 0/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Fri, 21 Feb 2025 00:28:02 +0530
Message-Id: <20250220185803.1995791-1-santhosh.reddy.guddati@intel.com>
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

This feature allows FBC to recompress a subsection of a frame.
When the Dirty Rectangle Enable bit is set in the FBC_DIRTY_CTL register,
and there is a sync flip indication, display will read the scanlines
between (and including) the Dirty Rectangle Start Line and End Line,
in FBC_DIRTY_RECTANGLE, from the uncompressed frame buffer.

Utilise the FP_DAMAGE_CLIPS property in the below subtests to validate
the feature.

1.Implement basic tests for Frame Buffer Compression (FBC) with dirty rectangles.
2.Add tests for dirty rectangles outside the visible region.
3.Include tests for dirtyfb functionality.
4.Support different formats in FBC dirty rectangle tests.
5.Ensure proper CRC validation for each test case.

Santhosh Reddy Guddati (1):
  tests/intel/kms_dirty_fbc: Add tests to validate FBC dirty rectangle
    feature

 tests/intel/kms_fbc_dirty_rect.c | 559 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 560 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1

