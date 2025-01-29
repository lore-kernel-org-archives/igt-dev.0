Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D757C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 17:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC21010E84D;
	Wed, 29 Jan 2025 17:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8DSkO0x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405A110E84D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 17:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738171590; x=1769707590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sgg1SkzrrJHalU9FLPoEOFNKdU+mTo8b+o3PMY1L2S8=;
 b=b8DSkO0xHysLFM0BDhfgfAxrn+mGHDthlZKoMs2BCD0ES5WCa/35qy5j
 rjfuDnDv3+8Ttleg600CZoWIsH1xoWooM3ewTFKlgEeEN4oZGJwZHEe2/
 xbtsif4j3IK+F1rDIk60yAm2Id+TS0p4e0GoW8mcnUicX69HYdYGrjq2M
 URYcHj06Whr4nuaJoReQIQZ72a3rAc+ZyEgAjlSQHrKpOs4609oDT6dze
 hi+SMVLxqTjPblqoiFuq7MmTYKQeiqVVVi+V3ATIUt/+RLlnPbp50wOGd
 QQ31jeI/DJ1uPRn3GKziJ4Qwa78hj4dJO2QixMV1Bl4c6vd7dVUnY4Je3 Q==;
X-CSE-ConnectionGUID: 6NwpuwG+SIiAFhD8ct6Ljg==
X-CSE-MsgGUID: x+xCLWBVRYmBkMMoGkvQaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38580383"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38580383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:26:30 -0800
X-CSE-ConnectionGUID: B0sClz9GTJKhmhfP5KrzQA==
X-CSE-MsgGUID: piG0g9CpR5a7JgRoa4GvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110008001"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 09:26:29 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: Restrict cursor tests to
 I915 driver
Date: Wed, 29 Jan 2025 23:11:52 +0530
Message-Id: <20250129174153.3654881-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250129174153.3654881-1-jeevan.b@intel.com>
References: <20250129174153.3654881-1-jeevan.b@intel.com>
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

change accounts for the limitations of gem_set_tiling, which
no longer works on recent platforms and will not be supported
on Xe drivers, so updated the tests to run only for i915 driver.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 990c50915..24f527c2a 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1189,6 +1189,8 @@ static void cursor_subtest(bool dpms)
 	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
 	uint32_t crtc_id;
 
+	igt_require_i915(drm_fd);
+	gem_require_mappable_ggtt(drm_fd);
 	disable_all_screens_and_wait(&ms_data);
 
 	igt_require(default_mode_params);
-- 
2.25.1

