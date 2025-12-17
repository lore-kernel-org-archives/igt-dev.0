Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984B8D6408E
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 08:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1001D10EBE5;
	Wed, 17 Dec 2025 08:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXiUoMAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A284010EBD0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765958854; x=1797494854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X5mFuBlc/Uqp4Mc0kQuj7qyx6Le388AWMU6UGLWNqdA=;
 b=gXiUoMAxwaDFLnIR3xi9BhK+JBgSkWwIQEsSMTUKfjskO91PKvbsj5r6
 GLLsI7o1TGpJK1kht8+ppilw2vM3jLaiKPjv4ptBIruljmrg99L/1CTC/
 f5xHLC1jiq0vsOWe/7nw5tXWM863iLbxl2H7NcX3wyXhHwqNBc0pPb+MH
 R3xbh4rLBwIGTJvOjbyTiyNuAuLVJ43lRnKEgTu6haQ1kstrPsidr8CMe
 wq++N47434nOBhq8xdAc6wv3Ih7vpla9Zd11NRfkJCK+OdGlEaqUzpQhw
 9+pB0Tf3j7xjhNUkJICKkUWEkUyKU0gMsS8BiF20cYBn6f1zfk84sOYDs Q==;
X-CSE-ConnectionGUID: gewMgEn5SdiuwKq7TcJZ0w==
X-CSE-MsgGUID: 594UxnvoQiqLx5IwmGyunA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71747849"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71747849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 00:07:34 -0800
X-CSE-ConnectionGUID: 8KiVFcfoR+aHPgX/4Tku5Q==
X-CSE-MsgGUID: sWjYSCleTlGQ1JiWQuTSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="197857453"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 00:07:34 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v6 0/2] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Wed, 17 Dec 2025 08:07:26 +0000
Message-ID: <20251217080732.266257-1-x.wang@intel.com>
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

 lib/intel_pat.c      | 140 ++++++++++++++++++++++++++++++++++++-------
 lib/intel_pat.h      |  21 +++++++
 lib/xe/xe_query.c    |   6 ++
 lib/xe/xe_query.h    |   4 ++
 tests/intel/xe_pat.c |  37 +++++++++++-
 5 files changed, 183 insertions(+), 25 deletions(-)

-- 
2.43.0

