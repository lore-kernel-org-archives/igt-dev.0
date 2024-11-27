Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A157D609AD
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 07:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08E810EA10;
	Wed, 27 Nov 2024 07:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NERsjL64";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C06A10EA00
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694376; x=1764230376;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WYzPkCwQDhZaNcE5gWeFKoMHK19RVvowmbWxoz2IFFg=;
 b=NERsjL64kHp2M8frGPyahuqnJWh+gIoTIZefh+0rfrgesUNbfPwwD/HP
 t5/j9e3zfUpYtthMTisKklMlp/cLu+ge6rNpKDAFLk2ppkbAeQP/Isj+z
 A5lVg2NfjNBHzQ3/Rpskj9hTUQaMyVU1IDL8zK2PmfBHL0S6jNTASPEQL
 GfanKGDVgwXR+TeIMLxU81pEQxgQB9hFT0sJHMg799j8LhjRo6HMVJvoQ
 I5qBo/B1b7sokvuWmNYc+NKFNInhbjvOIhBfseVI1cGIXnqWZcnh3ygXD
 5PzNq3udZUx+TWZBMZ2tE6mlalF3y5nKrz/A2W0q5p15ZdlXH7RVIvIwE g==;
X-CSE-ConnectionGUID: T9i5O4frTOeAn/Pl/t2GVA==
X-CSE-MsgGUID: bmK6+lWBSMOVayAxZPsXTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32628675"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32628675"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 23:58:54 -0800
X-CSE-ConnectionGUID: udU7SNbYS7GFB+AU8sepbA==
X-CSE-MsgGUID: 0aRxO2qySLmG1otPHdV/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92008395"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 23:58:52 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/4] Skip test if joiner display is connected
Date: Wed, 27 Nov 2024 13:43:53 +0530
Message-Id: <20241127081357.569876-1-jeevan.b@intel.com>
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

Skip tests on joiner outputs to prevent failures caused by high-resolution
displays. This ensures the test suite runs smoothly without unnecessary issues.

Add 6k resolution support for a single CRTC and update calls.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  lib/igt_kms: Add is_joiner_mode function
  tests/kms_display_modes: Skip test if joiner display is connected
  lib/igt_kms: Add 6k resolution support for a single CRTC

Santhosh Reddy Guddati (1):
  tests/kms_async_flips: Skip async flips on joiner output

 lib/igt_kms.c             | 54 +++++++++++++++++++++++++++++++++------
 lib/igt_kms.h             |  6 +++--
 tests/intel/kms_pm_lpsp.c |  4 +--
 tests/kms_async_flips.c   | 18 +++++++++++--
 tests/kms_display_modes.c |  3 +++
 tests/kms_flip.c          |  4 +--
 tests/kms_setmode.c       |  4 +--
 7 files changed, 75 insertions(+), 18 deletions(-)

-- 
2.25.1

