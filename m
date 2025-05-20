Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF268C54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F710E525;
	Tue, 20 May 2025 19:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBoCBV64";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9A610E575
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747768186; x=1779304186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X0VW3EjNnW/TdQopYqdPqJQ41elXIPoc+3okP63b9I0=;
 b=BBoCBV64mFkip9q7jF6VZaG68boeE9sQmqyPLDUQQfbdJcNXdiK/us43
 8/yQbopYXdBW8GuDIN7g8UYUsWld8JlUlwm9JhssUQ/C99lPcsDO7Gyd4
 22hYebBmy7hBMKMxSOFVEjk/o/rO2kY8kNovwN0Pswl08aJt2+Ta36Q0l
 j5kvR+zKDRkwKTX3GhLvf+1IlYBo5EU7Al3rXdiBWd6NAgSmPXn+aMl9P
 DmcOxgFy9SZhq2LcBEwOVXQ504Tv4cg0P6nzicrSd3TCIV/CKSXxjMRkc
 OrGcesHOeRNvsJ63wKGkzR4MosiB6OnKQD2xhmZd00Jw2gldxIIlTSu9i Q==;
X-CSE-ConnectionGUID: mYshw+RoRVmUjqd8svmghw==
X-CSE-MsgGUID: VoWEouCmSGa8k7OFxZ4x8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49420875"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49420875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:42 -0700
X-CSE-ConnectionGUID: VOLyX5CjRQSR3vCHWnE4Ug==
X-CSE-MsgGUID: mFdqxmodSXe6pJdoDvtsjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144524865"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 0/5] Update image assets
Date: Wed, 21 May 2025 00:39:06 +0530
Message-ID: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
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
 runner/settings.c                        |  29 ++-
 runner/settings.h                        |   3 +-
 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 274 +----------------------
 tests/meson.build                        |   7 -
 13 files changed, 73 insertions(+), 464 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0

