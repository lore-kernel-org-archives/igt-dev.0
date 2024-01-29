Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EC4C47DDB
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 16:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA61E10E4D2;
	Mon, 29 Jan 2024 16:16:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5E310E029
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706544995; x=1738080995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lJ8q4CFds3YyMy7qQUDGP17Enoz5EONEJBQHgBH7YbQ=;
 b=JeQmQV0VasM48GC6PHZ5VLbFzuUtNDiAECewYGGauQEAM3CmbdNsZjWP
 FBpTNJ4om1HYF25z0J54c/E9yCai0KfYOV/OO52IQ2cqgxgP1GzNvZp9V
 t/dBWf5PuKaCdnM6dXpbpCVEsDWtnmhK+lqZH2wr7S5pHDtVwxqiVBOpz
 u6GzzwHxj9OHxxOZV0Sju0XBj/uxb1jaiIJH4/HRsyG57mFKGQa+/AlYa
 eHAFijeAZsZCoCSVk6LWzbXgCQoflAZ2ouxFc+DcPphindur0Mi00um2Y
 I5ygsyKytr38Ca4DQHfMxZGrdhvwiSJsFnQJBAJ7Pb3fskeQxDQt1hrnA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="401862237"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="401862237"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 08:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="960935456"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="960935456"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 08:16:02 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] make display test dynamic
Date: Mon, 29 Jan 2024 21:55:33 +0530
Message-Id: <20240129162535.1462795-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

currently kms_feature_discovery@display checks for number
of display from 1 to 4, make it dynamic to check from 1 to n
also reducing unwanted skips.

anyone who needs to check number of displays for a particular
config can check kms_feature_discovery@display test result.

Kunal Joshi (2):
  tests/kms_feature_discovery: make display test dynamic
  HAX: please do not merge

 tests/intel-ci/fast-feedback.testlist |  2 +-
 tests/kms_feature_discovery.c         | 35 +++++----------------------
 2 files changed, 7 insertions(+), 30 deletions(-)

-- 
2.25.1

