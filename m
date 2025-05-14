Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7DBC3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 20:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0695810E742;
	Wed, 14 May 2025 20:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUltuZie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2B10E742
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 20:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747256284; x=1778792284;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mx2hKWhSWifSwOecvtE8ueLK92FebGMoQQIOwzKnBiU=;
 b=hUltuZie3/HzG+KlrM7Eb4jBp5SC0R9CxNjcxY+icMEfUT3V+cvWpe9p
 4ON2fGHonAjApBTrJx4lEpyGCN0cz2z5+Z55IkPIoNJYgBV2iMvHQiJEJ
 bJS3t3VRYTSTcUIxuPKvUfUxyGe0SyfG2lz9ILhg6Tm3umfAe4CgiMW0Z
 63GKFpEK6V/ilZoQ5aQJNGaK+/1hBE1E8L9Awevb9rjkBox96lNEVdc1z
 grMLswHhNvS+ZNn/ukQIWNH/DtBnpbm8FplKbL9f2+r62UBVpwdKKDhU5
 eXAOOk0cGFvqTPfBY4iHQjFJnhNLQOUE6w1F9tB8tM9ixY3feFMPc5hr4 w==;
X-CSE-ConnectionGUID: lXBBF/yfTMCPNNwvEeS7Lg==
X-CSE-MsgGUID: FRokHhnLQhOB4FobL8d/yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49067595"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49067595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 13:58:04 -0700
X-CSE-ConnectionGUID: AnP3BHU0SPK0t2IV39QLgA==
X-CSE-MsgGUID: Y0vaxrNERVGGirUI/N1yRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138573973"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by fmviesa008.fm.intel.com with ESMTP; 14 May 2025 13:58:02 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH 0/3] tests/intel/xe_exec_system_allocator: Test to validate
 SVM prefetch ranges
Date: Wed, 14 May 2025 20:57:58 +0000
Message-Id: <20250514205801.40253-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test validates prefetch with single range and multi ranges,
and stree testing of prefetch by binding address ranges with different memory
regions to check the expected bahaviour.

Verified with KMD SVM prefetch changes
https://gitlab.freedesktop.org/hghimira/kernel/-/tree/latest_v6_to_be_sent?ref_type=heads

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (3):
  tests/intel/xe_exec_system_allocator: Test to validate basic SVM
    functionality
  tests/intel/xe_exec_system_allocator: Validate preftch of svm with
    single and multi ranges
  tests/intel/xe_exec_system_allocator: Rebind the prefetch ranges

 tests/intel/xe_exec_system_allocator.c | 205 +++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

-- 
2.34.1

