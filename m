Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CEDE77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B894210E081;
	Tue,  7 Jan 2025 20:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aw4pPWVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8D310E77F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736280485; x=1767816485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NyCfmeulEVYK95VoOVlwmF4jnUzIpRXvNKngURlOIsY=;
 b=Aw4pPWVq5LPHNadiiIogrmklCY6oAu70n5PQABlDwQ0IalvcFtTlPx/+
 rh2aVdSEtZhtEkRnHGbYq6jev11L+mljKU3JXzlOgt86p9W7NQKt2pOdk
 inpR7k1OW8odT4jX5LRVzNoUBRTnSahjY+Q1JD0k6ca7+8xGq3DATcFys
 J0rbJu2/xYkGQFNZ6p00IvflZ9FDieStx3ZFEsqUl3zSCNdzut8UQfHpw
 EI/abpNNQsTJ9wSLjvasmSu8gpp96TwVb1rHNj2scz4SHdXPj0JPNvNf0
 l8rmONOoQsdwUxzYRKySTDsQgHCB9l7vxHfIctFOXYFGS/iiUONH60St0 Q==;
X-CSE-ConnectionGUID: 5+rXXMFBTtaxyxIOptMDjQ==
X-CSE-MsgGUID: Lb1JrOhdQR+AcRdexXO4aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36367052"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36367052"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:08:05 -0800
X-CSE-ConnectionGUID: mAENbcYLTUG1MXSCrsANMQ==
X-CSE-MsgGUID: 4nGzPgAnRh6yNs0UnqbN0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="102688332"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:08:02 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/5] Update image assets
Date: Wed,  8 Jan 2025 01:36:09 +0530
Message-ID: <20250107200614.963199-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Update image assets and improve file handling.

Naladala Ramanaidu (5):
  data: Move PNG images to new data directory
  runner/settings: Constify absolute_path parameter
  runner/settings: Add function to set IGT_RUNNER_DATA environment
    variable
  lib/igt_core: Enhance __igt_fopen_data to support additional
    directories
  HAX patch do not merge

 {tests => data}/1080p-left.png           | Bin
 {tests => data}/1080p-right.png          | Bin
 data/meson.build                         |  11 +
 {tests => data}/pass.png                 | Bin
 lib/igt_core.c                           |  31 ++-
 lib/igt_core.h                           |   6 +-
 lib/meson.build                          |   1 +
 meson.build                              |   2 +
 runner/runner.c                          |   8 +
 runner/settings.c                        |  11 +-
 runner/settings.h                        |   3 +-
 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 273 +----------------------
 tests/meson.build                        |   6 -
 14 files changed, 54 insertions(+), 466 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0

