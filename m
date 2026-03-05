Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F43CEEF325
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 08:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B0A10EB9C;
	Thu,  5 Mar 2026 08:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJjsgBP8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F21910EB9C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772700121; x=1804236121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jtEo3KPrI172Y3ozRISRFchWjz0AjTowQdHzn8h7pOU=;
 b=MJjsgBP8BUp8g8N0DaoJkHpQecO8thXoJ+UUf9wvkRrLMe1akky+bPKz
 UZzs8Zth4BgVDPMPNBxZMWzLAp/oSmrmCRwdlK+0vaVOdh/LA+StQupHw
 eQLKpwINYRB8OYl8i2qJFhOpQVz9VVNdW/9NhLVYPlkSL+9eXi53N7tfh
 BLBbarDc7eBW1+pmYRszTb+2xaAVFMI6p0O0hQSYJdXW5b5/X+rFG+7NG
 VI3tIzIdvuzBWzO4+Y2Mpb3eG0dOZEq1Sge6n0qKtB4SIiA1JT7tognds
 yr3KLMH3W9wRqyJRjt+ETaOe0Fyl+a8VRX3Qwcs1c6zjMOd1LsPJfXNSU A==;
X-CSE-ConnectionGUID: ZdrYbpIESyOWovMNWO9HKQ==
X-CSE-MsgGUID: DK7rAi76SESN6SC/gOBcpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77624273"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77624273"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:42:00 -0800
X-CSE-ConnectionGUID: me0dq7V4RGmIdkknLs3uww==
X-CSE-MsgGUID: 69KB4XPORum5qS0Jctw40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="214673644"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:58 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v5 6/6] intel-ci: Remove xe *-vga chamelium tests
Date: Thu,  5 Mar 2026 14:09:06 +0530
Message-ID: <20260305083906.3098168-7-mohammed.bilal@intel.com>
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

Remove VGA-related subtests from the Xe FULL chamelium testlist as Xe
driver does not support VGA connector types.

v2:
- Move suspend resume tests to the end of the testlist (Kunal)
- Comment out random-plane test (Kunal)

v3:
-Use move-fix-add approach (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)

v5:
-Update commit message (Kamil and Swati)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/xe.chamelium-only.testlist | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
index 56bffd8de..4428fb48e 100644
--- a/tests/intel-ci/xe.chamelium-only.testlist
+++ b/tests/intel-ci/xe.chamelium-only.testlist
@@ -24,7 +24,6 @@ igt@kms_chamelium_edid@hdmi-edid-read
 #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@hdmi-mode-timings
-igt@kms_chamelium_edid@vga-edid-read
 igt@kms_chamelium_frames@dp-crc-fast
 igt@kms_chamelium_frames@dp-crc-multiple
 igt@kms_chamelium_frames@dp-crc-single
@@ -40,7 +39,6 @@ igt@kms_chamelium_frames@hdmi-crc-multiple
 igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
 igt@kms_chamelium_frames@hdmi-crc-single
 igt@kms_chamelium_frames@hdmi-frame-dump
-igt@kms_chamelium_frames@vga-frame-dump
 igt@kms_chamelium_hpd@dp-hpd
 igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@dp-hpd-fast
@@ -57,19 +55,12 @@ igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
 igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
 igt@kms_chamelium_audio@hdmi-audio
 igt@kms_chamelium_audio@hdmi-audio-edid
-igt@kms_chamelium_hpd@vga-hpd
-igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
-igt@kms_chamelium_hpd@vga-hpd-fast
-igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
-igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
-igt@kms_chamelium_hpd@vga-hpd-without-ddc
 igt@kms_chamelium_sharpness_filter@filter-basic
 igt@kms_tiled_display@basic-test-pattern-with-chamelium
 #Place suspend tests at end
 igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd-after-suspend
 igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
-igt@kms_chamelium_hpd@vga-hpd-after-suspend
 igt@kms_chamelium_edid@dp-edid-change-during-suspend
 igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 #Place hibernate tests at end
-- 
2.48.1

