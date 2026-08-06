Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4F9C55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 11:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF99110F19D;
	Thu,  6 Aug 2026 11:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtmnrGmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D165D10EA23
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786017296; x=1817553296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cj8IpYOIxlltkN8KtIPNmRBl0NluC8rxbmcn36gYnEA=;
 b=GtmnrGmbeGU+12YznBk1Gn7zQ+KetPfWfJ3fCfsegwfi2mzv9L4pNCSJ
 KkHmLPbmP0ppE71QYVP4zGn/g6SOTTtAY9Iua8fV3lHOEe9aR82o4XNu6
 HW2iYhB3AGUNydgfNvbf5cGg/Gi8M5JV3caDUXGVkH58JfdwsVnO7pVdy
 rd7YVb74qzixNrHjM/msmd7zc8S5F/J6bYprLoi5zmxZO+8kA6gHYIv4f
 NIXId0IL4vKSISPTo0B2+NSRTOZuX1jC9wQPN/Dx3mtao9ktKqBmKr9vL
 4fab9nestYn+SOFlfnAoAecQchtSRqoQXMz7uNzHGjTaMf3BYeFFyYq7U g==;
X-CSE-ConnectionGUID: UMfEenwUSnuuiFP9jqhGfA==
X-CSE-MsgGUID: 5bgTlTI6RyOpmgD4oF6SNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97204774"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="97204774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:54:56 -0700
X-CSE-ConnectionGUID: fso/Nox6QWiuoH+IM2dDCA==
X-CSE-MsgGUID: wdVXHyxRTj2JaIZOdZSREg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="261552840"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:54:55 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/6] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
 definition
Date: Thu,  6 Aug 2026 17:33:40 +0530
Message-Id: <20260806120345.19406-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806120345.19406-1-swati2.sharma@intel.com>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
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

Add DRM_COLOROP_FIXED_MATRIX to the colorop type enumeration. This
colorop type represents a pre-defined matrix operation selected via
the FIXED_MATRIX_TYPE enum property. The driver advertises the
supported operations through this property.

Aligns with kernel commit introducing the Fixed Matrix colorop
type for Intel display hardware.

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859..0924e38af 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -934,6 +934,17 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_FIXED_MATRIX:
+	 *
+	 * enum string "Fixed Matrix"
+	 *
+	 * A Colorop block that performs a pre-defined matrix operation selected
+	 * via the FIXED_MATRIX_TYPE enum property. The driver advertises the supported
+	 * operations through this property.
+	 */
+	DRM_COLOROP_FIXED_MATRIX,
 };
 
 /**
-- 
2.25.1

