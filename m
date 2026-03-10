Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69258EB104A
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DC910E237;
	Tue, 10 Mar 2026 10:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFdKWtIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25E210E235
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139134; x=1804675134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1OkLZWtHOiqMfquRoJhtZ7Ie1XTFMlu5v1HNXNw9sMU=;
 b=HFdKWtIfTPC05kU1T9NXbNdPdzy0y1sTCy7XzpBeOzFsu7MY+FXAVDNv
 XqBBA4hO6R84xLcqgF6F9ragNQEUTi2F1w8sWTgin4yz+6mKeNPwPc7AY
 +EnAdEXBoDCygKqg73CqCyE9QTv3sBa7UUcUf1+Yc/dZ6ORH0lag0uyez
 SOVAotxYr8X6VBopBTPWtqDkkXCWfpGA6+aoelV7FwL5CnOXpYpxSt6Wk
 liWvVbuyGG92jUa8eO8jpK4nWT1Ci/qE/rvmUjgyvsivXCWzhljzDScWr
 BofdpkYfcA6I9kMV4gJcj552JgRm1I9vjVREv67oTPOIv6omU6TiF1rn6 g==;
X-CSE-ConnectionGUID: +KAnbsAvTKeF7IuKtgLQjA==
X-CSE-MsgGUID: FDTU8YcCQOalPJNDaOgOhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74059134"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74059134"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:38:53 -0700
X-CSE-ConnectionGUID: Ag+AQrAQSKyqYoH9udJ/gQ==
X-CSE-MsgGUID: Arfl9Q/BT4iw+enaxtn2jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219313438"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:38:51 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v4 0/1] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Date: Tue, 10 Mar 2026 16:05:53 +0530
Message-ID: <20260310103601.3195341-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

v3:

-Rebase

v4:

-Rebase

Mohammed Bilal (1):
  tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled

 lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c |  4 ++++
 3 files changed, 37 insertions(+)

-- 
2.48.1

