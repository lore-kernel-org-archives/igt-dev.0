Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9304CCFA13
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 19:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4369B10E12B;
	Wed, 29 Apr 2026 19:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JfHYOvbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA88C10E12B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777491755; x=1809027755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tvpx1pSTS1EnYyVySJGHgxPn41Kzc9yoBcq5CFzxkZ4=;
 b=JfHYOvbeRsT3c7vrJH+XGLUB6eniQYMOBEM35nD/vEiwzCdZbQxE/xbB
 PwBhQEHFbgj0DTvelsFTri3px95C7kj2rKL7lag8ixiMWOHfjeOw0OGp6
 qCqwp1ZAeZ5Vkw23yT4mGjKCj/Kt9GFzuG7OkCgjzhkLH/93n8EHVmi9f
 342fHkY4bXeYYn0MHo7LYW89o7+YhgyNuTWu7Acd/qpDyPOh10wC+TfUq
 efPMRFtlDdKH2z6xyl0l+4yYfE9omjKI740XLlQd8jM3IZLT+xhF+c1ux
 KraHTP2hDeF5Ts7GGY4EO+MJO8Sk7/ApotWoU5Nwnlos4z7ClBeZ/hwhB Q==;
X-CSE-ConnectionGUID: 3xlQbJk8ShW9BBSgHccEYw==
X-CSE-MsgGUID: iwidXMsISzyRuRW5PQI1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82295696"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="82295696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:42:35 -0700
X-CSE-ConnectionGUID: vP+ZxRBAQ1mAuzUi6Kw0Dw==
X-CSE-MsgGUID: W655iNlmSO+DYw3Pxbs1NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="229761998"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:42:33 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v5 0/4] Add dsc+bigjoiner subtest
Date: Thu, 30 Apr 2026 01:21:11 +0530
Message-Id: <20260429195115.2332923-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

New subtest is added to validate dsc + big/ultra joiner use cases.

Swati Sharma (4):
  lib/igt_kms: Add igt_get_joined_pipes_name()
  tests/kms_joiner_helper: Add igt_is_joiner_supported_by_source()
  tests/intel/kms_dsc_helper: Add helper func()
  tests/intel/kms_dsc: Add force dsc and joiner test cases

 lib/igt_kms.c                   |  22 ++++
 lib/igt_kms.h                   |   1 +
 tests/intel/kms_dsc.c           | 206 +++++++++++++++++++++-----------
 tests/intel/kms_dsc_helper.c    |  54 +++++++++
 tests/intel/kms_dsc_helper.h    |   3 +
 tests/intel/kms_joiner.c        |   8 +-
 tests/intel/kms_joiner_helper.c |  33 +++++
 tests/intel/kms_joiner_helper.h |   2 +
 tests/meson.build               |  17 ++-
 9 files changed, 262 insertions(+), 84 deletions(-)

-- 
2.25.1

