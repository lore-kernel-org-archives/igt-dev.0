Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DEBC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 13:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217BA10E653;
	Tue, 25 Jun 2024 13:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4yplLRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2007C10E653
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719323162; x=1750859162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hWIJdiZY1z14J0mlbYdQ+Q62aYgd5KV8U0e3U2kj9cE=;
 b=i4yplLRXddNVwxW8dyH2Z5kiCHXn9rYj/W1YJBCc+1rm2/S3QsL9vwdh
 iWQ+3hxp3i1OgMluhEPk6VUS4rZ/b1aIZtZfVWFigi/lgWBXl34NNbG+q
 nU5Gef4VHxzcqr7bQOcszSiafYQryIy48nWdEvND26gWBU8CF5vhKPOtl
 wjWar/G8zjXthYTqob0FTvroF9yOHJLJneRemP+goj+z2HPvb3in2QNCG
 xR5nrqXeqyyxWMkdo2f5jZuVsogUxVY99dxIxWzc6c4DnP56lppPh9RB3
 E1kohNRjvj1t5Ux0SFYulPTPUaxACbhmsTiXyZOZ44CCH9qHLQ/TzOw8K w==;
X-CSE-ConnectionGUID: kMa6BKriRKy/9y64bg1yaw==
X-CSE-MsgGUID: DCorFENRTW+n6k6M49YRtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20149869"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20149869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:46:02 -0700
X-CSE-ConnectionGUID: JzKYPmfuTViTdVZllnk08g==
X-CSE-MsgGUID: Nhhdu4ydRdGRWo6WqVlg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43458325"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:45:59 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [i-g-t V2] tests/intel-ci: Update i915 blocklist
Date: Tue, 25 Jun 2024 19:07:51 +0530
Message-ID: <20240625133751.293055-1-bhanuprakash.modem@intel.com>
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

Block KMS tests those are specific to (display_ver > 14)
are not applicable for i915.

V2: - Update the regex (Kamil)

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/blacklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index d01ef5e16..cfc5491d5 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -142,4 +142,7 @@ igt@device_reset@reset-bound
 igt@kms_bw@.*
 
 # Tests specific to (Display_ver > 14) are not applicable for i915
+igt@kms_ccs@.*-4-tiled-xe2-ccs
+igt@kms_frontbuffer_tracking@plane-fbc-rte
+igt@kms_pm_dc@deep-pkgc
 igt@kms_vrr@cmrr
-- 
2.43.2

