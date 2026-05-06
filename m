Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64654CD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 06:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1DD10E4F6;
	Wed,  6 May 2026 06:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZxNvLrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8EA10E4F6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 06:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778050555; x=1809586555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JBZid+zZrBnfflXTkIjw9TLynxvdcuAxNpgAPceS5N8=;
 b=mZxNvLrpQs40XIOwGE+JwGB4tVGaP+CrK0Ln4dLeH/hyCw19OAcjl0L/
 hgt26dTm2MFXPhcDocRf6Z+Yv+mG4C0dKpOy/HyZZw8z89U447RsrYM92
 XhogLUe+9NbVyP2CRQbuPtDYgCOCPhkPqgstfDvY9WEiGPMlAn29Ir5Sh
 kG+YTozr44gpkKQZJe2nskmYnK9wrgzhD4/V1/haUIEzsEEWeC+pl5Xdj
 Xsno0UFe3Oz14w+OwCN1p+T4t7cxTve+8G6wNTdvrwDMrkNLcYV7YfqjN
 AuWWTx2xFHRScTrm3gWtIxL/FsJKfqRKbQTxrYabKnQrH8RI/PCACw2Io g==;
X-CSE-ConnectionGUID: r7UwnXouQ+6YlJDVhzwv5Q==
X-CSE-MsgGUID: AOi8aKZvQ4iqgZTN/3gYPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90063666"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="90063666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:55:06 -0700
X-CSE-ConnectionGUID: TszvnM/nSCCAJ0sk9PD+Rw==
X-CSE-MsgGUID: gDGfkMW8TrGG8yDL/a+/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="231677261"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 23:55:04 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 0/2] Extend gpgpu fill support to XE3P
Date: Wed,  6 May 2026 08:55:01 +0200
Message-ID: <20260506065500.162563-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add pipeline + shader for XE3P and extend test with 4x4 position.

Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>

Zbigniew Kempczyński (2):
  lib/gpgpu_fill: Add support for xe3p gpgpu fill
  tests/xe_gpgpu_fill: Add subtest with 4x4 position for XE3P

 lib/gpgpu_fill.c                     | 117 ++++++++++++++++++++++++++-
 lib/gpgpu_fill.c.gen.iga64_codes.c   |  46 ++++++++++-
 lib/gpgpu_fill.h                     |   8 ++
 lib/gpgpu_shader.c                   |   6 +-
 lib/gpgpu_shader.c.gen.iga64_codes.c |   6 +-
 lib/gpu_cmds.c                       |  96 ++++++++++++++++++----
 lib/gpu_cmds.h                       |  16 ++++
 lib/intel_batchbuffer.c              |   4 +-
 tests/intel/xe_gpgpu_fill.c          |  11 +++
 9 files changed, 288 insertions(+), 22 deletions(-)

-- 
2.43.0

