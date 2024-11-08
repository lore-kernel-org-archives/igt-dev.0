Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0CDD5E145
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 07:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA9610E0C7;
	Fri,  8 Nov 2024 07:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W46f4vhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22D10E0C7
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731051943; x=1762587943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LybFZy6oDL5NNeE4hiybshG7IkVi9acrlXBZc2aGsF4=;
 b=W46f4vhGcTk2il6dwoKgkCCuSuA4R4FsveHIxRvHOxBQvuicuNbShjTJ
 BWAAXNofFMFss1BomISwOwxbpQbkpYQUV1PhUsKNtL9CI0K765s/tS63U
 WjfjY/TFjyy8J42i8VryRrVye7kEYW01GHt6RpyMFk+6VKUkwYZraUd6T
 cvOuCFpBk6RS1pJDv65HH8Mnj1hsF6phmRKqaHveHpnRs+npi7lUi8ayO
 a661glhquwS0SjArPj8qvMVHwsItEuDULu9wvZOJrGI8UUmVra/tG2pKb
 PzP204BeMAXJEMsUh0+NVXTeWoIADAB+sdmCaWBxqgDkP6UR623hOsuPN A==;
X-CSE-ConnectionGUID: xR5qfF4OSIeBHnGIEf8UOg==
X-CSE-MsgGUID: bfOjqG1sSE2otlg7zKr9tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34616552"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34616552"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 23:45:43 -0800
X-CSE-ConnectionGUID: OK9Ki/3yR8COyB833CkxrQ==
X-CSE-MsgGUID: nNp0tXpFR2+iPRLy+t4EXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="122953734"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa001.jf.intel.com with ESMTP; 07 Nov 2024 23:45:41 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH 0/2] tests/xe_spin_batch: Add spin-timestamp-check
Date: Fri,  8 Nov 2024 13:14:01 +0530
Message-Id: <20241108074403.366318-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

move the spinner related functions to lib
check the ctx_timestamp register post gt reset for each engine.

Pravalika Gurram (2):
  lib/xe/xe_spin: move the spinner related functions to lib
  tests/xe_spin_batch: Add spin-timestamp-check

 lib/xe/xe_spin.c            | 115 +++++++++++++++++++++
 lib/xe/xe_spin.h            |  22 ++++
 tests/intel/xe_drm_fdinfo.c | 197 +++++++-----------------------------
 tests/intel/xe_spin_batch.c | 121 ++++++++++++++++++++++
 4 files changed, 293 insertions(+), 162 deletions(-)

-- 
2.34.1

