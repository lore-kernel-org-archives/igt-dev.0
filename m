Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A39606A322
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 22:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k1byrZim
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8964E10E8E0;
	Fri, 30 Oct 2026 22:41:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18F610E42F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793400014; x=1824936014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nEXc/PjkIPWqnEGhxQXX0gEX2KOkMI5shhfaRsC/zuM=;
 b=k1byrZimRwVR4Zb5GCMLiJiNMtO30CN8BmpOEZ/Xy9XEK7P4BMgOV1J6
 tX/yaZSRl28dbNdP8imfRFFR35a6a5ItwiZwmQdRZh9fKvqVP5bpl+DAb
 Z7FnvFPTdvFpsR4tl8oYXsohtYPPmVEOkvSwhDZiGhFN1ZqaT5/ewazj+
 SSERzd1wGU99KflxoqdYpjCgU7WXCmRBlOlQyxsZo1t/ZNdAqjdcABl0H
 6erivKv0AcbFOBLX6CteA55Bo2raooGtigLArhQfWTQxrAseMPzWpjmcD
 /XpbdCqaeLWAdpdQrI2NnKTjNZixfzMz8P2xyV8vPAiGY/dBN49J6vztL Q==;
X-CSE-ConnectionGUID: GJ8Z73+cR9ymHdUudcjYsA==
X-CSE-MsgGUID: tLC0kSG4RKeBoeuQiYlmQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2165492"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2165492"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:14 -0700
X-CSE-ConnectionGUID: mhUi7gTZSGqZCGeDhrR08g==
X-CSE-MsgGUID: Q75R1TYCTPqV54D3+FAiww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5874292"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com,
	riana.tauro@intel.com
Subject: [PATCH v2 0/3] Test unbinding PCI device while OA stream is open
Date: Fri, 30 Oct 2026 15:40:12 -0700
Message-ID: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unbinding PCI device with an open OA stream FD crashed the system with a NPD.
Test the kernel fix for quiescing OA on device removal.

v2:
- Assert expected values (Shekhar)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  tests/intel/xe_oa: Move device setup and teardown into helpers
  tests/intel/xe_oa: Check that OA buffer mmap rejects a non-zero offset
  tests/intel/xe_oa: Add unbind/rebind test with an open OA stream

 tests/intel/xe_oa.c | 540 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 515 insertions(+), 25 deletions(-)

-- 
2.55.0

