Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A99EFB805
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 05:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A68210E067;
	Tue, 24 Feb 2026 05:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJoCd2gt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEFE10E067
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771912098; x=1803448098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b1yRlG09hQWTN1lt4lR1mjr94eqTxdpr1+nKtnVRBVU=;
 b=fJoCd2gtVJnBSy+8Yxqs/5fgB20Gurv8Xh84a0K6pXGV2Drf+9cxKTnN
 BTi9Qje3sf15DM+jtPf9hgorwhvmbFfmfsqWkNwK17poj4X52Wqs5Hies
 jBZ4X4+rjtdWw7o+7oO8qZv2jaHCdLlRRM/gCdsW1loStE4Kj27reiS3I
 1BEp7eTLp8sOgntOUzUWpi9KZpKX6DNs6D0GTrNbq2GGMNpbe1WRQz/18
 4Bbtpa5jzUbSQ6PtA7n5joCp03eXy3ew897AkfmHuuDOMR/XCNdah0pYl
 aUhqNVdkz3vgtc33+n+TgOStj5mubzShsxQ4kHCRvp8v/j+Y0J7CeqCHW g==;
X-CSE-ConnectionGUID: On0Xax/fTbKDQVKLYyttDw==
X-CSE-MsgGUID: PV4mJqgYQG+eaAb2woN3Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95535458"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="95535458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:48:18 -0800
X-CSE-ConnectionGUID: zTnB4CwNTgicSBV57kNI5A==
X-CSE-MsgGUID: vPQ4DgAKRzyCNsc5TAMAGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219900916"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 21:48:16 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 kamil.konieczny@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 0/1] tests/kms_vrr: Skip LOBF test when aux-less ALPM is
 not enabled
Date: Tue, 24 Feb 2026 11:15:10 +0530
Message-ID: <20260224054530.2946765-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

This patch series restricts LOBF test execution based on the observed 
support behavior across eDP and DP 2.1 configurations.
From our analysis, LOBF is supported on both eDP and DP 2.1 
only when the display version is > 35. For display versions between 20-35, 
LOBF support is limited to eDP. Additionally, either Aux-less or Aux-wake 
mode must be enabled for LOBF execution.

LOBF support may also depend on the eDP version 
(e.g., valid only for eDP ≥ 1.5). Confirming this would require reading 
DPCD registers via IGT, which is not preferred at this stage. To avoid 
unintended failures and ensure proper skip behavior on unsupported 
connectors, the test is now restricted to execute only when Aux-less mode 
is enabled, preventing false negatives and improving stability.

-v2:

-Update commit message (Jeevan)
-Remove additional check for connector type filtering (Jeevan)
-Update commit message for LOBF/ALPM clarification (Kamil)
-Rename function to igt_is_aux_less_alpm_enabled (Sebastien)
-Add explicit null-termination (Sebastien)
-Add igt_info() log (Sowmiya)

Mohammed Bilal (1):
  tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled

 lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  6 ++++++
 3 files changed, 39 insertions(+)

-- 
2.48.1

