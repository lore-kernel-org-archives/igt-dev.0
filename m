Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE62FCCD1BB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 18:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5A310E181;
	Wed, 22 Oct 2025 18:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMJc7sT7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA47010E181
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 18:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761159334; x=1792695334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n8uglY9iRxPj40zD1zdR7Yy9X7/c6I0cFKtkQsja1dU=;
 b=kMJc7sT76YQN4fSPT3TnpiuPV5PHrxIzge4ShsbH03aPb3lVWXJNsPo/
 6t12LPsw05d2wiJQnejJhcAMXe0UepXEZgS29fcieW6pq1em08CEujiG1
 V3342thEQMGakPBhG4RzdQpf+JYnAnCd2r3ge8an39vkiB8k065KuyzeN
 Ex1daE2NXrIPxKX/N8EOaTb4Cnfrldi5X8b1cD7ja+R/wpctmnD7bqSqI
 7ms90xydpNQ//0Sbzbctn0FRfHDCNxYU7UbvQwy6iVKPWzlOlf9pc8abR
 +z6LL2yNPkWn8Rp73BZP8EcooH3eqCUYdv53MQd5cYX4XRJX/RH+P9AjX Q==;
X-CSE-ConnectionGUID: 1lgILzPYSSiJZCZSwQIjQQ==
X-CSE-MsgGUID: CHxfsAqmQwusGGJzIxoYLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63241614"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63241614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 11:55:34 -0700
X-CSE-ConnectionGUID: jmZO0OxbTaS7vD2pN/B+jg==
X-CSE-MsgGUID: BxW1/SpxR2q/6rodnqEtfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183537699"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:55:32 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] LRR test to start above midpoint for multi-mode
 panels
Date: Thu, 23 Oct 2025 00:25:08 +0530
Message-ID: <20251022185510.1099036-1-ramanaidu.naladala@intel.com>
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

Update the seamless virtual RR test to begin from above the midpoint
of the VRR range when multiple modes are available. This avoids
fallback to lower physical modes near the LRR boundary, preventing
unintended clock changes and ensuring stable VRR behavior.

Naladala Ramanaidu (2):
  tests/kms_vrr: Start virtual RR test above midpoint to avoid mode
    fallback
  HAX patch do not merge

 tests/intel-ci/i915.fast-feedback.testlist | 183 +------------
 tests/intel-ci/xe-fast-feedback.testlist   | 288 +--------------------
 tests/kms_vrr.c                            |  12 +-
 3 files changed, 35 insertions(+), 448 deletions(-)

-- 
2.43.0

