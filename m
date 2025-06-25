Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313BFC7115C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 12:18:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DDE10E6FA;
	Wed, 25 Jun 2025 12:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6v9nFXc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2B710E6F4
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750853901; x=1782389901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZIUe2IRebo/djfsbBO856nzwiHHkN16u3OnUUtbbaq4=;
 b=Y6v9nFXc3bDNkCeHNwh1K/En6QLFUCSgekTKNUzme+zK2W2ZyQV5z87/
 nbnfQmMrADYYnmWmqlualvhG6trQ2Rm/xVULe2OQPR+A6BRPCowSjZtFy
 ZK1eGO4oHCV9kxbEsglOLf5Qb6m1Av+FrESxHfc4sioBwJpeRxmdsCIK/
 mp84skjKcI3u0vnil4PpdGrlF2SsEqbagnz8Xps2uiky7SQyQxMWcpwWK
 PquKDDLcVI7/fTdDaLpfLLW3KImmlsjCtiYm8PRyNS+P2f/OI86gYmQQu
 jF5/mObABG7p18Wy6l4lssH9nLICrUqGzbUD/n2GpglkTwuF/0F8NEQY9 Q==;
X-CSE-ConnectionGUID: Z0LhLstiQyK7W5yi8NqyPg==
X-CSE-MsgGUID: rgzfk+ezS6WvXimG4uV73w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53260752"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53260752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:18:21 -0700
X-CSE-ConnectionGUID: X77gjnJUS0CZrl8/cGbgtw==
X-CSE-MsgGUID: x1MUbmK9RXSScI+V6ht2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151714786"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:18:19 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 1/5] tests/intel/kms_dp_link_training: rename to
 tests/intel/kms_link_training
Date: Wed, 25 Jun 2025 18:03:58 +0530
Message-Id: <20250625123402.3929358-2-kunal1.joshi@intel.com>
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

Renames kms_dp_link_training -> kms_link_training
and update meson build for compilation

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
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
index 55bcf57ec..bfaa84389 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -245,7 +245,6 @@ intel_kms_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_dirtyfb',
-	'kms_dp_link_training',
         'kms_dp_linktrain_fallback',
 	'kms_draw_crc',
 	'kms_dsc',
@@ -258,6 +257,7 @@ intel_kms_progs = [
 	'kms_frontbuffer_tracking',
 	'kms_joiner',
 	'kms_legacy_colorkey',
+        'kms_link_training',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
 	'kms_pipe_stress',
@@ -377,11 +377,11 @@ extra_sources = {
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
2.25.1

