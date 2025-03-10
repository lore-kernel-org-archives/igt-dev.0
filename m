Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676E2C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 09:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DBB10E3D5;
	Mon, 10 Mar 2025 09:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAAgNOU+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBB310E3D5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741599582; x=1773135582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uga1qjoXqNciygq3WnEwXIX8pczWOeaw6qTwNE6BjGM=;
 b=RAAgNOU+gi8MKKcNfYQBJc3TXLNrLtSikZ3ubRtZhMwkOdOZcFNCHMua
 Wb93Cr+gvHca5mitbcliHWCMCqTTF5hlCjlySkhn8GuRXr9iQjyd9xDlx
 uixyGNTQP0RNFaog3P8suYwTfvC5R4M9EnyV3mHCwXL1NgaqhdDeJzWc3
 DDlGkfihiNwTg0/ivt/vHV6tqBPBcARaqRidhoHPVvpxIRctHxizgrEtC
 lztIaRBFoOjI3GhEINnxeICq9d7M0jZingiScBtqEqF9eceIHFNrZhk4k
 gxjOVAthoyg4QKf5CwelG6Uy4k7ZrIEnCd7ZPfQ068uEWLdFBtqnL8bEh Q==;
X-CSE-ConnectionGUID: ilzFqHWFTbG8fXDgmPj4Jw==
X-CSE-MsgGUID: zDKoK0SvRreNG/GGRK+wBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46497592"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="46497592"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 02:39:42 -0700
X-CSE-ConnectionGUID: K9YJR9DKRDOby+gF3QL7sA==
X-CSE-MsgGUID: 21PiVCzjRgePQMom12mDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="120148559"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 02:39:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Fix VRR multi display issue
Date: Mon, 10 Mar 2025 15:09:21 +0530
Message-ID: <20250310093923.1479995-1-ramanaidu.naladala@intel.com>
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

when use multi display config test is consider only first display config
for vrr test.

Naladala Ramanaidu (2):
  tests/kms_vrr: Fix vrr multi-display issue
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 174 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 278 +----------------------
 tests/kms_vrr.c                          |   9 +-
 3 files changed, 15 insertions(+), 446 deletions(-)

-- 
2.43.0

