Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C563C5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8807910E463;
	Fri,  7 Aug 2026 22:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rotp34IJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA15C10E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142870; x=1817678870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T5AMk5BfCYri8p2UpBG9/YZMTe2rHC0O+vTfDb/n4s0=;
 b=Rotp34IJ07QIkveh4kUbwRovQN9lo3/ot48wyz7+QONNvFnZoutSMXwR
 rhHcM14278M2UM20WgTwChNWauEcHdTDvTaJcIr1Z1A58vTbAKDsD9M3g
 vdIn4t0oZylt1HlPZyi3abotULPqW74RmiYXpLqm1/o7XgobYlNYt/PGx
 Mc9c90pxEjDfRunYS8HOiFevBYIpgg8nLCm9SRm517Z8SdoKxJJeLA+v0
 DcFYY4QaRWYDKHPYFrPGHavflsGBzjdYHmY1s2dn5tiO1e+HVoa+rlyDQ
 CFjXs4V4y7hp/TGP2dSGCE+msgfvUdltzWzbmYxB7Ejri/LZiQv9yKCqN w==;
X-CSE-ConnectionGUID: ndkrJWC4TxKX8gaRxEzUJA==
X-CSE-MsgGUID: wr6sLKM1RL6s6jcGdu25tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835795"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835795"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:47:50 -0700
X-CSE-ConnectionGUID: /E6ZPEy3SviqPafbOk2Iag==
X-CSE-MsgGUID: /LYjAiMmQmGIlDQ/2zy1sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655393"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:47:48 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 00/16] tests: limiting suspend tests
Date: Sat,  8 Aug 2026 00:47:30 +0200
Message-ID: <20260807224746.3554064-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. Previous series had mangled version number.

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260713085515.463575-1-michal.grzelak@intel.com/

Michał Grzelak (16):
  lib/igt_aux: remove typos
  lib/igt_kms: s/pipe/crtc/
  tests/kms_async_flips: split outer test loop into two
  tests/kms_async_flips: limit S/R to first and last CRTC
  tests/kms_frontbuffer_tracking: remove TEST_MODE_ITER_BEGIN() from
    `suspend`
  tests/kms_frontbuffer_tracking: remove TEST_MODE_ITER_BEGIN() from
    `fliptrack`
  tests/kms_pipe_crc_basic: limit #crtcs tested during suspend
  tests/kms_psr: limit #outputs tested during suspend
  tests/kms_vblank: split outer test loop into two
  tests/kms_vblank: limit #outputs tested during suspend
  tests/kms_sharpness_filter: fix typo
  tests/kms_sharpness_filter: limit #outputs tested during suspend
  tests/kms_sharpness_filter: limit #crtcs tested during suspend
  tests/kms_ccs: split outer test loop into two
  tests/kms_ccs: limit #outputs tested during suspend
  tests/kms_ccs: limit #crtcs tested during suspend

 lib/igt_aux.c                          |  2 +-
 lib/igt_kms.h                          |  2 +-
 tests/intel/kms_ccs.c                  | 88 +++++++++++++++++---------
 tests/intel/kms_frontbuffer_tracking.c | 67 +++++++++++++-------
 tests/intel/kms_psr.c                  | 29 ++++++++-
 tests/intel/kms_sharpness_filter.c     | 29 ++++++++-
 tests/kms_async_flips.c                | 68 +++++++++++---------
 tests/kms_pipe_crc_basic.c             | 13 ++++
 tests/kms_vblank.c                     | 58 +++++++++++------
 9 files changed, 250 insertions(+), 106 deletions(-)

-- 
2.45.2

