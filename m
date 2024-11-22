Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F8D75E59
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6243810EBBA;
	Fri, 22 Nov 2024 14:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvIBTrJZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7972B10EBB9
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 14:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732286109; x=1763822109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vrcCQzQYi5tJlD4Hg6vKUBYRLCPk/P/iAG8m/Mdh//A=;
 b=SvIBTrJZ9bUfg1gWDU80BDzU3z6d67OF0p9HO0piSLaKBoVhL1zMWRb5
 Y4M6VPWtb9axsNRt5OeZYewXC/GadBL1r4m5QgPpnJh58YA1Gp4unATRs
 KX+S//KBx67vZ1qOltklrpImv+kJ4JdU4zvsCfuY1/DT1gXoLLt95qwIG
 tgNFkBZKfgL2GeF0gcoeGILC5FmMVhmL2+ZC23o3KhDsr5RkNVmlflS5l
 FjSXHh6jDmZjCMOKGOxibDqg3GvY0yPSL9o5q8Bqusy7BOhR3AYGtfG/+
 GBemydj68kbfh+L9qZAsNqfVqjJUPNBHJPtjnzNGco9Hqrz9mSIBHX1cJ w==;
X-CSE-ConnectionGUID: JmtiWXWDQgWz112blhRrZQ==
X-CSE-MsgGUID: VIqktrOtRLKyVVA9JnWe+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="57845208"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="57845208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:35:09 -0800
X-CSE-ConnectionGUID: 3UUTfoq8Tye/mJLPn5K2MA==
X-CSE-MsgGUID: GN8W+JerTS+42Xp85P9pdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="91383993"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.141])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:35:07 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, christoph.manszewski@intel.com,
 jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t v3 3/4] eudebug: Add eudebug pagefault event declarations
Date: Fri, 22 Nov 2024 16:34:45 +0200
Message-ID: <20241122143446.659440-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
References: <20241122143446.659440-1-gwan-gyeong.mun@intel.com>
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

Update the xe_eudebug drm to include pagefault events.

v2: use igt_container_of() macro (Andrzej)

Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 include/drm-uapi-experimental/xe_drm_eudebug.h | 13 +++++++++++++
 lib/xe/xe_eudebug.c                            | 11 +++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index f50051e9a..ed2e728c2 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -154,6 +154,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
 #define DRM_XE_EUDEBUG_EVENT_METADATA		10
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		12
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -352,6 +353,18 @@ struct drm_xe_eudebug_event_vm_bind_op_metadata {
 	__u64 metadata_cookie;
 };
 
+struct drm_xe_eudebug_event_pagefault {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u64 pagefault_address;
+	__u8 bitmask[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index c5814421b..8f3bb2f1e 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -91,6 +91,8 @@ static const char *type_to_str(unsigned int type)
 		return "metadata";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
 		return "vm_bind_op_metadata";
+	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT:
+		return "pagefault";
 	}
 
 	return "UNKNOWN";
@@ -222,6 +224,15 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT: {
+		struct drm_xe_eudebug_event_pagefault *pf = igt_container_of(e, pf, base);
+
+		sprintf(buf, "client_handle=%llu, exec_queue_handle=%llu, "
+			"lrc_handle=%llu, bitmask_size=%d, pagefault_address=0x%llx",
+			pf->client_handle, pf->exec_queue_handle, pf->lrc_handle,
+			pf->bitmask_size, pf->pagefault_address);
+		break;
+	}
 	default:
 		strcpy(buf, "<...>");
 	}
-- 
2.46.1

