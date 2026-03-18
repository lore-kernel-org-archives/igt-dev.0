Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0F510854DB
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C2610E032;
	Wed, 18 Mar 2026 09:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ms1k1s8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9ED10E032
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773827152; x=1805363152;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ca3dV9q8bWdmToXHNl5fBUJENcEuWMKZ0505BwB8aoU=;
 b=ms1k1s8X/CDpZPtiVCSaDB3bsJQbdJlm4YaDFh31An4xBFax/LwPKaNW
 +QLfx4H+Q1pY6H2MLXckJOmki2Mwrl69yIX1ZLXpaQ3VJprYjBaXZqfcz
 /eAfMQhAnhypG+2Usom14ymMGMLUgdcglTUmNFbn5674qCua/mEW+WJa/
 iGxAhMPUwO7gg7ArWqGTMnOHk4bbAWTAaVYHbdYWo7qZimTBpDqOpgV4n
 +BY8OVUNQiOfDTdZ7xMzn8+VTIgQqqnOdPDsJ1jDLYYU2wR46ohf1WQsd
 TjugsHE0JxS/TRLgDqxmzLiHkXwiYBRX3lLVvDLCARdb+f/IJHPg3K9LK Q==;
X-CSE-ConnectionGUID: aFlpKVenRf2KmfCNMOz6RA==
X-CSE-MsgGUID: aHIODeYnTrqPhQ+0vmcWcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85955525"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85955525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:45:51 -0700
X-CSE-ConnectionGUID: ZxNMVpTzRi+vuHtf7jY9mw==
X-CSE-MsgGUID: rWYR4bt7Qs6UfqU1Cz+jdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="222790926"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa007.jf.intel.com with ESMTP; 18 Mar 2026 02:45:48 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Subject: [PATCH v2 0/3] Implementation of Negative tests for VM_BIND Decomp
Date: Wed, 18 Mar 2026 15:16:54 +0530
Message-ID: <20260318094657.761076-1-smitha.balasubramanyam@intel.com>
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

- Fix indentation issues reported in review
- No functional changes
- Rebased on latest drm-tip

Smitha Balasubramanyam (3):
  igt/xe: Add temporary helpers for VM_Bind neg test
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 include/drm-uapi/xe_drm.h |    1 +
 tests/intel/xe_ccs.c      | 1134 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 1130 insertions(+), 5 deletions(-)

-- 
2.43.0

