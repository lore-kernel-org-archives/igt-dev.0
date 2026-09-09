Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1157C79F82
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 00:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3D610E183;
	Wed,  9 Sep 2026 00:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuX9y/WI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A595E10ECCD
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 00:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788913630; x=1820449630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B1gDtPdbLc2zXZUEu4vwa7tWWnY6NbPCSB3mSXzYv6s=;
 b=DuX9y/WILW9KAZsUgqks5oax3oVcz03iaHi1cwMXPho/kZ5Qmfi8AGl9
 nguBi1j1tW745afsdDeYH+hIFTmAe2O3v9WiyV3QlPu82RkkOFdaRhOjN
 v3ce6iEEyndaUIyuSJTx4HSm9fNpnmuCztVSsTfc0/R2ef6b6GGDc0h/d
 3mzk7xVFaTOoOPsdrbyXGd4FaAkxLSDYnc8iz1Gj4easrf9ydhTgBU+sc
 xH3xlD0pu2sS2jcq8g6q/U2frzaYYYAlt+nnmt2wh8oZRoE0eWRXawqHB
 IyoVz150cUzTc16aW+4nvkqwy/5CXO1ABr2OqW0j21VwJ2XIwIQhGXSHB A==;
X-CSE-ConnectionGUID: 7sMO5MNkQjapAdVVF31djw==
X-CSE-MsgGUID: qxTFNRd0ROO4DH9kiMXVQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88265122"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="88265122"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 17:27:10 -0700
X-CSE-ConnectionGUID: EJWOgACGR4mbUqwgnGX6Hg==
X-CSE-MsgGUID: LUCwsWJDTkqB3l1q17qdKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="267905631"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 17:27:10 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel-ci: remove pxp from PTL blocklist.
Date: Tue,  8 Sep 2026 17:27:04 -0700
Message-ID: <20260909002705.431136-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
References: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
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

We've added GSC FW with PXP support for PTL sometime back.
However, it was still in the block list so let's remove this.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel-ci/xe.ptl.core.blocklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 362711406..85e0c3f3c 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -82,11 +82,6 @@ igt@xe_oa@unprivileged-single-ctx-counters
 igt@xe_pm_residency@gt-c6-freeze
 igt@xe_pm_residency@toggle-gt-c6
 ##################################################################
-# Expected skip as PXP is not enabled for PTL upstream
-##################################################################
-igt@xe_pxp@.*
-igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
-##################################################################
 # survivability feature not applicable for PTL
 ##################################################################
 igt@.*survivability.*
-- 
2.43.0

