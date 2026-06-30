Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B21FC43327
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 12:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276AE10EBFB;
	Tue, 30 Jun 2026 12:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g66b2Lnm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EA210E1DB
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782820787; x=1814356787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uQYoxiehPWlmfZFW+bMxS2LXD6YDGj764V7SK3kLRNU=;
 b=g66b2Lnm7dE5ZeU9k2c+aRNnZxzzrQWK3Ko0lFbi+4GFo5Bi8Ihe6o6G
 oBcHvPKRz+bPsfY7JDcoQKD09RnQMlMVYvnBGLZjgrdjiPCgxqF96ZTYd
 +ePUIWXcsILs78wjsuIc9Tx2xVJZ/mO37n7JG+vCMj94zYA0knR08f4la
 wHZpNmtoDtECXY7+5nLqMv4cYyyMlBw0I/rbF+kIF/y4FGlAt6IiqGtTy
 c9YXQV7nlyyCutDy1rYoqaPCcsHYLyzXPqtTngPx0iRamxH5gx8vJNvme
 7DfhmSFNyOG6Ga9in/9eZwrmji28d3RgkQHuDhxi6HtvowdJJCh/6bKiN g==;
X-CSE-ConnectionGUID: OeyYwHeTQmO7PQyiWR4xuw==
X-CSE-MsgGUID: hS+yFmgKQbqBIMDofUCIBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="109080767"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="109080767"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:59:46 -0700
X-CSE-ConnectionGUID: RQFkQIkFT3WBqJTutfIFDg==
X-CSE-MsgGUID: OxYLnCeATM6A4UUZkfIq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="250556987"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.186])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 04:59:45 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/1] IGT release version 2.5
Date: Tue, 30 Jun 2026 13:59:37 +0200
Message-ID: <20260630115940.51167-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Some statistics for new release (suggested by Swati Sharma).

Compared to previous version 2.4 number of tests files increased
from 440 to 455 (+15) and subtests from 495121 to 496253 (+1132).
Above are checked with the help of:

find build/tests -type f -executable -print |wc -l
find build/tests -type f -executable -exec \{\} --list-subtests \; |wc -l

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net> #irc
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Kamil Konieczny (1):
  Update NEWS, bump version to 2.5

 NEWS        | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 meson.build |  2 +-
 2 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.54.0

