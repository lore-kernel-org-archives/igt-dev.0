Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53101C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 16:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7105B10E389;
	Tue,  4 Mar 2025 16:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUtefLaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D6710E389
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741105971; x=1772641971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IMBZ9kqi393mCLKcLm5JfEoMYbLNRp9pczjCPDG94gU=;
 b=KUtefLaW2Zfrz9fagp7zjB0ccq73yH+oV3Y8Gm/t2bkEq/BZQ+f+F4ah
 X6bYfKYRYMVzo6jzzMVkqcDhPz/ZRoz4x9CTMu51sVCyLisNHFop+lT6N
 yKNIck94o13r7X+l0/JVTpvPiPUIQma/9tDheL6t2tzRSFEfPU1njC5To
 L2YzhfweiYrlLvTfi5SMxWUtC+tqyJFcUbQcHVCQrgl+SJllbcneilTlf
 LyQRVpVspvNKnnA+qfJNGMWW27l4FpNwnRRYbIi4B69qqkFbcrkTLyAJ0
 S719f3xt11e9Bpx6+piEKyAC2KjwgiDfoOZKSev0vwd/7lfQogisquusu w==;
X-CSE-ConnectionGUID: Cq3LmRPqQDmy+cGBK61lbQ==
X-CSE-MsgGUID: sEiii5u0TOOTwFtsQlowAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41746051"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41746051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:32:51 -0800
X-CSE-ConnectionGUID: DxwxDhweRHOPa+wQ6h+fqA==
X-CSE-MsgGUID: macL0z2/TUKlgWqMtkfPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118146822"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:32:47 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 0/2] Ensure that SR-IOV and eudebug are exclusive for
 Xe
Date: Tue,  4 Mar 2025 17:32:25 +0100
Message-Id: <20250304163227.49986-1-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Ensure that VF provisioning and eudebug enabling is exclusive by
returning EPERM on an attempt to enable one of those features while
the other is already enabled. Check that enable_eudebug sysfs entry
is not present when the driver is loaded in VF mode.

Since eudebug KMD side is still in the upstream review phase, the related
kernel side change can be found here:
https://gitlab.freedesktop.org/miku/kernel/-/commit/bf0257ae834f48aaf34425dda0fd0ab5bb71bd19

v2:
 - move subtests into dedicated 'xe_eudebug_sriov' test (Kamil)

v3:
 - remove leftover includes from 'xe_eudebug.c' (Dominik P.)
 - use igt_sysfs_printf to get latest errno value (Dominik G.)

Christoph Manszewski (2):
  lib/xe_eudebug: Export __xe_eudebug_enable_getset
  tests/intel/xe_eudebug: Add subtests for eudebug/SR-IOV exclusion

 lib/xe/xe_eudebug.c            |  15 +++-
 lib/xe/xe_eudebug.h            |   1 +
 tests/intel/xe_eudebug_sriov.c | 148 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 4 files changed, 163 insertions(+), 2 deletions(-)
 create mode 100644 tests/intel/xe_eudebug_sriov.c

-- 
2.34.1

