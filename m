Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFCEC83030
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 05:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E1310E92F;
	Fri,  4 Jul 2025 05:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFzjqh4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFE510E92F
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 05:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751606535; x=1783142535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FRkIRD+PqcJdCwpD8Yi4fcN4bUqk3Qfwd9bD/XRXxuE=;
 b=AFzjqh4RTl3v31EwSA98r0Os4LTp7toyCUUmZDFiVnYNAXeh/yJz2wBe
 ldYXByXERRjqPb15fq0v/4xJssAxXTDJ9Yxu1Md1wHoLWvHdQego88ekY
 BYs+Q2oj0Xlbh2Z47KbT885zjPLAHYd/W5rE04rZcEzuKhhy5w1eg0uX7
 DoBkwAoRUnT6oe6UeupoZCITstNk1TU3HZCMHUO1o/gHuY+YUX7nzlgPd
 CRSnCdO/KRDQ51krjv2pNjIIJJQu4vK7z39Vdyo5tnEcWa+6v03Relfq4
 dGkB4LYOsjL8rUzWEYCv6t/IzSyDQigApfLd/43z+4tARnFiX7nChFrn/ g==;
X-CSE-ConnectionGUID: w6wrEvDAS9+Pt8ZVOPG56Q==
X-CSE-MsgGUID: 8uWJZWRYRfCkasJz3q8i+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53810989"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="53810989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 22:22:15 -0700
X-CSE-ConnectionGUID: Lfwy+XGDRIe4D2QYp6apmw==
X-CSE-MsgGUID: FInlt67iTmSaPm4JVtR/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154635437"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:22:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/xe.bmg.display.blocklist: update bmg
 blocklist
Date: Fri,  4 Jul 2025 11:08:01 +0530
Message-Id: <20250704053801.230707-1-kunal1.joshi@intel.com>
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

update bmg blocklist with unsupported
or tests which are expected to skip

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com> 
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 25 ++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index f145d6c0d..d315ca1a0 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -9,8 +9,9 @@ igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
 igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-(tiled|tile).*
 igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
 igt@kms_flip_scaled_crc@.*(yf|y)tile.*
-igt@kms_async_flips@invalid-async-flip
+igt@kms_async_flips@invalid-async-flip.*
 igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_pipe_stress@.*ytiled$
 #########################################
 # Valid skip :- 90/270 rotation is not supported
 ##########################################
@@ -61,6 +62,14 @@ igt@kms_cursor_crc@cursor-(offscreen|onscreen|random|rapid-movement|sliding)-512
 # Valid skip as BMG doesn't have eDP supported
 ##########################################
 igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_vrr@cmrr.*
+igt@kms_atomic_transition@.*-internal-panels$
+igt@.*psr.*
+igt@kms_pm_backlight@.*
+igt@kms_pm_power_saving@.*
+igt@kms_scaling_modes@.*
+igt@kms_panel_fitting@.*
+igt@.*@.*(?!no-)drrs.*
 #########################################
 # no VGA connectors in BMG
 #########################################
@@ -71,6 +80,7 @@ igt@.*chamelium.*vga.*
 igt@kms_content_protection@content-type-change
 igt@kms_content_protection@lic-type-1
 igt@kms_content_protection@type1
+igt@kms_content_protection@mei-interface
 #########################################
 # Expected skip as BMG doesn't have PORT_A/B
 #########################################
@@ -88,6 +98,7 @@ igt@kms_getfb@getfb-reject-ccs
 # Expected skip for graphics ver >= 20
 #########################################
 igt@kms_getfb@getfb2-accept-ccs
+igt@kms_vrr@lobf
 ##########################################
 # Valid skip :- Feature is not enabled on kernel
 ##########################################
@@ -97,13 +108,17 @@ igt@kms_writeback@.*
 #########################################
 igt@kms_pm_dc@deep-pkgc
 igt@kms_pm_dc@dc6-dpms
-
+#########################################
+# Valid skip :- BMG has only one cdclk (WA)
+#########################################
+igt@kms_cdclk@.*
 ##########################################
-# Valid skip :- DG2 & MTL specific
+# Valid skip :- DG2 & MTL & LNL specific
 ##########################################
 igt@kms_ccs@.*-dg2-.*
 igt@kms_ccs@.*-mtl-.*
 igt@kms_flip_scaled_crc@.*dg2rcccs.*
+igt@kms_ccs@.*-lnl-.*
 ##########################################
 # Valid skip :- Simulation specific
 ##########################################
@@ -156,3 +171,7 @@ igt@kms_bw@linear-tiling-.*-display.*
 #########################################
 igt@kms_big_fb@linear-max-hw-stride.*hflip
 #########################################
+# Valid skip : intel_display_ver(data.devid) >= 30
+#########################################
+igt@kms_pm_dc@dc5-retention-flops$
+#########################################
-- 
2.25.1

