Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DD3C28B2E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 08:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F1B10E545;
	Tue, 11 Mar 2025 08:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRKWqnmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731CB10E539
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741683540; x=1773219540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q56g4CcJdUd6lthdPD1nYoQ3Q3ZTlibNcL340bghKbE=;
 b=NRKWqnmn1NfvBMOnwUX1Uc76iyPGEH7S3XFawE9tr95LvIw+QhjZ46Bl
 NV3Wq0kmO/txHqisGOwVVv6c6sO3f7BH7pHhiYZXTsTe6zRnn5ScfWgHm
 LaWe23L0d+Qdb7Ff8zTmcq+ieJ9nksAX9SBGQdTez7cFUw/Y2brSRsE14
 R0pABPTUZy/i4QWBPpI1/6lFCf6HH7c4CbZV/B/E3gOgE+HP832J0TjGR
 VWZAFXmwSSAcdB+dlgmlICs5iXRT1eBFJf0o6fuI8Lrs41uSkaCkivqAe
 /Yp7nDOfeTAgaIJ0dXGxpMmMA5adD3HaRLiI+9dqzfs0y0lLS6hRTEjhl w==;
X-CSE-ConnectionGUID: Yn87u2dATri/MZ+yFPzt/g==
X-CSE-MsgGUID: LOnnfwufRu6CCNlughfDNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42822024"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42822024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:59:00 -0700
X-CSE-ConnectionGUID: ilh9DV42Rn27OR65Jt9qrg==
X-CSE-MsgGUID: NTGGY9KHS027y+dG3zGM+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120211236"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:58:58 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 0/2] Support for IN_FORMATS_ASYNC plane property
Date: Tue, 11 Mar 2025 14:24:20 +0530
Message-Id: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
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

 lib/igt_kms.c           | 46 ++++++++++++++++++++++++-
 lib/igt_kms.h           |  7 +++-
 tests/kms_async_flips.c | 76 +++++++++++++++++++++++++++++++++++++----
 3 files changed, 121 insertions(+), 8 deletions(-)

-- 
2.34.1

