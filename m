Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D41C3ABB9
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 10:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EF510E04E;
	Mon,  5 May 2025 10:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpMAnzc8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8563510E04E
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 10:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746439598; x=1777975598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Bvlw6DiQ3RJuB4QjKMf76AfF18RcxL0MD5sDiS8Fhk=;
 b=TpMAnzc8cFLRliCNHc1eTkSmayqpwQE++Yv3p0UWrxRjA1qxkqnMRhQG
 k6ngwMhBqH++g5jOMBfjPJmZ1+n+rKpUCiiwouGwoRIokzgXrQB6Ci0Rn
 lma41ipU8t0ck5e5d0Xn4muc+xccmvXfCIWFqRRiC2HgFPQCEzw1R3eIb
 BoM2Ovn3qdyZf1VaB6XDAo9qnOT66OyPbukoNhY6ZFOWGhyCSav8KUS4F
 cOzQ0TzidG3aAuqbBbxhfUjsL8t/REgENIyvBdaP5V1ljh9HhRZwV9FBE
 e8E9OF/CKb3kgJNdQwFCbowe7VR6PVLk3Ua1N6lh1CILztO/1GLFW32l2 A==;
X-CSE-ConnectionGUID: YrVgfunxRYa2urLd1jqRHg==
X-CSE-MsgGUID: zmZpX8N6QBylpOBa4CuMUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47947352"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47947352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:37 -0700
X-CSE-ConnectionGUID: ZfSF3IErSl66LpuFypK5Rg==
X-CSE-MsgGUID: 4Lz54jYtRs+eABCdHW/5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="172437762"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t 0/5] Add more tests to validate engine activity
Date: Mon,  5 May 2025 15:59:41 +0530
Message-ID: <20250505102946.159655-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add more tests to validate engine activity

1) engine-activity-single-(load/load-idle) : Validates engine activity
by loading a single engine and checking if others are idle

2) engine-activity-all-(load/load-idle) : Validates engine activity by
loading all engines simultaneously.

3) engine-activity-most-(load/load-idle) : Validates engine activity by
loading most engines except some

Riana Tauro (5):
  tests/intel/xe_pmu: Add a helper function to check and end cork
  tests/intel/xe_pmu: move descriptions of tests to the top of file
  tests/intel/xe_pmu: Add tests to validate all engines with single
    engine active
  tests/intel/xe_pmu: Add tests to validate engine activity on all
    engines
  test/intel/xe_pmu: Add tests to validate engine activity by loading
    most engines

 tests/intel/xe_pmu.c | 315 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 279 insertions(+), 36 deletions(-)

-- 
2.47.1

