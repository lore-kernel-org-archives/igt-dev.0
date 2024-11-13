Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9922D41C17
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 08:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E5710E69F;
	Wed, 13 Nov 2024 08:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI3gWP/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B575C10E69E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731487938; x=1763023938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B2F59eobKMG/X5I3dcEhPXbYEXSY4ifFfpyDZ0Nio9w=;
 b=EI3gWP/PNHQgN9c87RzHiTeQH3D2SX8vY1nA5hB+6VFNQab9MXXdYKkR
 kfuUMO4Z/wGZcBIwDOIBNSW0BIbWCO9vtIUKyfkvl4D3H5nesYY0GYRau
 TdJ3fuvxqS5S1Ys7NOIDCaDOGYu21Ytw/uaAWMN2ooamKEoRRgXo/xkui
 3AqRmnnzl0k/ufHWMCTFyAzKTnRP9IkTWMQFNOgWXRj/a1pYFV/ub1Kvu
 Go8vzaF4YDIZOq29z+VyoPQxdU+DKgM3Jsvy5XTobveP+FWVFiKUNtI4O
 AUUpBr+pjpJi34eIrjrQl4W4cnrefcRKewYKt74nAcTgio6hamiOF9e8U w==;
X-CSE-ConnectionGUID: YBickbqeQEuwJZrxLn6mkQ==
X-CSE-MsgGUID: sihq9yNdR2Kdemdpxnp77Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31335363"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31335363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 00:52:17 -0800
X-CSE-ConnectionGUID: gMwoa6GSQjCeU4TcqBtkkA==
X-CSE-MsgGUID: yuopHvu1TsecnZPNM4Tqrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="92579657"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.180])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 00:52:15 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/3] drm-uapi-experimental/xe_drm_eudebug: Sync after
 exec_queue placement event addition.
Date: Wed, 13 Nov 2024 09:51:53 +0100
Message-Id: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Exec queue placement event has been added in logical order, due to that
there is a shift in event numbering. Sync uapi to match kernel changes.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 .../drm-uapi-experimental/xe_drm_eudebug.h    | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index 13c069e00..f50051e9a 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -147,12 +147,13 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_OPEN		2
 #define DRM_XE_EUDEBUG_EVENT_VM			3
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
-#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
-#define DRM_XE_EUDEBUG_EVENT_METADATA		9
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS 5
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	6
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		7
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		8
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
+#define DRM_XE_EUDEBUG_EVENT_METADATA		10
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -188,6 +189,22 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[];
 };
 
+struct drm_xe_eudebug_event_exec_queue_placements {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 num_placements;
+	__u32 pad;
+	/**
+	 * @instances: user pointer to num_placements sized array of struct
+	 * drm_xe_engine_class_instance
+	 */
+	__u64 instances[];
+};
+
 struct drm_xe_eudebug_event_eu_attention {
 	struct drm_xe_eudebug_event base;
 
@@ -303,6 +320,7 @@ struct drm_xe_eudebug_vm_open {
 	/** @flags: flags */
 	__u64 flags;
 
+#define DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS (10ULL * NSEC_PER_SEC)
 	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
 	__u64 timeout_ns;
 };
-- 
2.34.1

