Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90551C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 12:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC8F10E595;
	Tue, 13 May 2025 12:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+WMyis0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56E610E595
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747138735; x=1778674735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Gnki3YkGK7zedBb9zsdwygey/GjpNbqMpInQPtCXS0=;
 b=K+WMyis04peqCdV8X/IPgblpep30kdFfNcnqrO0NkdLIDqVR/zVq1Q6l
 7zhgCM2FTcXZk0DZpCbAtB6FzB8VC91OJRfPo2O1JC9Ywd+/ei9YjIzFJ
 SMqJU6Q1/ytnTWwEaRN3B1y39BlpJ5m5rlIw045jpUNmqG+2g2nAkMxGH
 VzZRuQ+rpgOs0AlNZCS1NOCDpoQPoXCoQwcmDzAUCK6YzYvGLcJPItrfl
 lRzu0cb8kii5GM+dhZIY+JpkEJmnimlewBzQAvpelERU0I7eUtD4xATsc
 /a3FgxX0Csilk6tFamXzrqVkUcbBUiLFlT8Cttxn3xDgQhgHdcgKYwapv Q==;
X-CSE-ConnectionGUID: 2qADShjYT4W1KxR6y+to6Q==
X-CSE-MsgGUID: dEEasjDmTlqN6PQyj1soMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48911088"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48911088"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 05:18:55 -0700
X-CSE-ConnectionGUID: RohSfiSGRgaUCPTe0+dd5g==
X-CSE-MsgGUID: 2I1Htql2QXuL4GTa5DJq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138669485"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 05:18:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 0/2] Skip PSR when disabled
Date: Tue, 13 May 2025 14:19:16 +0200
Message-ID: <20250513121918.2758842-1-michal.grzelak@intel.com>
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

This series handles failed PSR tests seen on JSL. It should be tested in
parallel with proper kernel change [1].

Test-with: <20250513113526.2758433-1-michal.grzelak@intel.com>

[1] https://lore.kernel.org/r/20250513113526.2758433-1-michal.grzelak@intel.com

Best regards,
Michał

Michał Grzelak (2):
  lib/igt_psr: Skip the test when PSR is disabled
  tests/intel/kms_frontbuffer_tracking: pass non-NULL output pointer

 lib/igt_psr.c                          | 4 +++-
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.45.2

