Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB42CD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 22:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9C610E639;
	Tue, 26 May 2026 22:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5lOYDG+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E537710E639
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 22:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779835021; x=1811371021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yeMBVawNooMZE0Dzu6VlRu44FhHoR1u7zXrsS6XqQE0=;
 b=m5lOYDG+Wkjpj5cP2ouNYr5ziHD3ZZAxjJk7q17jACI4H93bu14R/n1U
 +d++i2j0aR4vb13xsCFYkPgqFjrOajkY33h4jNGn+uICiLV9KCHzVIs3N
 /LwmCQNelmqYv4gsG6YCnn8ThZZD6ff7GFNcE5r7/RBY1q7FvOZe4EEdX
 laxMbmKPZ5D4r4/S/RGTMRj48HuBBRs7z4SVFqV6l4CrZ7KQUYzReIOME
 86KvNTf72BNatnK9evPRqQGCHI3x2SGVA1JS8AMnLT6VKr3euR5nuG9jR
 mJo+7DBpBYJt/tkg7qztMXq0oD5gA3p6l0BZfj/96FLKrWe/JmfwIjjCz A==;
X-CSE-ConnectionGUID: bqP8zMV5Tz6edQYPp4eplw==
X-CSE-MsgGUID: wQLSTJ/oR6qRr+MZ7MZ0BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98236840"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208,223";a="98236840"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 15:37:01 -0700
X-CSE-ConnectionGUID: Fku1x55+ReWzMV37qbIqpQ==
X-CSE-MsgGUID: Pn8qXFlZSMi3WLz4T+fdXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
 d="scan'208,223";a="241892815"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa008.jf.intel.com with ESMTP; 26 May 2026 15:37:00 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v2 0/3] tests/intel/xe_pat: dynamic PAT index selection for
 pat-index-auto
Date: Tue, 26 May 2026 22:36:51 +0000
Message-ID: <20260526223655.81924-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511233622.2074382-1-zongyao.bai@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
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

Two cleanups are included first:
  - Fix a copy-paste typo in a debug print statement.
  - Remove a redundant srand() call in igt_fixture(); the IGT framework
    already initialises the random seed via igt_srandom().

The main patch adds pat-index-auto, which builds a test mode set in two
stages:
  Mandatory entries: one representative WT, coherent, and non-coherent
    entry, always included for baseline coverage.
  Random entries: remaining valid PAT entries shuffled with Fisher-Yates
    and appended up to the configured test count.

pat-index-auto is added to xe.fast-feedback.testlist.

v2:
  - Fix pat index in xe2_blt_decompress_dst(): use pat_idx_wb instead of
    pat_idx_uc for the alias destination compression disabled path.
  - Replace TEST_MODE_CNT constant with explicit values: 5 in simulation
    mode, 16 on real hardware approaching IGT_COLLECTION_MAXSIZE limit.
    (suggested by Xin Wang)

Zongyao Bai (3):
  tests/intel/xe_pat: fix typo in r2 wc debug print
  tests/intel/xe_pat: drop redundant manual srand initialization
  tests/intel/xe_pat: Add dynamic PAT index selection for pat-index-auto

 tests/intel-ci/xe.fast-feedback.testlist |   1 +
 tests/intel/xe_pat.c                     | 168 +++++++++++++++++++++--
 2 files changed, 160 insertions(+), 9 deletions(-)

-- 
2.43.0

