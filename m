Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92395E9B357
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 10:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCF910E35E;
	Mon,  2 Mar 2026 10:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kidBDcCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC5310E47D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 10:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772446928; x=1803982928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N27NIW96k3LZLNx3tbcO51Ad/ekPe+gAT4xrCMuXofA=;
 b=kidBDcCPAx2Dcseg7m+bj6costLV/txHopZzUTsJolymySuQxYotB5SB
 4WAh9TRgKDF2He4XejL5+yxuZ7mEVmZZE0j+Flj8saasS5UdAptueRKkr
 EUwMKltYHbn37tj7Is6nqQ1aMv9OqEsEiYzIdJtW+Vq3GH8d5Ma7oDc9b
 a5AZJ1p/hrJVTD/fQVjAhgYaD2aMrvQ19B+zqrtnoMzOZtJw4vR75/zBf
 fRX5v0yzF23uNz9CNeK6C76ZVTxKepKRnpP7oIq3E+9jS8UWxuf3shJBU
 IjOfF+EIn49l93lqzyx0n9SPTk2IDeb83SQ9RL96bWuk+zZOPB4IVfGxL g==;
X-CSE-ConnectionGUID: 6JnbjcmLTx2b9Ns8XKeqoA==
X-CSE-MsgGUID: zywesJhIRUGomvaASAnNYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84917536"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84917536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:22:08 -0800
X-CSE-ConnectionGUID: CphyyR4WR86/sAPwzqGcQA==
X-CSE-MsgGUID: PHgREe3lRuCjFf4TW/oaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214844333"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:22:05 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v4 5/5] intel-ci: Apply xe chamelium delta changes
Date: Mon,  2 Mar 2026 15:49:26 +0530
Message-ID: <20260302101926.3015380-6-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302101926.3015380-1-mohammed.bilal@intel.com>
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
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

Apply xe-specific delta updates to the FULL chamelium testlist by
removing VGA-related subtests and keeping the remaining entries
aligned with the i915-based baseline.

v2:
- Move suspend resume tests to the end of the testlist (Kunal)
- Comment out random-plane test (Kunal)

v3:
-Use move-fix-add approach (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)

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

