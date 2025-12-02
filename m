Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4315AD1171E
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 18:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F2810E6A8;
	Tue,  2 Dec 2025 18:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htUdcs/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7743410E6AF
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 18:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698956; x=1796234956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4pNHgwewDbeVzeyrP5E41nFD049BC3D7OrLO/jMhluE=;
 b=htUdcs/jgYiiIydrxniRA2H+9k35X2Zi9SqN5PFdeXJ+4Vi9JbCBWzsl
 wiL7bCDS/ieVgTyv7hg/ZVoPevt8BM9icVfK8jYd82DwW4ROU8TB0n/E4
 L4lZdNeDfMiMU+0xQ70R3u33x7N9OOwjtWrlNjqrK7FzAd0KYnqWh+Q9C
 OTTNuDroxmGJEu5Uk8OwTXPg28VYOUfL75D0ekaIxRL59TgZ2L/I7nVgE
 nZif3C9B57597dyhoMi6RTna3Hov0IEzti3YlPYrvyjM+zOXvmXFMozd4
 au19IGYZghk4Zpr/HqX7R0w3Udq0U5lubmH39tRtY9fm/vTEu0qcBJ2DX A==;
X-CSE-ConnectionGUID: GKH/AH/6RSi9nheA1k7pqg==
X-CSE-MsgGUID: WJactKb9QRC3v/3fknT7kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66570818"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66570818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:09:16 -0800
X-CSE-ConnectionGUID: 1pWpqWXAQrCGrBn+clpVgA==
X-CSE-MsgGUID: S4q70sCtR8GNXmlZn+81zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198914818"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:09:14 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v1 3/3] intel-ci: unify chamelium testlist
Date: Tue,  2 Dec 2025 19:08:51 +0100
Message-ID: <20251202180851.148444-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
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

Both i915 and Xe use the same testlist, so make it uniform and
move it to one chamelium-only.testlist file. Add also symlinks
for it to make CI change easier.

Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/chamelium-only.testlist      | 70 ++++++++++++++++++++-
 tests/intel-ci/i915.chamelium-only.testlist | 70 +--------------------
 tests/intel-ci/meson.build                  |  1 -
 tests/intel-ci/xe.chamelium-only.testlist   |  1 +
 tests/intel/kms_test_config.json            |  2 +-
 5 files changed, 72 insertions(+), 72 deletions(-)
 mode change 120000 => 100644 tests/intel-ci/chamelium-only.testlist
 mode change 100644 => 120000 tests/intel-ci/i915.chamelium-only.testlist
 create mode 120000 tests/intel-ci/xe.chamelium-only.testlist

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
deleted file mode 120000
index 3715a9469..000000000
--- a/tests/intel-ci/chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-i915.chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
new file mode 100644
index 000000000..99d2f2409
--- /dev/null
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -0,0 +1,69 @@
+igt@kms_feature_discovery@chamelium
+igt@kms_chamelium_audio@dp-audio
+igt@kms_chamelium_audio@dp-audio-edid
+igt@kms_chamelium_color@ctm-0-25
+igt@kms_chamelium_color@ctm-0-50
+igt@kms_chamelium_color@ctm-0-75
+igt@kms_chamelium_color@ctm-blue-to-red
+igt@kms_chamelium_color@ctm-green-to-red
+igt@kms_chamelium_color@ctm-limited-range
+igt@kms_chamelium_color@ctm-max
+igt@kms_chamelium_color@ctm-negative
+igt@kms_chamelium_color@ctm-red-to-blue
+igt@kms_chamelium_color@degamma
+igt@kms_chamelium_color@gamma
+igt@kms_chamelium_edid@dp-edid-change-during-suspend
+igt@kms_chamelium_edid@dp-edid-read
+igt@kms_chamelium_edid@dp-edid-resolution-list
+igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
+igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
+igt@kms_chamelium_edid@dp-mode-timings
+igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
+igt@kms_chamelium_edid@hdmi-edid-read
+# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
+# removed test as its having a mode 4k@60 resulting 
+# TMDS config errors on v1 board
+#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+igt@kms_chamelium_edid@hdmi-mode-timings
+igt@kms_chamelium_edid@vga-edid-read
+igt@kms_chamelium_frames@dp-crc-fast
+igt@kms_chamelium_frames@dp-crc-multiple
+igt@kms_chamelium_frames@dp-crc-single
+igt@kms_chamelium_frames@dp-frame-dump
+igt@kms_chamelium_frames@hdmi-aspect-ratio
+igt@kms_chamelium_frames@hdmi-cmp-planar-formats
+igt@kms_chamelium_frames@hdmi-crc-fast
+igt@kms_chamelium_frames@hdmi-crc-multiple
+igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
+igt@kms_chamelium_frames@hdmi-crc-single
+igt@kms_chamelium_frames@hdmi-frame-dump
+igt@kms_chamelium_frames@vga-frame-dump
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd
+igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@dp-hpd-fast
+igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
+igt@kms_chamelium_hpd@dp-hpd-storm
+igt@kms_chamelium_hpd@dp-hpd-storm-disable
+igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
+igt@kms_chamelium_hpd@hdmi-hpd
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@hdmi-hpd-fast
+igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
+igt@kms_chamelium_hpd@hdmi-hpd-storm
+igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
+igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium_audio@hdmi-audio
+igt@kms_chamelium_audio@hdmi-audio-edid
+igt@kms_chamelium_hpd@vga-hpd
+igt@kms_chamelium_hpd@vga-hpd-after-suspend
+igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@vga-hpd-fast
+igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
+igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
+igt@kms_chamelium_hpd@vga-hpd-without-ddc
+igt@kms_chamelium_sharpness_filter@filter-basic
+igt@kms_tiled_display@basic-test-pattern-with-chamelium
diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
deleted file mode 100644
index 99d2f2409..000000000
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ /dev/null
@@ -1,69 +0,0 @@
-igt@kms_feature_discovery@chamelium
-igt@kms_chamelium_audio@dp-audio
-igt@kms_chamelium_audio@dp-audio-edid
-igt@kms_chamelium_color@ctm-0-25
-igt@kms_chamelium_color@ctm-0-50
-igt@kms_chamelium_color@ctm-0-75
-igt@kms_chamelium_color@ctm-blue-to-red
-igt@kms_chamelium_color@ctm-green-to-red
-igt@kms_chamelium_color@ctm-limited-range
-igt@kms_chamelium_color@ctm-max
-igt@kms_chamelium_color@ctm-negative
-igt@kms_chamelium_color@ctm-red-to-blue
-igt@kms_chamelium_color@degamma
-igt@kms_chamelium_color@gamma
-igt@kms_chamelium_edid@dp-edid-change-during-suspend
-igt@kms_chamelium_edid@dp-edid-read
-igt@kms_chamelium_edid@dp-edid-resolution-list
-igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
-igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
-igt@kms_chamelium_edid@dp-mode-timings
-igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
-igt@kms_chamelium_edid@hdmi-edid-read
-# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
-# removed test as its having a mode 4k@60 resulting 
-# TMDS config errors on v1 board
-#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
-igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
-igt@kms_chamelium_edid@hdmi-mode-timings
-igt@kms_chamelium_edid@vga-edid-read
-igt@kms_chamelium_frames@dp-crc-fast
-igt@kms_chamelium_frames@dp-crc-multiple
-igt@kms_chamelium_frames@dp-crc-single
-igt@kms_chamelium_frames@dp-frame-dump
-igt@kms_chamelium_frames@hdmi-aspect-ratio
-igt@kms_chamelium_frames@hdmi-cmp-planar-formats
-igt@kms_chamelium_frames@hdmi-crc-fast
-igt@kms_chamelium_frames@hdmi-crc-multiple
-igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
-igt@kms_chamelium_frames@hdmi-crc-single
-igt@kms_chamelium_frames@hdmi-frame-dump
-igt@kms_chamelium_frames@vga-frame-dump
-igt@kms_chamelium_hpd@common-hpd-after-suspend
-igt@kms_chamelium_hpd@dp-hpd
-igt@kms_chamelium_hpd@dp-hpd-after-suspend
-igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
-igt@kms_chamelium_hpd@dp-hpd-fast
-igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
-igt@kms_chamelium_hpd@dp-hpd-storm
-igt@kms_chamelium_hpd@dp-hpd-storm-disable
-igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
-igt@kms_chamelium_hpd@hdmi-hpd
-igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
-igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
-igt@kms_chamelium_hpd@hdmi-hpd-fast
-igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
-igt@kms_chamelium_hpd@hdmi-hpd-storm
-igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
-igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
-igt@kms_chamelium_audio@hdmi-audio
-igt@kms_chamelium_audio@hdmi-audio-edid
-igt@kms_chamelium_hpd@vga-hpd
-igt@kms_chamelium_hpd@vga-hpd-after-suspend
-igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
-igt@kms_chamelium_hpd@vga-hpd-fast
-igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
-igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
-igt@kms_chamelium_hpd@vga-hpd-without-ddc
-igt@kms_chamelium_sharpness_filter@filter-basic
-igt@kms_tiled_display@basic-test-pattern-with-chamelium
diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
new file mode 120000
index 000000000..d7c492973
--- /dev/null
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -0,0 +1 @@
+chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 917f18bfe..34453ca4e 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -9,7 +9,6 @@ intelci_files = [
   'fast-feedback-chamelium-only.testlist',
   'i915.blocklist.txt',
   'i915.blocklist-pre-merge.txt',
-  'i915.chamelium-only.testlist',
   'i915.fast-feedback.testlist',
   'i915.fast-feedback-chamelium-only.testlist',
   'meta.testlist',
diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
new file mode 120000
index 000000000..d7c492973
--- /dev/null
+++ b/tests/intel-ci/xe.chamelium-only.testlist
@@ -0,0 +1 @@
+chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 559d46b4d..5645de181 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -15,7 +15,7 @@
                     "include": [
                         { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
+                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
                         { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
-- 
2.52.0

