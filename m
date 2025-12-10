Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08404D3B9B9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5D10E64A;
	Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrjcH0Pj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3F510E641
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327185; x=1796863185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=39wT4WqfFtzlNtB/BS5Jn8T0fTcUT8fPHhf9ieUGb6c=;
 b=VrjcH0Pjpnu4wpNesYX5/RW5WDkGldqyALl7ltdAuhgVySx/Ktwgg+jI
 vrDiPsf/rsZpw858vu8GfrKw6wpxChOsz14jGaNLw7Eu+U9hIo91x6LZU
 fmkZHSnHUrPkHOTl0liLaZBO/Q5cqUIv57cdyFwEItzVI0P37DsWdmhf0
 7zkFJOTMSUUqvlRaBB3iAAB/N/S0Ah2Sniit+FmgVlF6KQOJNqvqo2obg
 9/GhG9cBotAwy7yv39OTjkD8gLKtqBYz6bZGXUeOYcwpOcV/wb3CvsL2C
 otgaOPcKJzzYXdo4bBwgAii2Agw5aWUXMAF1BJ85i6h0h0K1zqjJf2zdG A==;
X-CSE-ConnectionGUID: zoKje6LSR8e5pds7geoVwg==
X-CSE-MsgGUID: tLFcPZ//TsW7AjmieFB30g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180403"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
X-CSE-ConnectionGUID: Xmpueh0vSZqvdMRZWlWnpg==
X-CSE-MsgGUID: j0mTflbDSBWvEtLafv3K2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421622"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 09/18] lib/xe: Add exec_queue set_property ioctl support
Date: Tue,  9 Dec 2025 16:39:44 -0800
Message-ID: <20251210003936.1613078-29-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
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

Add infrastructure to support xe_exec_queue_set_property_ioctl()

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_ioctl.c | 27 +++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 39c4667a1..319853da0 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -503,6 +503,33 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	return create.exec_queue_id;
 }
 
+int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
+				 uint64_t value)
+{
+	struct drm_xe_exec_queue_set_property xe_priority = {
+		.property = property,
+		.exec_queue_id = exec_queue,
+		.value  = value,
+	};
+	int err;
+
+	err = igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY, &xe_priority);
+	if (err) {
+		err = -errno;
+		igt_assume(err);
+		errno = 0;
+		return err;
+	}
+
+	return 0;
+}
+
+void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
+				uint64_t value)
+{
+	igt_assert_eq(__xe_exec_queue_set_property(fd, exec_queue, property, value), 0);
+}
+
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue)
 {
 	struct drm_xe_exec_queue_destroy destroy = {
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index ae8a23a54..a7fd43c9e 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -83,6 +83,10 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 			  uint64_t ext);
 uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext);
 uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
+int __xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
+				 uint64_t value);
+void xe_exec_queue_set_property(int fd, uint32_t exec_queue, uint32_t property,
+				uint64_t value);
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
-- 
2.43.0

