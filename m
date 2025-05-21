Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B44C3ABC9
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 12:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE4410FA6B;
	Wed, 21 May 2025 12:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJDn4sCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A675410FA65
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747829174; x=1779365174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TaBweZyAcChWEdNTboZ9lgQYnLcb3IfExcsu35a2gHg=;
 b=DJDn4sCl7mvdCuTMjer03jljUznCl6GqU7jKrCpBxgifOsPxQZhsd5sE
 iNQ7IRjGgt1tSY+fZnCOqXkvgcH+9US8qgPct092JNOyqGuRjqVIzeKEa
 PSF78Lotmfmsk9QDG3n9trlASJAHXEz/ZGX3tFSUgDgBltcDSmyqO7oGr
 28F1qbmZnoBtkhQonw8pr76pAimCeDbrWnuPVnbJFk0eUcxzWFeR8Z/I6
 Ltf51zHu3Y5+YSwEFW+5Pug5b2AzP6jS3RmXsFzPfWBifBnjWXqMbwuKr
 aQ257ywHdUIkOgaBUgUU1U+u+qpUSfi4Ss4mo28uEv760fhh5872RWYzM A==;
X-CSE-ConnectionGUID: 1svDGzqETWiYf6D72sIusw==
X-CSE-MsgGUID: bJsyVMRuRSqvMVXkFvJ3Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49678043"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49678043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:06:13 -0700
X-CSE-ConnectionGUID: WY4GvrzmSEaSdfgR2RSF/A==
X-CSE-MsgGUID: spD1JQxVSTyLhNQTSiKqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140553255"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa007.jf.intel.com with ESMTP; 21 May 2025 05:06:13 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_mmap: Acquire rpm ref for all
 pci-membarrier tests
Date: Wed, 21 May 2025 17:54:05 +0530
Message-Id: <20250521122407.2855326-1-kolanupaka.naveena@intel.com>
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

