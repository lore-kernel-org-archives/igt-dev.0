Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD10EC0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 06:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D2710E1D8;
	Mon, 27 Jan 2025 06:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qjl3iZfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5754810E1D8
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 06:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737958409; x=1769494409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IHRRBpH22iC+G6NOHjjHwUOjSSSjdlTnCpb+iz+inRE=;
 b=Qjl3iZfQpivouw9mc1A9iKqTLlX9kLgt1CdsXJUirJ1QeDv7DcbJTD1P
 zYkely6ODa4FQyZhTNp5SxoAOLEEnl+JXsRR88kOVkeP2JIivJpZZh4dw
 vKv1BVuZYQSicr99T3XpWdtw5Y7T7VioZVp1paIyJnkceruTVn9rodirf
 1zLEhkUcFJ9Pb/7MNTuSsouPza4NfrkXrhNnAIT6ZOzi4yGxI+HYjT0D9
 Qr19rwA3ETC/VjSPc7/dyf2wgr8emnc8Egue2WWiNRy/4lbeaqJGaQdSu
 Nx4v2lrO/0sHUDVnUUl5zuqpWEZzREP5v50I+clpYCjmFBTh43tM9hc1l Q==;
X-CSE-ConnectionGUID: hu8OTIifSOyz+A4Qvh9QFw==
X-CSE-MsgGUID: 2KAGIntoQU+a1T7zkEuTGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60875515"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="60875515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 22:13:28 -0800
X-CSE-ConnectionGUID: zyZSdlCSQUWNS5p6fzi51w==
X-CSE-MsgGUID: tMWfOjg/SAKrLXt2nOlvVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="108142122"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 22:13:26 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] add dsc-fallback test
Date: Mon, 27 Jan 2025 11:59:01 +0530
Message-Id: <20250127062904.3420225-1-kunal1.joshi@intel.com>
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

Kunal Joshi (3):
  tests/intel/kms_mst_helper: Add helper for MST-related functions
  tests/intel/kms_dp_linktrain_fallback: add dsc-fallback test
  HAX: Do not merge

 tests/intel-ci/fast-feedback.testlist    |   3 +-
 tests/intel-ci/xe-fast-feedback.testlist |   3 +-
 tests/intel/kms_dp_linktrain_fallback.c  | 380 +++++++++++++++++++----
 tests/intel/kms_mst_helper.c             |  48 +++
 tests/intel/kms_mst_helper.h             |  10 +
 tests/meson.build                        |   3 +
 6 files changed, 377 insertions(+), 70 deletions(-)
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

-- 
2.25.1

