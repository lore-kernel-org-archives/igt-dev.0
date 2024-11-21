Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44834D6ED2B
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 13:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DF610E947;
	Thu, 21 Nov 2024 13:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAXCUljS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5446310E947
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 13:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732196473; x=1763732473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uouU/wrnuEaGTpoXa1VFdn2TIiCSxfvGNaFJSgoWCEo=;
 b=fAXCUljSK9XSFswwaOVGbOcYB85MQI1tqeIyMDVHIkVo1J0lORCoy99m
 HYbFg82npJSkr5OAtjSu7v3qWPq1g7wJOwHjdoU2/OqyL+WjRXs7lQd8b
 ZLD1c315MbEWomHv6Xk3dWkyriAn4xBpyoXi5JaVoiiZN/SWZnsdECvy8
 smhnUsBtKc2OuqQEwA54oAjz0Q4PRPfKXVU7WPkLJvC+hSvepMUBKp3by
 DnNrWOzDDSGaQVvc99mcMWk1/yqvtF4Fmpd9TthqNQhPrr3igH5FZlpQb
 sRnqTM5vd0H6WyuZmi/UABctBZolDtjpWT+8vazuiaHPjW0axGz9PqWUY Q==;
X-CSE-ConnectionGUID: i8zmvuJCQMOisYkp9+oJ2Q==
X-CSE-MsgGUID: Oa60TpyESXu4zTv+hpslYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54809147"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="54809147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 05:41:13 -0800
X-CSE-ConnectionGUID: RtsaFOF+QNKdCeVqbv4auA==
X-CSE-MsgGUID: cwaOSghdSLqAtPQ2jssWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90192535"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 05:41:12 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/5] Update image assets
Date: Thu, 21 Nov 2024 19:09:53 +0530
Message-ID: <20241121133958.3382633-1-ramanaidu.naladala@intel.com>
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

Naladala Ramanaidu (3):
  runner/settings: Update absolute_path function to accept const char*
    parameter
  runner/settings: Add function to set IMGDIR environment variable
  HAX patch do not merge

Naladala, Ramanaidu (2):
  data: create new data directory
  lib: update fopen() to accomodate imgdir

 {tests => data}/1080p-left.png           | Bin
 {tests => data}/1080p-right.png          | Bin
 data/meson.build                         |  11 +
 {tests => data}/pass.png                 | Bin
 lib/igt_core.c                           |  17 +-
 lib/igt_core.h                           |   4 +-
 lib/meson.build                          |   1 +
 meson.build                              |   2 +
 runner/runner.c                          |   2 +
 runner/settings.c                        |  15 +-
 runner/settings.h                        |  10 +-
 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 279 +----------------------
 tests/meson.build                        |   6 -
 14 files changed, 58 insertions(+), 457 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0

