Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3759DCAC5B0
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 11:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AC810E0D7;
	Tue, 23 Sep 2025 11:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeJzVSrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAB010E0D7
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758627445; x=1790163445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QNzYvFludsI+QuoJ3Nl6m4WphUN3coKZmNUt1eB1LfE=;
 b=GeJzVSrnD6KdCeKzj/UUHYDcinlnUWqhK3VHIGkaT5XXjj430eso+oYm
 aj2mYYdxQA1RNYS2O+jhVKgVv7MqZVCsY2R7yFmV3fJX1XR73o2KHyZqT
 7tBFojmx+nkgBwVG6Giwzap+rNjHyZBLJgGmG4Pa0ETJxDdumVl/zq/6J
 YAwf2J75uYpN4qc7VzCnf55pPX/GFRH/m7i0eNxhJuaUDYswNRydh85Cc
 R9w/WszXmNzaGLJcm/s62CfeEUaC85bCX2FqhMimfcCzCOahqnvL2aoAW
 3GC0K3My3shYYG28fJLd2aI/Nh63kYGGcZM12QsxJ9ymSGPTauNgnpJ7U Q==;
X-CSE-ConnectionGUID: 5d7DxTE7SWaw6fATnqXWVg==
X-CSE-MsgGUID: aQKvFeYpR5unMSw3MLfb3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61020038"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="61020038"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:37:25 -0700
X-CSE-ConnectionGUID: PqbZcccASmy24l7p27wDQg==
X-CSE-MsgGUID: C4xXsqupT1eitpkSUNgVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="176581458"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.251])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 04:37:23 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Fix typo in Xe LNL display blocklist
Date: Tue, 23 Sep 2025 13:37:17 +0200
Message-ID: <20250923113718.78290-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Fix a typo in a last line for kms_psr@fbc-pr.*

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Fixes: cb77d7e82066 ("tests/intel-ci: Add platform blocklists to enable platform testlist creation")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.lnl.display.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 1c6ea8c14..7ae7081da 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -168,4 +168,4 @@ igt@kms_joiner@basic-max-non-joiner
 igt@kms_psr2_sf@fbc-pr-.*
 igt@kms_psr2_sf@fbc-psr2.*
 igt@kms_psr@fbc-psr2.*
-'igt@kms_psr@fbc-pr.*
+igt@kms_psr@fbc-pr.*
-- 
2.51.0

