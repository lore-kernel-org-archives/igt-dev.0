Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8237BD1CDD5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1AD10E66A;
	Tue, 22 Oct 2024 10:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yty03g6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868F210E66B
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729594557; x=1761130557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YL8wMNkbwaeORHKefcw+X1gzN9fWu15Kp8NsmQhSPXA=;
 b=Yty03g6lCIuGVBClT80eyVKGT5fJzj8VlaazTNtuYd7Q6MthbkzM+T92
 4Ox3RCjoSAkxnJq32Ew9rgXP31ExFu0iNNoSuxQmEKPcBKzbCiKWXp7ft
 2QXB8NkTm3qKmxeUtm8zUAlaYNG5IZwqSdWFt+oHw1R4opaa7NNnkka/E
 kt1pUrtRLF1RErh1zdJnrP0yuuUlpbkq15nQBirKAoOmhwuVqXt2ndBgI
 75CHa6s0Loo5aCRePu0BKV+Aj405rRtwp2xQsVaqgeTxww1hPYJqkIqV3
 MZLyo0C9sMgy9ADzrOG2QFAttbonkL84uOdS4GE3NfTnsU51GlGO3Yznd A==;
X-CSE-ConnectionGUID: YvvU9KD5RJS44+8IWs6xqg==
X-CSE-MsgGUID: 2UXts6W7RiSHMluOwl6e7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="16749606"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="16749606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:55:57 -0700
X-CSE-ConnectionGUID: Qah/OAU1Q2qO9Nb6N3RlMQ==
X-CSE-MsgGUID: OpuNnaiHQM+msgywiCB6Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="110653916"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:55:55 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, sk.anirban@intel.com, riana.tauro@intel.com,
 badal.nilawar@intel.com
Subject: [i-g-t, v4,
 2/2] HAX: Add Coarse power gating tests to fast feedback list
Date: Tue, 22 Oct 2024 16:19:18 +0530
Message-Id: <20241022104918.2120652-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022104918.2120652-1-sk.anirban@intel.com>
References: <20241022104918.2120652-1-sk.anirban@intel.com>
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
index 01b01dcf9..2acb6ee0d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -159,7 +159,9 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pm_residency@cpg-basic
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm_residency@cpg-gt-toggle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.34.1

