Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4B0C2BA1B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 21:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E90C10E334;
	Mon, 10 Mar 2025 21:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYNcDztg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BCE10E334
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741640625; x=1773176625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ffoxMqDh2AAbsZCDRhfL0q0ndyzTRCxrdqAHmmJ5S18=;
 b=KYNcDztgigGZRreO/6QZPvh72lGxW9zdpza5vEdbk2TxsQyY2EjSZeX6
 jP23NT6R5EzgFrmNpquRNVXOqk8rLmTk0NownBuAYO7FG/IOMSbQ6bkwB
 c35GTCKOyLcs7lNn6dA0lUaIgCkFNmJVKeGBFKjV5E2lbcKW+T0M778Yq
 a59fS8e/QcaWXiyDcz8EhhAfWjuEWSvSZTpLDUvl90KffJmrUtxHpDUrX
 lE4FTtR34exrmDrUxxJZdTwkndx8adjQqmIdrUH5cabX/gjwX8femcgQT
 5jxv6xiKFy5I80Y06hripGSSxqCXnUyg9KBS9DweJYfM21YFP94WjXhRu Q==;
X-CSE-ConnectionGUID: IHnEQf43TfCoxgasGJGbcg==
X-CSE-MsgGUID: P60CZVsVSaOWY7tvPIms+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60061547"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="60061547"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:45 -0700
X-CSE-ConnectionGUID: 15cuAOmwRBOTXBszC/eKGg==
X-CSE-MsgGUID: XbwDc916RXOlsVRSYZm8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="120630405"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:45 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com
Subject: [PATCH 2/4] lib/xe/xe_ioctl: Add xe_vm_get_faults helper function
Date: Mon, 10 Mar 2025 21:03:41 +0000
Message-ID: <20250310210343.204246-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310210343.204246-1-jonathan.cavitt@intel.com>
References: <20250310210343.204246-1-jonathan.cavitt@intel.com>
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

Add a helper function, xe_vm_get_faults, that calls the
drm_xe_vm_get_faults ioctl.  Since the ioctl behaves similarly to an
xe_query in that it needs to be called once to get the size of the
return data and again to save the data, the helper function takes the
ioctl structure as a parameter.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_ioctl.c | 5 +++++
 lib/xe/xe_ioctl.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 6d83889188..6b75a02c90 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -232,6 +232,11 @@ void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
 	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, DRM_XE_VM_BIND_OP_UNMAP);
 }
 
+void xe_vm_get_faults(int fd, uint32_t vm, struct drm_xe_vm_get_faults *query)
+{
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_GET_FAULTS, query), 0);
+}
+
 void xe_vm_destroy(int fd, uint32_t vm)
 {
 	struct drm_xe_vm_destroy destroy = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 18cc2b72b2..42988230df 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -65,6 +65,7 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
+void xe_vm_get_faults(int fd, uint32_t vm, struct drm_xe_vm_get_faults *query);
 void xe_vm_destroy(int fd, uint32_t vm);
 uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 			uint32_t flags, uint32_t *handle);
-- 
2.43.0

