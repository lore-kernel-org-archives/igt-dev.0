Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD80C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 08:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C339D10EC4B;
	Fri, 12 Jul 2024 08:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5FjIbRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB34E10EC4C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720772960; x=1752308960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B2v3kONtlkDs2VtxCn4972hSB76q5UtLTIPBKrbOEIY=;
 b=T5FjIbRFJtnNzRRVXHT/0ocEZDIpQowp6z5vuXgJS/p2YjQzdO8fPiOT
 4Sb6W9r5d9cgdCFRViaIgLXJceV3zYTvOO/qjDK5X1GFnPwf2vgkA5ClA
 CCfEB9tqA7w3Nomn1X1u3ZB/RH0e8agFKvcSttTsIkWN1GAAojbjIuHIB
 dn+dGRsKuoVVTtb4yvXNtKaMhYzaA9xmABAdXG0WcgWg2z4JFq93cjZhx
 6JhJIS754xLRtTyOj15XBcvlgGHBsQVMPsFQczLEo3+lTm1ZFDPUZY3I9
 GY7ShTnGikYUrMjrl3BSKT10i8z83RHVC6FV/1XSQIBkhhqJzlKl751JM w==;
X-CSE-ConnectionGUID: u6ecsEL1TVa6+5qPe0rr2g==
X-CSE-MsgGUID: gZLwL2gcT8u04HfOe/livg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18337363"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18337363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:29:19 -0700
X-CSE-ConnectionGUID: 0nt/xk0oSE6vq+9NeVuUJw==
X-CSE-MsgGUID: TM6QlTP8T1Os9Qq8Z9AxmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="49607961"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa008.jf.intel.com with ESMTP; 12 Jul 2024 01:29:18 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v6 0/2] Runtime alteration of debuglog level
Date: Fri, 12 Jul 2024 13:59:26 +0530
Message-Id: <20240712082928.762514-1-pranay.samala@intel.com>
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
 tests/kms_atomic_transition.c |  12 ++++
 3 files changed, 125 insertions(+)

-- 
2.34.1

