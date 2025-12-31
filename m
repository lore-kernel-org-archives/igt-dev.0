Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24C5EE57D4
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 05:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7522810E8FD;
	Wed, 31 Dec 2025 05:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FU/kZy99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C2010E83B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767160529; x=1798696529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uS4mrTqig6Q5vR5ZTNrBenxFYLGGd1bW5JAmlObbkNc=;
 b=FU/kZy99zjhi55spxBdoFYMjCL3aA3QUdUJ3NUh5Yg5xgFi1I+r+odoz
 8C8CE7M/RLO9SueSzXpMMseBi93KoINC41Z2PuUzY8HlxR5J/MxOOkJEa
 CwHZImfStw4OpfAvziJRz74O/k24wp/5s9x6ietmXyUcKfcVRevZF3W8B
 p6kzn5pwVphE95JY3GuM/A31biAyvUpm/wFyRmDZhCgN8JiIdY2GleQTx
 2VkdQjMatYrY4LRmLaVkt9RWqKEy7QrI5VXVgHI+dlW0/SPqluOm6uErk
 1La7A7nNAT9yPYds1KDWyrmi4aGUhQavfcjQyA4RCR6wHsqtfJY0r6U9R A==;
X-CSE-ConnectionGUID: Ti3FBpHsQNK+7m4voC8LWg==
X-CSE-MsgGUID: jgAVIBVoT3G4EwTWt2RRzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72589998"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="72589998"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 21:55:28 -0800
X-CSE-ConnectionGUID: JebKGIpMTIyy1r915DcJsg==
X-CSE-MsgGUID: vLSIHFkPQRG/tpD3XUzIsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="201119700"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 21:55:28 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v9 0/5] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Wed, 31 Dec 2025 05:55:20 +0000
Message-ID: <20251231055525.51524-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

Xin Wang (5):
  lib/intel_pat: add pat_sw_config debugfs parser
  include/linux_scaffold: add FIELD_GET() bitfield helper
  tests/xe_pat: add pat-sanity subtest for debugfs vs getters
  tests/xe_pat: use debugfs reserved flags
  intel-ci: add xe_pat pat-sanity

 include/linux_scaffold.h                 |   5 ++
 lib/intel_pat.c                          |  94 ++++++++++++++++++--
 lib/intel_pat.h                          |  20 +++++
 tests/intel-ci/xe.fast-feedback.testlist |   1 +
 tests/intel/xe_pat.c                     | 107 ++++++++++++++++++++++-
 5 files changed, 216 insertions(+), 11 deletions(-)

-- 
2.43.0

