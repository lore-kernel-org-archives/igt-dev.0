Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A86ECF07BF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 08:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D7310E88A;
	Thu, 10 Oct 2024 08:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVq7ay7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2210E88A
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 08:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728547579; x=1760083579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/gI37KqITUzz20P51mzj5L/uY9Yi9D3xsICphwzOgoE=;
 b=UVq7ay7NT3vur6FEDqDOxiwId/igmLtc8sYpLbm7iXyYIm+Z3n3mHAL1
 HsZetE/aV/bwLygHVRl3FuwLEIybvqoEPATekTykRJrzOmbRNvYO+zIfC
 lH22T92Un/cJJ1LRDA40W4PiHBbjR9qI3bjnHWUImzFInzYTlWGMSXIr+
 UqHL/xlJ6ngLKbRf2ju1cYwNmnLYnQYU50BjH5j++aTFOh4FffjrDIdmS
 083hk70DMeYt9pDA9LluxegtlldhOhuPFE04qlqMNAqX1/X3h8lLl3ClY
 MyA3eKi8yexSXQv+uc+sfuoYP+YSIfcS0/Qq4hsNX3wJOk+y5/EMBqa+V g==;
X-CSE-ConnectionGUID: qEWQzZ7LQ9OjE5pxOAfBXQ==
X-CSE-MsgGUID: FcHUH0RERIKHUY2fRhcXSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31677705"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="31677705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:06:19 -0700
X-CSE-ConnectionGUID: u8pzuoqeSi24MsWeDnGsxA==
X-CSE-MsgGUID: jritVzOyTt+HsKTxaL/xww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="107352719"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:06:18 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com,
	vinay.belgaumkar@intel.com
Subject: [PATCH 2/2] HAX: Add Coarse power gating tests to fast feedback list
Date: Thu, 10 Oct 2024 13:30:48 +0530
Message-Id: <20241010080048.1989232-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010080048.1989232-1-sk.anirban@intel.com>
References: <20241010080048.1989232-1-sk.anirban@intel.com>
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

