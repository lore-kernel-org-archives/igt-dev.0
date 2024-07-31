Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B15CC3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FB310E639;
	Wed, 31 Jul 2024 14:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kah4y8lw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F6810E639
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437525; x=1753973525;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AhKhgi+2D1s39q1dUm1MLve19u9zsvKn56EBC1IZZZU=;
 b=Kah4y8lwfeYLPvd8L6lSqzFElJPT/VcmHFGQB2j9CEKcj2fFD3YNlHvd
 OVsSA188QG6+A5srQOhsqkg8kSQ8P2XdUpSYaS5OwcmSzFXnWaFQCkrJB
 dI6GzKAJ1SDQe2Sg5e0uCVA6o1hStZor9Q6gyu3iEoctlQd3PhR1viIKg
 IcoT8b/C7z3m+1ruRd9yvlI9Y8dG0XJKQrN8TmOZO9aAj2mzYUOB3kewH
 srb8piMQxKQenzcxFsRTDf8My9tIwy0Ir3ZLp8TGZfW5YwfqZy/filBg3
 CU9oXci/Hk86xUiuuW9hWJ7Sm/nGEXHSmLbYP2vYDJsUqsPwwBm65v7EB A==;
X-CSE-ConnectionGUID: sPfVTGaBR7qZ05uPzBNF1A==
X-CSE-MsgGUID: mRQGHtxPT2SJSYgJ3t4akw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37838490"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37838490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:52:04 -0700
X-CSE-ConnectionGUID: reGx3MlNRN+Qy2w2bc4peA==
X-CSE-MsgGUID: 3LJ88KGkQNumxoZZJCVMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="58845506"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:52:01 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] New test to validate link-off between active
 regions (LOBF)
Date: Wed, 31 Jul 2024 20:32:49 +0530
Message-Id: <20240731150252.2951870-1-jeevan.b@intel.com>
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

Add debugfs entry to validate LOBF status and create a new
test to validate and fix typo.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  lib/igt_kms: Added library functions for LOBF status
  tests/kms_vrr: Add new test to validate LOBF

Umesh Nerlige Ramappa (1):
  tests/intel/xe_drm_fdinfo: Add basic-engine-utilization test

 lib/igt_kms.c               | 23 +++++++++++++++
 lib/igt_kms.h               |  1 +
 tests/intel/xe_drm_fdinfo.c | 33 +++++++++++++++++++--
 tests/kms_vrr.c             | 59 +++++++++++++++++++++++++++++++++++--
 4 files changed, 111 insertions(+), 5 deletions(-)

-- 
2.25.1

