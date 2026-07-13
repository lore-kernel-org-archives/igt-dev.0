Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679D9C44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDDB10E879;
	Mon, 13 Jul 2026 08:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8F1jeTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0569510E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932966; x=1815468966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H6vK72LphxJtE/Gw9bANw+6l+Zm8+/1UZoT3yYFLTWw=;
 b=a8F1jeTaB4srEHSJkCQmqiqP6Lv0vLYEh77vF0JHhSZON99OhuzvpxDm
 UR+pu/QJMZ1OOCjI+L8zPSXQTE30FXubi+QT++kBwvEIJBNjc7oxScwTC
 izEMSJIfAVmxJr3Yw0Uhb7/wnqVMAMsTjkq/Dz8qMzbaZjbr91FIcUVwp
 tjChaSmQhy+qj73/nlZ/Nl69T0GJ308/xpydh7qEZUAxdlx/Oa55yI7uu
 j14O3D4DgZQt1Ey37ii4FQQ0IaZwcsZcSwWhCINu2V8XQmIatrJ7TNjM1
 qIjU5OJfxGahHAvTIDXWCOu7OZjdfFlblJ10o+kzMKzwbfXt66OGoYn4M w==;
X-CSE-ConnectionGUID: +1AEZ/3HSLmgUJpQapvfLw==
X-CSE-MsgGUID: GRZTl7EYT5WeOTpVZgQbvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081315"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:06 -0700
X-CSE-ConnectionGUID: EOJTTnJfSbuxGlJEiD7QHA==
X-CSE-MsgGUID: GsE/gWWWT7+T3eAiF9G1Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385829"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:04 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 00/16] limiting suspend tests
Date: Mon, 13 Jul 2026 10:54:59 +0200
Message-ID: <20260713085515.463575-1-michal.grzelak@intel.com>
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

Gathered series [1], [2], [3] into one. kms_async_flips,
kms_frontbuffer_tracking, kms_psr, kms_vblank are added together with
couple fixes. 

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260622225811.1703400-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/igt-dev/20260629090740.2706320-1-michal.grzelak@intel.com/
[3] https://lore.kernel.org/igt-dev/20260629091350.2706610-1-michal.grzelak@intel.com/

Michał Grzelak (16):
  lib/igt_aux: remove typos
  lib/igt_kms: s/pipe/crtc/
  tests/kms_async_flips: split outer test loop into two
  tests/kms_async_flips: limit #outputs tested during suspend
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
 tests/intel/kms_ccs.c                  | 88 +++++++++++++++++--------
 tests/intel/kms_frontbuffer_tracking.c | 48 ++++++++++----
 tests/intel/kms_psr.c                  | 27 +++++++-
 tests/intel/kms_sharpness_filter.c     | 29 +++++++-
 tests/kms_async_flips.c                | 91 +++++++++++++++++---------
 tests/kms_pipe_crc_basic.c             | 13 ++++
 tests/kms_vblank.c                     | 54 ++++++++++-----
 9 files changed, 257 insertions(+), 97 deletions(-)

-- 
2.45.2

