Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FE2C021A7
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D7C10E3A0;
	Mon, 17 Feb 2025 08:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMxdOB5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E510E39C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739780343; x=1771316343;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LKtrYeZBDekoCf6bk6HAeuEMsM8TJVQCb6mSJ5oTzHo=;
 b=XMxdOB5ZKD3BlVpThugafJK4kMnS4ZdrAlHgXwLbyW8Ym51i5LzcTcza
 CD7tya4nAngvYN38+W81a7RGRL45ZgQAICg2pdLsnJsMAmdhXeUW6tIwT
 219nfgWTykoTPDQ6j87tCI5Ek32DeekQHIs268bY5IHSZu6hwWxLdu/fy
 SlOK+rViT2DOkPQEIf6Lh7kG9wbKWggmWXA7+3+BHCwpADwb86tVjGs8Q
 RdhaY/PLUwiSgTxcccj2iHwC3m5m/7Bp1+dhx6nfQDZeTwqPeRQzZpTC4
 q2RPdz1FaQEjtAMEmMW1THLunxsgYYA0hKM7xLe4YctByyR/9fddmmCsp Q==;
X-CSE-ConnectionGUID: M1j/JZ3KQN2H6/T80rwCKg==
X-CSE-MsgGUID: us2/KRBqSm+O0UOcYMjOWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40157780"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40157780"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:19:03 -0800
X-CSE-ConnectionGUID: hFKylz3pQ0ysjko+OSeADg==
X-CSE-MsgGUID: MUcKj1tTTKSBXodE2dA1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144978446"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2025 00:19:01 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/5] tests/intel/xe_compute_preempt.c: Reduced child
 count for PTL
Date: Mon, 17 Feb 2025 08:18:54 +0000
Message-Id: <20250217081854.3219791-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Preemption is not happening for long kernel when child count is beyond
50 in PTL for compute-preempt-many test and its failing user fence.
So, reduced child count for PTL.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_compute_preempt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 5319dee7b..d4c243c16 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -64,8 +64,16 @@ igt_main
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
+				uint16_t dev_id = intel_get_drm_devid(xe);
+				int child_count;
+
+				if (IS_PANTHERLAKE(dev_id))
+					child_count = 50;
+				else
+					child_count = 100;
+
 				test_compute_preempt(xe, hwe, false);
-				igt_fork(child, 100)
+				igt_fork(child, child_count)
 					test_compute_preempt(xe, hwe, false);
 				igt_waitchildren();
 			}
-- 
2.34.1

