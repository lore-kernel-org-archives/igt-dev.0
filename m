Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A2C109E54B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B67C10E2C3;
	Thu, 26 Mar 2026 06:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCmcv0ke";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A18210E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774506062; x=1806042062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pg120JWCh91XVPGfp2NZtcK2zyda48Bh/k/SY3oZ7CM=;
 b=KCmcv0ke7Yo+7PBC2+JzHf1X0aTAqnG22d9WbUGqw7y+094OE04VQFmK
 lNu8J23FAkQpFYKO+Tc5JQwQ1bicIXh2T8krX8Lb0xe6rWGYr5CfwH6rc
 89Ti55Eb804wg9z9TDH8GhhuBv3NmEvnW9GGjSePAsJkM5foa5ZKQ8IGJ
 eIVMG8GZ9lBVKXQtTnaHqec06c22KhQVmVZIVHlgUf9DeABsh492bdA4U
 /SRk7RwnL4/NvUVSCpWwGz152K13a2HqJMYL8rS2w8Nk6+rmDt54KxxPb
 S2vVVgEKjnE4OKow6V05VNn9MjxH5WuEJuZxLNknYKK2zBipNOmo8EBNr Q==;
X-CSE-ConnectionGUID: RyCoq+U/R4+ZhEzoo4ZYVw==
X-CSE-MsgGUID: Mkt1J9l0TIiQ39LugV434g==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="98175229"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="98175229"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:02 -0700
X-CSE-ConnectionGUID: qS/6Qdp1SbakxYlS5GqhBA==
X-CSE-MsgGUID: NbCCOltwTBeY5fsU8rglgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224935945"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:01 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 1/4] intel-ci: Move suspend/resume chamelium tests to
 end
Date: Thu, 26 Mar 2026 12:11:58 +0530
Message-ID: <20260326064201.783311-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326064201.783311-1-sowmiya.s@intel.com>
References: <20260326064201.783311-1-sowmiya.s@intel.com>
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Suspend operations can cause system hangs or connection timeouts,
so isolating them at the tail ensures stability of main test
execution.

v3:
-Sort tests alphabetically (Kamil)
v4: Add detailed comment (Swati)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 9adace28c..0e7c8e301 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
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
@@ -41,9 +39,7 @@ igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-single
 igt@kms_chamelium_frames@hdmi-frame-dump
 igt@kms_chamelium_frames@vga-frame-dump
-igt@kms_chamelium_hpd@common-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd
-igt@kms_chamelium_hpd@dp-hpd-after-suspend
 igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@dp-hpd-fast
 igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
@@ -51,7 +47,6 @@ igt@kms_chamelium_hpd@dp-hpd-storm
 igt@kms_chamelium_hpd@dp-hpd-storm-disable
 igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@hdmi-hpd
-igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
 igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@hdmi-hpd-fast
 igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
@@ -61,7 +56,6 @@ igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
 igt@kms_chamelium_audio@hdmi-audio
 igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_hpd@vga-hpd
-igt@kms_chamelium_hpd@vga-hpd-after-suspend
 igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
 igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
@@ -75,3 +69,12 @@ igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
 igt@kms_chamelium_hpd@common-hpd-after-hibernate
 igt@kms_chamelium_hpd@dp-hpd-after-hibernate
 igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
+# Suspend operations can cause system hangs or connection timeouts,
+# so isolating them at the tail ensures stability of main test
+# execution.
+igt@kms_chamelium_edid@dp-edid-change-during-suspend
+igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
+igt@kms_chamelium_hpd@vga-hpd-after-suspend
-- 
2.48.1

