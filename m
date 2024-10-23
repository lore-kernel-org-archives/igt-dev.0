Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75857D2E015
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 04:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303DF10E731;
	Wed, 23 Oct 2024 04:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPNN2bHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9405810E72F
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 04:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729659335; x=1761195335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=niiRCPIN40PBqYWp4x0j7DaZgv7+RqbIxHXT6NoNm70=;
 b=HPNN2bHdQIwL70O+0BvPrp/N5N4l3YA1f8au5lIOfaql9ljADMDzjbL4
 imQCXW933PApbF0TS5kxwTDiHtyF1rSDoPCTRv/5mSYBbH9yfdz5cC57s
 1lZ7IHvaNm0fY6LNlaOfimPddJVE0exXmDdmEDaJfgGe/N+ylEU2RY/Mb
 PDNRDxrJovMmBPIeFEWzTwFffDB695xWt63mjfPug+HI37kM2nVBz3+4y
 TT+skbs0clhZNFnyxTScgRodK2dkp4GI4FUJ5xFOAsbEOffyu9eeETEg/
 MYs5cgHwfRE5AfX20cwysm4131WoXGIMapBZR4wG1r5zYi7e9wqRU+WG5 w==;
X-CSE-ConnectionGUID: gRYKXLouT4G1IBkdM83s0w==
X-CSE-MsgGUID: qNzfuT6RTxGs1OjncjXZYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29009107"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29009107"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 21:55:34 -0700
X-CSE-ConnectionGUID: dWYG8kiqS+eg2DOi82ZBMg==
X-CSE-MsgGUID: CDC5geNsTiCu9gFG4Nd8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="84061619"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 21:55:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [CI 0/2] Test pmu unbind (xfail)
Date: Tue, 22 Oct 2024 21:55:09 -0700
Message-ID: <20241023045511.3047422-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

This is expected to explode on perf_pmu@unload. Later this should work
together with the kernel patch.

Lucas De Marchi (2):
  lib/igt_kmod: Export igt_kmod_unbind()
  tests/intel/perf_pmu: Migrate to unbind + unload

 lib/igt_kmod.c         |  6 +++---
 lib/igt_kmod.h         |  2 ++
 tests/intel/perf_pmu.c | 22 ++++++++++++----------
 3 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.47.0

