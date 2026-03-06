Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79556F513F4
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 06:04:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CF10E374;
	Fri,  6 Mar 2026 06:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ve68pUqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECCB10E374
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 06:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772777085; x=1804313085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0kfpIrCC0kMWR4MZ2ysBh6Znh+QA6kdKTQFpqV1mOU0=;
 b=Ve68pUqjRCctXNQxjAKHnjAisg3ggisbusNSARD+MIOQY+eVMe5mBXay
 fQZ9y6eKpXa3h6xfDsyBn2aduY7oLX/zKaFNLPo/8HOycqfjs3FcU/AO0
 s0jM6rYPGQThtloTSDp8L9vcXWBlBd8HW/gRmXELdWzrOke+ctaC791IB
 EsIIstWYIRNVKjLPVj84X/jIaE7QwZCCDNZEs72SuetL4u5BD9KCKUPk/
 ihEDRbNPGSdFEfPwkc5qzICX42BUGhTaq5Ec7U7KXmV6aC5uFPGfrdPdG
 DxbumQrSmXZeDw5Kj4JWz/auAqiW2baUBtWPRZkaD4xG7fmKSLO7OO2ak g==;
X-CSE-ConnectionGUID: KgciNf3KTHqQX5zMuB6Byw==
X-CSE-MsgGUID: It45M6PoToKl+FWzABIPIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73955342"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73955342"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 22:04:44 -0800
X-CSE-ConnectionGUID: C2WzG80ISqu97Mw4rmmhyw==
X-CSE-MsgGUID: 5G3hwU3EQhyYTZF1rgzk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="223048519"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 22:04:42 -0800
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Cc: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Subject: [PATCH 0/3] Implementation of Negative tests for VM_BIND Decomp
Date: Fri,  6 Mar 2026 11:34:59 +0530
Message-ID: <20260306060459.625887-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND Decompression.

Patch 1 introduces temporary helpers and UAPI definitions required
for the tests while the corresponding positive test series is still
under review.

Patch 2 adds resource management structures and helper utilities
used by the VM_BIND Decomp Negative tests.

Patch 3 implements the actual negative tests covering invalid uapi parameters and
ccs corruption scenarios.

Smitha Balasubramanyam (3):
  igt/xe: Add temporary helpers for VM_Bind neg test
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 include/drm-uapi/xe_drm.h |    1 +
 tests/intel/xe_ccs.c      | 1395 +++++++++++++++++++++++++++++++++----
 2 files changed, 1275 insertions(+), 121 deletions(-)

-- 
2.43.0

