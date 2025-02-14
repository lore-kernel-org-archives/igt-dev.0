Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B03AC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 09:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E663C10EC12;
	Fri, 14 Feb 2025 09:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HjK0s2v9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DDA10EC12
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739524484; x=1771060484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nLB6I6oMsp9Th4ZcSiV8x/Wj8ON0fVD07h6MhsxIgMk=;
 b=HjK0s2v9qY6zIUlZg6pP26TAGjHGnOUnImbV+Yoda1fEopcDD2SHgKy5
 tUrx4YzuWJl3QnLNrxOkx3oGvEpBTtkPq0Lq3atkM2p3Tb3zRZxy1ybxs
 W5WaFNtHJblhKeryfFnKsqKBz/xzh6uCIVNUgg/BC0o2w/Msck0ABQl7d
 GRuRQeS2ixY8Jv6bzgo4oF1KQfPHNYvXUqfvn7xt4wKtKctiyh4oReYBO
 Alo6kfFycOd8u6YgrevXHPWZtAq901PSP/3oTFxXsrgddwlLS0Jak391z
 S6LmxXtDmXXJDogZApKXdDntf3r9a0iIRsyF20Ya7Z6QB7tM+xvJf6XYA Q==;
X-CSE-ConnectionGUID: b0XQlzXfS3O2aJZQ8KDiZw==
X-CSE-MsgGUID: KUetJBWqSkyZdN1IWg/oXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40412200"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40412200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:14:43 -0800
X-CSE-ConnectionGUID: 1MXreFfeSp6fcMgmfd5FLw==
X-CSE-MsgGUID: FxppwDJ5Qaat1toBdZJmhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113146479"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:14:40 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 0/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Fri, 14 Feb 2025 14:41:42 +0530
Message-Id: <20250214091143.1265210-1-santhosh.reddy.guddati@intel.com>
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

 tests/intel/kms_fbc_dirty_rect.c | 653 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 654 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1

