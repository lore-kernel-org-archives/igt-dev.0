Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B490EEB57A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 09:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ABB10E0DF;
	Fri,  2 Jan 2026 09:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dW2Hj4RL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604BA10E0DF
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767347191; x=1798883191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r4/npz9X0RLfrswKTh77qy/mEBRsrk/na5WHUfXrDyY=;
 b=dW2Hj4RLAN0DPjH6yNSYbWQCMr7HCgj6mRGtUQkmkdpEau0rqrFKdNA9
 /l1Br4hwRiXz5w8q6SZpfCu/LRqLi56OhS9ebRcWTMPuEAvZuBPAiy9To
 /6I37wm+jA4mrvODufR2Ux0xkZoDYtjaQNIgMVAMKf0SbOMAheNiaGEsT
 EGH3PqgcxWP993mKgaGHPQ6wVZn0Xek1zpLqw9r14PGYCcH8SQ+Is7KFv
 1hsCiAlBA7L9Ye3X9GGfGV1UBvVqfcuOtUz454dxG4VPiXkE9vIZ5jsSh
 nIjGdcRUxu7xw+4IgPRJKSvN+jAwRslm/eU27LmlurdlEwv52j+TGqmBh g==;
X-CSE-ConnectionGUID: vJVTwVB3Sr+iQa7Uu2lilQ==
X-CSE-MsgGUID: cuehGRrQQfWjuKCNfqAxgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94313804"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="94313804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 01:46:31 -0800
X-CSE-ConnectionGUID: 5zkoVfriTe2smw0sgBDEww==
X-CSE-MsgGUID: C+nG1VmwT6Gf/fu2DIUq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="202746884"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 01:46:30 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [v2 0/4] Enable HDR in IGT Frontbuffer Feature Tests 
Date: Fri,  2 Jan 2026 15:24:47 +0530
Message-Id: <20260102095451.42401-1-swati2.sharma@intel.com>
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

Swati Sharma (4):
  lib/igt_hdr: Move HDR helpers from kms_hdr into shared library
  tests/intel/kms_frontbuffer_tracking: Add HDR feature support
  lib/igt_hdr: Add helpers to enable and disable HDR on an output
  tests/intel/kms_frontbuffer_tracking: Enable HDR in feature tests

 lib/igt_hdr.c                          | 217 ++++++++
 lib/igt_hdr.h                          |  36 ++
 lib/meson.build                        |   1 +
 tests/intel/kms_frontbuffer_tracking.c | 724 ++++++++++++++++++++++++-
 tests/kms_hdr.c                        | 298 ++--------
 5 files changed, 1012 insertions(+), 264 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

-- 
2.25.1

