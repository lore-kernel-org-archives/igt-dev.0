Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C697D1067045
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E04A10EA53;
	Thu, 12 Mar 2026 15:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZCiNWzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB36310E02C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329134; x=1804865134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8W5Oh51oUukCbCCbb6Y/h4h2Nl5v4JepjX6awEk76J8=;
 b=AZCiNWzTfHIGPhXZam8/qyq/1ahNWwNvVsvC8y6vebwsl7muSAIder5C
 DH5Cij4Dyg6wV+Prgy4KFBiwUSJ6qpDDKyKgVQSDr9oeK+UCkjm0gqj0i
 CF6WVKNXWkRgoJ7VdsEvP+ufE904PXFupS1fLnIw8LqH96qlMyz9FHKKk
 jnKo0CDQ5J7J2BdFB7bsSs7W0Dtj0IW74i3ZPlHKtQUXkJABAUme6SSS7
 PvoSLE8FL/XgpmOvguwms2X0oPOnEMy1PIhKvuOSAf0idTTi4WnSbYGq4
 snOvYjzJZ8RSdb+sdAhS389vYEn3ABxBkpWlHzSfw3ArIQj98tovVLaXn g==;
X-CSE-ConnectionGUID: eB237Yg8RIC5f2ch6KPtag==
X-CSE-MsgGUID: s0BxS1WeT/+Ihyykrr1X0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85902416"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85902416"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:34 -0700
X-CSE-ConnectionGUID: wDmaQ4JwQN67mBSg77b5OA==
X-CSE-MsgGUID: VPRj5NFTROSvTpfel4iQjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225297250"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:25:32 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 1/5] intel-ci: Move suspend/resume chamelium tests to end
Date: Thu, 12 Mar 2026 20:52:29 +0530
Message-ID: <20260312152233.3280893-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312152233.3280893-1-mohammed.bilal@intel.com>
References: <20260312152233.3280893-1-mohammed.bilal@intel.com>
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

Suspend operations can cause system hangs or connection timeouts,
so isolating them at the tail ensures stability of main test
execution.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 9adace28c..b66788bac 100644
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
@@ -75,3 +69,10 @@ igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
 igt@kms_chamelium_hpd@common-hpd-after-hibernate
 igt@kms_chamelium_hpd@dp-hpd-after-hibernate
 igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
+#Place suspend tests at end
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
+igt@kms_chamelium_hpd@vga-hpd-after-suspend
+igt@kms_chamelium_edid@dp-edid-change-during-suspend
+igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
-- 
2.48.1

