Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC32C2BA15
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 07:52:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D519F10EAB2;
	Wed, 19 Jun 2024 07:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IWhNIKsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E95B10EB38
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718783562; x=1750319562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CpH4CAswi+Ps4LvndpshohBcMplM3GDF9WJ6rkCpJoI=;
 b=IWhNIKsVi6RJfIBYW0p6JRLZDiPL9sNvILQBD3OD7uq44nSYIPBX6ebv
 nGkESGxwG8JEG0od8HmOzNfqoM3IQsPW7U6JJK2hYSiIAlqVeH/r4lUF+
 G1GZwee+WNL2pFvBeWK0unfe15xxQbhhl4x8YkbcYwOiygmt7DyHuwPs0
 LvkctuDiAB1Np54B8psh396rF6jFbgEBIm72L9WHKmgZ4AZVgwgmucXfa
 WERbmZQ6lX2+SCV2+8u135E67zNKkZwQYIxWQXm4dKth+nmTpNypEevso
 yYuovo7mZuDUhSugO7OGVhUjGuKWAldunyKrdCKmarMzc1yKfmi4Rf1bc g==;
X-CSE-ConnectionGUID: fqGbgmnUTtqzhUTIAOzXPg==
X-CSE-MsgGUID: 8QnAoJ8oTnqj4ofVtDyDhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15850211"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="15850211"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 00:52:12 -0700
X-CSE-ConnectionGUID: +09W9MRyRza+IuKRyQvZyw==
X-CSE-MsgGUID: BlaflPuAQiyslZoBEJQH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="42308933"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 00:52:11 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] add subtest in kms_bw for connected outputs only
Date: Wed, 19 Jun 2024 13:34:06 +0530
Message-Id: <20240619080408.1161329-1-kunal1.joshi@intel.com>
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
 tests/kms_bw.c                           | 48 +++++++++++++----
 3 files changed, 169 insertions(+), 9 deletions(-)

-- 
2.25.1

