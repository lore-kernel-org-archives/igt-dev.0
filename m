Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0411C27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 08:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FD510E352;
	Thu, 30 May 2024 08:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTwdeK7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618410E3DC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717059564; x=1748595564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F+3JXaAz2PLgpV3vsgT+XummmEWX5xuPd80G0IlU3A8=;
 b=TTwdeK7B/BK7rh46eyqqRvoyH6PPt8hhXsCP7KznaGMY8HJ5LCj8y1ij
 XdqQfgPA8atx9ifbsG91W/T2FW3ya4qnDiT0RJUiK4gkZNk2Wo997I9Xy
 c9pOV9jMp2wLX1U8ePZAj3rh1cAPOVLgPGQOB10deqLKFHvxE/GYsSowI
 UHg0mv/ZMc2cjM4/qSG+hEPRtZXtKEOkuE8ss2HmPltRvyeW0Z3AG57uY
 yEa+YUx2GQ4zteKaEUdXvKEwoBXxAJUC+m6XKOwRsYdEJ90jMh2q8WJzf
 TyfR2Uc1qWOr72YXE6E0FDtNQDlouiA26vBas7SG1jTy8Ot7q68g2Lus4 A==;
X-CSE-ConnectionGUID: MwyrbdqaQ0CrS3+IWhFYtQ==
X-CSE-MsgGUID: 2c294G2SSC2kHnnDZtRs5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24134315"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24134315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:59:19 -0700
X-CSE-ConnectionGUID: zhoesseDQReIdv4tUanNig==
X-CSE-MsgGUID: HmY5SiKNQqa4j3t5Epcq2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40621902"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.249.36.158])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:59:18 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v3 0/2] check drmModeGetConnector() return value in some
 missing places
Date: Thu, 30 May 2024 11:59:06 +0300
Message-Id: <20240530085908.564733-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

Hi,

There are some places where the return value of calls to the
drmModeGetConnector() function are not checked, even though it can
return NULL in some cases.

Fix that in lib/igt_chamelium and intel/i915_pm_rpm.

In v2:
   * change igt_warn() to igt_debug() [Kamil]
   * set connected to false when we can't get the connector [Kamil]
   * added Chromium stakeholders in Cc. [Kamil]
   * shortened the commit message a bit. [Kamil]

In v3:
   * changed the commit summaries [Kamil]
   * added more people to CC [Kamil]
   * changed igt_debug() back to igt_warn() [Kamil]
   * added a small excerpt from the bug report [Kamil]

Please review.

Cheers,
Luca.


Luca Coelho (2):
  lib/igt_chamelium: check drmModeGetConnector() before using
  tests/intel/i915_pm_rpm: check drmModeGetConnector() before use

 lib/igt_chamelium.c       | 5 +++++
 tests/intel/i915_pm_rpm.c | 6 ++++++
 2 files changed, 11 insertions(+)

-- 
2.39.2

