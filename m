Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A1BC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 09:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF37B10E0B0;
	Tue,  3 Jun 2025 09:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yyo2uuNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42FB10E0B0
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748942936; x=1780478936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ndudIwZWj7ehmJXgVWJDehbhVLrdOZbGH7+psn4AOWg=;
 b=Yyo2uuNLbINoN2T69Un5LsmGeK5/ReFEBpl+tHQYeKRzOWJ812yw/MpZ
 yuQNyaTApfx6Jc9Q+bAMlb3DYcomm41Dlb6ZQcNW1MtVKNUQM7WyaiMtR
 L53seTeYBRm7WsJodxPFDeOmvn0dqePRbjrzlZvBrC3ARGfpfBl8fVDvJ
 v0+xwv9xyBqDOfB/zTiqjymHjj6S1OVTc/dnZB7aOxX2Yjx1ooS/aNBYz
 kFm5p8xMQG36LKeBQh36UEtq4p0D9tJm7zo1ZitjqiHpIuFZNsLdrIMg0
 ZnKIzPX1D2r1icYEcgLp0JKvIp+Eb5Pd9WES9csWkD+jAbViCq6Y12XI+ Q==;
X-CSE-ConnectionGUID: g1lllvVTQlymIUS9P4+NtA==
X-CSE-MsgGUID: cN751QRWTQ2t9CmESibskA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50892401"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="50892401"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:28:56 -0700
X-CSE-ConnectionGUID: /mkl4GUXR2aZIU980+K9Yg==
X-CSE-MsgGUID: ozdq71+MTSWgi25GYRgJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="145760948"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:28:53 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v13 0/5] Support for IN_FORMATS_ASYNC plane property
Date: Tue,  3 Jun 2025 14:57:53 +0530
Message-Id: <20250603092758.371150-1-santhosh.reddy.guddati@intel.com>
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

 lib/igt_kms.c           |  73 +++++++++++-------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 167 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 200 insertions(+), 47 deletions(-)

-- 
2.34.1

