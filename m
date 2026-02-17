Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A87CE68154
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 09:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA4210E4AD;
	Tue, 17 Feb 2026 09:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="my4nrfa+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253B78913D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771320047; x=1802856047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UcQgO0XXVSrivl43ov2MPcasCaruAS91YZa/hIqNt8I=;
 b=my4nrfa+vzTwSJNz1uGYj/sUFsW85krYVkS07AMzP4qMFXXf4bEOD1vz
 UHNdM6H0XboS7nFwU0DV6Ztb2ZMWFV8YHJqLkun3lJcCrNzyZIxwp9PSZ
 DAIy0k2BQGPd6SysVQ4Lg0hzoXuIuzjZwNEZaD5w3fFrJFEmltmN8C3xm
 cfIGZc948iuiNp3idAjgmgXIOVKxRcIQTOD0o/9qzI36/p9HQvcclM5hn
 KU+jWCOFZbND1ANdY5uA3dJw2/rI5Ax+1mPbPtPX8DVHYwMx/JvoqtOuq
 mREpocQ4Vgf27VlyMkPuXja/oOhUAk0fXMur3kQkhtzLcukV4iW8Pn215 Q==;
X-CSE-ConnectionGUID: hgFwLgb6Q6K+gJ7/9uslAg==
X-CSE-MsgGUID: swpXTTDNSfysQWARvyhvlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72558934"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72558934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:20:47 -0800
X-CSE-ConnectionGUID: AFJ1vm57SIaIsrCX/VyVsg==
X-CSE-MsgGUID: c2dJmC4US6mUgI4+rKNRiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="212744460"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:20:43 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 2/3] intel-ci: Rename chamelium-only testlist to i915
 specific
Date: Tue, 17 Feb 2026 14:48:37 +0530
Message-ID: <20260217091838.2508942-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260217091838.2508942-1-mohammed.bilal@intel.com>
References: <20260217091838.2508942-1-mohammed.bilal@intel.com>
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

Rename chamelium-only.testlist to i915.chamelium-only.testlist.

v2:
- Move suspend resume tests to the end of the testlist (Kunal)
- Comment out random-plane test (Kunal)

v3:
-Use move-fix-add approach (Kamil)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 ....testlist => i915.chamelium-only.testlist} | 23 +++++++++++--------
 tests/intel-ci/meson.build                    |  2 +-
 tests/intel/kms_test_config.json              |  2 +-
 3 files changed, 15 insertions(+), 12 deletions(-)
 rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (91%)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
similarity index 91%
rename from tests/intel-ci/chamelium-only.testlist
rename to tests/intel-ci/i915.chamelium-only.testlist
index 9adace28c..56bffd8de 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -12,16 +12,14 @@ igt@kms_chamelium_color@ctm-negative
 igt@kms_chamelium_color@ctm-red-to-blue
 igt@kms_chamelium_color@degamma
 igt@kms_chamelium_color@gamma
-igt@kms_chamelium_edid@dp-edid-change-during-suspend
 igt@kms_chamelium_edid@dp-edid-read
 igt@kms_chamelium_edid@dp-edid-resolution-list
 igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
 igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@dp-mode-timings
-igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 igt@kms_chamelium_edid@hdmi-edid-read
-# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
-# removed test as its having a mode 4k@60 resulting 
+# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
+# removed test as its having a mode 4k@60 resulting
 # TMDS config errors on v1 board
 #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
@@ -33,17 +31,17 @@ igt@kms_chamelium_frames@dp-crc-single
 igt@kms_chamelium_frames@dp-frame-dump
 igt@kms_chamelium_frames@hdmi-aspect-ratio
 igt@kms_chamelium_frames@hdmi-cmp-planar-formats
-igt@kms_chamelium_frames@hdmi-cmp-planes-random
+# Tests are exhaustive and pick random configurations
+# removed tests as results are non-deterministic on each run
+#igt@kms_chamelium_frames@hdmi-cmp-planes-random
+#igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-fast
 igt@kms_chamelium_frames@hdmi-crc-multiple
 igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
-igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-single
 igt@kms_chamelium_frames@hdmi-frame-dump
 igt@kms_chamelium_frames@vga-frame-dump
-igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd
-igt@kms_chamelium_hpd@dp-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@dp-hpd-fast
 igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
@@ -51,7 +49,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
 igt@kms_chamelium_hpd@dp-hpd-storm-disable
 igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@hdmi-hpd
-igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
 igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@hdmi-hpd-fast
 igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
@@ -61,7 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
 igt@kms_chamelium_audio@hdmi-audio
 igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_hpd@vga-hpd
-igt@kms_chamelium_hpd@vga-hpd-after-suspend
 igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
@@ -69,6 +65,13 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@vga-hpd-without-ddc
 igt@kms_chamelium_sharpness_filter@filter-basic
 igt@kms_tiled_display@basic-test-pattern-with-chamelium
+#Place suspend tests at end
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
+igt@kms_chamelium_hpd@vga-hpd-after-suspend
+igt@kms_chamelium_edid@dp-edid-change-during-suspend
+igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 #Place hibernate tests at end
 igt@kms_chamelium_edid@dp-edid-change-during-hibernate
 igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index cf0023c63..466530e08 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -2,11 +2,11 @@
 
 intelci_files = [
   'README',
-  'chamelium-only.testlist',
   'fast-feedback.testlist',
   'fast-feedback-chamelium-only.testlist',
   'i915.blocklist.txt',
   'i915.blocklist-pre-merge.txt',
+  'i915.chamelium-only.testlist',
   'i915.fast-feedback.testlist',
   'i915.fast-feedback-chamelium-only.testlist',
   'meta.testlist',
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 61a70a9bb..e907b4b84 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -15,7 +15,7 @@
                     "include": [
                         { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
                         { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
-- 
2.48.1

