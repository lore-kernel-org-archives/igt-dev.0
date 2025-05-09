Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F40C3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AE310E9D3;
	Fri,  9 May 2025 07:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FA7wCXy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127C110E9D3
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746777179; x=1778313179;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SWt+xgw/DpTcGpBsU9xjoGyCfNdvccmaXfDB6pz8YIM=;
 b=FA7wCXy8wI6Yi24YycRnMBA9la3Y6eCb/itWh4wwbJC/YBaVCqZfskw5
 q5s9+xhfhM6GAbTzJgj56j3uTd4reUrdn7Na/0Zc4hCLaqFdrijpgOcPZ
 DFb2+zfFK36iPAu3mF7G1w5vNjCMF0Pd70+OAaRT5mTUNUVkJkXXu3MMV
 A4v0B2LsNAtKdslSiQ2ABDdJjeE8fJkR7XyI1d6okeBGDs3WvvHqA6t/6
 U0fQzsn8WF4OovGgf21XbgDe+uyLeYl+2ReSSI6SPJgwqcXF5SmpQuUQF
 mNGtZnFx0kqJdOLOaRwOpWpNOKqcnOGBLyqgIZDPVEKl2HmDnx+FmJqCr Q==;
X-CSE-ConnectionGUID: X9GpvIdnRpWPgjtM+1uVHg==
X-CSE-MsgGUID: zi2U6417TUOf9wjsonS26g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36222477"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="36222477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:52:57 -0700
X-CSE-ConnectionGUID: EKxUaHbqStGTyq4hyc+Wqg==
X-CSE-MsgGUID: Ip27H0XUShCV6ujgXRTbjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167476479"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:52:55 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/4] tests/kms_flip: Improve frame timing checks for
 high refresh rates
Date: Fri,  9 May 2025 13:22:28 +0530
Message-ID: <20250509075232.1610123-1-ramanaidu.naladala@intel.com>
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

