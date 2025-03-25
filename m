Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5A8C3600E
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 12:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C030310E536;
	Tue, 25 Mar 2025 12:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4eI2/qO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC5A10E39A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742905320; x=1774441320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uZgboRQksiexzcc1hyaRlcPoGWUpKUjYM2ZAG/zYxic=;
 b=E4eI2/qOYzxGfYcgILT2HUnGzL7iExgc6ARuFowVUV9x1O8xvFSufvLD
 Mr+8nDYfGDup1ibPcKeDNC6C2qGA2JX2Zyey+ZcKZpKUd18lwBs+zw9aF
 jFn7GiJdc9YW1ryFtT6jbQBE2fsYwgDvXMvorBaxQmjhEavtEUlI5IFPQ
 U+ibkmz/JBVXIYXm/noltIcOLVDPcjfmdmmO27xN9Gih5Em6bd8YffGjN
 IWS8ZiqviByihvq6JjkCu2NpOUikDmxqW6nT51Cxj2akIgBUgSFQ/MAN+
 ZeGpm2RMP3ZDhHzYcH/VrGMsG0R287UrcaALRH9SFhFBzn+CVNphx6dnI Q==;
X-CSE-ConnectionGUID: naQvAvYOTeCYoALA9zB++w==
X-CSE-MsgGUID: 9jafLkPtRlOp1CCsgJ8siw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="48022625"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="48022625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:21:58 -0700
X-CSE-ConnectionGUID: NICB6J0jSPyo88CcpEzpOw==
X-CSE-MsgGUID: ebhRWm0QT1yjbJIyQKwYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124391523"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:21:56 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 0/4] Support for IN_FORMATS_ASYNC plane property
Date: Tue, 25 Mar 2025 17:46:21 +0530
Message-Id: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
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

Santhosh Reddy Guddati (4):
  lib/igt_kms: Add support to retrieve async modifiers and formats
  tests/kms_async_flips: use in_formats_async for async modifiers
  tests/kms_async_flips: Add test for all async format modifiers
  tests/kms_async_flips: Remove allow_fail flag from async flip tests

 lib/igt_kms.c           |  55 +++++++++++++++++-
 lib/igt_kms.h           |   7 ++-
 tests/kms_async_flips.c | 125 +++++++++++++++++++++++++++++++++++++---
 3 files changed, 175 insertions(+), 12 deletions(-)

-- 
2.34.1

