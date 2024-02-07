Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF0C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 13:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2E210E766;
	Wed,  7 Feb 2024 13:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMBfTlaa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1766910E766
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707313442; x=1738849442;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t4MoerGN/oEwt/KjU+a56hfbCpSJbPsnneyGKMa1Up0=;
 b=BMBfTlaajEpjAqR8e8MZkWm4HHOtHqTH3eFuIsXIkW94UIolEwBwEr/B
 UXrFEiRLtlynKqx/2k88ciQd8+MISsV1rzboi5SwbA32DjFl9T/BLdog3
 o+88mSG9tZSXjR92l8xQPsJPET04DGX1Pa7lyQb5TuZPR4+37S9aEdjAh
 0opyimpyQiRfEX+e4xtS4kcUitSuKtDO3ytGp+TbP2Ep1WEHdY5J9NlQl
 88HXJLd7dbnaNHyIdLX2q7f9GoJbNUgswc6S75z6Z2NtKxGkxwXLGjEyq
 ZJjpNe1m5jF68WxD/Jw2il+C+qglYzbuV7WMIHgSAyKri4+1/NeD0afV+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1133290"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1133290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 05:44:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="5973361"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 05:44:01 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] extend psr2_sf test for pr_sf
Date: Wed,  7 Feb 2024 19:23:16 +0530
Message-Id: <20240207135319.1880229-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

kmd series [1] adds supports for panel replay selective fetch,
modify lib and kms_psr2_sf to extend kms_psr2_sf tests to validate
panel replay selective fetch as well.

[1] https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3

Kunal Joshi (3):
  lib/igt_psr: add support for PR selective update
  lib/igt_psr: modify library to support multiple PSR/PR outputs
  tests/intel/kms_psr2_sf: extend tests for panel replay sf

 lib/igt_psr.c                          | 130 +++++++++++++++++--------
 lib/igt_psr.h                          |  14 +--
 tests/intel/kms_dirtyfb.c              |   4 +-
 tests/intel/kms_fbcon_fbt.c            |   4 +-
 tests/intel/kms_frontbuffer_tracking.c |   4 +-
 tests/intel/kms_pm_dc.c                |   6 +-
 tests/intel/kms_psr.c                  |   4 +-
 tests/intel/kms_psr2_sf.c              |  94 +++++++++++-------
 tests/intel/kms_psr2_su.c              |   2 +-
 tests/intel/kms_psr_stress_test.c      |   4 +-
 tests/kms_async_flips.c                |   4 +-
 tests/kms_cursor_legacy.c              |   4 +-
 12 files changed, 177 insertions(+), 97 deletions(-)

-- 
2.25.1

