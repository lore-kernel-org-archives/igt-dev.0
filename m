Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8752F1093168
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 21:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7BE10E899;
	Wed, 25 Mar 2026 21:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQpknoPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A17910E02B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 21:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774473732; x=1806009732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NUapsWMAGix7oae9yREXXLGd8+neYy578f0BAiTys3I=;
 b=KQpknoPBTm0r05cFILsoTAFjRSSVYr8W9BzNgRuilt6149MpVRlzJfee
 8/KPWotlTfu8hwEsPXpnqoEVfLD7d8hGPOjjIKWuaaRhTgbKXSq2U93lq
 h6uaHrjMUi2vXcuTa0+G/NGK+fE0quyKadAxaGvJQi9GH4D3c6Ns7H9Qb
 jilRjiVF+AginASS9ldzRlzB8ohxoxxxck++Qw6n9X/9+8llBjDvtqWYN
 k9EMgE6Ckb06jw4t0tY7x4jtjMWU6IInL31co4BfrKL5Ny/c6URLo9ajg
 aJs8fpK1rWJPAudAA/sHdE0mPs+jaQDxvHy4XlsMO2ICzxDyHHgb8oZEx Q==;
X-CSE-ConnectionGUID: t5y19gnzSDKUcnIk+lliPA==
X-CSE-MsgGUID: 1sRS28+/SOarffmg/530+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74551985"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="74551985"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:22:10 -0700
X-CSE-ConnectionGUID: RNZIl4sxQp6H+MkvG2EwBQ==
X-CSE-MsgGUID: UBoYVhzlRxOXmKqp5IBzPA==
X-ExtLoop1: 1
Received: from dut4086lnl.fm.intel.com ([10.105.10.101])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:22:10 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v7 2/4] lib/xe/xe_ioctl: Add xe_vm_get_property helper function
Date: Wed, 25 Mar 2026 21:22:11 +0000
Message-ID: <20260325212208.85743-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325212208.85743-6-jonathan.cavitt@intel.com>
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
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

Add a helper function, xe_vm_get_property, that calls the
drm_xe_vm_get_property ioctl.  Since the ioctl behaves similarly to an
xe_query in that it needs to be called once to get the size of the
return data and again to save the data, the helper function takes the
ioctl structure as a parameter.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_ioctl.c | 5 +++++
 lib/xe/xe_ioctl.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index ea3f2fcaab..7a8444095f 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -332,6 +332,11 @@ void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
 	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, DRM_XE_VM_BIND_OP_UNMAP);
 }
 
+void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *query)
+{
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_PROPERTY, query), 0);
+}
+
 void xe_vm_destroy(int fd, uint32_t vm)
 {
 	struct drm_xe_vm_destroy destroy = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index b62d259fda..4ac526a8ec 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -65,6 +65,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
+void xe_vm_get_property(int fd, uint32_t vm, struct drm_xe_vm_get_property *query);
 void xe_vm_destroy(int fd, uint32_t vm);
 uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 			uint32_t flags, void *ext, uint32_t *handle);
-- 
2.43.0

