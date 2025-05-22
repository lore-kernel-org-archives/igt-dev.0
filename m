Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE64C54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 08:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9CB10EDC9;
	Thu, 22 May 2025 08:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndRabK3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2C10ED99
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 08:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747902721; x=1779438721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TaBweZyAcChWEdNTboZ9lgQYnLcb3IfExcsu35a2gHg=;
 b=ndRabK3zH3S82A8kN++IsMKhLtFW9PZnunhSLIO6fr4hAMzBCJEMxT9Z
 h+0Fz81x1VHoyISLq1f8UAkhZfaR31ZLaQezRLcq+tvA9eX5RmEoCMeMw
 xUIOSGHE/jP0otwnxZTZJ2deZfwqv5gj9/n1ASqRhN1Tas/e2TSZjjFUN
 K83Yyg1qH0wjfyRpRamorhoRwg7+mNInl66XiM3iAd2YaFHCZXr34kkAW
 pmj1ZJ39TAyciigdIeSP+besnj6WT1Dfqxmb0DChtysBAlFxrfMatMZ0S
 26txox8fDoipOZQMYygBiqMQIhCo368y9RhUm0ruYIVnsTWvEpKbuYmT0 w==;
X-CSE-ConnectionGUID: QBbmGIc1RK2SM7igIYob6g==
X-CSE-MsgGUID: oAfvJ96KQUmdut7wFR96pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50054308"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50054308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 01:32:00 -0700
X-CSE-ConnectionGUID: LqwvS00YSiaM1NYuz9ZYeQ==
X-CSE-MsgGUID: h1T8yxTxSlSCMqvEBTr9IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="141017838"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa007.jf.intel.com with ESMTP; 22 May 2025 01:31:59 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_mmap: Acquire rpm ref for all
 pci-membarrier tests
Date: Thu, 22 May 2025 14:19:52 +0530
Message-Id: <20250522084954.2861807-1-kolanupaka.naveena@intel.com>
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

During the test, the device is entering into runtime suspend, which is
leading the device to d3hot or d3cold mode. Hence the read is giving
a special value 0xffffffff.

To avoid this issue acquired an rpm ref to keep the device awake
during the access.

Kolanupaka Naveena (2):
  tests/intel/xe_mmap: Fix open/close calls
  tests/intel/xe_mmap: Acquire rpm reference for pci-membarrier tests

 tests/intel/xe_mmap.c | 73 +++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 27 deletions(-)

-- 
2.34.1

