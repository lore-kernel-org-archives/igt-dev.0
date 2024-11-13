Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0880D637D2
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829BD10E773;
	Wed, 13 Nov 2024 23:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyE/ylwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799C710E29C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538986; x=1763074986;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kmfT6KXernlNKKm0nGIgUGRaCX40Vrb/k0571wlAeuM=;
 b=DyE/ylwpjGjKq8vPKUrPCjwcQUFw3O2eTfQ6FPAP6UmC26UhoR+4YdMZ
 d4Bc9at0w6owFVk0DmS1d3MPwknRP9OHieSqRjLdBi2AIy978n2dWZ0GK
 RXcnkHpTwBFn6tF/uBx5wAZrqMMaBFV6fwTVYoayxnkxE5r/C1SFgbf56
 HIaEDM8I2f86ZsBMUrWFCPROuW8J9u0z4TgNVYYNikRQPC5CqoPRPxUJY
 TmqjDprh/xcOEOZd9x6O8AKsUi4ICdoz+0wTiUeMXdW3M+mNtEg3M5zkF
 bnfAPyk/hif88NLQ04TpP+RF3M9upACCkYTzeWfuucN9ng5DDc26Gef0y Q==;
X-CSE-ConnectionGUID: H3eyOl/+SQyt4nmsdq08FA==
X-CSE-MsgGUID: 9UThYY42QaCIVHdkCDsCCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999375"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999375"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
X-CSE-ConnectionGUID: SS7Rpw6NRTCdV7EPUbfXgw==
X-CSE-MsgGUID: Daqsg4AnTmSht/cnzlLhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074715"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/9] XE3: tests/intel/xe_pat: extend for xe3
Date: Wed, 13 Nov 2024 15:02:56 -0800
Message-Id: <20241113230301.655499-6-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113230301.655499-1-clinton.a.taylor@intel.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

Same pat_index modes should apply as for xe2. Matches the kernel.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/xe_pat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index b0b3ad8a7..1322df349 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -110,7 +110,7 @@ static void pat_index_all(int fd)
 
 	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
 	     pat_index++) {
-		if (intel_get_device_info(dev_id)->graphics_ver == 20 &&
+		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
 		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
@@ -854,7 +854,7 @@ static uint8_t get_pat_idx_wt(int fd, bool *compressed)
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
 	if (compressed)
-		*compressed = intel_get_device_info(dev_id)->graphics_ver == 20;
+		*compressed = intel_get_device_info(dev_id)->graphics_ver >= 20;
 
 	return intel_get_pat_idx_wt(fd);
 }
-- 
2.25.1

