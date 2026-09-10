Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E01C79FBB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522A210E2F9;
	Thu, 10 Sep 2026 20:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amp/XHfq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D3B10E2F9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071265; x=1820607265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yAGkPwXIzfVKALT809hEnPw3WDxKVUCiiBvPvy9+3VE=;
 b=amp/XHfqSObVRUbujDIoLA8wAWD9Qpn3fJ2tLNO78x0PUa5eah0sURkd
 eaHku3WvQ3J+LGEH9avnCvUPXvZ3kiyzyIDIwzeIf1b326A+Pl9IRJPeu
 n0Re2SsfiDbxrabr1TiXr07WG6t5Xg+TYjeWMQIb1ic1kLm0kjrln8h/D
 0DysfMRsEFJhCOAO/VHLd54lc5H3dtO5JXaKCjQcfbwsDia1kiIsrsPsK
 fFOCE0tI4Fqp/EZA/DWbGK6H+Zbp77FGNrbLnz5L/vnDGNESlIQrGeFQo
 PFmgoBFWMUVEB+r9Pt9pbrak3/7Z09nN5BXtVcqL42wSuPlnGCMWdSsm/ g==;
X-CSE-ConnectionGUID: jpDVCqNOTl+Uv0XVx+BZQQ==
X-CSE-MsgGUID: CCYODgksS1SF0L8Y22mGGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657239"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657239"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:24 -0700
X-CSE-ConnectionGUID: KmtfRQtVR42iiMHHC3kRNA==
X-CSE-MsgGUID: rSL8AfjATF6NsdGWul9CvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978158"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:23 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 00/17] tests: limiting suspend tests
Date: Thu, 10 Sep 2026 22:13:56 +0200
Message-ID: <20260910201413.2730574-1-michal.grzelak@intel.com>
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

Next version of [1]. Missed comment addressing indentation.

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20260910185902.2728276-1-michal.grzelak@intel.com/

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
  tests/intel/kms_ccs: split outer test loop into two
  tests/intel/kms_ccs: limit #outputs tested during suspend
  tests/intel/kms_ccs: limit #crtcs tested during suspend
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
 tests/kms_vblank.c                     | 54 +++++++++++-----
 10 files changed, 272 insertions(+), 105 deletions(-)

-- 
2.45.2

