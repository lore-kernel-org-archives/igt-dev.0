Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF79EE644D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643F410E1AC;
	Thu, 12 Sep 2024 06:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPo3trQu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD41410E1AC
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726121802; x=1757657802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lY1y7eLZexnX46oqpXgUKguek8AVzGMqPOOhAbs01Dk=;
 b=cPo3trQu9oV32Q9FN2T/1NlWQ25dU0De60p57Y79MuWEuKQ1S6ecqTBQ
 +cXp9yw71mq3KCa3Z4fm8dj0t4/zFcjkYlkfLyDjCOFWv+Hg27myiPkTA
 beyCbd9OGnkhTCnr/ApY6vZnO14wndvqGZft0uwnQyAJFVwDCuAwIvRr9
 g1P05O2O7Ez3oPPt+py6mmP8KEkYMwuWzCRGkYQoIaabVeBu/TWkZ7za1
 R5bKZ8NVKP7dv3Ll8wdTMlHJWANf/WsMdVSOe13uSw/JV51HjtqroLu86
 5O7MqBsCxRkcgxkeHCSamrSt7zOAx+d4079TfdjXug4K+pvNeVMGGDXLu A==;
X-CSE-ConnectionGUID: nCjuumQ7Rkmq/aKo6KdqTA==
X-CSE-MsgGUID: g+H3NOzkRk6qQWhs9ZfR/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25056613"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25056613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:16:42 -0700
X-CSE-ConnectionGUID: c3VLYHi5SlqXG8zjCSdJvg==
X-CSE-MsgGUID: Y6/GK39LTuKCh7/uBYP7uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="98310262"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 23:16:40 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/6] add test to validate fallback
Date: Thu, 12 Sep 2024 11:58:33 +0530
Message-Id: <20240912062839.760661-1-kunal1.joshi@intel.com>
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

Kunal Joshi (6):
  lib/igt_kms: add DP link management helper functions
  lib/igt_kms: add helper to set connector link status
  lib/igt_kms: allow set and reset value to be same
  lib/igt_kms: add function to reset link params
  tests/intel/kms_dp_fallback: add test for validating fallback
  HAX: Do not merge

 lib/igt_kms.c                            | 301 +++++++++++++++-
 lib/igt_kms.h                            |  13 +
 tests/intel-ci/fast-feedback.testlist    |   1 +
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/kms_fallback.c               | 423 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 6 files changed, 733 insertions(+), 8 deletions(-)
 create mode 100644 tests/intel/kms_fallback.c

-- 
2.43.0

