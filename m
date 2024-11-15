Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77440D637CE
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 14:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368AC10E864;
	Fri, 15 Nov 2024 14:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvkzOtdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5186B10E864
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731679950; x=1763215950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=du30ofJ27DFknprXX5yUylkJ3JhFKHtCrCRx+MYr8NM=;
 b=RvkzOtdAl1nUSTbqIRr8WleBeiDXoBGdvQCH+D0MsitPLef3GhyxmrWw
 ys9uy9p8xq2skWCcPSHxXluA/TY0hus49HDfNDM5AQMPtlXwCDj/HGlhc
 lQf/TiHTNto8dQn8wjbSBExugxByXVbaMcrQJxDVduqZN9O/SbKAIqHhM
 8WncIO8YY4fFSk/Rc8pJkv0LIhVtBp5JaOxLES0syUHtrSICmHMBIJT2J
 QW1flYkUGqoTLRugl2cUV5xy2iSrfjChlPcfw3HblQSBv+l3V7t0llG21
 hUgTC3dDCXecmDVWqnYmXeUT/tngv7HQgIB36ZkjC3N8wza/GV75ue5Eo g==;
X-CSE-ConnectionGUID: 1YkejHTNQxWvon3xIApRxA==
X-CSE-MsgGUID: HSAYIew6Tb6yoWA3PyUQMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31822547"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31822547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:30 -0800
X-CSE-ConnectionGUID: 7rKNihoiTOKW3xfnodVYSg==
X-CSE-MsgGUID: ys+Oq42+QQCmlX/8qnHotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88979972"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:27 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t 3/4] eudebug: Add eudebug pagefault event declarations
Date: Fri, 15 Nov 2024 16:11:31 +0200
Message-ID: <20241115141132.866838-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
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

Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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
index c5814421b..de01e6b49 100644
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
+		struct drm_xe_eudebug_event_pagefault *pf = (void *)e;
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

