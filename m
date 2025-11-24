Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274EFCFD345
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 18:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C9610E31F;
	Mon, 24 Nov 2025 18:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDbkrGV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3100510E31F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 18:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764008904; x=1795544904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HJhCMD36xEaSZ1Mi0eqKJyVJCqC5ZOi+9cXuyHSalU8=;
 b=fDbkrGV9xoEyyMzhqFf+KtTXBpBkkEr4UWOdXdqiP1IyQDHmwrD0SCu2
 WAybSHPv4auu5lyMLEY6xx8TIMeX1eoVVE+hzDxTLzAkHu2rboMZCKgqR
 OQuLV5T+bds/Rk3vqsJokFZ86ruHwq/XO4lbkMYZRK+pj8ZbNcTWLPU/1
 4OTx5jZ+rBGe3es7QIL1LJCzMTq0oMMWnKJkPRPeIq98+K2H70iQbIBkL
 q2Lwc6ImLgsYzafE4QxZitpJvHBTL8u/Yu2j6RHl9D6ZtIrlyjbe/DaCW
 JBWyC3eQWJYO5Ymj0NNRm2CTAgyUnHXbsYCJNbT4pRJi2HBYY9B/ukYQO Q==;
X-CSE-ConnectionGUID: unqSK8MhRH2DNn55khnWGg==
X-CSE-MsgGUID: b/304tvgQCqGnwGNZtsPag==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66055350"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66055350"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 10:28:24 -0800
X-CSE-ConnectionGUID: MyA8uohPS4m15qHJtzmrAw==
X-CSE-MsgGUID: 7smy26imQz6faNzqXn1RZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="215747167"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:28:23 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, suraj.kandpal@intel.com,
 Imre Deak <imre.deak@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/kms_dp_link_training: rename to
 tests/intel/kms_link_training
Date: Mon, 24 Nov 2025 23:57:51 +0530
Message-ID: <20251124182804.2095722-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124182804.2095722-1-jeevan.b@intel.com>
References: <20251124182804.2095722-1-jeevan.b@intel.com>
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

From: Kunal Joshi <kunal1.joshi@intel.com>

Renames kms_dp_link_training -> kms_link_training
and update meson build for compilation

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 .../intel/{kms_dp_link_training.c => kms_link_training.c} | 0
 tests/meson.build                                         | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename tests/intel/{kms_dp_link_training.c => kms_link_training.c} (100%)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_link_training.c
similarity index 100%
rename from tests/intel/kms_dp_link_training.c
rename to tests/intel/kms_link_training.c
diff --git a/tests/meson.build b/tests/meson.build
index ecc0f4c7f..24675e61e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -249,7 +249,6 @@ intel_kms_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_dirtyfb',
-	'kms_dp_link_training',
         'kms_dp_linktrain_fallback',
 	'kms_draw_crc',
 	'kms_dsc',
@@ -262,6 +261,7 @@ intel_kms_progs = [
 	'kms_frontbuffer_tracking',
 	'kms_joiner',
 	'kms_legacy_colorkey',
+        'kms_link_training',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
 	'kms_pipe_stress',
@@ -386,11 +386,11 @@ extra_sources = {
 	'kms_dp_linktrain_fallback': [
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_dsc_helper.c') ],
-	'kms_dp_link_training': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
+        'kms_link_training': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.43.0

