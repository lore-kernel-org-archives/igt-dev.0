Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08281C04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 15:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA5910E7BC;
	Fri, 19 Apr 2024 15:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sh+Raxr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2B810E7DF
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713541109; x=1745077109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i8+qnlrDbHogQxuPa5rJxAiEx0ZaRqvBPOoEo/8mavg=;
 b=Sh+Raxr8RC0KKDwvhGfTlsv6ddgFeDabN+YSk3EnpicUQxcW9NSOPzBF
 lt7kiSDxG9SrMjbLD5a+fsqkVpkfM7MzC/9FSUmMMaBN+23Rf4r7s5e9v
 sa0WlBnTrwEtfQMtns8fKiTckKNRJS4WvwIvWeaZDhnd78XZKGm8mSidi
 CCC8DoV6DxcHQ6Ah7pfIT/nPBSxuNMlmFBXDlrXaeB03d0Iez0y6yD0YQ
 7khblzrdtRZRfDMws285J10h+vknySF4SYAMdafEPPB+dckIkbNgkAic5
 TGuY7jRGdr4naTdwtvN6YllsC05I1jrlgYvA4yohcZ2l03zdi/l5MguOY w==;
X-CSE-ConnectionGUID: +2C88YgKQLyja22AWvzm0g==
X-CSE-MsgGUID: eUekMSvKTGKwG3xkVXlmEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9009101"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9009101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:38:28 -0700
X-CSE-ConnectionGUID: WDSPs+glSe+auXfxu1tWAw==
X-CSE-MsgGUID: 42FNYxeJSoSDTQF/zYRVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28017182"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:38:28 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v6 0/2] Update compression check based on platform
Date: Fri, 19 Apr 2024 20:36:15 -0700
Message-Id: <cover.1713584014.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
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

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled,
and if it doesn't, then update the check on compression
and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform has  flat-ccs
    enabled
  tests/xe_ccs: Update compression check based on flat-ccs  enablement

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c | 40 +++++++++++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.34.1

