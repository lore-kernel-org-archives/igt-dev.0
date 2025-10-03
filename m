Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A54CAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 05:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2901E10E0BB;
	Fri,  3 Oct 2025 05:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jp9lg3LW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB4610E871
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759469219; x=1791005219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=27H9lgGDmJ66QrI0AKgpXhmcEUW7AmWv10Vs4Pwi414=;
 b=Jp9lg3LWtsv6nrvGdUUBYaL04Qo5vC2ohMJkEwb6EXiyAeZTg7JcX8yM
 +bW8U28eVaLKISiVBW5iJQ9FoFD+ujiEo3o/0s57+lCQBDoqh7TRUweBl
 EanSGmklYoziQx5E5qcKI6IMIDxxpXQ4A6bEzg45u7+rwXxxttojGisgX
 cvyEH/lvLn/zx+hq9tddaSbx3/J1hb8jIMO3wVv+EWMa/l9g24LBVD1mY
 JtkkrohkVMH5lioawM8WbVZI/2/tFIkwEeAZGruAUyyLQNSuazDv1NwZH
 OkY95reOl5TmTEKy2vjGtJmRZfRx0DgTFEWP6Dy9EhpKfc70X1DfYNtU8 g==;
X-CSE-ConnectionGUID: 7NAZEkInTqeSlSKPV4zQRg==
X-CSE-MsgGUID: +OUTBiGrR8y27j0VqsKiOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="49308084"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="49308084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:26:59 -0700
X-CSE-ConnectionGUID: CowFqrGESoCy0B3eQ0Jj9Q==
X-CSE-MsgGUID: GLGuP1uVTTC6Cs/Dyq/ZvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="183233881"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:26:59 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v9 3/3] lib/intel_compute: Adjust long kernel usage for
 WMTP
Date: Fri,  3 Oct 2025 05:26:21 +0000
Message-ID: <20251003052640.56068-4-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003052640.56068-1-sobin.thomas@intel.com>
References: <20251003052640.56068-1-sobin.thomas@intel.com>
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

WMTP uses different shaders SIP and loop kernel and does not
require a separate long_kernel; This will make long kernel test to
be enabled or Thread group preemption tests.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index ade0b44c1..23931f089 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -72,7 +72,6 @@
  * WMTP - Walker Mid Thread Preemption
  */
 #define TGP_long_kernel_loop_count		10
-#define WMTP_long_kernel_loop_count		1000000
 #define XE2_THREADGROUP_PREEMPT_XDIM		0x4000
 
 struct bo_dict_entry {
@@ -2135,8 +2134,6 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 
 	if (threadgroup_preemption)
 		long_kernel_loop_count = TGP_long_kernel_loop_count;
-	else
-		long_kernel_loop_count = WMTP_long_kernel_loop_count;
 
 	for (int i = 0; i < entries; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
-- 
2.51.0

