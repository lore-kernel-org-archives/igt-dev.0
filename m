Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1065CC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 15:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1D210E48E;
	Thu, 18 Apr 2024 15:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8VGlveT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A5710E48E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713453449; x=1744989449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y2niHxjYuhfKMRyOZbEFva4ySBdG/t6GUfcHL5mLSKY=;
 b=W8VGlveTmEw90ATSiHDQ1bQWpeqnGYaQgEja2fzzsRTRQGVKh8JlRIpk
 IoQRlwQu7SubzevNHde7toQ18sKASKBKcqvGbnezK8LjZGucBQr0ei7FL
 bsMKeqH60D6dmm2Ul1C8ocJWvfsAR82V9vs8OepMkn5D3ujcJ+F3v7Pnj
 L32pStjaXt0S53rfssHk3YeXCrB2PUvfl4/t4hWoxoSZUM7Klu69K+gB7
 /8OQYa4nmytbRajoV5DSo6p2LIXQ+gX1NBJs3PyGczwzPAZZHNVJ0Dt9n
 UHPXV3L7BLzmzcwiU1dqKjYznsNsD5m9szK13vtxa6HXPiEpxUHDm1ebT g==;
X-CSE-ConnectionGUID: NS2vdlmyRY2xoCypGZlqfA==
X-CSE-MsgGUID: hq0b7ksZRhioNybwU+Wbng==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26465801"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="26465801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:17:29 -0700
X-CSE-ConnectionGUID: VaHeyCNjRc6O9nGAPuOv0w==
X-CSE-MsgGUID: wmq3O3mFROuUPzb9xRFrbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23463241"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:17:27 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/7] cleanup and fixes for kms_big_joiner
Date: Thu, 18 Apr 2024 20:58:10 +0530
Message-Id: <20240418152817.2352850-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

fixes and cleanup for kms_big_joiner test

Kunal Joshi (7):
  lib/igt_kms: don't run on unsupported platform
  tests/intel/kms_big_joiner: fix crash in multi joiner test
  tests/intel/kms_big_joiner: add missing commit after reset
  lib/igt_kms: add support for forcing bigjoiner on particular connector
  tests/intel/kms_big_joiner: use kmstest_force_connector_bigjoiner
  lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status
  HAX: Do not merge

 lib/igt_kms.c                         | 105 +++++++++++++++++++-------
 lib/igt_kms.h                         |   2 +-
 tests/intel-ci/fast-feedback.testlist |   5 +-
 tests/intel/kms_big_joiner.c          |  28 ++++---
 4 files changed, 98 insertions(+), 42 deletions(-)

-- 
2.25.1

