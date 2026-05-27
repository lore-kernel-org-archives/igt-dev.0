Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E89CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 21:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BD710E2A6;
	Wed, 27 May 2026 21:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1gVbtAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D1710E2A6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915655; x=1811451655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y1bBlRY6UqA4WtAxan88xtR+G51HYAZDmKjINlDgWBM=;
 b=W1gVbtAvSPolv0WS3P8dkh20PFcmWHokV53x3GamIjxotaERQJ6v1vNd
 1i1GGy5RGxUV+WW8pTYjj1aI5/WpwS2l0vu+Zub4Z9W+tlJbBXo8CYYNc
 dFfSHmoAt506Ip/I6c0ehNe66G628StniFg6mLA4lDiz6a6hdHi0UOic1
 O1agQF0THXEv6iF96GjAP15g9XQbw2VzPpMnyd1Fv+S/4cRCK3YBWY9EG
 m2+wO9TEXh8Si35DQ6+cFCz2VTSRiQA+ZVL2IubqphXU7zCidQ3E+2uBK
 poTabK2NKPyUiVHESxPyiVe35F6CD7F50ArqFYeuVx1ouxYWNVQ7SCloz w==;
X-CSE-ConnectionGUID: E6Q+tOyrR66xUuRv9n8/ew==
X-CSE-MsgGUID: ByhZhO0rTZizh4ZaSyw7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80869903"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208,223";a="80869903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:00:54 -0700
X-CSE-ConnectionGUID: F8x+nfJuThKcK/wuYnQdhw==
X-CSE-MsgGUID: rrt8Yd/5TMmPuJ600GS3QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
 d="scan'208,223";a="244172206"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa004.fm.intel.com with ESMTP; 27 May 2026 14:00:54 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, kamil.konieczny@linux.intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_pat: dynamic PAT index selection for
 pat-index-auto
Date: Wed, 27 May 2026 21:00:50 +0000
Message-ID: <20260527210052.161768-1-zongyao.bai@intel.com>
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

From Xe2 onwards, the PAT table has grown large enough that exhaustive
testing of all index combinations is impractical. This series introduces
a new pat-index-auto dynamic subtest that selects PAT indices from the
hardware PAT software configuration at runtime, improving coverage across
runs without hard-coding platform-specific tables.

The subtest builds a test mode set in two stages:
  Mandatory entries: one representative WT, coherent, and non-coherent
    entry, always included for baseline coverage.
  Random entries: remaining valid PAT entries shuffled with Fisher-Yates
    and appended up to the configured test count.

pat-index-auto is added to xe.fast-feedback.testlist.

Zongyao Bai (2):
  intel-ci: Add pat-index-auto to Xe BAT testlist
  tests/intel/xe_pat: Add dynamic PAT index selection for pat-index-auto

 tests/intel-ci/xe.fast-feedback.testlist |   1 +
 tests/intel/xe_pat.c                     | 159 ++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 1 deletion(-)

-- 
2.43.0

