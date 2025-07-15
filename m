Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEC3C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 22:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79D910E247;
	Tue, 15 Jul 2025 22:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9SsMy9w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3BE10E247
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 22:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752617281; x=1784153281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q9uvVUundDChYoTlxxjA2hVpjjHWl0jAacm49AZpEXM=;
 b=g9SsMy9wrcTVtQCuqpKeHnuTVnHyXLQjkxyjDHDlXDK0IQM/4dzM4zoe
 wBy38oOhfIDdm197Zwaljp4bV9LBeFfRisuAIhdpDsd9owVcTdvvIqf1o
 38K4HVy/kH45Hg4hWFOa2vEPjh/4KCPks4CHWKzcytxRdhKU+Pe465Klz
 3/P9XCOkY2ZXmduwwaZolbC60NwVwvc8ZGXVgZmGkgzLDNYxc/e1kmhwe
 0MfNWi1PB5Z5ZH2m6abESGYj0+2b3WiehXtW4yYDk23Kmr/v4cuuVDql5
 YHZAhntAc5LTlDaNeX05o0+EPn0suWX4fdzfXAzHX9SWORYCMc7t03xOc g==;
X-CSE-ConnectionGUID: XSum00PVRHuMfCDOpv0P+w==
X-CSE-MsgGUID: UYEvsz/vQZeBvL68uyGShA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58507227"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="58507227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:08:00 -0700
X-CSE-ConnectionGUID: riBs5lc5S/mnfc0iB6kuEg==
X-CSE-MsgGUID: G6MAeY7OQtqQvLBkJiGXEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="158060585"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 15:07:58 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Refactor pixel format test handling
Date: Wed, 16 Jul 2025 03:38:08 +0530
Message-ID: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
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

This patch restructures the scaler pixel format tests by splitting
them into separate subtests for each format type: RGB, planar,
and packed.

Naladala Ramanaidu (2):
  lib/igt_fb: Add helpers to identify planar and packed YUV formats
  tests/kms_plane_scaling: Simplify pixel format test flow

 lib/igt_fb.c              |  57 ++++++++++++++++++
 lib/igt_fb.h              |   2 +
 tests/kms_plane_scaling.c | 124 ++++++++++++++++++++++++++++----------
 3 files changed, 150 insertions(+), 33 deletions(-)

-- 
2.43.0

