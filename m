Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CE4CD5BA0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD8B10E7FC;
	Thu,  5 Sep 2024 09:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDOUEGkh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A81F10E7FC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528518; x=1757064518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7IU2R/HBcLn7182HBHIKHHsmZPJzKjuNtWGECqHS3Qo=;
 b=dDOUEGkh6NPj9+feAlGt8JnI8CjhFJAfTwtwKSLkYtL5epONHvlxh1NF
 /TAWEqG63ibHkp5+Fd9sPY5T5DOxrLFdUkZC1/rYJeslEQjCqs6Bks0i8
 KFqPSAfgHE5xBRKBea2Bc9TL6xCKdmxbKCGZ2t2DB+37m2zFGvNxdgASt
 9IEZVK06oH61XLGJXnZVLjnBPVbl2VNEo2ISIM5R60U8TIkvO4CZdJjTE
 NN/osyGH2S1qBSMJ0PqjnReLKAVV8iFO1itrjJEChlucEebUL1T60gHdq
 jZAcLEXP/hJV/JzJ2YclNgnjAEh9kHeZggIdC0Em0VpUhrosKLsQrLkDi Q==;
X-CSE-ConnectionGUID: VR+XiBWESMmyYoOdsjkDwg==
X-CSE-MsgGUID: f0xFx077R/ebVm2ns0sRrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590128"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590128"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:32 -0700
X-CSE-ConnectionGUID: vjMrDtn+REK92c3PWfyLuQ==
X-CSE-MsgGUID: pknp2IpFS2aIiksdh9QXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404646"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:27 -0700
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
Subject: [PATCH i-g-t v6 02/17] lib/xe_ioctl: Add wrapper with vm_bind_op
 extension parameter
Date: Thu,  5 Sep 2024 11:27:57 +0200
Message-Id: <20240905092812.94553-3-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
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

