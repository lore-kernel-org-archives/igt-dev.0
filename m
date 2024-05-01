Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F33C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 17:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2625510F1E9;
	Wed,  1 May 2024 17:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bueJWOBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421AF10F1D4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714584791; x=1746120791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wCFy387UzLSlkq7mCNI4g4L0EN55jhgoMB/aaYWix2c=;
 b=bueJWOBrYxG/iWIxwz5WTvY32xAO7/zfeVghtOt/Z9KNllbPR3695cuM
 OOFLrUiK7fcORL6BG55CiARJApWn3AcYmba0fnyAclhXeORAISGgVwuA3
 Vj5ksfy6Rtf5Cr90J7DaHwIw4P5xAOjTprpI2bm3T+fs0IKnwIbS522AC
 kXb59+yygrhQTIbQVaKDo4hl24ewu16fBOyBswm2AZN5LwCu/LxCszzHj
 zKgu8jVqfEShoDhhMN8B8AuhEDHRD0rWzHTQbDmNtlNOEmLUP6LHweHhn
 7do7teIfya4UZDD3LbFg5MWtG4KzptqR0oN4FbxyKTJiIXr7NEdrT6pmK w==;
X-CSE-ConnectionGUID: CJXT+/0xTuKgku3dAxfFOg==
X-CSE-MsgGUID: 1EFl1MPnTHyDUowvAtjbSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10497098"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10497098"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:10 -0700
X-CSE-ConnectionGUID: f90NEtw8S0y2yC2hgXViWA==
X-CSE-MsgGUID: 9muKF3WQS8yIpPvTDbpSYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26721807"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.109.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/4] Minor gputop improvements
Date: Wed,  1 May 2024 12:32:59 -0500
Message-ID: <20240501173303.115737-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.45.0
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

Extracted from https://patchwork.freedesktop.org/series/132059/ as not
really related.

Lucas De Marchi (4):
  gputop: print percentage number
  gputop: Add option parsing
  gputop: Allow to limit number of executions
  gputop: Allow to set delay interval

 lib/igt_core.h |  1 +
 tools/gputop.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 89 insertions(+), 6 deletions(-)

-- 
2.45.0

