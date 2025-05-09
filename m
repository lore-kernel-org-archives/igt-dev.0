Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB04C3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 05:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA13B10E9A1;
	Fri,  9 May 2025 05:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LI3xG5cm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6361B10E9A1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 05:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746768431; x=1778304431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SWt+xgw/DpTcGpBsU9xjoGyCfNdvccmaXfDB6pz8YIM=;
 b=LI3xG5cm47T37SntnCuN39brwlZ94G4/h15PgMbeJe/ih0RPqcDbjBqY
 H/MRNFhnF/tjtQMKmFRGTTtAg+JaLXkG+eKeVrPNrVkc8QKXGyBOZvA/U
 ZGgB3SQ328sl6/BRs17+1kiU1GgvUcS/mRBZdS6TJU6wMhE6DrV1zxjI5
 c2mj4JzpBlq+/GvL5clT05B/cPkEGJbUB+WOrBfy9OOtccltbhRv3ZIPm
 22R3kZ3LKmNm8VWxTh0gTHgJZ96gHyLXHCmMPLnT4iNpLuI1GM3IGiZqj
 10B98t9Xa43O+7ILLerm0fXySKp9jvvtKyNgF15dFbkhPfE5qPf1f9mcq Q==;
X-CSE-ConnectionGUID: 3qegv3unSESbfwgFT//hMQ==
X-CSE-MsgGUID: 1HHTFosOTV2wb4EuL22DvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66116662"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="66116662"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:27:11 -0700
X-CSE-ConnectionGUID: 7ClidsCWQ1+EQrFJalRzWg==
X-CSE-MsgGUID: /Q+RR6LdSUK6wyOVTyINKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="159815399"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:27:09 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/4] tests/kms_flip: Improve frame timing checks for
 high refresh rates
Date: Fri,  9 May 2025 10:56:39 +0530
Message-ID: <20250509052643.1607987-1-ramanaidu.naladala@intel.com>
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

This patch will improve the test timing checks.

Naladala Ramanaidu (4):
  tests/kms_flip: Modify check_state to return true on unexpected
    sequence
  tests/kms_flip: Increase test duration for flip-vs-wf_vblank
  tests/kms_flip: Adjust frame time checks based on refresh rate
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 257 ++++++----------
 tests/intel-ci/xe-fast-feedback.testlist | 362 ++++++-----------------
 tests/kms_flip.c                         |  22 +-
 3 files changed, 200 insertions(+), 441 deletions(-)

-- 
2.43.0

