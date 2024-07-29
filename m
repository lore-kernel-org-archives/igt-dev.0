Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F20DC3DA7E
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D218010E42A;
	Mon, 29 Jul 2024 16:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmrqKHGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DED010E427
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268967; x=1753804967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/fWsFDUXiPhEwJnP0whQWZZ8upmFqrF1TV9MtuHULTk=;
 b=RmrqKHGIMLymRaH7aWNUGXmiPafA3f/yqHCzXAVqtg7PVIbRkdrOuUyn
 L47vsmvN0zpGZjEv1E9Kj/SG2jcmPK4dI8gFJ/4ECKkmQ9QvkMlqcXTot
 w8aEPK0g1wRB7Eud6WrPoXqgmLWebiuFfrBEFlAruBs93LUxxy+Nt6MRN
 AZSRKyKf3bVliHAvzjlSlFg0oBbUyyYR/jVzJWaThpEaqExkHtAxNh/A4
 0LgGyYpud7S6RNqzupT/GiNbZUHpPxjFPyl/mbbBims/yyXYddCPT8fq3
 k8Q2jtaAMlrfO/e6uxIqwbwYBPitJWIhtDsohqK8g7crPiMyGnamgNfYC w==;
X-CSE-ConnectionGUID: /QgvV1nQS1u2+kSnaVBIhw==
X-CSE-MsgGUID: /wmGUehIRa2xcZBmATwt6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426829"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426829"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:47 -0700
X-CSE-ConnectionGUID: vr5jR5TKTo2PCLiapSGH5Q==
X-CSE-MsgGUID: F9Nrs/BfSLCTw4btrtMLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737314"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:36 -0700
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
Subject: [PATCH 06/66] lib/xe_ioctl: Add wrapper with vm_bind_op extension
 parameter
Date: Mon, 29 Jul 2024 18:00:59 +0200
Message-Id: <20240729160159.37036-7-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

Currently there is no way to set drm_xe_vm_bind_op extension field. Add
vm_bind wrapper that allows pass this field as a parameter.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
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

