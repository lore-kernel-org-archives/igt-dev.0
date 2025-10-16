Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB6ECCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 10:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687D510E9AD;
	Thu, 16 Oct 2025 10:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSF95uGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58910E9AB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760610791; x=1792146791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KbbPjz4Bu7cUc7ijRO70mJKLnmUQfuPCarnLg9urYGM=;
 b=TSF95uGH4+OsOYBFstSgKjOgY4zCgi6FsEb8SyBUsT+AMVDMU6dktDiR
 lhgf1JiTu3KMt8y0KJ1Dja6wggg/ZoNGOOtmXzT1oudmwdzqM0Gwd1TNp
 0y+TFS2oA9yHASCRisiiKBi5amTOjdDhDEOIimVFJ3jJBH6Xy2CYHoW6O
 uyZSVJRy0fdgWkj9zl44H9zi/unXbjsTnHj0mds73qYTV7D+GMPoQjGsR
 YsSVAWOZW9bUBeeYe2ga+JQubB/xwY7WjAkollwI0qI1Vgo4TaHaSuZxg
 +FSlhuulE1SK7+PKnnc/bRBbIdf3Z1pMFbi0CMq0HswDVcsIXfIKnQrz2 g==;
X-CSE-ConnectionGUID: gHhtXxwHT8uLQSaGd2BVmw==
X-CSE-MsgGUID: KOowV1uiSC2WfYhcqSW9wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62843427"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62843427"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:33:11 -0700
X-CSE-ConnectionGUID: +HscDANlRkCUcwIZyMJEoA==
X-CSE-MsgGUID: cjuwy4uTRG2vl5eVwaFX9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="219584554"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:33:08 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 2/2] HAX: Add gt-frequency test to fast feedback list
Date: Thu, 16 Oct 2025 15:59:38 +0530
Message-ID: <20251016102935.1935374-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016102935.1935374-4-sk.anirban@intel.com>
References: <20251016102935.1935374-4-sk.anirban@intel.com>
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

Add gt-frequency test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..a9a4f105c 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -163,6 +163,7 @@ igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pmu@gt-frequency
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.43.0

