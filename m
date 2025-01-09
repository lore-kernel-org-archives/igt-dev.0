Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C79AE77188
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 03:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D2210ECB3;
	Thu,  9 Jan 2025 03:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYUUOZeC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A510ECB3
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 03:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736393033; x=1767929033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EhFWgeyAfTK/jZ7gs5Q/Zr4MrFSA3X67JFSEwwCFXlk=;
 b=cYUUOZeCm5cqu3gYuLCbUurxVYisMRU/ukxFkKpimFwB+pAR97adk19K
 LBF7U8rKZekI+azwTt9fVSdl2p8BwCQs61VMbRXSm7TPIMOd4GanrSejC
 kprqPlww5tLa167Pq5HB/LjQd8QGZAlG4A7eehbzkcfASrDjRNK7tDprg
 F0rn1PiGrtLyAu0yGKbtITig9pFhhEPvQ/372NCnlhYa0fb4eJJS2rVey
 ifgncyNAzLG7AKFuuUU/X+yCF60JGhTeTOzU+deExlH0F9lxSCAa6SV6X
 h+eyOjSFwYWJPoAhoyGlwAnnZraqn9DF3Ollb0VwFrJ9V+QlPtDty3VFi w==;
X-CSE-ConnectionGUID: BicoTS7GTFW3OfIHrlQ6Hw==
X-CSE-MsgGUID: XHTVSWWMRKiNIYVm0EzutA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47137160"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="47137160"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 19:23:51 -0800
X-CSE-ConnectionGUID: 6MAngLLGQqOc+Am1qrOY8Q==
X-CSE-MsgGUID: PIE862uLSym1OZG8FTPNZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134172346"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 19:23:44 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH i-g-t] drm-uapi/xe: Sync with OA uapi updates
Date: Wed,  8 Jan 2025 19:23:31 -0800
Message-ID: <20250109032331.2774067-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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

Align with kernel commit 5637797add2a ("drm/xe/oa/uapi: Expose an unblock
after N reports OA property").

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 56163eb913..08e263b3b2 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -134,7 +134,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the __user boundary with pointers encapsulated inside u64.
+ * the boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -1486,6 +1486,8 @@ struct drm_xe_oa_unit {
 	__u64 capabilities;
 #define DRM_XE_OA_CAPS_BASE		(1 << 0)
 #define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
+#define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
+#define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
 
 	/** @oa_timestamp_freq: OA timestamp freq */
 	__u64 oa_timestamp_freq;
@@ -1651,6 +1653,20 @@ enum drm_xe_oa_property_id {
 	 * to the VM bind case.
 	 */
 	DRM_XE_OA_PROPERTY_SYNCS,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE: Size of OA buffer to be
+	 * allocated by the driver in bytes. Supported sizes are powers of
+	 * 2 from 128 KiB to 128 MiB. When not specified, a 16 MiB OA
+	 * buffer is allocated by default.
+	 */
+	DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS: Number of reports to wait
+	 * for before unblocking poll or read
+	 */
+	DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS,
 };
 
 /**
-- 
2.47.1

