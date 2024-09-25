Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B003BCCF9E7
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 18:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC9110E2F3;
	Wed, 25 Sep 2024 18:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIvLjn6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C23A10E2F3
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727288265; x=1758824265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1aSC/0wUG8xwgAfnHzkiIv6ABa8lCtSXnbH/QBwQ9Dw=;
 b=jIvLjn6TbUkor77oQwU0lL9YTOl5M16rOVz6V78eJfaVjrkJ4OAt6q8y
 OqjQiDyEPPcsP1UNiUeaLrD3LcUXa3A6SVoxq10Ltf3Z31m+h9hAYXywy
 TsQUQ4X136Lep0AGXvZsf1Y2hNtCXdNBruWDM+xOt8WAPrqDWxbFuyRg2
 SjF0lAh+A1mK2RYFa/gtKKRXrNBJFAxLjqOCL6F/abYFAPK+4Wk5ZJsyW
 +TqMZhsLmKmaeajOgrHKy0H2U0eIFSW+wFYKIszjfxrU6I+o3MJyQ6uHl
 4BkJ5z8PactNFgCW05bW06C8sBPfIViQwVUufOqVCMxTRIPX3kZ5sDAUa Q==;
X-CSE-ConnectionGUID: 9IQJdqLaQCq+/WtIQq9LPQ==
X-CSE-MsgGUID: svJfQeaITrubY7FtcTm61w==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37032350"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="37032350"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 11:17:45 -0700
X-CSE-ConnectionGUID: qIvGdIHXSFGTKav6rMTGnw==
X-CSE-MsgGUID: B1u/IUs+Rjemcn7apw+Zlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; d="scan'208";a="72324292"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 11:17:44 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/7] add test to validate fallback
Date: Wed, 25 Sep 2024 23:59:37 +0530
Message-Id: <20240925182944.1603015-1-kunal1.joshi@intel.com>
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

[1] provides debugfs interfaces to force link training
failures, retrain link, set/get current/max link rate/lane count.

add new test using newly exposed interfaces to validate fallback.

[1] https://patchwork.freedesktop.org/series/133624/

Kunal Joshi (7):
  lib/igt_kms: add DP link management helper functions
  lib/igt_kms: allow set and reset value to be same
  lib/igt_kms: add function to reset link params
  lib/igt_kms: fix helper for dp-mst connector id
  lib/igt_kms: Handle EINVAL error as well
  tests/intel/kms_dp_linktrain_fallback: add test for validating
    fallback
  HAX: Do not merge

 lib/igt_kms.c                            | 371 +++++++++++++++++++-
 lib/igt_kms.h                            |  11 +
 tests/intel-ci/fast-feedback.testlist    |   1 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/kms_dp_linktrain_fallback.c  | 409 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 6 files changed, 781 insertions(+), 14 deletions(-)
 create mode 100644 tests/intel/kms_dp_linktrain_fallback.c

-- 
2.43.0

