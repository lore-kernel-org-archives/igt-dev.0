Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4308C36005
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 21:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564F210E5FB;
	Tue, 25 Mar 2025 21:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8GAesgF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B055610E5FB
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 21:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742936528; x=1774472528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8IZdh0clL9AYzV10XAmeDVVNXbWUjsdvLlh8AzlE5xM=;
 b=n8GAesgFqsLaur/45sSyJ8rrtcv9m4OI9CWzbsp75cBwbDAiecNEzEZ1
 3CaLMIwvzu+loXofDO5YQaGG0liBhYBFcGVs4pijwhtc4qUnyew3KAp7V
 RPL8k6++TlJ9FBqDzFP69bIs0GYhzR178Un+3MgbbIajkjzT7t5I7uaWN
 fCMUN9KTZJkBOhuQv+IdTBY3zuzDF8oMKt70aMoN++uG7+DE9hVmCOKuA
 g9gYgTdjyhq+vjvMbSWlJBcAuQwVNgCMoo19aTkKPgLBaaISG2YnO5qc0
 NoxVbbrx79L7WeLdyGMi7RVipiRCiBeJEgkOsiG8fZndiHZH0cGk6G6sU w==;
X-CSE-ConnectionGUID: pc0dis8DTPaSuHCsw6ZH/w==
X-CSE-MsgGUID: 6cp6KmNXQeiIapr5ks3dDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55584496"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55584496"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:07 -0700
X-CSE-ConnectionGUID: rAs4sG61Tt6SE/XpmMiiNA==
X-CSE-MsgGUID: NL3RO/6LR6yB8wH5VEAp7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129164662"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:05 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 0/5] Update image assets
Date: Wed, 26 Mar 2025 02:31:41 +0530
Message-ID: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
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
  runner/settings: Add function to set IGT_DATA_PATH environment
    variable
  lib/igt_core: Enhance __igt_fopen_data to support additional
    directories
  HAX patch do not merge

 {tests => data}/1080p-left.png           | Bin
 {tests => data}/1080p-right.png          | Bin
 data/meson.build                         |  11 +
 {tests => data}/pass.png                 | Bin
 lib/igt_core.c                           |  36 ++-
 lib/igt_core.h                           |   6 +-
 lib/meson.build                          |   1 +
 meson.build                              |   2 +
 runner/settings.c                        |  24 +-
 runner/settings.h                        |   3 +-
 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 273 +----------------------
 tests/meson.build                        |   7 -
 13 files changed, 68 insertions(+), 463 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0

