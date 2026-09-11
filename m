Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9D2C88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 20:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078EC10E1F5;
	Fri, 11 Sep 2026 20:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QfraN87i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FD510E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160288; x=1820696288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yrBD0EwqRtI3YW+MvQabrUxgrj9a/ZvmVpkc2Z3WLP8=;
 b=QfraN87i2joYNjouAWNihdnb2RJVARY3DEi6Rna5F5QP4r2Gp8230p6H
 twEBMaWCSFc5I7zTZySRhRRrJP0xGFiLo+JkOrdBu6W72Kt5pADD0wCQd
 7QMrQMR+nQWdXzR/bYGu9Dm3dHUovdQ1VM/eBL/m6w+xOHtsj35tsi7vt
 SfhCRv/Bl9ms8asok4VIFbGI89QXbOYMa6WX1ftmC+rEkLG5tdMnPzIer
 gUZTvFu+l8SdJ9JYHZCzNr2H82iwki4V7ellMJPczR5qYCJqMngJWziHd
 nM/Y07q9iN076Mq/wkqwPO/bJWni879eFPP7z0AieVOI/HajaXl4wFnKl A==;
X-CSE-ConnectionGUID: cGbov2eZQz+V+0CBuX4PFA==
X-CSE-MsgGUID: oJX9QgisSFmeO2po7dTA+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138954"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:08 -0700
X-CSE-ConnectionGUID: +IMdkjznS7qwv1ilJwk+Ng==
X-CSE-MsgGUID: qk4XqU+rSMehCDdQqQDsIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293665"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:07 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v3 0/9] Add DSC compressed BPP subtest
Date: Sat, 12 Sep 2026 02:37:00 +0530
Message-Id: <20260911210709.943683-1-swati2.sharma@intel.com>
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

Add support for testing DSC with specific compressed BPP values.

Swati Sharma (9):
  lib/dsc: Add igt_force_dsc_enable_compressed_bpp()
  tests/intel/kms_dsc_helper: Add helper to force compressed BPP
  lib/dsc: Add igt_get_dsc_sink_compressed_bpp()
  lib/dsc: Add igt_get_dsc_sink_max_compressed_bpp()
  tests/intel/kms_dsc: Add dsc-compressed-bpp subtest
  tests/intel/kms_dsc: Add compressed BPP combinations
  lib/dsc: Handle missing fractional bpp capability
  lib/dsc: Handle missing max slice count capability
  lib/kms: Add NVL joiner exceptions for 4K high-refresh modes

 lib/igt_dsc.c                | 141 ++++++++++++++++++++++++++++++-----
 lib/igt_dsc.h                |   4 +
 lib/igt_kms.c                |   3 +
 tests/intel/kms_dsc.c        | 101 ++++++++++++++++++++++++-
 tests/intel/kms_dsc_helper.c |  10 +++
 tests/intel/kms_dsc_helper.h |   1 +
 6 files changed, 239 insertions(+), 21 deletions(-)

-- 
2.25.1

