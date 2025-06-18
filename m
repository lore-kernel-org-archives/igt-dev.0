Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1846C71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97D610E81E;
	Wed, 18 Jun 2025 12:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cszRpp65";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB32B10E81B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750250604; x=1781786604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0uZsFpNpJez4GFc7swrRJboduQd4zUTmKmC1xYx77ps=;
 b=cszRpp65GgnURMmYgFeC6gHao/rbkf/yAPbLOKwUyZw0Y0cBaDXm9yqA
 9pF7nsoNwfinMR7wHryrtjRT3n2+EqgE409zZtqfg6fzysP5m8qgNqKDr
 fegaiARqHhmIqOUMq8K2QVMO2NiVEh2rEvaofoQwmYnxR1y73zk1RnMpG
 NEWYRqTWEt6Gn4DdSTlev8a8mJ+rDQTiu0OZFramGUK2qyNWDj1rIWNua
 cbWFyEbSneKXPKp9TEn4nBHtCgYwKF5ciCYoRA1maCfAgd41jcyRPv1Iz
 D5ZkPN2AxFHQsRBwlUPQC1Pjb5SVMuKWO89JtPLjMd0p9oNBSpnTK2HoA g==;
X-CSE-ConnectionGUID: d2v2OQTISBW6yJdcOfpujA==
X-CSE-MsgGUID: qZvOPt0OTH229BPS5Ld4LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51690528"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51690528"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:23 -0700
X-CSE-ConnectionGUID: qlVJruXQR5eqfHv/rptc7g==
X-CSE-MsgGUID: kQIldNh4QUyn9S6mmAw7/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150265991"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:21 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, chaitanya.kumar.borah@intel.com, uma.shankar@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/9] drm-uapi: Add 3x3 CTM
Date: Wed, 18 Jun 2025 18:18:43 +0530
Message-Id: <20250618124849.1587767-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618124849.1587767-1-swati2.sharma@intel.com>
References: <20250618124849.1587767-1-swati2.sharma@intel.com>
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 4c8d404b1..754a3b029 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -918,6 +918,14 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_CTM_3X4,
 
+	/**
+	 * @DRM_COLOROP_CTM_3X3:
+	 *
+	 * A 3x3 matrix. Its values are specified via the
+	 * &drm_color_ctm struct provided via the DATA property.
+	 */
+	DRM_COLOROP_CTM_3X3,
+
 	/**
 	 * @DRM_COLOROP_MULTIPLIER:
 	 *
-- 
2.25.1

