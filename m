Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27639D3E18D
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 07:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C762710E427;
	Mon, 21 Oct 2024 07:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nT0DuwUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F05A10E425
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729495537; x=1761031537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/gI37KqITUzz20P51mzj5L/uY9Yi9D3xsICphwzOgoE=;
 b=nT0DuwUN4j8MyQkhObwVCG77jZyKO7y7dAc0CkqvhoCtvxMUM5Phhay/
 mVYFPc9UzTYvcsXEPhV1jt7jJ2Ca8K2180skM1d7eaqZAbKr0COQJXMEl
 MOG8o/ivUSPBMcvwelEqR1oQjVuvCFWsN/2jDKuAOXXiJvKbGy3CFQUjS
 scbRO1MwHSjwWtxjA7wRw3WGGl8jBU+7GtQQ0uUSaW+mVSUEu0wBvrotw
 gu4179h91yvW5FPQ9+/UIinl34WQGFYYb+wSn8dmwsigA5nOvD1TUAQS0
 97i6FmRCudnk7dyvy7E4zj1t17zTtdeAg0M5jvsCK4sC9Hyq1fwvQF8BX A==;
X-CSE-ConnectionGUID: S2ltkBERQL2+iNYfTWeQlQ==
X-CSE-MsgGUID: iNxn2yv2RRKwkycmlpFm0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40355143"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40355143"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 00:25:37 -0700
X-CSE-ConnectionGUID: SeGI27j1RqmNThpqr3Kraw==
X-CSE-MsgGUID: ubvHuG+WRFytR961l9j1hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79787340"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 00:25:34 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com
Subject: [i-g-t, v3,
 2/2] HAX: Add Coarse power gating tests to fast feedback list
Date: Mon, 21 Oct 2024 12:49:02 +0530
Message-Id: <20241021071902.2086909-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021071902.2086909-1-sk.anirban@intel.com>
References: <20241021071902.2086909-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Add cpg tests cpg-basic and toggle-gt-cpg to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..e9ae799cf 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -159,7 +159,9 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pm_residency@cpg-basic
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm_residency@toggle-gt-cpg
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.34.1

