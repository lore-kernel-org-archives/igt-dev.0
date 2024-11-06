Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3C5D59F5A
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 17:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D578510E74F;
	Wed,  6 Nov 2024 17:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqrNV4bC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88E810E74F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 17:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730915468; x=1762451468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/VeiXm9ebv/MoEBVBKguidFaiNB4TOeHSgv8CLw9RvM=;
 b=nqrNV4bC1G3me71BVLPaKNGQ9by7Fkpkx5gt3GCOCUJhO9gThG8ol6pQ
 lJnmFG3+crLKZjwHRF/6mGkNdu3aeXKdqVRF/c3eNAZO6O43osZKJd62i
 kEUCy+rMSVt9SkPCD85eb1Aln2ly7GjykYdprumzw9gIuvtSU0azWgWgz
 KJoQvADtYXY3+WPDNF9FZaZ0tBoPSfBpjkIeNS3cTDkGUFLN7hewxnK4M
 BUE4UlywskekRQzZsz7yZJ0/Z7mQihfkAscQgQ5IkGxeIp4YQbI3i6XYj
 gieYbG2ss3NlGsMC3zyYjkaXtxX9S34g25karaZacp6tlBf42/2ZuMHLm Q==;
X-CSE-ConnectionGUID: YGlrei+1Szm26M+wmIxZrg==
X-CSE-MsgGUID: OqIfABFTT2G7G5MgaRO0kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34508170"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="34508170"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 09:51:07 -0800
X-CSE-ConnectionGUID: f9FjMZyqQM6oBQyNtViN6Q==
X-CSE-MsgGUID: zErN1wTTSkuTpwsfBLXEeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84203003"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 09:51:04 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe-fast-feedback: Add SR-IOV FLR test
Date: Wed,  6 Nov 2024 18:25:03 +0000
Message-Id: <20241106182503.203956-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add SR-IOV test to exercise Function Level Reset (FLR) on VF1 in BAT
testing.
Test being added:
- igt@xe_sriov_flr@flr-vf1-clear

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..c56a7219a 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -176,6 +176,7 @@ igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
+igt@xe_sriov_flr@flr-vf1-clear
 igt@xe_sysfs_defaults@engine-defaults
 igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
 igt@xe_sysfs_scheduler@preempt_timeout_us-min-max
-- 
2.25.1

