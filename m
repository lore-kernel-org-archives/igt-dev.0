Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B369D11700
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 18:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F76210E45F;
	Mon,  1 Dec 2025 18:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIg4ue2x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBC510E2BF
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764614995; x=1796150995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P9D0dYUPYqKYzG7wrmFrwib6Ilv655KFK5c0nwVjq98=;
 b=UIg4ue2xNisL/6eiaQicP+XCs1MN4xbUcmiZ46v3P/UU+zIilb6ef/Ea
 AGNpju9hznsg1JDjYmyNJU07Xlbs2xrHFndtm4mAvnX7HX38x0ZGHO6v/
 MpKifwAyIFTLxFd0V22s4ocpqhyJTxH2R7KX/ZkxQVzL++3zWu3WZhnEd
 OteEiUKQ1FaGCuKMz9516dsrJHI30B3oQIHteOAI7ldOCHNZn3oEC5wYY
 s/B5vkF9izDgVv0YfejpcQed9UpBYNjsCPnH+508WMnZVltOK72gX9/Km
 92/fhkdUKPGSvWqjOqtDbtd39v6eQHAsp3gRrxeFljF3/PQWWxIOLBnTL Q==;
X-CSE-ConnectionGUID: Jd0nWPQPTlOMdZzyjbGS/g==
X-CSE-MsgGUID: Zn6qdFrfRkWYSiPOnOMNVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66603138"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66603138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:47:32 -0800
X-CSE-ConnectionGUID: Oo03ZAy2Rh2z/+tfml5Njw==
X-CSE-MsgGUID: dIPqmCtGRxylzmzjE+Tadg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199277080"
Received: from dut4086lnl.fm.intel.com ([10.105.10.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:47:32 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 ivan.briano@intel.com, nishit.sharma@intel.com
Subject: [PATCH v5 2/4] lib/xe/xe_ioctl: Add xe_vm_get_property helper function
Date: Mon,  1 Dec 2025 18:47:32 +0000
Message-ID: <20251201184729.164799-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201184729.164799-6-jonathan.cavitt@intel.com>
References: <20251201184729.164799-6-jonathan.cavitt@intel.com>
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
index 39c4667a10..0f2beb1adb 100644
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
index ae8a23a545..d2da217ad8 100644
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

