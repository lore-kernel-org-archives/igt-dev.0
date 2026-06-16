Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F26CCD98D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 05:14:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0517E10E80F;
	Tue, 16 Jun 2026 05:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbKd9UHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2645F10E579
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 05:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781586836; x=1813122836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VYr6RW/kMWoSUpLNqaw56mqP1SDKNU/uhk85ttuxX4Y=;
 b=kbKd9UHV9XOHLpTEPmHEqtB6UJNydVWtBBJALtqHUeUSA0AR6hWm4tVj
 e2JdAPuEtsYr8bj1BSJJn1nVGpEZZ53rVfCcttCpuUzcw+9+QC5zGJGqd
 pZ1tMHUN86/PfwWhXXxkw5IOqhVl2OUoVSd1gkcfk9DzibANBjqBth+Pf
 9m7HS0l4ebYW3AxOfLNYT2V0mRTVTPJNc9vo/LirqZ+ULk6Mlw4H/5HMP
 W/28igiaJZybgdWpjHeOiesdDgVLT3YVj9Ytr5cT5MNNOLNriXL2W5SMD
 L9FxDrhYVlLknwj4bq61jLlLETs3hOjkLS+hWR1VTgIrL1si/sAgUmXBi A==;
X-CSE-ConnectionGUID: NY41j3qWQ5uCDAo0V9JZpw==
X-CSE-MsgGUID: Sk3Z+g5LTNW5ZfkXo7/Hzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82536818"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82536818"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:13:55 -0700
X-CSE-ConnectionGUID: c20loHrUSV2YCjULU3s7FA==
X-CSE-MsgGUID: aBuPbZSaSqe2YH7mUItfzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="243294061"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 22:13:55 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_debugfs: Add debugfs entry
Date: Tue, 16 Jun 2026 05:13:44 +0000
Message-ID: <20260616051348.610849-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the root-dir subtest to validate additional Xe debugfs
entries. Optional entries are those that may not be present on all
platforms or configurations — their absence is not treated as a failure.
Validate:

Patch 1 adds validation for optional debugfs entries

Patch 2 adds non-empty validation for existing entries that 
are expected to always provide content.

Sobin Thomas (2):
  tests/intel/xe_debugfs: Add debugfs optional entry validation
  tests/intel/xe_debugfs: Add checks for existing root dir entries

 tests/intel/xe_debugfs.c | 187 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 178 insertions(+), 9 deletions(-)

-- 
2.52.0

