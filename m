Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110C2C5AD5A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 10:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A5F10E3F1;
	Wed, 12 Aug 2026 10:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRR79ypQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C7D10E3F1
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786531155; x=1818067155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VyalF81q5gDfUgm0KK7RsfMTGTmD4Nlx2hS00MK3paA=;
 b=GRR79ypQEq6XO6pJ5ZkrOj425FvM562XvoUcoPbEbfCsebsanhjtZhhf
 796NMmshMdqAhWyeXVHwpBUSmDaCIVFYM11Hw5aL9+KQRejP6Qcrk4gYn
 R67N0KzNYtjfKaTOzmAR0YcSOyFZ1f0UombrJ+blMWMOcglbpKnjlreq6
 lYgeOH36iwIkGutsS1Cq7bq/qlu8i1dE3HogPBtu1QRA4iXogIJhsN6C/
 wM8H8d0KWH6Xs3SzPkRCEkUvNovlrRzAnNkMBBWfyD5FObOTQkI7aMEuO
 Q33yDwBfWTyAR4y2MKD/5byj3R6jn87PX2HQgMgcWzeM07F7ph344Giwq w==;
X-CSE-ConnectionGUID: 45HA32fnSJabUfwhU3CO3A==
X-CSE-MsgGUID: hRGC2jTgSICx4a/AuVeYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86954799"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86954799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 03:39:14 -0700
X-CSE-ConnectionGUID: dj7jAiimRquEeGBgMF3PKw==
X-CSE-MsgGUID: 45Ikw+PxSYW8thE4nLhowA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="263648815"
Received: from unknown (HELO cml-CometLake-Client-Platform.iind.intel.com)
 ([10.223.55.11])
 by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 03:39:13 -0700
From: aditya.chauhan@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com,
	himanshu.girotra@intel.com
Subject: [PATCH i-g-t] intel-ci: Move hotunplug subtest to the end of
 xe.fastfeedback testlist
Date: Wed, 12 Aug 2026 16:09:12 +0530
Message-Id: <20260812103912.1481362-1-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

Move igt@core_hotunplug@unbind-rebind to the end of
xe.fast-feedback.testlist to unblock further execution.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 64587cce1..ecd2c568f 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -253,11 +253,6 @@ igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
 
-# All tests that do module unloading and reloading are executed last.
-# They will sometimes reveal issues of earlier tests leaving the
-# driver in a broken state that is not otherwise noticed in that test.
-igt@core_hotunplug@unbind-rebind
-
 # Run KUnit tests at the end
 igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit
 igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit
@@ -314,3 +309,8 @@ igt@xe_evict@evict-small-cm
 igt@xe_evict@evict-small-external
 igt@xe_evict@evict-small-external-cm
 igt@xe_evict@evict-small-multi-vm
+
+# All tests that do module unloading and reloading are executed last.
+# They will sometimes reveal issues of earlier tests leaving the
+# driver in a broken state that is not otherwise noticed in that test.
+igt@core_hotunplug@unbind-rebind
-- 
2.34.1

