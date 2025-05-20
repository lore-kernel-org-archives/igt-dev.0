Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714FAC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E8710E3EE;
	Tue, 20 May 2025 06:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDeFNbnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914D810E3EE
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747723243; x=1779259243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6E7ra795JtavHJU51DM+OqbpCae7qxvjw/L/Rhxbhc8=;
 b=dDeFNbnQrc7K1BuRdv7kqX8veAxRrKGH4vQ1UeK3+wLn2XDIYsYecigN
 9DFenmRyHNOZdt93/Q0M2PMpoabMdoGDv8v3iNe3nvdIfyc86g+k8qYvQ
 YJPvVTKHoKixFEBq4O1N4DJ/bkXLZZ16V/wARmlyq0QLoKwjtR6JjHj2g
 lGEDSdyCDY3u71f13UDS5gajSyUn7kPSCHM5vtL6ypQMaLm+5YXd3+46B
 e6TZQUaZ01o3CHzrd7m0iuRMa2DRGLGJxoccH/01lR9L69b9yYKkAAJ8w
 CHHVlJ1J3rFFtq9+wtg9NgoNcRXciJLVwDK6e1gYi7Oj56b2o96i3LCiY A==;
X-CSE-ConnectionGUID: TfF5IFiwR166iF9tWxlT6g==
X-CSE-MsgGUID: f9rS5wPERK+YyIeGD/pFSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48755440"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48755440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:40:41 -0700
X-CSE-ConnectionGUID: UE3XjOPQRX6dz/Pyh0uS1A==
X-CSE-MsgGUID: Y2hZRS50Rba9Umi8GeDSCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140105723"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:40:40 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH v9 0/4] Support for IN_FORMATS_ASYNC plane property
Date: Tue, 20 May 2025 12:01:19 +0530
Message-Id: <20250520063123.3309554-1-santhosh.reddy.guddati@intel.com>
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

 lib/igt_kms.c           |  73 ++++++++++++---------
 lib/igt_kms.h           |   7 +-
 tests/kms_async_flips.c | 141 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 174 insertions(+), 47 deletions(-)

-- 
2.34.1

