Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7569EC27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 12:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA55410EA6A;
	Thu, 13 Jun 2024 12:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELzN1clj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9184010EA6A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718283327; x=1749819327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0W6q49dykcAyNRz9+y14isT3gcFKS4JnKXytjwM0Eq0=;
 b=ELzN1cljzgw3Rulb229Kho3Gi0pTAQzAUxQZvRmveA6yxwgzk45k4mXv
 AKxIfFKy1vsY0FpX39u9UmiAsLu6g4LyNM9WMFW+Mf/+uP3FETBwgPfHy
 U/hWLNhnDjm+PfSmYi/048maR4V2dsz4ExkvvenE3lNyiEAhFMvYuTUDl
 umU/c77wUjpf+HCNgv7UcgAZ0oI8dp9gPr9hHWXkbBQA+2ZGbxAKqSA8q
 AQdI+MzKDfnRyaEfeLA2SbX9C51Su5rbqEGA84LaaL7aEhTnD/ZgPEqT3
 cJVeatWMaRarbR+b4K0ZHDO79+zddLq6cQ1YZdNWU7heQH16O54C5o1qU g==;
X-CSE-ConnectionGUID: KHpersmARlu+JKbtBjrP0g==
X-CSE-MsgGUID: G8LF03ODRHm8bO8Bc67Liw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18956178"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="18956178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 05:55:18 -0700
X-CSE-ConnectionGUID: mOb0zaCYQKy1ysumJPaZpA==
X-CSE-MsgGUID: nZP/kbhbQdGftDBUWjs1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="45079439"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 05:55:17 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] add subtest in kms_bw for connected outputs only
Date: Thu, 13 Jun 2024 18:37:13 +0530
Message-Id: <20240613130715.1008793-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

forcing DP connector doesn't work well on intel HW and tests are skipping
with unsupported mode, add new test which runs test on connected
outputs only.

Kunal Joshi (2):
  tests/kms_bw: add subtest for only connected outputs
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 64 +++++++++++++++++++++++
 tests/intel-ci/xe-fast-feedback.testlist | 66 ++++++++++++++++++++++++
 tests/kms_bw.c                           | 41 ++++++++++++---
 3 files changed, 165 insertions(+), 6 deletions(-)

-- 
2.25.1

