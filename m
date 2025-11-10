Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DACCD1297
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A207C10E308;
	Mon, 10 Nov 2025 19:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FifqKsgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEAA10E384
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802712; x=1794338712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K6p7AY0Or8pUEj6+0ARe1roTRyQb8fkgNXmZjEPKu+w=;
 b=FifqKsgkq0IbxW9oZPYuFYf+MVcSe/P9KvhOKS5pig4JFmWctSGizTJO
 7bLMT8RVMex6fjV+iSQrRyO0VVY05pHNK0tMyVA7BiTM3yRSeay/NcCKE
 0KAQ91TYN1bYkWhg7ZgRwYgvf+oc5T1KDgActMOlQZ27dW4mvNOG5KSzs
 nYkV2dPQ05Hiey/f9Y20pzFw3VxJj0YBAHQfflzZM/gJAO/REB4kNJqnW
 XU0rsJAfx8G+I5A64+akL81GVVyM3Yx33aZnuZaiG4lmhYe3gQaBkKzh2
 cvtk08LA949Wovz+VFHwLlBXVVxOYUKwm5qQwjkc3J+v/w289ensJV6Mr A==;
X-CSE-ConnectionGUID: TU9wJyZaTg+QTleXxly/FA==
X-CSE-MsgGUID: iW4VtmJTRdGEB3Xk6nRtIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900258"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900258"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:12 -0800
X-CSE-ConnectionGUID: tLN8gnOjTdenNiLtOZ+1rQ==
X-CSE-MsgGUID: aPw5A7NFRKaU4RCBeLpyiw==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:10 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 4/8] Revert "tests/intel/kms_psr: Enable the tests support
 variations based on the WAs"
Date: Tue, 11 Nov 2025 00:54:50 +0530
Message-ID: <20251110192454.44385-5-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110192454.44385-1-mohammed.thasleem@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
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

This reverts commit 897af2724210dd42e98e2d560c526db5a6dbadbb.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 07acde19f..f062d184a 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -719,12 +719,6 @@ static void test_setup(data_t *data)
 
 	igt_require_f(data->output,
 		      "No available output found\n");
-
-	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
-		      intel_is_fbc_disabled_by_wa(data->drm_fd),
-		      "WA has disabled FBC on BMG\n");
-
 	if (data->op_fbc_mode == FBC_ENABLED)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
-- 
2.48.1

