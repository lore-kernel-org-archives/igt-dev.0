Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22749C77B7F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 11:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3A010E35C;
	Mon, 23 Jun 2025 11:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8FO4eB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301E510E35C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750677098; x=1782213098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l2DnMm99MJC55A8q6itMsSLv7vm7EbHlTMveM6ebHRI=;
 b=c8FO4eB1501VJS53CVYLZu/CgkgNiCYXew7kJDhgDzZj38B1wdgXoh7t
 4V5D6MX0NL0l+IhPoVTP/9/g1O0Bcca6C91DUTwYJ8SDwlG0sW1rNqsDf
 VOu7vT5glQm0Peb8UrYS2HqImAWmV2VuxtYSVZNDss7WFCiuBX2vcv++m
 e+J4CtpvY/Cv+3Roxj2PVfnDSHZgi7JOc4LYPnjWkaE7lhg4w0WH9l0/x
 iE45vuy5AIJyyWdiAEmSFbgGsTR3sazB2kNfSS1LgIYx6GJT/x8TtKF7f
 KLJ7jS0l+nDWY9+YGP4SvOuPv7LNCpGyCg3S6pNjt+3qmBDoxw3XFqvKL A==;
X-CSE-ConnectionGUID: vq8NnBVQRLOiFeM6fB3biQ==
X-CSE-MsgGUID: 2K++pDdkQgSvOcT8rkgtyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53018902"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="53018902"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:11:38 -0700
X-CSE-ConnectionGUID: Vxc6LHO2TCCsVcbsI90m6w==
X-CSE-MsgGUID: dluQuFqoQdinp+Uu+l5uuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="157063739"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:11:37 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v15 0/5] Support for IN_FORMATS_ASYNC plane property
Date: Mon, 23 Jun 2025 16:39:13 +0530
Message-Id: <20250623110918.606014-1-santhosh.reddy.guddati@intel.com>
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

 lib/igt_kms.c           |  73 +++++++++++--------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 156 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 194 insertions(+), 42 deletions(-)

-- 
2.34.1

