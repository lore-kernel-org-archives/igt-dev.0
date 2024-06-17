Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E666C27C79
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 15:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E7D10E44D;
	Mon, 17 Jun 2024 15:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kwk3/lyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A221010E44D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718639951; x=1750175951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TnfGV8L0LrMisVLmgLJJessDB/3tcMVdxuSpGSJOMsM=;
 b=Kwk3/lyQbyfXmxDKsNBPPNPqwvJkh6yLV2WNgpUvJ4+2VqLd7CfZiOic
 hyVQjQ1ubBaz0Ugyv7QSqSf3fnqoC6NP5LwLMhcjZx0Q6jXVDudyy04HJ
 DRqP53RfpyS9blziZjvm2LYZD07bAdgjdDsrkh3azjgfG05CUHKvkTLtw
 rbiTQdYdMvk39B0T/7+5BRruaXYyLwJjzTO7qHVdTZX/1SMLNZ9xcIMMU
 RoElUR/2BYszFG3jS1lYKWumRY5rA0g7om0RnE629VdSP7F9rziPS80+Z
 G/2vdJte3NoAZ2WKYyCZ7WT4w+iVpGih1ImXw2Q5rwOj/fy5LJLhnEo1m g==;
X-CSE-ConnectionGUID: 9G9Eq3bHSAKvOZwwhixZ0g==
X-CSE-MsgGUID: Jt3rR/yFQkanxwgQNnP2sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33010463"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="33010463"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 08:58:57 -0700
X-CSE-ConnectionGUID: fZGMbAPoSo6G/kf3+yyxrw==
X-CSE-MsgGUID: 9MSXzjTZRsSzLqyPWVuEIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="45781825"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:58:56 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] add subtest in kms_bw for connected outputs only
Date: Mon, 17 Jun 2024 21:40:50 +0530
Message-Id: <20240617161052.1113250-1-kunal1.joshi@intel.com>
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
 tests/kms_bw.c                           | 43 ++++++++++++---
 3 files changed, 167 insertions(+), 6 deletions(-)

-- 
2.25.1

