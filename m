Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5ECC35FF1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 05:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042CE10E19B;
	Wed, 19 Mar 2025 05:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TL22Vb/h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4213A10E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 05:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742362454; x=1773898454;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HvBWqhGwesDC+xh60Od+vxFmggQM32Ti2MCyVU+S4LA=;
 b=TL22Vb/hKZGkV1VM6TgNJK4g8LZusIN+xOIRuCmAUB+P5o59W9oXVuQZ
 pGcJIWsFmBdlVOKzMOCEt5o3QA72CWKfDXyHoHbmArqbSrqBWAsMBzfon
 S2MvuuAt8hSFtiTQxX5IPjg6mnC/52IM/E6QeK1/i3ZcSxo7dVbpDIONu
 erMIOWRrcipT2+ZfmLV9q1PbkHv8THFWT5HXsHqzxP8j4tY5+FZl1nQUF
 VdwXvj9db6zl2K6w/p7LvK6Ob/9CWvWvcw8bDS9yDt+Fcp+7WqNTKcQuu
 s0RIxp2v/290flBtlQOirU4h5ytZGxEahOl3pyZuqGST/dL+fZsSmZzq6 g==;
X-CSE-ConnectionGUID: kgbTpRk6SWKS7vtTBsKZ8w==
X-CSE-MsgGUID: l6QkHYVsTw+j3SZnXyVa5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54917078"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="54917078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 22:34:14 -0700
X-CSE-ConnectionGUID: 1YxfDvcxROaOqv2ORg5cBQ==
X-CSE-MsgGUID: oD/TA+6HQ0Gz8F5xp8DGKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="153322840"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 22:34:12 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 0/2] Support for IN_FORMATS_ASYNC plane property
Date: Wed, 19 Mar 2025 10:59:03 +0530
Message-Id: <20250319052905.2624650-1-santhosh.reddy.guddati@intel.com>
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

Use IN_FORMATS_ASYNC property to get list of async modifiers
and improve async flips test to add coverage for the supported modifiers
and formats.

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers

 lib/igt_kms.c           |  53 +++++++++++++++++-
 lib/igt_kms.h           |   7 ++-
 tests/kms_async_flips.c | 116 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 170 insertions(+), 6 deletions(-)

-- 
2.34.1

