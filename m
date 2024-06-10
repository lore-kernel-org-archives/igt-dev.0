Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3E9C27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937AF10E4D0;
	Mon, 10 Jun 2024 16:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ql5D5hvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7B410E4CF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037778; x=1749573778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ap4UTm7Eu8LTGDQg2M01/yN29gzlEtd4VWUjDF0IgOA=;
 b=Ql5D5hvF18Iq6U2OweEjuh5dbTfCUku6udz0AfBdhg3lzAQbvFbVjKcS
 yXOGx9LPCg7dXgdmLttmMkK4Vzwiaz8ouzeRITrwkeMK9fbvpM6FU0zLc
 aA+BVpSq3oH0f9hy+xWFhaanGRaxGs5CsruBjeqeo/SdKxS+2h8207xpV
 SkYv6Dure6JS9vJrB9jVUkBAGAAt0F6SyhmF0gB0L+4fdplKgPx3ijh5e
 6NeLMovhcw+vGJEllahzSx86Q15epSrqssCfw4pD/zFCrmIXfA5YJSPfd
 MC/B2isyXXwCr9EHjgTb3u2QfUALK3DN1HcpYacXo+bkk61c8D6xzv7lD Q==;
X-CSE-ConnectionGUID: c7cY0+sGRcSkPbxJLZW4eA==
X-CSE-MsgGUID: m6r33aVNQEOZGxTrtVbvkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819723"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:57 -0700
X-CSE-ConnectionGUID: kYRdDyAnTBC56mq1Jy8HSQ==
X-CSE-MsgGUID: 1vGSkPgDS8GMsHEi8VHfmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681356"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:56 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 7/9] tests/kms_tv_load_detect: Test cleanup
Date: Mon, 10 Jun 2024 22:04:55 +0530
Message-ID: <20240610163457.3711476-8-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
References: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
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

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_tv_load_detect.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 8feed385f..9f6f4071e 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -99,6 +99,7 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeConnector(tv_connector);
+		drmModeFreeResources(res);
 		drm_close_driver(drm_fd);
 	}
 }
-- 
2.43.2

