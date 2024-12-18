Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F07E7718B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4610E6BD;
	Wed, 18 Dec 2024 21:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ch4RbrLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B7710E460
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557820; x=1766093820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m5H3S4wAyC0Ay93dFtNmFcJIZDoSOPonnmqOrirXO2E=;
 b=ch4RbrLrjDsrsPGZ3a37RH+IyIO01VeHkUr+7M1WAcMMLC7xTsTuegCK
 x998wcOBqBr19XAjsZAD+w9eU1n0HJoirSMS/H/SbjvgmPlNNVXVCFGfo
 G7PzRQMMhKXJDU3AQTK+F061u6w6l5fLjA4SdCXuWTfVoZMCJkE35G1XK
 j0ktgOrmcnBDtWwB8YKdN3fYFCtOyl+MjHJUKihCUlGYXAJB4OLCv1LXg
 1ag89DNq2NPyRqVM1QN2QuXgasJ5Re/JBSJAlHjRYv0FNfDDi+ENDTY+L
 u4nsUV6jL31tmg7CdABjkSSq2clxAlWbQpATvLt+DOIjLvP1Dvy8+PShC w==;
X-CSE-ConnectionGUID: dj9SAX2hTB+JlchA+udOYQ==
X-CSE-MsgGUID: n4P/trSuTwm+UEHiEFz3Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379758"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: AMuT5FVwQtKZSeTrv6zaNg==
X-CSE-MsgGUID: 04QuwhccTSOtaNkW+GqS/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973918"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 3/7] tests/intel/xe_pat: extend for xe3
Date: Wed, 18 Dec 2024 13:36:50 -0800
Message-Id: <20241218213654.2734573-4-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
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

