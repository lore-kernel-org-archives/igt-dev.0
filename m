Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D933C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB03110E28F;
	Mon, 24 Feb 2025 13:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGYWk1gJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320DF10E057
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740402508; x=1771938508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DQr/yDcdq4V2j648CzrJwIRFqggtocNBTumlTQ1+bXc=;
 b=hGYWk1gJFmP1F1dwu4Yy4jgQF1CmkTbrNSYSC+llzSuGllJHnVvzDOmb
 qOJ5jtmRm3Z4c626WEuONYu4+fwU297B7PiC9CsJvIfPZ7oFIbwb15AaY
 LOmGpWcNd97HTJrbwDcYco/D64f6ylRoV0xZUdnl0Q/16q/1GuxvnvPge
 aYXMZhjL6Mbmisp4kqEv2RG3FZ6WfYuQfCLbVsugHLGtKI/HX690wzhbP
 ZDIWcl5Mb41/YZlMEXNhAS0LPE6GpZ7pqe1BpobnAlASZz4W/RyIxs1s/
 UZtsAscwmTHoxmW+HWjfiRp2jPz1mZJxDCgVPK77l3PV+WACssyEXjmM1 g==;
X-CSE-ConnectionGUID: oKbU7F2sSVq7aYGWxQMNeg==
X-CSE-MsgGUID: PMJrS/zgQkOk5zdS3tu52g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51783820"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="51783820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:08:27 -0800
X-CSE-ConnectionGUID: 96S4nGslSIidZ3OlB9WijA==
X-CSE-MsgGUID: p8pcHwZgQB693a37/LrLXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153251840"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 05:08:26 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/3] tests/xe_eudebug_online: Add
 set-breakpoint-sigint-debugger test
Date: Mon, 24 Feb 2025 14:08:04 +0100
Message-Id: <20250224130807.9249-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a test that sends SIGINT to the debugger thread with random timing
and checks if nothing breaks, exercising the scenario multiple times.

In order for this test to work, make debugger thread SIGINTable.

While at it, fix rare xe_eudebug_client_stop corner case issue that was
spotted with the new test.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (3):
  lib/eudebug: Make debugger thread SIGINTable
  lib/eudebug: Fix xe_eudebug_client_stop corner case
  tests/xe_eudebug_online: Add set-breakpoint-sigint-debugger test

 lib/xe/xe_eudebug.c             | 18 +++++++-
 tests/intel/xe_eudebug_online.c | 75 +++++++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+), 2 deletions(-)

-- 
2.34.1

