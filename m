Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B337C021A1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A7A10E739;
	Tue, 11 Feb 2025 17:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f02gjjlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6DB10E254
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296206; x=1770832206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=af/3zoviBHJye8pwtdagGUCNDsZ7ofFQTrwKqMQAglI=;
 b=f02gjjlMBu0hSshmTdhWsGLUcTzuw0jqzdrnSk3eZbgeiLBbGcvoHKB/
 ZEO8PAk8xEJQe94MRxc7sY9j5SRqFisGSSjKAWRlOuy13vIbNUPBRjpid
 JNgJGIOUzOuBnWzfnDlzqgXzGl489+Cn0kp9K+kz/sNTiQ1H3UzWyNEJr
 LDb0c9LT35M6oGbAQOsqC7NiSrFOdbQBKA4oE/3siAztXGVPBG0B1f0vB
 DQTWPj/7ycz/AE7aJDOiACsUzDZk+Q/8iqrp4CQc49oW0GM8GPaR0S9RP
 donPBmLapouwtJyS1evTiDuWEd+XOB56QTEna8tRDPVbp8amkGoN1nrOL w==;
X-CSE-ConnectionGUID: 9nW566TrSxm1c576xuXpxw==
X-CSE-MsgGUID: 9hzwzOxlR0OtOsLF4mB1HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339094"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:05 -0800
X-CSE-ConnectionGUID: U24KtTqqRmKZ7zH4rzne4Q==
X-CSE-MsgGUID: C2zDWxoNT6uaPoZSxEKRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767459"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:04 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/7] add dsc-fallback test
Date: Tue, 11 Feb 2025 23:35:35 +0530
Message-Id: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

Add test to check we fallback to dsc when current
link params cannot accomadate bw required by
the current mode.

Kunal Joshi (7):
  tests/intel/kms_dp_linktrain_fallback: refactor find_mst_outputs
  tests/intel/kms_mst_helper: add helper for MST-related functions
  tests/intel/kms_dp_linktrain_fallback: refactor dp-fallback subtest
  tests/intel/kms_dp_linktrain_fallback: fix typo
  tests/intel/kms_dp_linktrain_fallback: add dsc-fallback test
  tests/intel/kms_dp_linktrain_fallback: disable ignore long hpd
  HAX: Do not merge

 tests/intel-ci/fast-feedback.testlist    |   3 +-
 tests/intel-ci/xe-fast-feedback.testlist |   3 +-
 tests/intel/kms_dp_linktrain_fallback.c  | 356 +++++++++++++++++++----
 tests/intel/kms_mst_helper.c             |  48 +++
 tests/intel/kms_mst_helper.h             |  15 +
 tests/meson.build                        |   3 +
 6 files changed, 367 insertions(+), 61 deletions(-)
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

-- 
2.25.1

