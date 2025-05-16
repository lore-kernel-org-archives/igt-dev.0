Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAB2C3ABDD
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 10:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABBC10EA41;
	Fri, 16 May 2025 10:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilBtV2NK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CFC10EA41
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747391641; x=1778927641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zB4FNlTCqQsmvbnVkyoR8LVWElkex9GEU2ANKQJYAGo=;
 b=ilBtV2NKehrIrx6H89jl5NeLMIIOJFFC5XVgSN8IK7JsfMZyeJ1IG/pu
 5AhSfsggqh6Xr1DnPK28oYWq5rk0XvbcQy8csHOiJcNQIqXQRz50timdI
 hf/G4r9DFQp+EzqOfleUsxeO0J9BAdxXBmaYytYH7b2FGZc1TnjKG9hAu
 T5loZcCjYk9g5/yfW17jVEdMKpurHQfWUWHLIF7GyPV12Ydrm3+RvDOel
 LT6dPi9dtYM4gb+AdBuhDK0I7Wsk4Ia6xwL6gQSgma8QR1nY0h0Mp+t/D
 ODqC4SgaU/CG3r/GDPYsB0gXqAKIanrivNskqAEWayeZ/4mdmBQpURDnq g==;
X-CSE-ConnectionGUID: hTllCiH0RHuNISphFn3ztw==
X-CSE-MsgGUID: qNvaONLOQTybqbCIF+aUnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60697259"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60697259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 03:34:01 -0700
X-CSE-ConnectionGUID: /bDiR5eRRy+Jcjab/lEfzw==
X-CSE-MsgGUID: 2Q1VGz30QrKRvx2F0wcm+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139539067"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa008.jf.intel.com with ESMTP; 16 May 2025 03:33:59 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_mmap: Acquire rpm ref for all
 pci-membarrier tests
Date: Fri, 16 May 2025 16:21:47 +0530
Message-Id: <20250516105149.2783072-1-kolanupaka.naveena@intel.com>
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
  tests/intel/xe_mmap: Acquire rpm reference for pci-membarrier-paraller
    test
  tests/intel/xe_mmap: Acquire rpm ref for all other pci-membarrier
    tests

 tests/intel/xe_mmap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.34.1

