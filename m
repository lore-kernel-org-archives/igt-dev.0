Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BBAC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 17:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7029010E459;
	Mon, 29 Jul 2024 17:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gV5tXRNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BBD10E456
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 17:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722275602; x=1753811602;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8sDGVq2c47XPQ4WyevWCLRo3WnMRVc/WBmeqNEeoYBg=;
 b=gV5tXRNFjaDp0YQDJ42GdKwDf/eNSyBrNs8ZX9y8SunUQPAFl5Mfyotq
 gjDrIG/PNtDLpn3lhvhDhc40Yhk8izZDfkzwiJ6zS+ZlyciApdwypfAdd
 LPEwddpojedq47dCG0tbqiYI/cPM9Feefvs1cdN3RjxNzH7hukk8LZefH
 c85o8iy0PWvdcbpGAjb2/Q4gAy3NmfAdI+xUNfqOwrXdoPtIaNlU6ywL2
 mTP4suLoj7LfxKYAZMgB/zaHfSW8tshtDnmIsutZUWmssrCrJyl+cMaSp
 sk1H9tdV6nj9ZoIrYaVldUTO2uGhYGozqInSCcNICVNVSNJv64dOJQzz1 g==;
X-CSE-ConnectionGUID: h5NhIDOnS2G7prk6+tGfWA==
X-CSE-MsgGUID: NT8vOilvQeig/luD50i9uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30641067"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="30641067"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:53:21 -0700
X-CSE-ConnectionGUID: 1FsZeqpHS0+bg7ElOaQ5tw==
X-CSE-MsgGUID: nJl1TeFxRlK+S/sUJhhdFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58184170"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 10:53:20 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tursulin@igalia.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v3 i-g-t 0/6] benchmarks/gem_wsim: Extend engine selection
 syntax
Date: Mon, 29 Jul 2024 19:52:13 +0200
Message-Id: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Introduces significant changes to the engine selection syntax:
- Dynamically generates the list of available physical engines.
- Identifies engines using [class:instance:gt] tuples.
- Allows specifying engine instance and gt as 
  `engine_class[<engine_instance>-<gt_id>]`.
- Adds support for compute engine class (CCS).
- Maintains 1-based engine instance ids for compatibility 
  with existing workload definitions.
- Enhances `w_step` with `engine_idx`
  and `request_idx` for throttling functionality
  (both populated during prepare workload phase).

Adds command line option (-l) to list physical engines.

v2: Split into multiple patches for easier review (Tvrtko)
v3: Rebase patchseries (Kamil)
    Corrected indentation, unbalanced braces, multiple assignments.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Marcin Bernatowicz (6):
  benchmarks/gem_wsim: Introduce intel_engines structure
  benchmarks/gem_wsim: Unify bond handling
  benchmarks/gem_wsim: Introduce engine_idx to streamline engine
    selection
  benchmarks/gem_wsim: Update request_idx in prepare phase
  benchmarks/gem_wsim: Extend engine selection syntax
  benchmarks/gem_wsim: Option to list physical engines

 benchmarks/gem_wsim.c | 840 +++++++++++++++++++++++-------------------
 1 file changed, 454 insertions(+), 386 deletions(-)

-- 
2.31.1

