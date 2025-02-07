Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206AAC02196
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 11:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DD510EAEE;
	Fri,  7 Feb 2025 11:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgAoWWub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CC610EAFA
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738928972; x=1770464972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p64MfXMOnhGNl3XPBn1GNwpr2GoAKXwyFONF6UA8ofk=;
 b=dgAoWWubiobDcweWkUY34kkXreYLa1Vpaondd9EM/9i0k/rowvkn2Gjn
 W416Y0/v6CmViWAuCQ6QzeFMKQ0CqSQvOsps2nv4JjwXfiN8ggY94ka4p
 0/S9n4me9fKodRR3EvGG/TxxVPMHw1K0bYbYu3ofYIBg1zqJryuieqZeI
 zgKARmE/ne3ZvK2RsNe4XnFSi0xo5FFSoJObNS8ruOEOWwBRvvrte5ava
 UoWthHBzbydEx1rVEbnBKi+3pfLVBekihNCvVWoPIPzly2gO0MsFGjnDB
 sPsXiN+5y5aF9SrU7/5emVGY78FSiqh7zVxFSf5ScU5eTPYooQQi6rlpv A==;
X-CSE-ConnectionGUID: AWCbf99pRKu5W4Xft2IBGQ==
X-CSE-MsgGUID: xakmvHpMSMSmnlv7rNDAZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39683420"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39683420"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:32 -0800
X-CSE-ConnectionGUID: LNCFeNrGT9i6Uxx5hQPORw==
X-CSE-MsgGUID: B+c+wpdOS8G7cDQvmK2R2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116506767"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:30 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 4/4] lib/eudebug: Adjust to upstream uapi rebase
Date: Fri,  7 Feb 2025 13:49:35 +0200
Message-ID: <20250207114935.1996323-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
References: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
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

As eudebug-dev is not merged, it consumes the upstream changes
as a base. Exec queues got new property of PXP which causes
PROPERTY_EUDEBUG to jump from 2 to 3.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/drm-uapi-experimental/xe_drm_eudebug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index 714bb93c7..f66de2ff5 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -54,7 +54,7 @@ struct drm_xe_vm_bind_op_ext_attach_debug {
 
 /* ... */
 
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		3
 #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 
 /* ... */
-- 
2.43.0

