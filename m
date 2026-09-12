Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58F7C88E56
	for <igt-dev@archiver.kernel.org>; Sat, 12 Sep 2026 20:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FD110E00B;
	Sat, 12 Sep 2026 20:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6fehov9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9033210E00B
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Sep 2026 20:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789243783; x=1820779783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M2ZxCaXaIQ5ul1jSJDvyJyMBjt6ddeo2o7OaEKLBj4o=;
 b=D6fehov9l524TpWR4PBKmdfIO59LC8zGQ7yzeGbMxnZM8grKwSklaTpQ
 DeIrRuBuLajmtsz8i3fxQMGovLgxRBK8g2NEZErhQ4wNtqhuY24uCP/9G
 KtzISn8/7IPhMFfZGWorwdwlcPe4kf/+DljjKLExfJ0bbcZmkvmg61tA4
 PG04HIgBdgw4ah6fEaHBDMD7I1VbnjgQdwIMC7+SXQ9eZ6PXyLgey/PH6
 i8J5ucGKyEjpUt2SX1rxLNwzJ9x2PfTOMws+HoI6ZcdU6ll9UDi4A7aQG
 ijn+EF2Z99YHA5UP+7N/pNDaL+LvbbeONTVsLcTeWHTqlsPHFfB1idnRu g==;
X-CSE-ConnectionGUID: f4xKIybKQFuaMj6wfkqOiw==
X-CSE-MsgGUID: F2X/WphrSjuWh+PaPx0B+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89682400"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89682400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2026 13:09:42 -0700
X-CSE-ConnectionGUID: lWVCcrLIStubIIKcd/MSFg==
X-CSE-MsgGUID: 66LCURb/Seqm9wYA8SjHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; d="scan'208";a="274162338"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 13:09:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v7 0/4] Add CMRR subtests
Date: Sun, 13 Sep 2026 01:39:39 +0530
Message-ID: <20260912200945.3263106-1-ramanaidu.naladala@intel.com>
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

Add a subtests to validate CMRR with video mode and desktop mode.

Naladala Ramanaidu (4):
  lib/igt_vrr: Add VRR helper library for display refresh rate testing
  lib/igt_kms: Add helper to return vblank timestamp and sequence
  tests/kms_vrr: Add CMRR fixed and video mode subtests
  HAX patch do not merge

 lib/igt_kms.c                            |  37 +++-
 lib/igt_kms.h                            |   1 +
 lib/igt_vrr.c                            | 166 +++++++++++++++
 lib/igt_vrr.h                            |  30 +++
 lib/meson.build                          |   1 +
 tests/intel-ci/xe.fast-feedback.testlist |   2 +
 tests/kms_vrr.c                          | 246 +++++++++++++++++++++++
 7 files changed, 479 insertions(+), 4 deletions(-)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0

