Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE6D68BEE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 08:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D5210E42E;
	Thu, 18 Dec 2025 08:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XO1U1ucd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ECB10E2E4
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766045198; x=1797581198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jXUa/s2r9+fTv9dMySK+IWVxLGttAznfJqe58yrdcFI=;
 b=XO1U1ucds6vW/swKxroMc/HtNPd1gCIvY0NYx5NNfnC2lcZuY5G2RZQl
 yIyl0tJbBLHru1IdtUzFRJDnJGoD+QuL+0TsYDGDgFGr0jlMkObXVEnlk
 0qbrW8qVhRFZ2K7BM4MFl9nPFeWYqZrmvpYF6cWrbRHcq24yytXP142lU
 oyIfql86LRWySvg2flbdRtEkkEskM6dcg4j+TX41wtSflMXa+yku7slaK
 NsFPv7l+jnaVz+ghAXriYiFFAj/gml3MplKfVyMG+Z+UxqSJ1sQEGQX1U
 3CHpGIChQR2B9caHBR/pCflBdEk+Q+Zunv63mf2N9jyTaNMLsvxqjK6Qo w==;
X-CSE-ConnectionGUID: YBwrDBE3Sby0F+uEzkECQA==
X-CSE-MsgGUID: rQubEbsZS7OHpaegOAmI1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="55568969"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="55568969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:06:29 -0800
X-CSE-ConnectionGUID: VqjqefPrRu2X2gKyNrMm/g==
X-CSE-MsgGUID: XYXCgjKaSRiOjbA+32MUoA==
X-ExtLoop1: 1
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2025 00:06:22 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v7 0/2] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Thu, 18 Dec 2025 08:05:53 +0000
Message-ID: <20251218080620.286687-1-x.wang@intel.com>
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


Xin Wang (2):
  lib/intel_pat: read Xe PAT config from debugfs
  tests/intel/xe_pat: sync with Xe PAT debugfs parser

 lib/intel_pat.c      | 138 +++++++++++++++++++++++++++++++++++--------
 lib/intel_pat.h      |  21 +++++++
 lib/xe/xe_query.c    |   6 ++
 lib/xe/xe_query.h    |   4 ++
 tests/intel/xe_pat.c |  37 +++++++++++-
 5 files changed, 181 insertions(+), 25 deletions(-)

-- 
2.43.0

