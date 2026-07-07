Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF0EC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 04:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDC510E27F;
	Tue,  7 Jul 2026 04:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3HmODTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406EE10E27F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 04:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783397208; x=1814933208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tdqCCxGP4x97fqGT6oxGQJ4WhIiIHx6MxMx66ADpgZU=;
 b=Q3HmODTj2dZjMXoQQ531KqD4pbXhfLjuzmQ4R5QbCMDpeIU4Xn7k/+cR
 4GHQihehwWT04g8twyqekizk/+rFqCWAuWhmKNTI+KOF2H199z3cSZZR5
 gtw8+sX2DUCsA8hgM8RoQWK3N+pvL+R56IZic4uY8L3JTYD4W2swiVed5
 FGDKTzyu9lJtor1bjUn/35cdknQcF3/U6Fq13TdfV+T5ghZeL1iuVPvSE
 xEtmqsu03MyVYy92Tw3Bta/l79u/pXI7sDFQk4rxj2HhdgnmC5VxObn6w
 8ERI8qfnvHa9K7CUwvv7nwbfbwbJBYGzcxYvKK+haMjazCFfs5k+HmX9t A==;
X-CSE-ConnectionGUID: 428ZJiltRjutVLzeUwsy7w==
X-CSE-MsgGUID: 1lNRAUgpSjmblK6dbr4ppA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87718090"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="87718090"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 21:06:47 -0700
X-CSE-ConnectionGUID: n5nN4ticSZGfrHNdUg06oQ==
X-CSE-MsgGUID: WSg2PQIARWebdB2YG6T4gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="249455950"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 21:06:45 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel-ci/chamelium-only.testlist: Include
 additional chamelium tests
Date: Tue,  7 Jul 2026 09:49:56 +0530
Message-ID: <20260707041956.39997-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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

Extend chamelium-only testlist with audio-after-suspend tests for
DP/HDMI and kms_chamelium_color_pipeline tests.
Blocklist plane-lut3d-green-only on platforms with display version <= 35.

v2:
- Update commit message (Kathik)
- Add NVL specific test in other blocklists (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/chamelium-only.testlist      | 11 +++++++++++
 tests/intel-ci/xe.bmg.display.blocklist.txt |  4 ++++
 tests/intel-ci/xe.lnl.display.blocklist.txt |  4 ++++
 tests/intel-ci/xe.ptl.display.blocklist.txt |  4 ++++
 4 files changed, 23 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index d627ad414..8d634b6cc 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -2,6 +2,7 @@
 # To blocklist tests, use the appropriate xe/i915 blocklist files instead
 igt@kms_feature_discovery@chamelium
 igt@kms_chamelium_audio@dp-audio
+igt@kms_chamelium_audio@dp-audio-after-suspend
 igt@kms_chamelium_audio@dp-audio-edid
 igt@kms_chamelium_color@ctm-0-25
 igt@kms_chamelium_color@ctm-0-50
@@ -14,6 +15,15 @@ igt@kms_chamelium_color@ctm-negative
 igt@kms_chamelium_color@ctm-red-to-blue
 igt@kms_chamelium_color@degamma
 igt@kms_chamelium_color@gamma
+igt@kms_chamelium_color_pipeline@plane-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d
+igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
 igt@kms_chamelium_edid@dp-edid-read
 igt@kms_chamelium_edid@dp-edid-resolution-list
 igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
@@ -53,6 +63,7 @@ igt@kms_chamelium_hpd@hdmi-hpd-storm
 igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
 igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
 igt@kms_chamelium_audio@hdmi-audio
+igt@kms_chamelium_audio@hdmi-audio-after-suspend
 igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_hpd@vga-hpd
 igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 4c2a7390a..18712fb86 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -181,3 +181,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
+# Valid skip :- For display ver <= 35
+########################################
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
+########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 1dbb24ae3..5d008ce8d 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -191,3 +191,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
++# Valid skip :- For display ver <= 35
++########################################
++igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
++########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 1041931a1..846527f02 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -182,3 +182,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
++# Valid skip :- For display ver <= 35
++########################################
++igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
++########################################
-- 
2.53.0

