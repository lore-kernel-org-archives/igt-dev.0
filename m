Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C54C27C55
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 05:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE3C10E848;
	Thu,  6 Jun 2024 05:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIlFXzIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAF010E050
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2024 05:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717653589; x=1749189589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QAdzVncpTCHEjMQ1PJ+Jzzkg1QCOpWNzo6XurQq9nz8=;
 b=gIlFXzIg/NjSs4gKK1BjMS5/jYPtrQifIXlqcZf2rmaFScXP4NdiUqfM
 1+cTiPz9BQlWSkLlTRUBwE9ohHNX//njsUyjCJqDpjBdmSVZ6DAbGEhAo
 s5z1wpxYvkvXRCvFQYB9jSemB2L5ZVnb54eyN/WuJT46d2V/mBY9FgroI
 ia5RmpIEUqY7sRe4+a42yKR0JGJE2dgLPltl+RFSyjZN/D9+Xl3eR28eT
 w/qCJSNcKdJBUObY+p/WXhbXTgt9BkfheBKLsaoS7oHSHRN6XVQPp959F
 mo+4Y8KADcypdkffgQ2acK5R8hrwEMlD5AAmMPooto8oP/RVeBTB9PHEc g==;
X-CSE-ConnectionGUID: Y4kDfIkBTkGTHlp/zZ05qg==
X-CSE-MsgGUID: EtqQ2kZYSN6DdMBeM0Qgvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25698744"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25698744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:59:48 -0700
X-CSE-ConnectionGUID: jl1TDV3LR1S8wmzWFpECgw==
X-CSE-MsgGUID: dPuKBtzXQ6SziCoR0bNQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="61050705"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:59:47 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 0/3] VRR test cleanup
Date: Thu,  6 Jun 2024 11:22:02 +0530
Message-ID: <20240606055205.3296434-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

VRR test cleanup.

Bhanuprakash Modem (3):
  tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest
  tests/kms_vrr: Fix hardcoded step size
  HAX: Run VRR subtests in BAT

 tests/intel-ci/fast-feedback.testlist    |  4 ++++
 tests/intel-ci/xe-fast-feedback.testlist |  4 ++++
 tests/kms_vrr.c                          | 11 +++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.43.2

