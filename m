Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2456FD60CF8
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C457410E29D;
	Mon, 18 Nov 2024 23:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ol9jXozj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B2210E569
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972958; x=1763508958;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4Qy8SJVx/z7VFxY+3ybgTb8glU6XUs0SKy5CimmDh9I=;
 b=Ol9jXozjt5CKSbjkjL6Bfu3uri4mRWTQi0gQqDntZKJpaEB4ijqsefQM
 DnXzyBbs9AxN0abBwaopKchmkGsl6OsqOiR5k0KbBWwluCvlIzTHjhlRh
 wLrmKGHxRZylJZQAYGmruSwN6a2JmuUztBEb8MjJbpv+mcPg2IH+kZE2m
 jPb4PgCkEMl3BWSAzWiJUIPYKQX1jFsBqKukbQI8SJ3f5s4P/O5nX8pO2
 gEWirP+9L7QdOerNeR/cnPFgP5wrBoaJWcB17nzPTc2EUGX19FTlNyzsv
 MOaUQJ63GrrisE/hJbj2Q1EUPGa/KEXDJsfvLozALAR7TzbwsPQDeGZBg w==;
X-CSE-ConnectionGUID: eFrqwZIDQGqmndO4K/uCLQ==
X-CSE-MsgGUID: pf1H1VlPQJiKIQfy0iPI3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451235"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451235"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:53 -0800
X-CSE-ConnectionGUID: G+X1tUqHTWOlonlJjjwW9g==
X-CSE-MsgGUID: TlsolencRtO9GhUSmDVasQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245229"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 12/29] drm/xe: Add exec queue post init extension
 processing
Date: Mon, 18 Nov 2024 15:36:03 -0800
Message-Id: <20241118233620.2373819-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

Add exec queue post init extension processing which is needed for more
complex extensions in which data is returned to the user.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index aab9e561153d..f402988b4fc0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -33,6 +33,8 @@ enum xe_exec_queue_sched_prop {
 
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number);
+static int exec_queue_user_extensions_post_init(struct xe_device *xe, struct xe_exec_queue *q,
+						u64 extensions, int ext_number);
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
@@ -446,6 +448,10 @@ static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] =
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
 };
 
+static const xe_exec_queue_user_extension_fn exec_queue_user_extension_post_init_funcs[] = {
+	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = NULL,
+};
+
 #define MAX_USER_EXTENSIONS	16
 static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 extensions, int ext_number)
@@ -480,6 +486,42 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 	return 0;
 }
 
+static int exec_queue_user_extensions_post_init(struct xe_device *xe, struct xe_exec_queue *q,
+						u64 extensions, int ext_number)
+{
+	u64 __user *address = u64_to_user_ptr(extensions);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
+		return -E2BIG;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.name >=
+			 ARRAY_SIZE(exec_queue_user_extension_post_init_funcs)))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.name,
+				 ARRAY_SIZE(exec_queue_user_extension_post_init_funcs));
+	if (exec_queue_user_extension_post_init_funcs[idx]) {
+		err = exec_queue_user_extension_post_init_funcs[idx](xe, q, extensions);
+		if (XE_IOCTL_DBG(xe, err))
+			return err;
+	}
+
+	if (ext.next_extension)
+		return exec_queue_user_extensions_post_init(xe, q,
+							    ext.next_extension,
+							    ++ext_number);
+
+	return 0;
+}
+
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
@@ -647,6 +689,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 	q->xef = xe_file_get(xef);
 
+	if (args->extensions) {
+		err = exec_queue_user_extensions_post_init(xe, q, args->extensions, 0);
+		if (err)
+			goto kill_exec_queue;
+	}
+
 	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
 	if (err)
-- 
2.34.1

