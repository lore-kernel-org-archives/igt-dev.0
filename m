Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD426C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3DC10E64C;
	Wed, 31 Jul 2024 14:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btyTxdpg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED0810E64C
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437821; x=1753973821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V9XXZ0gR2PcKAQV3obolt0meXvce6EZhUsrEN2rieps=;
 b=btyTxdpgnAzmjpZxvkGBxi0Sauq4+LI/RZsOuEvi0iunRUKqYNZhIn6g
 dETTlQtKE/sM/X6OG7TBuKiUoHyx0pSzK2IAsRsxJ31h357cwLv2iZNQE
 AfUxqs8tJ+E6aYm5eLcoP3rriJXm/I5HMhkZfmyPsyTsTj8xk+wWfxXjb
 JgysQ7qDaAvOsuQD3jEZo5OvdToT5UooOuopv7UUA6nPe3bdzN7WjkKHb
 PYRJHuLJgtxtESeST+wwkWpT/rIePM68l0Bt6pXnDQB3bJ0PB6RiDM7uC
 xYSqeyrzbxpbmuI9izf70FR/jXE/txMRNxqQEh523N1tcqdJKTssvOPVN Q==;
X-CSE-ConnectionGUID: YUMB/pylQAmGR/pIlF5QxA==
X-CSE-MsgGUID: YiURkNETRKiMuhYCMNSPMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37839439"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37839439"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:57:01 -0700
X-CSE-ConnectionGUID: r3zV9xssSCKlexg+i+69ig==
X-CSE-MsgGUID: VwuOYKz4RIyHlUwupRZtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54635793"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:56:59 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_vrr: Fix typo in igt_describe
Date: Wed, 31 Jul 2024 20:37:41 +0530
Message-Id: <20240731150741.2952335-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731150741.2952335-1-jeevan.b@intel.com>
References: <20240731150741.2952335-1-jeevan.b@intel.com>
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

fix typo in igt describe.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9ddb56cbc..d5df99149 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1077,7 +1077,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
-		igt_describe("Test to validate the the content rate exactly match with the "
+		igt_describe("Test to validate the content rate exactly match with the "
 			     "requested rate without any frame drops.");
 		igt_subtest_with_dynamic("cmrr") {
 			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
-- 
2.25.1

