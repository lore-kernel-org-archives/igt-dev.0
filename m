Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92CAFEA80C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 06:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1C810E77B;
	Wed, 25 Mar 2026 06:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJbfuGSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44CF10E1EB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 06:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774418473; x=1805954473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iGh7i96d9szPnIel7oVJDtUHzCTKWtkkwmTxWk4B2Bo=;
 b=RJbfuGSMhqRi7yzxRnApzigEi37i2ptjooNddplHoDHQennflGRcrotj
 2UNFJhp4jlHyz6TVDVfUCDUNrZxsfyXJWf4jQ/XgiKqiudDNTKeJ3tfaG
 dkvSsgfSxCvUBpYqdH3O5tMq7wRf3TzvCWc2uji4aFyO8guM6mnfGL+Lt
 lC7g+nlEKTOP+Yo9RSXfBrPYoErIC+BmqV05bExWgklGcUcTQk0ldmls/
 aMxFUaI37feLlkDgxJ7uxkUVBzbchKoKre/4fisU/DX45LTUTDxVHnn61
 BP+k03uTrnjIysCTftm+0RhVPl7TiGeo+pgkr++lIqI/NFaPb5mDclqNV w==;
X-CSE-ConnectionGUID: MypLYv3kQyexhGfLGQ7tQw==
X-CSE-MsgGUID: LlPqMYYzQqaPOMnRoD7hJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86525357"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86525357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:01:13 -0700
X-CSE-ConnectionGUID: JWP5t9KKRqW8SVR/6aA7jA==
X-CSE-MsgGUID: 1fQ4cKczSgeXMy9GiIokqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221686768"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 23:01:12 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v7 i-g-t 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync
Date: Wed, 25 Mar 2026 06:00:46 +0000
Message-ID: <20260325060051.2498340-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325060051.2498340-1-sobin.thomas@intel.com>
References: <20260325060051.2498340-1-sobin.thomas@intel.com>
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

Introduce a new failable variant that returns error codes instead of
asserting, allowing callers to handle errors explicitly.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/xe/xe_ioctl.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 16aae05c9..30c8a15f6 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -795,6 +795,42 @@ void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 	free((void *)sync_addr);
 }
 
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags)
+{
+	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
+	struct drm_xe_sync sync = {0};
+	int ret = 0;
+	int64_t timeout = NSEC_PER_SEC * 10;
+
+	if (!sync_addr)
+		return -ENOMEM;
+
+	*sync_addr = 0;
+
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = BIND_SYNC_VAL;
+
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, size, DRM_XE_VM_BIND_OP_MAP, flags,
+			   &sync, 1, 0,  DEFAULT_PAT_INDEX, 0);
+
+	if (ret)
+		goto out;
+
+	if (*sync_addr != BIND_SYNC_VAL) {
+		ret = __xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL,
+				       0, &timeout);
+	if (ret)
+		goto out;
+	}
+
+out:
+	free((void *)sync_addr);
+	return ret;
+}
+
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size)
 {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 3ea651063..eba10bd34 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -116,6 +116,8 @@ struct drm_xe_mem_range_attr
 void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
 			uint64_t offset, uint64_t addr,
 			uint64_t size, uint32_t flags);
+int xe_vm_bind_lr_failable(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo, uint64_t offset,
+			   uint64_t addr, uint64_t size, uint32_t flags);
 void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 			  uint64_t addr, uint64_t size);
 #endif /* XE_IOCTL_H */
-- 
2.43.0

