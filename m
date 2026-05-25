Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AEFCD5BD0
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 11:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9E010E2A0;
	Mon, 25 May 2026 11:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="at1W4D8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906710E2A0
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779708947; x=1811244947;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o4K8M5zziA3pfLchVlmOat6NWl+rJzAvZ3qoDKcKNUQ=;
 b=at1W4D8QvivWQElKxoRA2c95XDtYZiXsNYePdR+4pwiwXpjXT2ctovcE
 CR+ZySM2s2fNUfI0PJ1c/VBwpAMIQd1yyRgO2GeqQn3NHOkndp6tj1CBb
 /+KmgE3uDnDvgPjq3L1JNDNYmInvDzpcpykVILBUi8eEdoASz0zgyBgT8
 3au1yUPjv6QjQB+rFZjX9sEdB3p7Zh/fW3QGopHUD1gcraPXtxIeE7fLd
 AKtcOQjqn2Mh7PryNdGlVeT0KQvB/RlpGPGgSvt1e7WlSYJTVSZG3Suok
 n53qdhj5wEWIAdNCAxDrPET12L8PYBPTbTo1BZaccEflhdbpj6XMWCb7w Q==;
X-CSE-ConnectionGUID: QiE7FvxrSWePbKkX/aneyA==
X-CSE-MsgGUID: /h9hF/sNSeS1TksuPQYTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="84415481"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="84415481"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 04:35:46 -0700
X-CSE-ConnectionGUID: 8XbiTCztS76sZ1Uo5DZQng==
X-CSE-MsgGUID: OKThHSHiQwmPqy7AGybimA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="241650603"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa009.jf.intel.com with ESMTP; 25 May 2026 04:35:46 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/3] Negative tests for VM_BIND decompression
Date: Mon, 25 May 2026 17:10:39 +0530
Message-ID: <20260525114043.2128358-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND DECOMPRESS flows in
xe_ccs.

Patch 1 introduces resource management structures, helper utilities, 
and a negative uAPI parameter validation test for VM_BIND DECOMPRESS flows.

Patch 2 adds a helper for fault-mode handling along with a 
negative test to validate VM_BIND DECOMPRESS uAPI parameters under fault-mode conditions.

Patch 3 adds negative test coverage for VM_BIND DECOMPRESS 
with CCS corruption, including suspend-resume scenarios.

Changes since v1:

Reworked test split and helper organization
Previous version:
https://patchwork.freedesktop.org/series/162838/

Smitha Balasubramanyam (3):
  tests/intel/xe_ccs : Add helpers and Negative test for VM_Bind Decomp
  tests/intel/xe_ccs: Add fault-mode helper and VM_BIND decomp neg test
  tests/intel/xe_ccs : Add CCS corruption neg test for VM_BIND decomp

 tests/intel/xe_ccs.c | 1184 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1184 insertions(+)

-- 
2.43.0

