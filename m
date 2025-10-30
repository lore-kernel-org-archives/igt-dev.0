Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D21CCF9E3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 19:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948B110E32C;
	Thu, 30 Oct 2025 19:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/E5UZm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F1610E32C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761852656; x=1793388656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1YQwHgWv7k1o2rn9v6Ah/pE5pkmlGQdEqURx2ALxkbg=;
 b=e/E5UZm5Buajw84xtJkloM6AEFs5WqQQFoZQVNPXyYA6llQM5kI5+qLJ
 bbizxB4RSNs00KGtBlyg8s+TLJmLPs5gt8TFHYkbRCJdJ0LUmuuYhQ3sE
 LFnDzyLK4LoX0iEVXbMCk6WfAJMIfM/r1Nnv4pPmP6nbfYR+s7FeXZ8OZ
 VZm3mX5wd+YJUkqVlT3TMLqapP1RA2gMTWSKpPCFc+Hp5Kfdoxe5GMHPg
 JOMrwXtBSUR4Ap03SadK4RtIhgK9VITDp8oTlu7PsDAPR9XBRehOxTEck
 8/DH5W1WjYpS7VyTTzLTTFX7O7HC2kx/pA1kQPcSQ03yYQFEV8kv1m3g+ w==;
X-CSE-ConnectionGUID: U0B/BpP8TmCB1fhjOE9tQA==
X-CSE-MsgGUID: fUK/7K71QWSWZ47wQX6ObQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63028422"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63028422"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:30:55 -0700
X-CSE-ConnectionGUID: EkiTxHtESl2Ag7hoTt0N0Q==
X-CSE-MsgGUID: 0mDpLNcHTr66ZGEY0hh9CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185249327"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 12:30:52 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_pmu: Fix frequency assertion when RPe
 raises min frequency
Date: Fri, 31 Oct 2025 00:56:28 +0530
Message-ID: <20251030192627.3810994-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

While running workloads, RPe may dynamically raise the minimum frequency
above the original value. To balance this, set the minimum frequency to
original minimum.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5841
Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba..1a5b17de0 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -912,6 +912,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	/*
 	 * Set GPU to min frequency and read PMU counters.
 	 */
+	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
 	igt_assert(xe_gt_set_freq(fd, gt, "max", orig_min) > 0);
 	igt_assert(xe_gt_get_freq(fd, gt, "max") == orig_min);
 
-- 
2.43.0

