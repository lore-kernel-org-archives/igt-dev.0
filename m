Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D6DC3DA45
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 03:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF1310E065;
	Fri, 12 Jul 2024 03:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9ZaQsQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FA010E065
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 03:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720754051; x=1752290051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cnYLCNhOstJ5Ak31qqkCquJJgd3FfbkWCDSsrJzsh2A=;
 b=O9ZaQsQ4kWMe5uUHwXoiAb2scteoVV5ETxxh9nNZN6Wl1D/B8sYy5uuQ
 ACFix7ov8QlerknS8eE4ztwEpSBhcG9OJaxYvyLflzJ6pJq+4sG5HAhZD
 ybEPckR+tQgW+JAT1YrvLVDL9yMKjXqBQYPaX5uQfOdc3GXzlj3t1iMgQ
 bns4MaBVky+9sT/owZ2U31DqNpic2MCFAqUEeyo6k+zTU532JAxs7BVO/
 fZxXivHjNyHa9ffSnSKS+VAWVco1or9ha5RbB8cam/23DAGFHRA4Aex+B
 x7aMkneC46pRrp21Z+JRIbYGcs7ODDkCzhEvvE196HoC50tpx8jUfzRZw Q==;
X-CSE-ConnectionGUID: h6I3MoLDQIqs3bTcgrJLDQ==
X-CSE-MsgGUID: FwIAoNMqT82ZGIKlz8sLkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29574129"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="29574129"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 20:14:11 -0700
X-CSE-ConnectionGUID: dgz8rgO6Q6iqYJgwqUA3Hw==
X-CSE-MsgGUID: oPKdducpSnuBeJcbEO6Tuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48665328"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 11 Jul 2024 20:14:08 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v5 0/2] Runtime alteration of debuglog level
Date: Fri, 12 Jul 2024 08:44:16 +0530
Message-Id: <20240712031418.762175-1-pranay.samala@intel.com>
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

In certain scenarios, tests may fail due to insufficient disk space, 
even though they fulfill all requirements.

To resolve this issue, adjust the debug log level before initiating 
the test. Rather than manually editing the debug log level each time, 
aim to dynamically adjust it.

This approach involves modifying the log level within the test using 
the debugfs entry, with an exit handler ensuring default settings are 
restored after testing.

Pranay Samala (2):
  lib/igt_sysfs: Implement dynamic adjustment of debug log level
  tests/kms_atomic_transition: Reducing debug loglevel dynamically

 lib/igt_sysfs.c               | 108 ++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h               |   5 ++
 tests/kms_atomic_transition.c |  13 ++++
 3 files changed, 126 insertions(+)

-- 
2.34.1

