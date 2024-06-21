Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6D6C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 04:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC45E10E2DA;
	Fri, 21 Jun 2024 04:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgxzvLhJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261B610E2DA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718944364; x=1750480364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZGfEm0n3VL0zqJQEHFdeUk/g2uJme5K37PsylqXO/RI=;
 b=OgxzvLhJJJKPbMrxI1HGy5z5gHE6h1wLOmCSZBVPHHLbeqs3C/3dl1dS
 NgRF4antR09gafDW+9d26SPzxMauIP63kGautEdGOG2SeY5NNvDrktHYD
 nNw9qoULKFEy5XgzTK/Pf9grG8eqp82cc4R90r0Poz5i9x1URm78+iA+k
 vwSTPgQgtV662PQQZfXY2mlfCf6Xvcck1XuLAQge14LSftiAgWPjPvb/y
 VfwLF6rxsim2QM+JlN+N36VBxdxtIwqEiXVoIzznK5F2UoWWiGZYy584s
 MnmHKPUKLu4TRjia8lrTdw4nphelqUIa6PF+w+qvWpSgwjg0U9la4cGe0 A==;
X-CSE-ConnectionGUID: /1hkA3axTwuRv+sGHf3arw==
X-CSE-MsgGUID: 5KmkpozNTu6veuy1WUFM7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15794349"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15794349"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 21:32:44 -0700
X-CSE-ConnectionGUID: TgAPHT+NTU+YhGSbhespIQ==
X-CSE-MsgGUID: wtPdaSzFSQC7qsvg6jQK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="79980633"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 20 Jun 2024 21:32:42 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_getfb: Skip getfb2-accept-ccs subtest on Xe2
 platforms
Date: Fri, 21 Jun 2024 10:02:48 +0530
Message-Id: <20240621043248.612664-1-pranay.samala@intel.com>
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

The getfb2-accept-ccs subtest tests on ccs modifiers.
With Xe2 platforms we no more have the ccs modifiers.

Adding a check to verify the platform. If it is
Xe2 platform then test will skip, otherwise it
will execute further.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_getfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index bb9679bc9..81829ca3b 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	igt_require(has_addfb2_iface(fd));
 	devid = intel_get_drm_devid(fd);
 
+	igt_require_f(intel_graphics_ver(devid) < 20,
+		      "No ccs modifiers on Xe2\n");
+
 	if (HAS_FLATCCS(devid)) {
 		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
 		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
-- 
2.34.1

