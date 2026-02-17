Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16066E68152
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 09:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99EE10E4AE;
	Tue, 17 Feb 2026 09:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJXehL1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4010E4AE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771320049; x=1802856049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tacBdh0aHQh2oaB0kEKn5cPMoEzFUS+KSlLzjexXU1g=;
 b=oJXehL1eV8XrtmfLz63UKek5HGhUyjnDOj51Grl6VkI2VLVt0JVay+pn
 uC312c1utgcHzbUPosyLJZP0Sl6E9st5YfhOmWAqMBkDMiMkG4CEw19kk
 8KLp0gQws27BKQLsZMumx+MnIFenmuGJFxtxl1Fqn3tygvledzihQzYIh
 e2HaE5wEPGSaMVtOERl0tAFds4VozV5LVX7So16qizk+lmyKDvZtgkpj2
 2ZaHB+fRc/P/LFGG4aUPzPNN7SjocRCpC2C8eDdY8ZOTj8/gwJb3HIfUN
 U+yN7wtm8bvPFNSjZvA7YPvnQowLT1Qo4KpnDhzcyRiCq3z8W7jcplCDO w==;
X-CSE-ConnectionGUID: DDNRXj7rQGOFOJ5b2ct0mQ==
X-CSE-MsgGUID: A/Lm5D1bT8mmVpfk9/6ggA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72558938"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72558938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:20:48 -0800
X-CSE-ConnectionGUID: elwr6Td9SWSAcl2VpqMkyg==
X-CSE-MsgGUID: v9lTzlgcSVy9cvachGmiog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="212744464"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:20:45 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 3/3] intel-ci: Add xe.chamelium-only testlist
Date: Tue, 17 Feb 2026 14:48:38 +0530
Message-ID: <20260217091838.2508942-4-mohammed.bilal@intel.com>
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

Create driver-specific chamelium testlist for xe

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/meson.build                |  1 +
 tests/intel-ci/xe.chamelium-only.testlist | 71 +++++++++++++++++++++++
 tests/intel/kms_test_config.json          |  5 +-
 3 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 tests/intel-ci/xe.chamelium-only.testlist

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 466530e08..54a9b6f5d 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -14,6 +14,7 @@ intelci_files = [
   'xe.bmg.core.blocklist.txt',
   'xe.bmg.display.blocklist.txt',
   'xe.bmg.eudebug.blocklist.txt',
+  'xe.chamelium-only.testlist',
   'xe.eudebug.blocklist.txt',
   'xe.fast-feedback.testlist',
   'xe-fast-feedback.testlist',
diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
new file mode 100644
index 000000000..4428fb48e
--- /dev/null
+++ b/tests/intel-ci/xe.chamelium-only.testlist
@@ -0,0 +1,71 @@
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
+igt@kms_chamelium_edid@dp-edid-read
+igt@kms_chamelium_edid@dp-edid-resolution-list
+igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
+igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
+igt@kms_chamelium_edid@dp-mode-timings
+igt@kms_chamelium_edid@hdmi-edid-read
+# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
+# removed test as its having a mode 4k@60 resulting
+# TMDS config errors on v1 board
+#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+igt@kms_chamelium_edid@hdmi-mode-timings
+igt@kms_chamelium_frames@dp-crc-fast
+igt@kms_chamelium_frames@dp-crc-multiple
+igt@kms_chamelium_frames@dp-crc-single
+igt@kms_chamelium_frames@dp-frame-dump
+igt@kms_chamelium_frames@hdmi-aspect-ratio
+igt@kms_chamelium_frames@hdmi-cmp-planar-formats
+# Tests are exhaustive and pick random configurations
+# removed tests as results are non-deterministic on each run
+#igt@kms_chamelium_frames@hdmi-cmp-planes-random
+#igt@kms_chamelium_frames@hdmi-crc-planes-random
+igt@kms_chamelium_frames@hdmi-crc-fast
+igt@kms_chamelium_frames@hdmi-crc-multiple
+igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
+igt@kms_chamelium_frames@hdmi-crc-single
+igt@kms_chamelium_frames@hdmi-frame-dump
+igt@kms_chamelium_hpd@dp-hpd
+igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@dp-hpd-fast
+igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
+igt@kms_chamelium_hpd@dp-hpd-storm
+igt@kms_chamelium_hpd@dp-hpd-storm-disable
+igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
+igt@kms_chamelium_hpd@hdmi-hpd
+igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@hdmi-hpd-fast
+igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
+igt@kms_chamelium_hpd@hdmi-hpd-storm
+igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
+igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium_audio@hdmi-audio
+igt@kms_chamelium_audio@hdmi-audio-edid
+igt@kms_chamelium_sharpness_filter@filter-basic
+igt@kms_tiled_display@basic-test-pattern-with-chamelium
+#Place suspend tests at end
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
+igt@kms_chamelium_edid@dp-edid-change-during-suspend
+igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
+#Place hibernate tests at end
+igt@kms_chamelium_edid@dp-edid-change-during-hibernate
+igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
+igt@kms_chamelium_hpd@common-hpd-after-hibernate
+igt@kms_chamelium_hpd@dp-hpd-after-hibernate
+igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index e907b4b84..158ead3b6 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -18,11 +18,12 @@
                         { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
-                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
+                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
+                        { "Xe chamelium": "../intel-ci/xe.chamelium-only.testlist" }
                     ],
                     "exclude": [
                         { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
-                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
+                        { "Xe BAT, Xe BAT chamelium, Xe chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                     ]
                 }
             },
-- 
2.48.1

