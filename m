Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B43C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 05:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC10A10E0BE;
	Tue, 27 May 2025 05:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3UURHfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7FC10E086
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748325252; x=1779861252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WJ7waF+exJP0/V9uoGcX45CHyiXkedc+kRMWDe3bVVQ=;
 b=i3UURHfXlPOM9KMZJ/DqqzJNJZBbn8RiG00/kMWVoN7AalCcgRsmjzJ4
 ir/J2PB/azumqHlZbgoN2dVSQkClyN8lAW06v3X94n4+Sy9dPLYHQX2+n
 KsCyOGXYLKU2YPfAyY96EjtjYdjMmUGTdTv0St9j78O58w7oWu9RaArzk
 sgEesaMWKaxJ1StMqnXXM2QePJfyl584ONMedGh1Md3tcSQ+1QSgRFHSr
 vxCfVqoaj28D/rfmIWKwX5SxTuCWir6mFwoQC3MmtLWlGsyDy2uqo8TzD
 3XfNztBMOiRIEZL2mZ6grjw0o/v4pVO4a1LdGTPa6lP+cE0tybhel9xSg w==;
X-CSE-ConnectionGUID: C9hk2HC3S0ikPu4FSF5PBw==
X-CSE-MsgGUID: pYtBnqLhSxmLZ9UHtApiUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50455622"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="50455622"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 22:54:11 -0700
X-CSE-ConnectionGUID: JpCl4Y5TTw2EJRPrd7P/fg==
X-CSE-MsgGUID: G8x0wtTWSYy6x2DM+JgQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="179842222"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 22:54:09 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v12 0/5] Support for IN_FORMATS_ASYNC plane property
Date: Tue, 27 May 2025 11:23:38 +0530
Message-Id: <20250527055343.247952-1-santhosh.reddy.guddati@intel.com>
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

Santhosh Reddy Guddati (5):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers
  tests/kms_async_flips: Add test for all async format modifiers
  tests/kms_async_flips: Remove allow_fail flag from async flip tests
  tests/kms_async_flips: Skip Async Flips with Linear Modifier

 lib/igt_kms.c           |  73 ++++++++++--------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 161 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 194 insertions(+), 47 deletions(-)

-- 
2.34.1

