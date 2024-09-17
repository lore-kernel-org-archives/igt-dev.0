Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30151C36013
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 11:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B4810E470;
	Tue, 17 Sep 2024 11:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFfE8Nc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4554710E467
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726572290; x=1758108290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R1/Vd93R3b4fkb8cUbCQnAQxOM73Mh0tO2Jmt6ElaeE=;
 b=AFfE8Nc31FRHfKwbZJALOsnQDdRM7g0tbrMFkuWAmSSU0WWjfss+HOa9
 Ipl+9chG7EaaZeCGQWIcyu6ivRBy+Xf7A+aGVt4/rGJi0G01k8LpAIdB/
 gcp/iuf1QwxL0AWufiXwEQWKT+XSs2RNZh6pRiAygbrJVTLh8uL0vGuvK
 WOtnlrAHAA3Ugqi5rzaam4q4FhTDqNvOTAub4vN1Cse5R5s20wdQ+16Sa
 tpq/291Stkr6IDljyMTgCG9oyM0+dLxtxC2p+Fcj/5bkDYJxSqw3sVaBg
 YSxxrUeaGDO5GJOvF06aU+QYOgW6z06GsnW7mmP6H1vBiEUTvjMCnitN+ w==;
X-CSE-ConnectionGUID: CYgYLKIJQh+kcVVNh+52gw==
X-CSE-MsgGUID: 1t8BiIiVSkux6fTNYHjJ+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29207432"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29207432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 04:24:50 -0700
X-CSE-ConnectionGUID: +OLB5T9BR+CD31jBl8tZQw==
X-CSE-MsgGUID: KTKMjtCuQEuc97MSGBcZRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="73249882"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 04:24:48 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t 0/2] For CI only [DO NOT REVIEW]
Date: Tue, 17 Sep 2024 17:08:57 +0530
Message-Id: <20240917113859.1499723-1-karthik.poosa@intel.com>
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

For CI only, do not review.
Couple of debug patches for xe_pm_residency tests.

Karthik Poosa (2):
  tests/intel/xe_pm_residency: [DO NOT REVIEW] Assert if sleep more than
    120 s
  HAX: [DO NOT REVIEW] Add xe_pm idle-residency-on-exec test to fast
    feedback list

 tests/intel-ci/xe-fast-feedback.testlist | 25 ++++++++++++++++++++++++
 tests/intel/xe_pm_residency.c            |  5 ++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.25.1

