Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7E6CFC26F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF4389F49;
	Fri, 21 Nov 2025 12:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xmsn5wMY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FFE10E137
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763727886; x=1795263886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0wlxC8juxBA2YrLztmFtxWfohE2wOsGqTtcm4A/OgPQ=;
 b=Xmsn5wMYj3jQPwP20HrmmLRqYHprA0XVGHjg20v5Tg0yrcGmMZNLYgNw
 FDB260k7M3b/XryZ7TbSjRkeR6u1nybusIR8VHcVmqLTGBP3+nM4MAaA/
 umuZKvPSXlhE+maacElOJtiYlMS1oEQ6bIebT7pDPmsUbnHTEmXjKICxz
 rsVjUlprPjBa6NRQyuIEOSEjIlEOnAwKL3k8vv5+0wO7iSShKeCyQevyB
 1JMOK5cEvJSQdfdJoyVqcUbomIbRYWhJvBeFC6OQjo+Ih4g08N5kHunQn
 gq1BTFovgGpNl0ASDvUP07cgP2rVewvtTeew4b+lbtaTP9PKnj29SeoSZ Q==;
X-CSE-ConnectionGUID: N5W1BCdmS4Kz0LO5nkE1Zw==
X-CSE-MsgGUID: DZ6tZWE6SDK0l5ZWuVEtjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77289576"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77289576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:24:46 -0800
X-CSE-ConnectionGUID: d8ZzA+MuTg2hUZEZeGqzpw==
X-CSE-MsgGUID: YnPbcPpZRy6yeNkCoUNyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215047353"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:24:45 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/6] tests: Move kms_sharpness_filter to tests/intel/
Date: Fri, 21 Nov 2025 18:01:31 +0530
Message-Id: <20251121123134.1099006-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121123134.1099006-1-swati2.sharma@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
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

The kms_sharpness_filter test is tightly coupled with Intel-specific
scaler behavior. So relocate it from tests/ to tests/intel/.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/{ => intel}/kms_sharpness_filter.c | 0
 tests/meson.build                        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/{ => intel}/kms_sharpness_filter.c (100%)

diff --git a/tests/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
similarity index 100%
rename from tests/kms_sharpness_filter.c
rename to tests/intel/kms_sharpness_filter.c
diff --git a/tests/meson.build b/tests/meson.build
index ecc0f4c7f..da70c5014 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -62,7 +62,6 @@ test_progs = [
 	'kms_sequence',
 	'kms_setmode',
 	'kms_sysfs_edid_timing',
-	'kms_sharpness_filter',
 	'kms_tiled_display',
 	'kms_tv_load_detect',
 	'kms_universal_plane',
@@ -274,6 +273,7 @@ intel_kms_progs = [
 	'kms_psr2_su',
 	'kms_psr_stress_test',
 	'kms_pwrite_crc',
+	'kms_sharpness_filter',
 ]
 
 intel_xe_progs = [
-- 
2.25.1

