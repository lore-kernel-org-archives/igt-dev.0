Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1644DD39420
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39A310F09F;
	Thu,  2 Apr 2026 13:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMa2r6KI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D0E10F09F
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775136018; x=1806672018;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BNI87r22JLrBNDBh6dZl9JC1jDj+9Ua4Fs64i4UGBqM=;
 b=LMa2r6KIs8e0J7IsjmUTgYCxRyUG//tDUxmYzDyR4nnXxUKeCvdgzmvM
 4W45Z5dqaIt/r8vWTQwzJAaEs1MRj31b1sP+4I0B+aVT/pkCL3pkVhtiA
 Zur2tnXgqXHzAHU+sbAxNQO+lPL/UZhu1SoY/62bBdpb4+WYjS6e/dmwV
 l7GwmpmQfK06+ak2zvA2kWh9+VdaamQadjt1ZFgyRkMRzwWqPu2cJ5Pf7
 xWTLi8AjKyEWRi6YthZCM5LJu+fYBhAgVtWQXP5so0nVFywLrtAVZp3MX
 wD5b6uaUW8kuJvf5uXNJSzj1R1HKmFgGDD4wwwmzjsfahf02IEPhicu+M Q==;
X-CSE-ConnectionGUID: EKykJI4LR7uUxiOsR+/4RA==
X-CSE-MsgGUID: twRAZvjFRE2+ur7mSGs4vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86894501"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="86894501"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:20:17 -0700
X-CSE-ConnectionGUID: Hw0PfHhTSjufmy8l1J0jcw==
X-CSE-MsgGUID: 8q3XXm49S4yNbn8Hn5Fffg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="231036875"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 mpatelcz-mobl.intel.com) ([10.245.245.90])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:20:16 -0700
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.rudnicki@intel.com,
	Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH i-g-t] drm-uapi-experimental/xe_drm_eudebug: Adjust definition
 in xe_drm_eudebug.h
Date: Thu,  2 Apr 2026 15:20:04 +0200
Message-ID: <20260402132004.1712065-1-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
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

Adjust the IOCTL numbers an exec_queue eudebug extension number to
match drm-tip.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 include/drm-uapi-experimental/xe_drm_eudebug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index 8e74ced2f..a1733f543 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -19,9 +19,9 @@ extern "C" {
  */
 
 /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
-#define DRM_XE_EUDEBUG_CONNECT		0x0f
-#define DRM_XE_DEBUG_METADATA_CREATE	0x10
-#define DRM_XE_DEBUG_METADATA_DESTROY	0x11
+#define DRM_XE_EUDEBUG_CONNECT		0x10
+#define DRM_XE_DEBUG_METADATA_CREATE	0x11
+#define DRM_XE_DEBUG_METADATA_DESTROY	0x12
 
 /* ... */
 
@@ -54,7 +54,7 @@ struct drm_xe_vm_bind_op_ext_attach_debug {
 
 /* ... */
 
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		6
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		7
 #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 
 /* ... */
-- 
2.43.0

