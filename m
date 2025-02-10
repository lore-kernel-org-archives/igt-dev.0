Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005F2C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3310E1E7;
	Mon, 10 Feb 2025 18:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgxRuGZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E003A10E1E7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212829; x=1770748829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PA859LTLKVjyfvnhO10a2wsCjsTcez729fBIbBPB2Cw=;
 b=EgxRuGZBGwMif6zZJmygV9SkSNvjt9Rp2CavxRL05tuSJPqTkBkb+bGh
 +fyHugBo2JR6VZ0j+jL2w8/MvJtVvxMI97bAe/5i6hZaD8JdPt6IN7V1W
 mw3TMcdvTE3b6X+YbGDytmir/Es/3aF8/Ojpv5Rv8ecYMSk9my1TaOUiW
 sISrRegWt/AaGMwO1byspjFeT4eQpMrr3hLFD/xPdw3hD6DQQzg4ka+wi
 QoTMamz/ByD6GfRssayMEv+AedN2tdvylU8QZgAsURmTLTM+BG286TUqD
 67eFa0xeKyBJb4qMXhrw8rSoYZGIxcGDEfOrSf58p+lFnW7Tj9pte1jlB w==;
X-CSE-ConnectionGUID: HbMGaCp/QpSIbJ/0jBAo/Q==
X-CSE-MsgGUID: 8hOZxxxYQcWcrrL1HZ5zyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39497458"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39497458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:40:28 -0800
X-CSE-ConnectionGUID: 7E09ZN6HSDCJ5UjpG/SmVg==
X-CSE-MsgGUID: t0PmgGI2TMeSOk9DOVBZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112229405"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:40:27 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] add dsc-fallback test
Date: Tue, 11 Feb 2025 00:26:00 +0530
Message-Id: <20250210185606.1327892-1-kunal1.joshi@intel.com>
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

Add test to check we fallback to dsc when current
link params cannot accomadate bw required by
the current mode.

Kunal Joshi (6):
  tests/intel/kms_mst_helper: add helper for MST-related functions
  tests/intel/kms_dp_linktrain_fallback: reuse from mst helper lib
  tests/intel/kms_dp_linktrain_fallback: refactor dp-fallback subtest
  tests/intel/kms_dp_linktrain_fallback: add dsc-fallback test
  tests/intel/kms_dp_linktrain_fallback: disable ignore long hpd
  HAX: Do not merge

 tests/intel-ci/fast-feedback.testlist    |   3 +-
 tests/intel-ci/xe-fast-feedback.testlist |   3 +-
 tests/intel/kms_dp_linktrain_fallback.c  | 355 +++++++++++++++++++----
 tests/intel/kms_mst_helper.c             |  49 ++++
 tests/intel/kms_mst_helper.h             |  15 +
 tests/meson.build                        |   3 +
 6 files changed, 369 insertions(+), 59 deletions(-)
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

-- 
2.25.1

