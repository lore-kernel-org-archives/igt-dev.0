Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B31C83F0C
	for <igt-dev@archiver.kernel.org>; Sun,  6 Jul 2025 19:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FC710E3CD;
	Sun,  6 Jul 2025 19:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9o3J/Vg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88F10E2ED
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Jul 2025 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751831697; x=1783367697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZ2U/3sJ7Ss3zIWFuGxrHuLHrwiOKySvQaDyOLgrThk=;
 b=g9o3J/VgHbwoj2M4ZZ/tLR4zKm1GTBMXOD3lIrFg76ab0GKc1uyCBNXK
 fVrSmpGvamwLEXVGc2dYDxIIM3Ukf90IqSt49JhlzEK8XN47rTohX9juO
 0oxnxJJ5AkFHki+b2h+0sN5bSqep8k+HHIz89ZqOotgswzCCa1D/2Z085
 E5Rym3IIdvsGWOSKciFxI52bHfY80HH/UnX9oY4wf+urZ2scEXgMSeiN4
 AjamHRcYt7DvslxeX2Id4zSwKwgNMfCq3Rbr4bL8ieZYHnRanmFY0el+3
 SlBLcxu63J+LQRG89nF4waRC3ZVD89cS68TjSNov5sl9IoJ8GNsvtzYKU Q==;
X-CSE-ConnectionGUID: G06PjM6ZRUqkywHFM1SN6g==
X-CSE-MsgGUID: X0tGh+SUTiGz6ZwwBCQ3/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53983010"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="53983010"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:54:57 -0700
X-CSE-ConnectionGUID: 4YKki7plTK+v46rsn0iVrQ==
X-CSE-MsgGUID: MOjmgIfEQ5KngqnJ569XpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="159064773"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:54:56 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/9] drm-uapi: Add 1D LUT multi-segmented color op
Date: Mon,  7 Jul 2025 01:31:20 +0530
Message-Id: <20250706200125.35741-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250706200125.35741-1-swati2.sharma@intel.com>
References: <20250706200125.35741-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 26ee2a68e..de89ad687 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -910,6 +910,16 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_LUT,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT_MULTSEG:
+	 *
+	 * A 1D LUT with multiple segments to cover the full color range with non-uniformly
+	 * distributed &drm_color_lut entries, packed into a blob via the DATA property.
+	 * The driver's expected LUT size and segmented capabilities are advertised via the
+	 * HW_CAPS property.
+	 */
+	DRM_COLOROP_1D_LUT_MULTSEG,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.25.1

