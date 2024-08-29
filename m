Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820F0C83F32
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 14:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EFD10E6C9;
	Thu, 29 Aug 2024 14:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APYFEhI0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE45510E6C6
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724942783; x=1756478783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7IU2R/HBcLn7182HBHIKHHsmZPJzKjuNtWGECqHS3Qo=;
 b=APYFEhI0Kd6cmihMngeeyHyF1Kjt7AM1ANadjPWImCWfLv2+DMMAokpP
 wW7PVRZGo0JHHMKSJQFQj/Tojq2ADLjChgu2ZznLBCDfBpqwhQ0fxJIdw
 is9NhJgiqqr0nkw/qODLGCGuevN4/X0oVEtHBPDWXOa1kQ9pkUOXI7Dxt
 KdvUUHJwiQJ5bXnAGstrkEgKVZaDdZNjf3iPfVBj3m/Umog149S4M6G/j
 m2IpVfcojWRzQwNDBC8zVXcIGZkKS47gnj9EuFqA5hYzdszuGYpP7/cwr
 +5EGEqgWJuk6MwBg6GJH5QymWKMbFOrdb2m5BtXfRkdbFSv00vi+10H08 Q==;
X-CSE-ConnectionGUID: W+XEzC1jSbmYymLBc59YxQ==
X-CSE-MsgGUID: 55kQfuEARLGO1xEHLqSz7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34947510"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34947510"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:12 -0700
X-CSE-ConnectionGUID: S/7p/R7SQjW4+9JQ7E/dpA==
X-CSE-MsgGUID: beS7SzpZRbqJjci34RXyjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64303991"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.237])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:08 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t v5 02/17] lib/xe_ioctl: Add wrapper with vm_bind_op
 extension parameter
Date: Thu, 29 Aug 2024 16:45:32 +0200
Message-Id: <20240829144547.105371-3-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144547.105371-1-christoph.manszewski@intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently there is no way to set drm_xe_vm_bind_op extension field. Add
vm_bind wrapper that allows pass this field as a parameter.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_ioctl.c | 20 ++++++++++++++++----
 lib/xe/xe_ioctl.h |  5 +++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index ae43ffd15..6d8388918 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -96,15 +96,17 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
 }
 
-int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
-		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
-		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
-		  uint32_t prefetch_region, uint8_t pat_index, uint64_t ext)
+int  ___xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
+		   uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
+		   uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
+		   uint32_t prefetch_region, uint8_t pat_index, uint64_t ext,
+		   uint64_t op_ext)
 {
 	struct drm_xe_vm_bind bind = {
 		.extensions = ext,
 		.vm_id = vm,
 		.num_binds = 1,
+		.bind.extensions = op_ext,
 		.bind.obj = bo,
 		.bind.obj_offset = offset,
 		.bind.range = size,
@@ -125,6 +127,16 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 	return 0;
 }
 
+int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
+		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
+		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
+		  uint32_t prefetch_region, uint8_t pat_index, uint64_t ext)
+{
+	return ___xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size, op,
+			     flags, sync, num_syncs, prefetch_region,
+			     pat_index, ext, 0);
+}
+
 void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 			  uint64_t offset, uint64_t addr, uint64_t size,
 			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index b27c0053f..18cc2b72b 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -20,6 +20,11 @@
 uint32_t xe_cs_prefetch_size(int fd);
 uint64_t xe_bb_size(int fd, uint64_t reqsize);
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
+int  ___xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
+		   uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
+		   uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
+		   uint32_t prefetch_region, uint8_t pat_index, uint64_t ext,
+		   uint64_t op_ext);
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
 		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
-- 
2.34.1

