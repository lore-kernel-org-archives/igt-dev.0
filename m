Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D117C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EC41135BE;
	Wed, 17 Apr 2024 14:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxLhRN97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227701135BE
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713364777; x=1744900777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3HTt9XY3Hsfer3BLTxIZ31lndy2lrZ9sap91KiJrxyA=;
 b=MxLhRN973olKR53i281bjLREYQjLCl79Hx30//DSvPy8KtREWLn7xHWo
 K/ni/3V+ENRIZCTDuf0mnWA2eY4cKIj8KQ5sWC2pgyH7CAurWx6HA/O7H
 arPzi2hph6XvTc6V3uymDlUZno1F3FHZ4CsELO6Mhiex93cJt0bFKmBHz
 uyOO6S33Mhvk42U3VlI8/sJn21k8Xqg+Dh6yvixiHPCzjfSiS5S0ze93U
 F3DewmyljLk6DTpc42KkmORHp044oNQ7v7u1fpsvIvu7UPhJ0MAeIxmua
 JPEyL1YtUfu9cHUxEFgJTxY/9Lhi57p+8n2ZsV2xLWnH+vzFxmShb2BWx g==;
X-CSE-ConnectionGUID: VAZgoyyKSF2tYLSH8g2ZMg==
X-CSE-MsgGUID: L2RM21KrSeGTh80+dztJCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9083637"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9083637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:37 -0700
X-CSE-ConnectionGUID: 6Z4YNC/wROKoKCMfTmE7zg==
X-CSE-MsgGUID: xVSj3X38SYiB/jOcGyzzNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53859879"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:36 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 0/6] Force joiner support in bigjoiner checks
Date: Wed, 17 Apr 2024 20:03:19 +0530
Message-ID: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Bhanuprakash Modem (6):
  lib/igt_kms: New helper to check force joiner status
  lib/igt_kms: Force joiner support in bigjoiner checks
  tests/intel/kms_pm_lpsp: Force joiner support in bigjoiner checks
  tests/kms_flip: Force joiner support in bigjoiner checks
  tests/kms_setmode: Force joiner support in bigjoiner checks
  HAX: Test force joiner on BAT

 lib/igt_kms.c             | 43 +++++++++++++++++++++++++++++++++++----
 lib/igt_kms.h             |  1 +
 tests/intel/kms_pm_lpsp.c |  3 +++
 tests/kms_cursor_legacy.c |  5 +++++
 tests/kms_flip.c          | 23 +++++++++++++++++----
 tests/kms_setmode.c       | 22 ++++++++++++++++----
 6 files changed, 85 insertions(+), 12 deletions(-)

-- 
2.43.2

