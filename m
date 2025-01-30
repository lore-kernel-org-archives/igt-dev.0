Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E64C0218D
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 22:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CD310E9EF;
	Thu, 30 Jan 2025 22:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+/dJwlu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7D10E9EA
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 22:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738275308; x=1769811308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wt4vuIhZTUNuxKzboNP0VEateyFTjaMMgSatYp2BTh0=;
 b=H+/dJwluxF6ByZ4D2Gxuppo5AGuqW3EIRHJJaMivnqpPiZNxHcsDlnEI
 LtI3N3CTuLRoZBLJPBxWZUtiPbPIJ3gweZ3fCwMjs3rm7uHXtOCyWXEnU
 Si01kqtFyWt/V7/9VO/dvRUAYgRZQ7NGbYrQE4Qqou2LE+2r7BYQSR9P4
 apnSQEfl7QEJjhVS2HWg5nC2/d3XcxA7BmKuUHyUBQHypavI3tri9UM+o
 XI1nScXv2Aofgj5v+OipaybimsJlmsZecXDgA8W8d+pU0jA3xsDCkQvcs
 K5KW1R/yOXgSwd+6pG4dbq3CUtdLAr3KFWGSFN7+lgCpfJdgcHhFoVP0y g==;
X-CSE-ConnectionGUID: dghILYLgQqiSq1R99bz96Q==
X-CSE-MsgGUID: fDD8speyR26Ou1LER0vFWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49502774"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49502774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:08 -0800
X-CSE-ConnectionGUID: 8JTxz5ltT6+r5lQ/W/DLCA==
X-CSE-MsgGUID: 1PCPlBgDR0S672g3JA1f9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="140347229"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:07 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 0/3] Prepare for new PXP UAPI flags
Date: Thu, 30 Jan 2025 14:14:54 -0800
Message-ID: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
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

PXP adds several new UAPI flags, which cause the IGTs considering those
flags as invalid to fail. Therefore, ahead of merging the PXP kernel
series (which is fully reviewed and ready to go [1]), update the
IGT tests to not expect the new flags to be invalid to avoid the
failures showing up in BAT.

Note that the changes in this series have been extracted from the
bigger PXP test series [2], and the r-bs have been kept from there on
the 2nd and 3rd patch as they're unchanged.

[1] https://patchwork.freedesktop.org/series/136052/
[2] https://patchwork.freedesktop.org/series/142450/

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Daniele Ceraolo Spurio (3):
  tests/intel/xe_vm: Update first invalid flag number
  tests/intel/xe_create: Stop treating the extension field as MBZ
  tests/intel/xe_exec_queue_property: Update first invalid property
    value

 tests/intel/xe_create.c              | 5 -----
 tests/intel/xe_exec_queue_property.c | 2 +-
 tests/intel/xe_vm.c                  | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

-- 
2.43.0

