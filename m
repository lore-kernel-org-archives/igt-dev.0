Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E81BC7EE30
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 12:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D7010E6F4;
	Wed, 25 Jun 2025 12:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTRNTB6S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA3610E6F4
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750853903; x=1782389903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jNzTBX2dif0mKx2dbkWqybMv5kDyxZXG3H020Hk3DdI=;
 b=MTRNTB6SAHWJsIOoaIWdxRPb85xdeRHAruKFWZuWsci9CCY1UmVf/zGu
 o3eMLLchQ2kawU3G9zR6yI5usfoUOqTnZd8n1Z75zVNh+Qty/JNF8pWyh
 HWVhKnVFCZg9YNwQ7Gg4zKs6/LCL+MmsKjgxoBcUtSu4AmOFqcKWwMdEr
 M2Hjftj1D6lQ2SOTDweJkvupK1+W/OsQcvN2Z/uapCM6OMycJsam5n2yb
 2g7Tfp9vQ5TxQThnMusNKkBaLFEaI/vBjmMOYXOUJ6YkE27TF3ATSYQwm
 VD0cXSo5i6bYC9jK/5R5vO8KMN/tiTBryXLESEhki2WJIaj+1VrDAnqs9 A==;
X-CSE-ConnectionGUID: h0d+4jbBSTG2dDUternp6Q==
X-CSE-MsgGUID: ThJNPGL+Qaq1Lom1pK8DVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53260754"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53260754"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:18:23 -0700
X-CSE-ConnectionGUID: l5ttDVL7SNeWasW3oXQMSQ==
X-CSE-MsgGUID: LpNSYLVKReOS7zHyc8f1LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151714796"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:18:21 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 2/5] tests/intel/kms_dp_linktrain_fallback: rename to
 tests/intel/kms_linktrain_fallback
Date: Wed, 25 Jun 2025 18:03:59 +0530
Message-Id: <20250625123402.3929358-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625123402.3929358-1-kunal1.joshi@intel.com>
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
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

rename kms_dp_linktrain_fallback -> kms_linktrain_fallback
and update meson build for compilation

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 ...s_dp_linktrain_fallback.c => kms_linktrain_fallback.c} | 0
 tests/meson.build                                         | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename tests/intel/{kms_dp_linktrain_fallback.c => kms_linktrain_fallback.c} (100%)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_linktrain_fallback.c
similarity index 100%
rename from tests/intel/kms_dp_linktrain_fallback.c
rename to tests/intel/kms_linktrain_fallback.c
diff --git a/tests/meson.build b/tests/meson.build
index bfaa84389..1bbb1dd90 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -245,7 +245,6 @@ intel_kms_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_dirtyfb',
-        'kms_dp_linktrain_fallback',
 	'kms_draw_crc',
 	'kms_dsc',
 	'kms_fb_coherency',
@@ -258,6 +257,7 @@ intel_kms_progs = [
 	'kms_joiner',
 	'kms_legacy_colorkey',
         'kms_link_training',
+        'kms_linktrain_fallback',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
 	'kms_pipe_stress',
@@ -374,14 +374,14 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_dp_linktrain_fallback': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
         'kms_link_training': [
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_joiner_helper.c') ],
+        'kms_linktrain_fallback': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.25.1

