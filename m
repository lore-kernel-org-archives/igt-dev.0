Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF490C87FD2
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 11:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5E810E440;
	Mon, 11 Aug 2025 11:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgboXPP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4F210E440
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754911254; x=1786447254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SldtDSDlFHF38qHuHjTK+yoAenG/ItrekPh6mEk+5pg=;
 b=HgboXPP1NcGuZRKitlBvSkLgb8iHgC0h0Xd8520WsgAB78YRV23Fzi8r
 iSvFr2nDitPBAoj+XGNvXhy3rSylAe3XXqKvtK8Vo6S3Y7G0HbpD2RiIk
 3h+KAqRx6/dhfPYedIBFx1mvcSWBb7RcWCypTylKmKIukW7nW226Z5y3c
 lOiFNPvYR9veiHc9MrY5fQjzFOrHVEbMU97DgE4x4liCm9Pf10MMmU8sZ
 WwgZ1tW9/EhmWWQd5aj8d2PW2m8a38xVbbZvNI8Cuj12P2sMFzIZL+FqV
 fwgPdsUy/ny2+CqJCZRdZ/GTb7ZS1tM63j3a3rjMqrdatbExs08aqIUSd A==;
X-CSE-ConnectionGUID: /TEcOmKBQFq6D9/nAVO1ZQ==
X-CSE-MsgGUID: W+bw6EPLR4WMQ12gA4Lzlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="74748067"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="74748067"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:20:53 -0700
X-CSE-ConnectionGUID: MV1YFiZrSUS2udY0S6diPQ==
X-CSE-MsgGUID: x7ZhVejSQoW2h1HUC1zxDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="171143294"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 04:20:53 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_exec_reset: Wait for spin jobs
Date: Mon, 11 Aug 2025 11:20:36 +0000
Message-Id: <20250811112037.342583-1-sobin.thomas@intel.com>
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

This fix will allow waiting for the spin jobs to be triggered
before performing the gt reset. This allows all the parallel job
to be started on the guc ids and prevents the timeout

Sobin Thomas (1):
  tests/intel/xe_exec_rest: Wait for spin jobs to start

 tests/intel/xe_exec_reset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1

