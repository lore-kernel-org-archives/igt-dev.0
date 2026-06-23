Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F58CD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 12:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC61610EAF4;
	Tue, 23 Jun 2026 12:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+jeKyX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856F810EAF4
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782218293; x=1813754293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VhCu9t5SCce4xmoT20CYoZP99tqPei8hIvLUJ0n0HS8=;
 b=H+jeKyX/2AFm7yQoX3lj1NkKWOKItOy6eZtX8T80Id/459MlH/D4X8bv
 1crFFSk4JXrpHeoTwQvhbseAgNxupv0DHQxeyr2XdO9TjHdJF0DDx3V7F
 8UPNHV1jtRi/C0X0WFCKKpMrMqaTz6RZPsIbkapGy/cIONWFlgDWhsYux
 enyJav+dUXKmqrX1mrH27VDhE/4eSARsqC8wOPkefPdgJjOVkxETQYQSs
 LsFWOr3sDBbIvzoonP2zDkOclN5H9Y+/Pcft/ZusIHyP+jlc0FiENjmQj
 c17hv6CS7qXxygWbGvWtSg+svVaSb9bdrTWdBqdQ5iC22ra1LC3PYoO2d Q==;
X-CSE-ConnectionGUID: qrYKyGEoQASWpQ6O/vZilQ==
X-CSE-MsgGUID: 9w+zuPPWQ7eqMT7aj4wltA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82063895"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="82063895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:38:13 -0700
X-CSE-ConnectionGUID: 73sTCFWfS5CEI/OrOwmGxA==
X-CSE-MsgGUID: jiB7CNcFTeG8f/EbSliH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="245150340"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 05:38:11 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Include
 additional chamelium tests
Date: Tue, 23 Jun 2026 18:19:13 +0530
Message-Id: <20260623124913.3003450-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Include additional chamelium tests

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index d627ad414..070e878d3 100644
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
-- 
2.34.1

