Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAC2CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 06:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA22F10E2AC;
	Mon,  1 Sep 2025 06:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAIDNUFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E71F10E2AC
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 06:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756708592; x=1788244592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eM9eORp2BOaA2LtNSDy7mln/M3tpQ/jPXzW9SuB0cq0=;
 b=VAIDNUFseTVCywhGV57ss1u7zNoYmIzZ2QcGX3BL2C6V387G+hSBivSU
 MlPm4wTfcqJ51r3NHikNNIqESWC/utw578MQEIeQbUuajDGuER0t822Cf
 CBTgYDOH76kxvED7elWkTo2moGjN2TlSCkkAXNpRgoVsDfKb0ZR5ao3Gu
 jtE9LROVLAw7IboE8NeAJjkiLKlsYFoHnUe+wVp/vCQAuy2DHhCATKjhW
 sc2KN/EbZifGT863agEIS3U8W16VKjzWXKSkWtdszJ3GTZ8UsrPRIhhjs
 xAy6wi9YsVuQROnymHJFaO02bR1IFmFIy0+D0baLsSKAfhlKry5E+xqjE Q==;
X-CSE-ConnectionGUID: kCKmgu/wRj63xvN826KEsQ==
X-CSE-MsgGUID: t/RSStQmQUqf6zaF4jE3iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="76351036"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="76351036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2025 23:36:28 -0700
X-CSE-ConnectionGUID: 1azj0mYoQZ+/TNH/P//45w==
X-CSE-MsgGUID: X+GK18D9SXSZheTXRzGakA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170139388"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 23:36:25 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: reduce exec. time for sim env
Date: Mon,  1 Sep 2025 12:06:16 +0530
Message-ID: <20250901063616.1231617-1-jeevan.b@intel.com>
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

For simulation environment, we can reduce execution time
by running test only with one combination.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index c93195b3c..97e12eb30 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -221,6 +221,8 @@ static void run_extendedmode_test(data_t *data) {
 			if (igt_run_in_simulation())
 				break;
 		}
+		if (igt_run_in_simulation())
+			break;
 	}
 }
 
-- 
2.43.0

