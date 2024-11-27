Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A04D6D237
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 20:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38CB10EBD4;
	Wed, 27 Nov 2024 20:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtKw3lZ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8852310EBD4
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 20:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732737790; x=1764273790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N1HVALRfDeOAd3oW4Sv9E1UNMNPvtIpmJTWYojBwZLo=;
 b=XtKw3lZ0EFKrtu5BdKAHnM+2C5Kj+mACpXHYMFq8t3lBLrnMANteRBLn
 qoRzUD+u+mqwpLgBKDbFwdmYtUApijtCUt0oSCK9xc3yiZ4VPc7U8eW+W
 Qt89V7DUBFCDGIQcEEGMiMeTSkQ6pZydxgc/ppqto14BVZsSG+x8t6ZzK
 VXUh4NYyPD7k3tbXTxDrhB/RKsGvQI390lxnMTx+Wm3hYAyDxEZJ1utoA
 l6qF2+rPArJKE6gjKFbAE0FcD1LdonG2hn2rwCd8GcnlnbS8cthCo75VL
 EHxFI0hcBhB59rT3eostjplU8fZKUlnH1XmPuAXXP+1erYd3d38w3aA9P w==;
X-CSE-ConnectionGUID: 0AVpkZzPQSiCB4W6J7tV9Q==
X-CSE-MsgGUID: eN0PrbOvS3iSLyAnZLwbCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44344219"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="44344219"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:10 -0800
X-CSE-ConnectionGUID: zOD16AQxQOSTM1O8Sgk2GQ==
X-CSE-MsgGUID: 4zgV34QySnCfoBJFk0TDXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="96484669"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.81.89])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:07 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/4] Subject: [PATCH i-g-t 0/4] lib/xe: Add SR-IOV
 debugfs and provisioning helpers
Date: Wed, 27 Nov 2024 21:02:58 +0100
Message-Id: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch series introduces helper functions for managing SR-IOV debugfs
and provisioning attributes in the XE driver.

Summary of changes:

1. lib/xe/xe_sriov_debugfs:
   - Add generic helper functions to get and set debugfs attributes
     for u32, u64, and bool types.

2. lib/xe/xe_sriov_provisioning:
   - Introduce functions to get and set scheduling attributes such as
     execution quantum, preemption timeout, idle scheduling policy,
     priority, and engine reset behavior. Provide both returning and
     asserting variants for error handling flexibility.
   - Add a helper to ensure default scheduling attributes are set
     for PF and VF contexts. Skip tests when non-default configurations
     are detected.
   - Add accessors for shared resource quota and spare attributes
     (GGTT, LMEM, contexts, and doorbells).

Marcin Bernatowicz (4):
  lib/xe/xe_sriov_debugfs: Add debugfs get/set functions for u32, u64,
    bool
  lib/xe/xe_sriov_provisioning: Add scheduling attributes accessors
  lib/xe/xe_sriov_provisioning: Add helper to check default scheduling
    attributes
  lib/xe/xe_sriov_provisioning: Add accessors for quota/spare attributes

 lib/xe/xe_sriov_debugfs.c      | 194 ++++++++++++
 lib/xe/xe_sriov_debugfs.h      |  18 ++
 lib/xe/xe_sriov_provisioning.c | 534 +++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  68 +++++
 4 files changed, 814 insertions(+)

-- 
2.31.1

