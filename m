Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B8DC2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 10:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637F610E86E;
	Wed, 21 May 2025 10:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lq283jEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFAA10E86D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747823010; x=1779359010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uG0ZK4pZ3I7zyjpS+OlBvlIb3C2BDpxpb3pKW6nFzEk=;
 b=Lq283jEOrKJB8VJZFP3P8/+k969cZd2wY5u9am166dKGcTaLdB52poos
 36G3C3lZCFPpcPMc1CLUkNat58dYFNOPyaG2rVh5qENPu9hmPcKRSH+/s
 5umY+nyRxEaReG+oxdF1C0c95g/rUYUJP/b8+xdml0i82h8AS6WHp8HgL
 JIbTzEpaThcuCZk3Zl7f4g4HMVctpHCk2DKX2OSP66rgiGzg+kob4aXOp
 6fJ84Ge0fScLkNevBUO1y8PVtkIuBSOoqMSRdv2XgvMkBnIGFHAjBFsVh
 QDV5CHBFvYYCqZFBmAQO90LU/zsO/UDnKxGEgaL6OritjFwzt1+elIQBJ w==;
X-CSE-ConnectionGUID: RcNf8hbKQROg9GQp4GpIHA==
X-CSE-MsgGUID: ZU/hsDwbSyqgMzF8swo9kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60837655"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="60837655"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 03:23:29 -0700
X-CSE-ConnectionGUID: IcPaPYUzSSSuBm/4eRe5Eg==
X-CSE-MsgGUID: oW7v2qHITY22rCBVu6Rb9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139868126"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa006.jf.intel.com with ESMTP; 21 May 2025 03:23:28 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_mmap: Acquire rpm ref for all
 pci-membarrier tests
Date: Wed, 21 May 2025 16:11:20 +0530
Message-Id: <20250521104122.2853986-1-kolanupaka.naveena@intel.com>
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
  tests/intel/xe_mmap: Fix open/close calls

 tests/intel/xe_mmap.c | 73 +++++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 27 deletions(-)

-- 
2.34.1

