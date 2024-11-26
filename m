Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB4D3B9B7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 16:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DB210E91D;
	Tue, 26 Nov 2024 16:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn03d0NE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B4210E91D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637729; x=1764173729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FOGMBtvfukIYZX2D3vrv5vdn4NIqX+HeCDX9J97G6Qw=;
 b=Qn03d0NEiD6QuzCznMuvYpzMH9uo7xuVvtZPm/UmqaaKp/A78ARPxmJn
 cAsQ+J805rocu4pMPHLxSxrV2SgIioKoxoS9jM3EjnF/7xI1cTuFOkkCB
 kbEyl77JWub45DESdX86bVF5I46lYetCDdZfz6y0lq95GCjBRzkXb/vLC
 pWFCpGq1dg9xpZp0k5ySiF2H0pOyxWqwb6eHVvelAgm0I2nUCFB8xtiYJ
 Urf3gRKuna1TmCu3ZhbHpHUYuHVB/kUWy8NpQJvF6cou1aqj02oLkus7Q
 rBtMjAvAKBeTF8NKOnvPv+tMSX5xapvlFpo88tpIGQjYTGVx0jkO+zr9L w==;
X-CSE-ConnectionGUID: 5v0QSfSCTVOuuWz2285WAA==
X-CSE-MsgGUID: YUEavIG3QEW4eqYxUR344Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43468103"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="43468103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:29 -0800
X-CSE-ConnectionGUID: rSDxt9HDRGyPdOaFUXiwJQ==
X-CSE-MsgGUID: GvzjCeDxQKyt8szjpNd5CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="129179938"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:15:27 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/5] Skip test if joiner display is connected
Date: Tue, 26 Nov 2024 22:00:16 +0530
Message-Id: <20241126163021.458991-1-jeevan.b@intel.com>
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

Skip tests on joiner outputs to prevent failures caused by high-resolution
displays. This ensures the test suite runs smoothly without unnecessary issues.

Add 6k resolution support for a single CRTC and update calls.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (4):
  lib/igt_kms: Add is_joiner_mode function
  Add 6k resolution support for a single CRTC
  tests: Update igt_bigjoiner_possible calls to include drm_fd
  tests/kms_display_modes: Skip test if joiner display is connected

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Skip async flips on joiner output

 lib/igt_kms.c             | 53 +++++++++++++++++++++++++++++++++------
 lib/igt_kms.h             |  6 +++--
 tests/intel/kms_pm_lpsp.c |  4 +--
 tests/kms_async_flips.c   | 18 +++++++++++--
 tests/kms_display_modes.c |  3 +++
 tests/kms_flip.c          |  4 +--
 tests/kms_setmode.c       |  4 +--
 7 files changed, 74 insertions(+), 18 deletions(-)

-- 
2.25.1

