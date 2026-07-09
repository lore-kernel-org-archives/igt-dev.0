Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBD5C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 05:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4310E02B;
	Thu,  9 Jul 2026 05:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jpb2I/7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78A010E02B
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 05:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783575640; x=1815111640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SDsB9/eLTA9P6LVxZ2lUF0ledrr4h9zyQ4ipBGF6PBs=;
 b=Jpb2I/7uwVh0LCrm+YyEA3iHdY3/qtwroXA0j7RISvoYe/edDtmTuW44
 hg8Lr5h2Ve1G8kho/hr/odL4pKBsNj35yTg+tj8BNA1OQ3dKifpVKBKp7
 iOvCuhHcRHpNlLiSP5p2mehRoXbp3vYS5keihx1EL56gfE+DaZOXoV2A+
 H1Tgm9dQTSdDJxNxJ3PdZAuDWM+wrw9HoY8YkPs8LyV6IQuEgxctx5/0o
 Vxoc2IZF2rYkQx8BjKQheBrzxRzBWmS+wIRLwkO+KXHD/P+6MXToXBcJZ
 NAdFiFNwrJ5IDqT6Q4+fZuZf8dfnzIMkSKpFMiqLJaiMVjT3uVqdFceJ5 Q==;
X-CSE-ConnectionGUID: QSumkzPWTzKxWOJ6kXE0ag==
X-CSE-MsgGUID: l+aKvyE1SaeExGJsY/QqKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88162267"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88162267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 22:40:39 -0700
X-CSE-ConnectionGUID: O/Bnf4yyRlCyt0gmTujUzQ==
X-CSE-MsgGUID: 8HrkZfnLTnCsVDXJVbX2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="284576067"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 22:40:37 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/2] tests/intel-ci/chamelium-only.testlist: Add
 chamelium tests
Date: Thu,  9 Jul 2026 11:23:48 +0530
Message-ID: <20260709055349.66437-1-pranay.samala@intel.com>
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

v2:
- Update commit message (Kathik)

v3:
- Update the subject (Kamil)
- Split the pacthes (Kamil)
- Move suspend tests at the end (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index d627ad414..898c53134 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -14,6 +14,15 @@ igt@kms_chamelium_color@ctm-negative
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
@@ -71,6 +80,8 @@ igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
 # Suspend operations can cause system hangs or connection timeouts,
 # so isolating them at the tail ensures stability of main test
 # execution.
+igt@kms_chamelium_audio@dp-audio-after-suspend
+igt@kms_chamelium_audio@hdmi-audio-after-suspend
 igt@kms_chamelium_edid@dp-edid-change-during-suspend
 igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 igt@kms_chamelium_hpd@common-hpd-after-suspend
-- 
2.53.0

