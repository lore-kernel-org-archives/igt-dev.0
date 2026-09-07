Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC1BC79F9F
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 17:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D472310E8D9;
	Mon,  7 Sep 2026 17:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIq35mxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF42610E04F
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788803316; x=1820339316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K4tQYNtSXE610YXnIsIiEZryZYUPWk5F4a2LSA3+gis=;
 b=bIq35mxq668Sup1SPEYvbk13n9WGSW2G6Wl68Wjsq8pLjd9xZt6v67mv
 k1rIQxL4NBMwmb6IDsqfvREDLI3zcOUd69w1v4SKWdlxkceARkpF+yKAI
 G9huMZ2bc9tnv2gyvpqotR6cpxRqSsO2DHpnTEAvIgiu+CCRtbEbSVYV7
 EPFBppIN2VAJyPhTKgudHaIToJ8g+LH+/o0yid5S8ktYpRf/G7Yp0poWM
 9RJroJDuodiKHqBYNwF1+D440tMNFPw6/lI5pnZ0Ayc5Q4OlQ0Cwr2O4F
 yEvfi3aECUi2WAxOlcCv7DRGdcUG/m+W5vZD3pp7u59BsmBUFCCEaQId9 w==;
X-CSE-ConnectionGUID: Gruoi/5VQLel+5iJkQyjmA==
X-CSE-MsgGUID: Z93T6W3bQsuImPREtWBeDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99801580"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99801580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:48:35 -0700
X-CSE-ConnectionGUID: SSc0XIyPSDa+rZAu/xlcew==
X-CSE-MsgGUID: hIpJgmxYQdmvB/UEt23XAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270743501"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 10:48:34 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 0/3] Add CMRR subtests
Date: Mon,  7 Sep 2026 23:18:32 +0530
Message-ID: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a subtests to validate CMRR with video mode and desktop mode.

Naladala Ramanaidu (3):
  lib/igt_vrr: Add VRR helper library for display refresh rate testing
  lib/igt_kms: Add helper to return vblank timestamp and sequence
  tests/kms_vrr: Add CMRR fixed and video mode subtests

 lib/igt_kms.c   |  37 +++++++-
 lib/igt_kms.h   |   1 +
 lib/igt_vrr.c   | 166 +++++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  30 ++++++
 lib/meson.build |   1 +
 tests/kms_vrr.c | 240 ++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 471 insertions(+), 4 deletions(-)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0

