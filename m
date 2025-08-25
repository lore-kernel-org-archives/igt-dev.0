Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF7DCA0EED
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 05:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948DC10E33A;
	Mon, 25 Aug 2025 05:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="et0OA3M9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A627F10E237
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 05:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756099794; x=1787635794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rWwFJ+tgX8mkRGPxEeJ73ZneoeAUlXYfsDGjeOqIxRA=;
 b=et0OA3M9v+7IW50/lMgmkU8lzGZcIO0eu+sewfttSjHzPMOE5KQtRSR3
 cb1rKk2gXjtnGYtdqKprdgFnhaAP6WaXnEiJ4Ch9V7l9buIORvLGIFLUd
 3PGTPrz7kKFeLR2UjgLTzdPX6Mtc4Bpx2ENOSZA8lK0a5PMf280T4xS2r
 iIAZbrH7s8STlUj4uo3JNw4T+/r2MMNWTcC/zNakHDoeU36yftO7rTB7g
 u3WmpjM0YGyRRYURFeilx5oRjuktfWoiUvazVz0ZBtSw65Ka7OL3cy4iQ
 XzX12cwHfC2IRoQrqDmGPUL3QEcXVeasWO/h53usqSa5yhEUzL6k0uozl w==;
X-CSE-ConnectionGUID: XfR3oq82Riu47yLzqruFEg==
X-CSE-MsgGUID: 3EmR0TrEQ/yswG9Vl+c77A==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75899092"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75899092"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 22:29:53 -0700
X-CSE-ConnectionGUID: 6EweMo8tQAWc6nA+71T2Sg==
X-CSE-MsgGUID: i60B5BUwRECIIvDAT/mTYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169578498"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 22:29:52 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] chamelium-only.testlist: Reorder audio tests to fix init issue
Date: Mon, 25 Aug 2025 10:59:41 +0530
Message-ID: <20250825052941.1135136-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix audio failures caused when HDMI audio test ran after DP audio.
Reordering ensures HDMI audio gets enough time to initialize before
running the tests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
index fa4e4e588..22e12108d 100644
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -1,8 +1,6 @@
 igt@kms_feature_discovery@chamelium
 igt@kms_chamelium_audio@dp-audio
 igt@kms_chamelium_audio@dp-audio-edid
-igt@kms_chamelium_audio@hdmi-audio
-igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_color@ctm-0-25
 igt@kms_chamelium_color@ctm-0-50
 igt@kms_chamelium_color@ctm-0-75
@@ -58,6 +56,8 @@ igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
 igt@kms_chamelium_hpd@hdmi-hpd-storm
 igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
 igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium_audio@hdmi-audio
+igt@kms_chamelium_audio@hdmi-audio-edid
 igt@kms_chamelium_hpd@vga-hpd
 igt@kms_chamelium_hpd@vga-hpd-after-suspend
 igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
-- 
2.43.0

