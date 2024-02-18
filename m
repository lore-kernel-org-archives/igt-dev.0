Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D4DC4829E
	for <igt-dev@archiver.kernel.org>; Sun, 18 Feb 2024 09:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BDC10E00A;
	Sun, 18 Feb 2024 09:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOxKa8c6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D0110E00A
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Feb 2024 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708247257; x=1739783257;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cFKZs/chKDBp+Eu0KJX8XCdFFnmAc2zsATR2TTh5lHs=;
 b=iOxKa8c68yIvXXFUFi5sGKxCB7ryI8+2c2ESqdRsjd/WWADieCm4GQut
 p01w1i0RF5i2bjCWHt5DjMsWzclAmw/TRJ3udC7qtqGWTWM+jgl6cIxHh
 v70QIvw+lM5o83A1drylptR7HSgvOzNFncImWSuirFMYmr8+R741eaGyR
 9w3yhzS+ApEwwbTd+2R+pKlzkmecVb4mz/p/xuVaJK2ETWdHgaw2nz2qi
 DEfanFBPw1nJS06rgFawVF7qr7KK2EMe3YyD5/UkdJJ/nXmpaQOA6xUFL
 n0ObvOsoG3u1JjnO+HD4DEOSFmiXH9L3btSPESGOHBfbMzQurRN1/YFN2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="12885280"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; d="scan'208";a="12885280"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2024 01:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4281650"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 01:07:33 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] extend psr2_sf test for pr_sf
Date: Sun, 18 Feb 2024 14:47:01 +0530
Message-Id: <20240218091704.2259937-1-kunal1.joshi@intel.com>
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
  lib/igt_psr: modify library to support multiple PSR/PR outputs
  lib/igt_psr: add support for PR selective update
  tests/intel/kms_psr2_sf: extend tests for panel replay sf

 lib/igt_psr.c                          |  98 +++++++++-------
 lib/igt_psr.h                          |  14 +--
 tests/intel/kms_dirtyfb.c              |   4 +-
 tests/intel/kms_fbcon_fbt.c            |   4 +-
 tests/intel/kms_frontbuffer_tracking.c |   4 +-
 tests/intel/kms_pm_dc.c                |   6 +-
 tests/intel/kms_psr.c                  |   4 +-
 tests/intel/kms_psr2_sf.c              | 155 +++++++++++++++++++------
 tests/intel/kms_psr2_su.c              |   2 +-
 tests/intel/kms_psr_stress_test.c      |   4 +-
 tests/kms_async_flips.c                |   4 +-
 tests/kms_cursor_legacy.c              |   4 +-
 12 files changed, 204 insertions(+), 99 deletions(-)

-- 
2.25.1

