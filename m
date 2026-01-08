Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6564DD148AF
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 06:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE34810E69B;
	Thu,  8 Jan 2026 06:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O89ajU+M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8266110E699
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767855576; x=1799391576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BdbrUMlwnUBmK8ygBEwQ3ESZAQ//Da8GXST0anlg3Tk=;
 b=O89ajU+MszYbZ5RsauxFWl/S2uV7NZJSZ33a2rx4UKsvceNmGrWaS518
 7X6qhD81qK7oshNur0P8FdQGcflssMs7zJwNYKtgZLRQmHKQIwZytiM5i
 rbOpgGBGPg7h05izBOURnej16YGgC6bej1IBZ/kO8zWZ30DAXg34wk9x6
 ZpP9XwRm1Pq733kF95DBEyGkljrI9QG4CWVBvblkKrAGazpgscNC1MMfq
 yQA7G/uyDSWJlCS02DwUlJ5M3yyjSLAKnxwVQRFE+whDZHmLtszWldziA
 O2zhuowchdKZUS4ePb6YkuObAiJ6XuB8QioAdn1iqOjpS2y961Gmgv6dG g==;
X-CSE-ConnectionGUID: 0NOoe6IIRQWeemO5SPIXDQ==
X-CSE-MsgGUID: nLyVOjCiRdCE3uhZSVKZKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73078771"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="73078771"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:59:36 -0800
X-CSE-ConnectionGUID: mRKT/H4AS1KeyaznqEqrnQ==
X-CSE-MsgGUID: 7uOekv3fR/6pm/f0DoVimg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="203034230"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2026 22:59:36 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 0/4] xe_pat: add compression subtests
Date: Thu,  8 Jan 2026 06:59:29 +0000
Message-ID: <20260108065933.409757-1-x.wang@intel.com>
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

This series extends IGT xe_pat coverage for PAT compression
behavior.

It adds three new subtests covering:
 - userptr-comp: verify PAT compression works with userptr
 objects
 - prime-external-import-comp: verify compression with dma-bufs
 import
 - bo-wb-comp-1way-bind: verify compression behavior with WB BO
 in 1-way coherent bind flow
 - add xe3_lpg_pat_index_modes[] to enable the wb_comp_2way for
 xe3_lpg devices

The new subtests are also added to intel-ci xe.fast-feedback.testlist to
provide continuous regression coverage.

Xin Wang (4):
  tests/intel/xe_pat: add userptr-comp subtest
  tests/intel/xe_pat: add prime-external-import-comp subtest
  tests/intel/xe_pat: add bo-wb-comp-1way-bind subtest
  intel-ci: add xe_pat compression subtests

 tests/intel-ci/xe.fast-feedback.testlist |   3 +
 tests/intel/xe_pat.c                     | 226 +++++++++++++++++++++++
 2 files changed, 229 insertions(+)

-- 
2.43.0

