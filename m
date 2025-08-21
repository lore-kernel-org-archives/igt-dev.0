Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2EDCA0EF8
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 08:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE1610E89F;
	Thu, 21 Aug 2025 08:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrD2aFJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EC710E8A0
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755763375; x=1787299375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vJi2f3U+ZS4uWcbvBadi+MSHmvxrbXO4H3Cblq3JFNM=;
 b=CrD2aFJCXyQWcVuyy+U1AzeDt0zp9haG6pUtAkXWcA6c8qo/7wxzfCby
 TnNZ99UesBQA8uQQfTwmo5z7iQc1moTIaLdLtIlLkuS6acIZpM0E8+z/C
 8WyhccAXuAg7NdKpxPAiSCsnS1ivBxLYet42fKAbHphKVXRkdjNbnyRDT
 x9zcUmOGCbXCOEeNmnu0nrTtRdHDJXcUIZuY2yHm3e34leRpFifPBd0R7
 /7QxBWbACoEoMbvMWbgmcC2Go3KuXIpxdO272ZvCjHauDka7fJKtntPfE
 AGDE18aDBKzgsjM6PnQX/HvDiarNFmv0jFmXOiaTaxpaTN/1T1UlCWbTA A==;
X-CSE-ConnectionGUID: IjqQlAC+TCmyylcG1R6e4A==
X-CSE-MsgGUID: F11VoDorQ1+BMRPxjspN9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="80640348"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="80640348"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 01:02:54 -0700
X-CSE-ConnectionGUID: ke6KnMc6QbmvuxG/VNn7Mg==
X-CSE-MsgGUID: r2W5EDTXSRGWRDEFsqxmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168267990"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 01:02:54 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v2 0/1] tests/intel/xe_exec_reset: Wait for spin jobs
Date: Thu, 21 Aug 2025 08:02:37 +0000
Message-Id: <20250821080238.467357-1-sobin.thomas@intel.com>
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
to be started on the guc ids and prevents the timeout message
in dmesg as warnings.
This will wait until all the jobs are completed before triggering the 
gt reset.

Sobin Thomas (1):
  tests/intel/xe_exec_rest: Wait for spin jobs to start

 tests/intel/xe_exec_reset.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1

