Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49473D1266D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE26C10E783;
	Wed,  3 Dec 2025 09:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buGVtQce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721AF10E789
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764752493; x=1796288493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUOT6B7OeTFwl87j1mPsBfMpsm6L+iZYzPNPihV5qVY=;
 b=buGVtQcesakKvtEyaewx/47CkfUMhZeKn4HwfUdarx3Z1wH2iBWFrChx
 WqDQcDF6Y4hFX5HorsISnC9LQwE26IM3RL7zoj6eNB597JUj26Fo7zZhW
 TE6Ai9ZH6NA5JiCBJe5y/zR8F/PwtsVFsXf7M4tuhZXS8ck+psIj7Fq3T
 lJvbcFD0+zaq22juX9RJjoG3IKG1TNTEPIbaisZGuvtIVxTm4VHzLGS79
 R3rmPOOYaan1otYbDWEJUXNXHYGwdfilzkk2RgUA4Rt3ekmoGaTY+Xcz5
 Go+bJMawI848rHixJCR77lmubF14X3PSXtFy4Ko3/CNxWhpB5bl/fiRFI g==;
X-CSE-ConnectionGUID: Ixm/pHOyTzSKE/6Lp+j/Bw==
X-CSE-MsgGUID: w3pR9T+WR1Kd6ZzWOW0RJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77848131"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="77848131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 01:01:33 -0800
X-CSE-ConnectionGUID: 9q7bHxWfTkGJEx29YARMIg==
X-CSE-MsgGUID: L+fsS06jQG6qgOuFU+kikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="195409974"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:01:30 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Enable HDR in IGT Frontbuffer Feature Tests
Date: Wed,  3 Dec 2025 14:38:33 +0530
Message-Id: <20251203090836.1164827-1-swati2.sharma@intel.com>
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

Patches add HDR support to the kms_frontbuffer_tracking tests.
This update integrates HDR into the feature test matrix, ensuring HDR
scenarios are exercised in RTE, suspend, and other feature-based
subtests. The patch also includes handling to skip CRC checks and CRTC
resets when HDR is active, preventing test failures due to display
resets.

Swati Sharma (3):
  lib/igt_hdr: Move HDR helpers from kms_hdr into shared library
  tests/intel/kms_frontbuffer_tracking: Add HDR feature support
  tests/intel/kms_frontbuffer_tracking: Enable HDR in feature tests

 lib/igt_hdr.c                          | 200 +++++++++++++++++
 lib/igt_hdr.h                          |  33 +++
 lib/meson.build                        |   1 +
 tests/intel/kms_frontbuffer_tracking.c | 170 ++++++++++++--
 tests/kms_hdr.c                        | 298 +++++--------------------
 5 files changed, 438 insertions(+), 264 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

-- 
2.25.1

