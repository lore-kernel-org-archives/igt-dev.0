Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB51EEEF325
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 08:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE5110EB97;
	Thu,  5 Mar 2026 08:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuBJOdhq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CFC10EB97
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772700116; x=1804236116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wLMo4THtwD1L8W92f7NkzusnBMGIWL7gs1qUlTIHu2Q=;
 b=EuBJOdhq/CTLtii7Uz8VZl18/jqNpDsO1UgFAa2xeGHohoZt7gIqnE/6
 pC5CU1yuUu8c01rXmIGmal7psrIU2eFr3+XNFIiyNHSFIrDgcKHCbyyX7
 0Q23kvEr1fKe8vhd3dAoUnLFH3TLX2GRM5Wg7D+yslpmPx/dUQylRDfOh
 GPhjcple6QCC1HTfmHlFEp/VcGtMxS+KKEJ6r1jV9S8rWlFgpIvTHkSgW
 1WhdivdLrDUy/Q3bSYWU4MdVEVttIsI3LvSx0vohpulcSjGFKGBktKrv4
 glNmcfJHM8jEmx9mRaMWPhR1Yduxrwzy7mKTgCUF4dmiy6JDLWjPwOwxW Q==;
X-CSE-ConnectionGUID: kUnt+2N7Qziy9Gh5Pr5wyQ==
X-CSE-MsgGUID: gEHAeJG7QSuXbbS3MAJs7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77624271"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77624271"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:56 -0800
X-CSE-ConnectionGUID: RoJSBBJ2SqyxdDxZKlBT7w==
X-CSE-MsgGUID: 87CIe61FROGDfAmkMOaKhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="214673627"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:54 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v5 4/6] intel-ci: Move i915 suspend/resume tests to end
Date: Thu,  5 Mar 2026 14:09:04 +0530
Message-ID: <20260305083906.3098168-5-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260305083906.3098168-1-mohammed.bilal@intel.com>
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
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

Reorganize FULL chamelium testlist by moving suspend and resume tests to
the end. Suspend operations can cause system hangs or connection timeouts,
so isolating them at the tail ensures stability of main test execution.

v2:
- Move suspend resume tests to the end of the testlist (Kunal)

v3:
-Use move-fix-add approach (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)

v5:
-Update commit message (Kamil)
-Split commit (Swati)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
index 6ab9029a4..0db71f7ef 100644
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -12,13 +12,11 @@ igt@kms_chamelium_color@ctm-negative
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
 # Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
 # removed test as its having a mode 4k@60 resulting 
@@ -43,9 +41,7 @@ igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
 igt@kms_chamelium_frames@hdmi-crc-single
 igt@kms_chamelium_frames@hdmi-frame-dump
 igt@kms_chamelium_frames@vga-frame-dump
-igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd
-igt@kms_chamelium_hpd@dp-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@dp-hpd-fast
 igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
@@ -53,7 +49,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
 igt@kms_chamelium_hpd@dp-hpd-storm-disable
 igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@hdmi-hpd
-igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
 igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@hdmi-hpd-fast
 igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
@@ -63,7 +58,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
 igt@kms_chamelium_audio@hdmi-audio
 igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_hpd@vga-hpd
-igt@kms_chamelium_hpd@vga-hpd-after-suspend
 igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
@@ -71,6 +65,13 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
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
-- 
2.48.1

