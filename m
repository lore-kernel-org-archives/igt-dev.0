Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FF8CA1016
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 17:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318AF10E583;
	Mon,  8 Sep 2025 17:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSoHDEap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F021910E583
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757351670; x=1788887670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=430gSwH8a5rQ6WBx9GwFuoF3PTGo/XPQyDeb3l4iQdc=;
 b=MSoHDEapXIUWDv9rOdFctJCZ9+48OpS/ZYfSIMstt243wTjtb3iLkvqJ
 F8RSn95aJFQZ5WiI1WURQfbu83DQvBG/6Hz1nmUdDj/Du+okHpq0Gha+u
 1uFj13oGm4qnx54oDfByRDf9BQv+SSK04e6aZpJ5I5cvFq4X7o83BCNzl
 GiXz/okkTfMs0AJZfAUp/vtiNr4yXeb/Lk05g6tm3z90jOtFvH6KBNzXg
 pVHSKt9hEB/ra0y6wEdOpmLPM5QoKwXphIEAG+iRRPhPceXRa2ufDOtHV
 85uKFD3M/PMkKfWg+RHrS1NFTQUtnZbsqcok6WB7iDDPA0AUGhlYJNRlO w==;
X-CSE-ConnectionGUID: pPQOGY2wSjWFW+nvbp3VWg==
X-CSE-MsgGUID: uUAKH0ISRL2FAaeOwp9OHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59543985"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59543985"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:14:29 -0700
X-CSE-ConnectionGUID: jJH3kTCfRImRBCbHfgzwyA==
X-CSE-MsgGUID: Q0BDiP4KRxOIfmosuiR0Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; d="scan'208";a="178057342"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 10:14:29 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v2 i-g-t 0/1] tests/intel/xe_compute_preempt: GPU
 Compatibility check
Date: Mon,  8 Sep 2025 17:14:20 +0000
Message-Id: <20250908171421.1787165-1-sobin.thomas@intel.com>
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

On platforms that do not support walker mid-thread preemption, running
tests in forked threads can lead to inconsistent states due to
igt_skip being called mid-execution. This patch introduces a GPU
compatibility check at the beginning of the xe_compute_preempt test.
If the GPU version does not support the required features, the
entire test is skipped gracefully, ensuring consistent behavior across
platforms.

v2: Fixed review comments to move the compatibility check
    into the igt_fixture.

Sobin Thomas (1):
  tests/intel/xe_compute_preempt: GPU Compatibility check

 lib/intel_compute.c              | 45 +++++++++++++++++++-------------
 lib/intel_compute.h              |  1 +
 tests/intel/xe_compute_preempt.c |  1 +
 3 files changed, 29 insertions(+), 18 deletions(-)

-- 
2.34.1

