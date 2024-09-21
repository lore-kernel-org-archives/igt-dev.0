Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A870ACF9C5B
	for <igt-dev@archiver.kernel.org>; Sat, 21 Sep 2024 15:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E01D10E1A2;
	Sat, 21 Sep 2024 15:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfQjR/xB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DED10E07B
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Sep 2024 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726932911; x=1758468911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9NsqCF01rsoaY9f0lMXRUJ1WKTW/qAOUu5A+KjgkH4=;
 b=dfQjR/xBcGaxr7C1W6nGXcu3MwYsoIDKPls/UH0D677/W7VSZFkrxrA9
 jRukewUSV4hZk47cuZV0vMfPtUbxRoweatm6IMb/8GLXOsZZvxF1jhUdm
 uN+ReZC5ECNAEa7yQ0l/ibFN/MTllbguJdjznhuXNps0wYh3S3W3xt+Zh
 va5FfuIft8IW+5rx8aGYknbJc/u1JVGD5FG8bAABBE87fa0DS0JIFMiIf
 IeSoKdEAu4nXd39nU75dVzzLIrLoMih5mHiykqe2w3JVeyMZ6I72oU/bq
 vvP9UGnH5lwpwkK6edtviDf/eDMjksg++90kMsdUZKW3Us+kMACRI8Z3q A==;
X-CSE-ConnectionGUID: nEcT11/UQm2+OAuD6QxMew==
X-CSE-MsgGUID: NzF8xJF4Tn6Skxynm7QIig==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36512832"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="36512832"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2024 08:35:10 -0700
X-CSE-ConnectionGUID: kBzZkddMSh28/V/mxUjFuA==
X-CSE-MsgGUID: /bd13MLjS4qQah7ULsjAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="71439419"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 08:35:08 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/2] Async flips with atomic commit
Date: Sat, 21 Sep 2024 21:04:48 +0530
Message-Id: <20240921153450.668896-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
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

This introduces new subtest to validate async flips with atomic commit

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: subtests to validate async flips on atomic path
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 183 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 289 +----------------------
 tests/kms_async_flips.c                  | 134 +++++++++--
 3 files changed, 140 insertions(+), 466 deletions(-)

-- 
2.34.1

