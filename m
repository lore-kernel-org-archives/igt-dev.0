Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D296E64019
	for <igt-dev@archiver.kernel.org>; Sun,  5 Apr 2026 11:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CD410E130;
	Sun,  5 Apr 2026 11:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6jqE5r+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DBC10E130
 for <igt-dev@lists.freedesktop.org>; Sun,  5 Apr 2026 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775389719; x=1806925719;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zoNtZGS72FgL0wYWA7QInHYUcCUqbeEp6tbclrZSuhc=;
 b=C6jqE5r+4ElDhsQ4MAy85BcfYNhZCdw74G2iog9ubxJL8Xa7KsUIeUoR
 Wvia6OLP5zz8/z/I7uM9YjjAvqZulgPLapLK8shhn9zRgdSBBbTlGucY6
 VNYsCf0YJpM5CJaMwwoQfw13wlTFcl8etw3IEBq1bREWocaN38MDVUDZU
 WdWIvQ5qIAOUG0UxIzuIrKGITLwbzAJ1wrtRNsvhEKDep7etkMj/MtUj1
 rP9TqFhL5wHdowT1sNjU3aP6pzrBxzd2gUSKCiqxvg+QbVzz1aFSb9dsh
 vf1zXaULu4/TAjTrjwTPb1pSjdA/VWLcLKTCnqw5WhBraizp/HjvWsz1P g==;
X-CSE-ConnectionGUID: suPzB8bvSH6F8jaatr0Usg==
X-CSE-MsgGUID: 1inZaqJuTzuQP9KnJdMYrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="93763632"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; d="scan'208";a="93763632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 04:48:38 -0700
X-CSE-ConnectionGUID: 8PIHHTf0QJqJOfIqg8Xvqw==
X-CSE-MsgGUID: crkNCIRdTvGlKPbAf2bmzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; d="scan'208";a="250923881"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa001.fm.intel.com with ESMTP; 05 Apr 2026 04:48:37 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Subject: [PATCH v2 0/2] Implementation of Negative tests for VM_BIND Decomp
Date: Sun,  5 Apr 2026 17:20:43 +0530
Message-ID: <20260405115046.939344-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309060901.642399-1-smitha.balasubramanyam@intel.com>
References: <20260309060901.642399-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND Decompression.

Patch 1 adds resource management structures and helper utilities
used by the VM_BIND Decomp Negative tests.

Patch 2 implements the actual negative tests covering invalid uapi parameters and
ccs corruption scenarios.

Changes since v1:
- Dropped temporary helper patch
- Rebased on latest upstream
- Fix indentation issues

Smitha Balasubramanyam (2):
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 tests/intel/xe_ccs.c | 1026 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 1021 insertions(+), 5 deletions(-)

-- 
2.43.0

