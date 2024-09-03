Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EE4CD13CF
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 09:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2632510E099;
	Tue,  3 Sep 2024 09:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdXfJmz2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046D10E099
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725356098; x=1756892098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3cXsi/4d3mX14WL3ZTPOcHPljdfrSqNbIq6R8Eae8Y=;
 b=fdXfJmz2Uro4BalYOOGSJMaicBX7o+mapB+ZWC8Bnxcge97+zxSvLxRe
 sMo+kIvmuWj/UjWa+XAH9fRshAq0PLa/lfY/stHDOkSw3ASUtN1hi2M4a
 DwipArYBeZTcAbNkesh6xCfNRHytmR/3aFRGh6jVKA35GPC6mN6MVvxu4
 UiNKdbwcCpVuMusjFvmxNnvG7RyD91qzOeeEvRHCeSJdItaIrFMZSsnSU
 ZbQPJg11hulR9hqR44wzes4gi1Y0sWw58TkbzjGjmIpsTw463c6OE+uIe
 Z9Sg2wpp8ByWSpypiX0RdPdqbjhmPl2pPdIvODSpykOYGmZoOccFItgJ/ w==;
X-CSE-ConnectionGUID: 7z4yZ1l5SxKSuf+LaLmTmw==
X-CSE-MsgGUID: GAGzYVzFTRCGUGpWPuyh8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23807362"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23807362"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 02:34:58 -0700
X-CSE-ConnectionGUID: pfycgQycQduJLjmpj/PyvQ==
X-CSE-MsgGUID: 2IEbSrxkSsyVPskADeCNTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="64523821"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.127])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 02:34:56 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/2] lib/intel_batchbuffer: Introduce
 intel_bb_create_with_context_in_region
Date: Tue,  3 Sep 2024 11:34:32 +0200
Message-Id: <20240903093434.6959-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
References: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
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

This series extends __intel_bb_create to take memory region as argument,
making it possible to create batchbuffer in given memory region.
Existing helper functions preserve original behavior.

To make use of this extension, intel_bb_create_with_context_in_region
is introduced, that creates bb with given context in given memory region.

v2:
 - Support both i915 and xe in intel_bb_create_with_context_in_region
 - Extend intel_bb_create_full to use region argument
 - Fix igt_require in intel_bb_create_no_relocs

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (2):
  lib/intel_batchbuffer: Introduce
    intel_bb_create_with_context_in_region
  lib/intel_batchbuffer: Fix igt_require in intel_bb_create_no_relocs

 lib/intel_batchbuffer.c | 68 +++++++++++++++++++++++++++++++----------
 lib/intel_batchbuffer.h |  5 ++-
 tests/intel/xe_pat.c    |  4 +--
 3 files changed, 58 insertions(+), 19 deletions(-)

-- 
2.34.1

