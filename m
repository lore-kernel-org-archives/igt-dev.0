Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F6FC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 11:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7E510E077;
	Thu, 29 May 2025 11:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1AAUNxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198C710E744
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748519562; x=1780055562;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gtR9PKf0HzJGEFxi8yM9KB1T53Nk4KyEq8u9HwO+SJs=;
 b=R1AAUNxAUyhsZlMxgd2lA6AUgx/nmeNtjCQJcFZR2fulfdP0LhO8CB3L
 2cbki6JRTU3UCfsvbmxXn014Ovv+yH6pZEiC8/QoceMuWmpL1GlHo+aGp
 sQNhX4N182paII1refOSYrVLnSMhWA9T2wY0YFcVVFfiJ89PlKLMlGLZ1
 3s2iGx1+gcYy8K/GG4HOp1W211vYPiQ6YE+7FwuTCBJhl7rZIv3TYKW0o
 9gQYQOJed8iMfevvn2l2hte7gu2ePp/quLhiAWaDORDXdg6u9eErmeOG5
 uijhadFz5L8rHiYaXiz8Z1h4X7gqYqmtd2oALZ2VxyD8gmJVsi6myWds0 w==;
X-CSE-ConnectionGUID: FjeuSWQ7Qp6rfAIhLktBGA==
X-CSE-MsgGUID: Aa44P65ZRIa7CK6Vr77C4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50630497"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50630497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:52:40 -0700
X-CSE-ConnectionGUID: Vo34g4YHQkuJYl98q+qBVA==
X-CSE-MsgGUID: opqLe8StSy+6jRh4lY3yXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="144008375"
Received: from dut1130bmgfrd.igk.intel.com ([10.211.178.45])
 by fmviesa010.fm.intel.com with ESMTP; 29 May 2025 04:52:38 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH 0/2] tests/intel/xe_exec_system_allocator: Test to validate
 SVM prefetch ranges
Date: Thu, 29 May 2025 11:52:35 +0000
Message-Id: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test validates prefetch with single range and multi ranges,
and stree testing of prefetch by binding address ranges with different memory
regions to check the expected bahaviour.

Verified with KMD SVM prefetch changes
https://gitlab.freedesktop.org/hghimira/kernel/-/tree/latest_v6_to_be_sent?ref_type=heads

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  tests/intel/xe_exec_system_allocator: Validate preftch of svm with
    single and multi ranges
  tests/intel/xe_exec_system_allocator: Rebind the prefetch ranges

 tests/intel/xe_exec_system_allocator.c | 155 ++++++++++++++++++++-----
 1 file changed, 129 insertions(+), 26 deletions(-)

-- 
2.34.1

