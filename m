Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB596EA3F35
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 10:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8952310E545;
	Tue, 10 Feb 2026 10:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWdcja4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C1F10E545
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 10:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770719071; x=1802255071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nl+I3vEb+7A9VV6HKmTEh9u703Gdv7/XjbhcGuIIuEs=;
 b=fWdcja4A1TGO1t00hTvSdDJ+LUM7BHZAfGrKleCRiv589tYzvAH2H/di
 40mxYG58q4hV3Xq8rgAOeJ7ss9XOBGK9HwUf8YogKUYx95/siuR8tmhHV
 O+sR7sBm1TeXip0xq4vUI71efrrjCdKgL2Cn7NTC5al8Fhk/lXeIG6Eop
 xznhz/AgKKhDPlWXy1KtulP9pDdubsWSE2ZVKvUEFcwrub57PmCSHV68+
 ZReSVqrTlm5tiPWoRSH7NsMgLc4K4AyUleWZMcmHpOswoygLGz8XQVSKC
 f9/PZXwmeLiDpnWc5b7QR+uDZexb/FscdxgS8Puj2ZtpKboUwvNU4v1Vb A==;
X-CSE-ConnectionGUID: 5o5d9CCqQrOO3T26k1GYkw==
X-CSE-MsgGUID: /fZZbW7NSVKVXl4wFq+UyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89258156"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89258156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:24:31 -0800
X-CSE-ConnectionGUID: FGNrOpaNRU6LSiuqILaGkQ==
X-CSE-MsgGUID: 39AXtcD4SpGNBnd9Sgw8aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242499987"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:24:30 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] lib/gpgpu_shader: set r1.4 to dim.x
Date: Tue, 10 Feb 2026 11:24:15 +0100
Message-Id: <20260210102416.2796291-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
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

Jan Maslak (1):
  lib/gpgpu_shader: set r1.4 to dim.x

 lib/gpgpu_fill.c.gen.iga64_codes.c                | 2 +-
 lib/gpgpu_shader.c                                | 6 ++++--
 lib/gpgpu_shader.c.gen.iga64_codes.c              | 2 +-
 lib/iga64_macros.h                                | 1 +
 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c | 2 +-
 5 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.34.1

