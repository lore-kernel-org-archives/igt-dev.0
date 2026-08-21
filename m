Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FA6C5DF87
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D30110E39F;
	Fri, 21 Aug 2026 12:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkB20srK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1864710E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316519; x=1818852519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2KzrjKK15IW7pi0iW6QUfs3ytCSSznjC/S5lsObP8bE=;
 b=VkB20srKaKiam9/AUj8U+nT8/l2ntYWM91bmJ+yOF0kLjkk+uJO94gHe
 bxI+PjklYF70YQcH4OFM0A/YwLIB7iBIcLUy8HNBSe5rdGfBT1V/wfssl
 eGLgDs+vjYN9JmSANrz3oy2Cj2WIn6EZmW9CpH6s6wMP0ut5cuCD0iPxT
 +/PQHiB0qrxKjGeTv4CrGnpxlpxJeNo33xvtpBxv68AzZ6Rjs9NIyfSHU
 jZFsmMGpSj0oPFZ9FQPbnFQgxobp68toelmSHdD5R9l1bK+suNhfgBgzp
 7nyPLakZIf4vOsEpLUIYJPQ/2QjM7kS3oxhEEGSD1TaDGTMIH9WgoKC6V w==;
X-CSE-ConnectionGUID: 3oamk1+nT/WgOLYAkmIpFg==
X-CSE-MsgGUID: PtSVY+vqT0WnnKegWZ6tog==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632903"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632903"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:39 -0700
X-CSE-ConnectionGUID: PViePIjlS/+FSFOte5AefQ==
X-CSE-MsgGUID: cVZLFTr5TsCWuIMUH1cIrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188331"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:37 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 00/17] tests: limiting suspend tests
Date: Fri, 21 Aug 2026 14:48:17 +0200
Message-ID: <20260821124834.1974029-1-michal.grzelak@intel.com>
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

Next version of [1]. Added one patch for kms_hdr.

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260807224746.3554064-1-michal.grzelak@intel.com

Michał Grzelak (17):
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
  tests/kms_hdr: run on 3 outputs when testing suspend

 lib/igt_aux.c                          |  2 +-
 lib/igt_kms.h                          |  2 +-
 tests/intel/kms_ccs.c                  | 88 +++++++++++++++++---------
 tests/intel/kms_frontbuffer_tracking.c | 63 +++++++++++-------
 tests/intel/kms_psr.c                  | 28 +++++++-
 tests/intel/kms_sharpness_filter.c     | 29 ++++++++-
 tests/kms_async_flips.c                | 68 +++++++++++---------
 tests/kms_hdr.c                        | 30 ++++++++-
 tests/kms_pipe_crc_basic.c             | 13 ++++
 tests/kms_vblank.c                     | 58 +++++++++++------
 10 files changed, 275 insertions(+), 106 deletions(-)

-- 
2.45.2

