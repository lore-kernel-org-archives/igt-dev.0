Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F40E6E13A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2020 05:59:39 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 23 Apr 2020 04:31:51 +0530
Message-Id: <20200422230151.29558-3-kunal1.joshi@intel.com>
In-Reply-To: <20200422230151.29558-1-kunal1.joshi@intel.com>
References: <20200422230151.29558-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 2/2] HAX: Run in BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org, imre.deak@intel.com
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Bat run
---
 tests/intel-ci/fast-feedback.testlist | 45 ++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 2ccad438..646003d9 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -84,15 +84,58 @@ igt@kms_addfb_basic@unused-modifier
 igt@kms_addfb_basic@unused-offsets
 igt@kms_addfb_basic@unused-pitches
 igt@kms_busy@basic
+igt@kms_chamelium@dp-hpd
 igt@kms_chamelium@dp-hpd-fast
+igt@kms_chamelium@dp-hpd-enable-disable-mode
+igt@kms_chamelium@dp-hpd-with-enabled-mode
 igt@kms_chamelium@dp-edid-read
+igt@kms_chamelium@dp-hpd-after-suspend
+igt@kms_chamelium@dp-hpd-after-hibernate
+igt@kms_chamelium@dp-hpd-storm
+igt@kms_chamelium@dp-hpd-storm-disable
+igt@kms_chamelium@dp-edid-change-during-suspend
+igt@kms_chamelium@dp-edid-change-during-hibernate
+igt@kms_chamelium@dp-crc-single
 igt@kms_chamelium@dp-crc-fast
+igt@kms_chamelium@dp-crc-multiple
+igt@kms_chamelium@dp-frame-dump
+igt@kms_chamelium@dp-mode-timings
+igt@kms_chamelium@dp-audio
+igt@kms_chamelium@dp-audio-edid
+igt@kms_chamelium@hdmi-hpd
 igt@kms_chamelium@hdmi-hpd-fast
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode
 igt@kms_chamelium@hdmi-edid-read
+igt@kms_chamelium@hdmi-hpd-after-suspend
+igt@kms_chamelium@hdmi-hpd-after-hibernate
+igt@kms_chamelium@hdmi-hpd-storm
+igt@kms_chamelium@hdmi-hpd-storm-disable
+igt@kms_chamelium@hdmi-edid-change-during-suspend
+igt@kms_chamelium@hdmi-edid-change-during-hibernate
+igt@kms_chamelium@hdmi-crc-single
 igt@kms_chamelium@hdmi-crc-fast
+igt@kms_chamelium@hdmi-crc-multiple
+igt@kms_chamelium@hdmi-crc-nonplanar-formats
+igt@kms_chamelium@hdmi-crc-planes-random
+igt@kms_chamelium@hdmi-cmp-planar-formats
+igt@kms_chamelium@hdmi-cmp-planes-random
+igt@kms_chamelium@hdmi-frame-dump
+igt@kms_chamelium@hdmi-mode-timings
+igt@kms_chamelium@hdmi-audio
+igt@kms_chamelium@hdmi-audio-edid
+igt@kms_chamelium@hdmi-aspect-ratio
+igt@kms_chamelium@vga-hpd
 igt@kms_chamelium@vga-hpd-fast
+igt@kms_chamelium@vga-hpd-enable-disable-mode
+igt@kms_chamelium@vga-hpd-with-enabled-mode
 igt@kms_chamelium@vga-edid-read
-igt@kms_chamelium@common-hpd-after-suspend
+igt@kms_chamelium@vga-hpd-after-suspend
+igt@kms_chamelium@vga-hpd-after-hibernate
+igt@kms_chamelium@vga-hpd-without-ddc
+igt@kms_chamelium@vga-frame-dump
+common-hpd-after-suspend
+common-hpd-after-hibernate
 igt@kms_prop_blob@basic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
 igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
