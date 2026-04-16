Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B68CF8D76E
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0FD10E16B;
	Thu, 16 Apr 2026 19:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6SES/X4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3499E10E16B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776367126; x=1807903126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/DyEMdqSXB3IQOfpHdAv0nAgrRQ7p1qYY2gPM7EmEPE=;
 b=I6SES/X4U55uPdBol761XKOCJ4z5FEDwEzkshIfSnQ0SnpbVqSw/Ds1W
 Ma55mYimAwsgsYhM+UaA2/7c6cooOi2Z8V4w2Yue1KKMcmw47vvVnECSR
 o8tUDTzfCtlFBmV6oqEiu/+DlCpPmHrwKrci/htEVYUXQEU35byxYIoDN
 fSRv0wvnOcxsGq3gaGQMl/Lkg09O1RKENpx+qV8LTbw41TWKAAR9bnTHg
 69Csch9XAaPQu8wHWdXOWrq2YQobWeHmw6/rWNIabn/3iOusrmg7F7sXR
 /LZU7CVhf+rh4kQ1Tg+Tn3cbbnbJO3ojSHPp+KRfhR57X0weLw9lYtQS1 w==;
X-CSE-ConnectionGUID: UqsVuLQqRLGp+cZlsQfFCQ==
X-CSE-MsgGUID: /MBQYlyHRlyxVuX0m1tXWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81260622"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81260622"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:18:23 -0700
X-CSE-ConnectionGUID: mOLFnR4RSTG9x+qUdAtU7Q==
X-CSE-MsgGUID: 4qb+A6NcTOajy3jRMHge0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229818011"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:18:21 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH,
 v2 1/5] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX definition
Date: Fri, 17 Apr 2026 00:56:56 +0530
Message-Id: <20260416192700.1579042-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416192700.1579042-1-swati2.sharma@intel.com>
References: <20260416192700.1579042-1-swati2.sharma@intel.com>
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

Co-developed-by: Claude Opus 4.6
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

