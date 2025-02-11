Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2D2C0219D
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 12:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA0D10E6B1;
	Tue, 11 Feb 2025 12:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZWtDhi8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADDC10E6B1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 12:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739276555; x=1770812555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ucl9MMjMNRRcROyTsLNAPL9JwI2bWS/kKpQMZ3L8OC0=;
 b=QZWtDhi8CXRhy9atv7HMYw6udCWZ8lq8C40iTlPsouFht+KUqeiT6jhe
 Q3Lf0tkRscSRhgmG0mM5QO4UwGkNwj16VvYyVV/zH4qHPFDa14z64nsdy
 Pese2NIzbObAmuiuVNRZ5wbUmOf8s96KSN0mtgxpISa6guY7MNVs8EPsC
 h4MmXUgB5af1GmP0koXgqx90HQhR/16k+yZVplJrk67Zduo7QrUH24G+a
 JiGemposqgPAwmaITV6PMPSyUB+S1cspVdxbLBHJ1nZoMvvKpOgQK8F88
 diLLplwxj+o+YJEbb+UYHr/mSt6aLD8jsC6TdpTi79z1z9m6ERWf+xlYs Q==;
X-CSE-ConnectionGUID: 66kB7QpiSou4+roxzB3Xyw==
X-CSE-MsgGUID: rLnq5bB3T42fyV53I0akrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57429357"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="57429357"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:35 -0800
X-CSE-ConnectionGUID: nYP55PSWSBqv0NfW9d5+0w==
X-CSE-MsgGUID: vh4oc09aQfy+ZRR3BMm9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112350983"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:34 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Zbigniew Kempczy_ski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_pipe_stress: Fix testplan
 documentation
Date: Tue, 11 Feb 2025 17:57:43 +0530
Message-Id: <20250211122743.329838-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211122743.329838-1-swati2.sharma@intel.com>
References: <20250211122743.329838-1-swati2.sharma@intel.com>
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

As kms_pipe_stress is moved to display, update the test
documentation according to the kms testplan kms_test_config.json.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Zbigniew Kempczy_ski <zbigniew.kempczynski@intel.com>
---
 tests/intel/kms_pipe_stress.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 78cffe707..1fa8df543 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -20,13 +20,12 @@
 #include "i915/gem.h"
 #include "xe/xe_query.h"
 /**
- * TEST: i915 pipe stress
+ * TEST: kms pipe stress
  * Description: Stress test how gpu and cpu behaves if maximum amount of
  *              planes, cpu and gpu utilization is achieved in order to reveal
  *              possible bandwidth/watermark and similar problems.
  * Category: Display
  * Mega feature: General Display Features
- * Sub-category: Display Tests
  * Functionality: kms_core
  * Test category: stress test
  *
-- 
2.25.1

