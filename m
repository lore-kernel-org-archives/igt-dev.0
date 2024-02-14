Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1E0C4829A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7391210E5D3;
	Wed, 14 Feb 2024 06:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kz2j9ZXg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960C510E203
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893164; x=1739429164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1pObZ9KJfZqSBpDLuzj5pqqBE2B+eXrN5bDACYSk2gM=;
 b=Kz2j9ZXgZWrOYwZHH1ois/ZQyD+VKonoSF06jYPamYr9QiVHowmpeMkP
 42S8WUNujVEhGZwpF/kr54dVQoN/m22ylQ6FXP/tJYQnfyk2XEqnZJK+K
 hDFHLEzMmlLb+3fv6DQLsFrsERHIFnILZ3FBq8l38zixk0Fy0xu3dqkeO
 u47gRKEh3i+Xo+ifICqMZc3hI6SUNUsT1KMVqVeXFNnR9UH3VUULw6Y7e
 FcpGKAlZ9QJq10XJ+E2zEIGbUB4koTYh5a4J24opFy+HbNqYMXJW0axK7
 gw64k496Z4pOPej60ACrtq47VJyEye2eFcoVPsu3GiLAuKNQhkg2c1a6s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645495"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427662"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:03 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 16/22] drm-uapi: Add 3x3 CTM
Date: Wed, 14 Feb 2024 12:09:47 +0530
Message-ID: <20240214063953.1285495-17-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 include/drm-uapi/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 358c5c313..476c1a7be 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -876,6 +876,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X3,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.43.0

