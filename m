Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4942C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 10:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5318B10E67A;
	Tue, 22 Sep 2026 10:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bktTuYJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2C610E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790071364; x=1821607364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bvVI4tfDjfUobS7ZH23Ek4WSEJiESKbOqacfKpdee7g=;
 b=bktTuYJpySex/Ac8U34aVYxoi2ZQSN+5dL0fefB7nwLHDrGlv/GjTzj4
 dATB00RVI5qGTuSEiHu7qutmSKH0p8u6IMWXekRS50J0ajwQMteq8nWL4
 EkpzqnWt5xX1+ge0vLRfxye2Nnw++MinJooNWB55lZpOyJXgjiEmivKCV
 z+5RHrOkUSzhMQFA8gPWq1h1JrtsJLwCdABWCwzQjJ6Ue74GDA4uHyHIl
 uYaK3Cd7rEDN93joJ/gsFI/7MdtyVyeHmsU8zkHXXn9m+CwZgzWxXbWSk
 ZEdcRaNXC/NujSSgQMkdcc5+8hqyEUZZu02Lct3g+bL5Mz7LKiVhGljVy A==;
X-CSE-ConnectionGUID: ZdRarbTpRo2KWXYIn3zkhQ==
X-CSE-MsgGUID: scWYNnpUTEKlpN1unVoskg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="94490191"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="94490191"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:02:44 -0700
X-CSE-ConnectionGUID: yR5XxkqpQBCrDPH6UfAmFQ==
X-CSE-MsgGUID: GYZZ2XlmQBOpsErF7su3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272567345"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.63])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:02:42 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ramadevi Gandi <ramadevi.gandi@intel.com>,
 Shivtej Patil <shivtej.eknath.patil@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Subject: [PATCH i-g-t] Revert "intel-ci: blocklist multi-queue tests on NVL"
Date: Tue, 22 Sep 2026 12:02:37 +0200
Message-ID: <20260922100237.77456-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

This reverts commit 305e940627bdd8b1334ac009305881850a20c2ff.

It turns out we need to test few multi-queue features so
this change needs to be reverted.

Cc: Ramadevi Gandi <ramadevi.gandi@intel.com>
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 71715235b..7de332352 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -107,8 +107,3 @@ igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
 ##################################################################
-# Expected skip on NVL due to unsupported multi-queue capability
-# Multi-queue is not supported on platforms older than xe3p
-##################################################################
-igt@.*multi.queue.*
-##################################################################
-- 
2.55.0

