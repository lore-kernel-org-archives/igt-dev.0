Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5441C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 13:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF3A10EAC1;
	Fri, 16 May 2025 13:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSZjirDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909B910EABF
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747402831; x=1778938831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UAr6gDGgjxWrrsGbN0O33D6x/xjF5zyOewodyPr42Tg=;
 b=cSZjirDTA8eSytp0vWBntmp18aCnnWVRRSCfbZTbuxvjUZ+eVfMArQTq
 bi3InhB/kjCcYqa9D8fdvGo86hS2KJBUhjDzU/xTa+Qc6V01sec1i4/Je
 0GrfXexDCAlBD4BJdroeBrOjLTjRh+9pI+gFPMnuYenEFbektWfUrCTJH
 AS0SSDkhWLbvz2anZ28MCF0Gtxm4wiVf0PUz6/JSV+11l0UQ7P493uN2P
 XllcIeaiT9WYlb2vsdnI4pzOnMWYC2UUP0SjlHXs9N4PAvbZL4ofwsmvH
 T/PqjwLdyVXC5ii8zh95szkVT1MMBmGLlLw+O2gm3KJwdoeF2wVR3Bbxz Q==;
X-CSE-ConnectionGUID: sirqK9SaRb+MazqRMlWcfQ==
X-CSE-MsgGUID: BJIY9uE7SSO4NeBoUkZxKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53190686"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="53190686"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 06:40:29 -0700
X-CSE-ConnectionGUID: OcVma6l7QSqj6+2tzsmWBg==
X-CSE-MsgGUID: wCs51v6SRE+fwVDd9NHQoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="175825561"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa001.jf.intel.com with ESMTP; 16 May 2025 06:40:28 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_mmap: Acquire rpm ref for all
 pci-membarrier tests
Date: Fri, 16 May 2025 19:28:17 +0530
Message-Id: <20250516135819.2784676-1-kolanupaka.naveena@intel.com>
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
  tests/intel/xe_mmap: Acquire rpm reference for pci-membarrier tests
  tests/intel/xe_mmap: Use appropriate drm APIs

 tests/intel/xe_mmap.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

-- 
2.34.1

