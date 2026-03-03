Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0452EC1450
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 13:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36D910E7F9;
	Tue,  3 Mar 2026 13:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iR/5ctNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB36710E7F9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772545090; x=1804081090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kYTruJxBYrSZfwA4fBFPVpyEJTro2+CtCrd6fsBfLC8=;
 b=iR/5ctNCdLSOa269/WP5amUuSs3ghdAdYPX5Lw8dgsixPzu8o3uUKL4Q
 u5IWL4a4Mxvx0FQprT7M/8uB9QLjhdFQmcCZzHp9kXMYlfbtI7ZV5EkUg
 LJcZA/S6WUaE+d1NdcTxufnhjmExGpFoovD31/eQC1wcqM05vP9vOj925
 /HpkxBo7+jrvMRAexiegGPutlxg92M73zPGbfsSYqRuK0mJXUyMPc3cbo
 DZoKg/XGWQ/PQWD4Pxc51Su4fxIydczAhwO8i1y3v+dAuiGBcYl8Q8lrH
 7wT1x/iROYMB1z8DFQAnkCj7xXwG6mCbs4R1h60cj1TLOwm0q/1X42CPA A==;
X-CSE-ConnectionGUID: ohTB/dnxRuCjgkGYpJwgqQ==
X-CSE-MsgGUID: x7Ne/x5WSPy+EYoNVmVXBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="90977766"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="90977766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:38:07 -0800
X-CSE-ConnectionGUID: CQjznfyFSpGGcsoICPmeHw==
X-CSE-MsgGUID: zOn9Qdq8QrGEfaYol8MwAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="248496828"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:38:04 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>
Subject: [PATCH i-g-t v3 0/5] Extend compute userenv to support user passed
 buffers
Date: Tue,  3 Mar 2026 14:37:59 +0100
Message-ID: <20260303133758.36553-7-zbigniew.kempczynski@intel.com>
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

Add support for user passed buffers in compute userenv. This allows
users to pass their own input and output buffers to compute tests, which
can be useful for testing specific scenarios.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_compute: Add types for input and output buffers
  lib/intel_compute: Extend userenv by adding input and output bos
  lib/intel_compute: Use user offsets and loop size if provided
  tests/xe_compute: Exercise user passed buffers
  tests/xe_compute: Use appropriate feature in compute-square tests

 lib/intel_compute.c      | 191 ++++++++++++++++++++++++++++-----------
 lib/intel_compute.h      |   4 +
 tests/intel/xe_compute.c | 154 ++++++++++++++++++++++++++++++-
 3 files changed, 294 insertions(+), 55 deletions(-)

-- 
2.43.0

