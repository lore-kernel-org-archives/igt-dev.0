Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86A0CD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 05:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC9C10E236;
	Wed, 27 May 2026 05:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7Hh/fbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0375D10E236
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 05:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779860228; x=1811396228;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f1ovqeLUbsjOQStt+3cWjB1SXcl3kcKh7j8z41f2qqw=;
 b=n7Hh/fbmu69HNBkw489P+RLjcCoBpHG0oIlR7Bbn7lgE3IUEDhd/PcP1
 CWe2a5n1oCT2IlWsLDO3Ot99VouGY8veYpn6JsDXfq+9gpcgh6J8BkVvx
 pXdJCyg0y52vfO1IyTV0kouSFv4c7PORWCpjsM+EMyvBe6HrNQ+Adeiy0
 2VYjSh1Otvae8I0Ky968XdCHQUkm6nvE2xFWoM/8XXvzRdePSsBC+2L++
 ccStRLBkIbxihmJxpoLs3M1CxskhHS/9kOFrbdSUT2mvCSFwgEta2rLk9
 jZqqtva3PFYvCmanEU8Yiw/2rqqiZbT6yfnMZUQCBrHUbHmP95HlV/xAt g==;
X-CSE-ConnectionGUID: LzUA5sUSRfON0Zn4/vTYvQ==
X-CSE-MsgGUID: UvICG0VBSE+xm1ULB4s+xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80652230"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80652230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 22:37:07 -0700
X-CSE-ConnectionGUID: ypWCn7i/QUODqcA/aGmy0g==
X-CSE-MsgGUID: qg5qDz0eQvaMvYJXfhBtYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246154356"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa003.jf.intel.com with ESMTP; 26 May 2026 22:37:07 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/3] Negative tests for VM_BIND decompression
Date: Wed, 27 May 2026 11:12:07 +0530
Message-ID: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND DECOMPRESS flows in
xe_ccs.

Patch 1 introduces resource management structures, helper utilities,
and a negative uAPI parameter validation test for VM_BIND DECOMPRESS flows.

Patch 2 adds a helper for fault-mode handling along with a
negative test to validate VM_BIND DECOMPRESS uAPI parameters under fault-mode conditions.

Patch 3 adds negative test coverage for VM_BIND DECOMPRESS
with CCS corruption, including suspend-resume scenarios.

Smitha Balasubramanyam (3):
  tests/intel/xe_ccs : Add helpers and Negative test for VM_Bind Decomp
  tests/intel/xe_ccs: Add fault-mode helper and VM_BIND decomp neg test
  tests/intel/xe_ccs : Add CCS corruption neg test for VM_BIND decomp

 tests/intel/xe_ccs.c | 1184 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1184 insertions(+)

-- 
2.43.0

