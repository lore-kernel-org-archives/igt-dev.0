Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB04CCFA0C
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 15:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FB610E639;
	Tue,  4 Nov 2025 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9JQT4b6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84C110E636
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762271413; x=1793807413;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NEpbtAEeH7pOtqUJy7cDT08Oa0+kSMDhJ9e5SmUAOH8=;
 b=W9JQT4b6IzbivsZSP8KrbZEttEi/Scv9C4evmeLIg1x4ACToGD1Ybq7I
 ie+iQmPN2IG7/ls689xKeNKlTTXfSoZcErXe2EUHzLBCGA0jLr7ZwPnZ0
 6154GjuDVwOHOKZ/cI3+Ppq0KhjwG4mAtbHqEO3K/XHNlDtPxQIRFUh0g
 bHaUdDEWFOZTMqnF8iM1oB1BxNlM6B2JwNPZd/zpkScWNy/jlme/dFVAX
 9jBF+6ovA6krpMCFXZvIjTW9ZJmTIH4a1SlwkX43dF7bQOiPDkEZOt3DW
 DaKqWZW5hvoYCafEnhFxLjnMI3CFH9CYtfEHXBtWvu1Lj4eM27elb+C6g w==;
X-CSE-ConnectionGUID: tfiucmMxQ86ZZ66+D9FhuQ==
X-CSE-MsgGUID: PZIeDKy/Qw2V0Y1RjhJgDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68206025"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68206025"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:50:12 -0800
X-CSE-ConnectionGUID: KAkgzTnuRDqZOfUWDR4HLA==
X-CSE-MsgGUID: 36njvyMMQgG/1BUUM83GZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191542270"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.72])
 by orviesa004.jf.intel.com with ESMTP; 04 Nov 2025 07:50:13 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v3 0/7] Madvise feature in SVM for Multi-GPU configs
Date: Tue,  4 Nov 2025 15:50:04 +0000
Message-ID: <20251104155012.679830-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series adds comprehensive SVM multi-GPU IGT test coverage for
madvise and prefetch functionality.

ver2:
- Test name changed in commits
- In patchwork v1 patch is missing due to last patch was not sent

ver3:
- In patch-7 tags were added and it was not sent on patchwork

Nishit Sharma (7):
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU cross-GPU memory
    access test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU coherency test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU performance test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU conflicting madvise
    test

 lib/xe/xe_ioctl.c             |   40 +
 lib/xe/xe_ioctl.h             |    5 +
 tests/intel/xe_multi_gpusvm.c | 1379 +++++++++++++++++++++++++++++++++
 tests/intel/xe_multisvm.c     |   41 +-
 tests/meson.build             |    1 +
 5 files changed, 1428 insertions(+), 38 deletions(-)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

