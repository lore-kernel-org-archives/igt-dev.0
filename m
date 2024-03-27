Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30C6C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 08:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1310210F930;
	Wed, 27 Mar 2024 08:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naDo0vnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E2210F92A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711526764; x=1743062764;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z32oPplMyTrq21HXCEIRt5bMae4tXRvQVX6mkeRRAPQ=;
 b=naDo0vnut4eUO1e04OrKjCM081GQXxuFIWPWCvsRIveZLB56mm7/Oywa
 d5Fyb0Cf7OhM1s3AB35AelwwIk1JDrk/u3bt5KysucdwHV40YSTeB0ykc
 35tlQ1vYL3m179YeCeRE8JPwKrkNIzIIo2fPFPPNDO3WncGfMoozefFcU
 Uv1RPZhMKN9hZM/7U4oaI4UBq+Rco7M1JXrZ0UCZeB0/ccWsMzWHiE7FS
 jV4qF+L3ltpAiY4BsZ141ngB1VK+VCLJWVtKFMyEMOD0/+2nk7ox5KctV
 NUuz1KYdzBrAnMvxKOFW0aXCKyFhrxDUL+gWF3c65p73wbViX3WqbLpZ6 w==;
X-CSE-ConnectionGUID: Wg6+0wXQSROE0GPP1VrIxQ==
X-CSE-MsgGUID: F/9Mi4q5R4KGr0AN/Y911Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6470021"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6470021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 01:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16282930"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2024 01:06:01 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, krishnaiah.bommu@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] Added invalid-va tests
Date: Wed, 27 Mar 2024 13:34:02 +0530
Message-Id: <20240327080404.3050140-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added 2 subtests related to invalid-va
1. invalid va
2. invalid va with scratch and without pagefault.

Priyanka Dandamudi (2):
  tests/intel/xe_exec_fault_mode: Test to check the access of invalid va
  tests/intel/xe_exec_fault_mode: Extend invalid va test

 tests/intel/xe_exec_fault_mode.c | 59 +++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 13 deletions(-)

-- 
2.25.1

