Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB0CCFA03
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B2210E30F;
	Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6GPD3J2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6CE10E2FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wZeSoB3++dYQF4rUNCSzvMsn0SqZWhop7MRZUXcdt5o=;
 b=a6GPD3J2cFZsnVk/NLNUe4LG7Hpi9JPmNYsigAg2RKLnuAaWd3YcLpBV
 XxMDX+oYTm8HdmkOnJYmhSyKfrQ8d5+mT/dZ11y5tn7x/XRS56gBYbTMC
 Nj68oTj2UeJcfg8IEc7hh3raaE4TrvTpeI/LGCOUGXG0BSLtkgv/c7cCx
 Qqafm4EJd4UEkVvEghg0Z0Jeh1PLtBkijWioaPTh9Eck0SsYhvQbHDIQV
 vN4BWYQjGJbCg5+wJCUutwU+idA5eQtwmQ6du/exetaxZSZ33CDcXu67k
 WgwzKxfOYYsErLViaARES2bJAobcSGqqcqJ9PBEbSQUMKuTXUHA41avnl A==;
X-CSE-ConnectionGUID: AZjDs/EgTfSFhX7pIaai5A==
X-CSE-MsgGUID: ggwdd0bsRBC7T/XzvVFrDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144732"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: mKDiqg+NTmG6NEdAEp5imQ==
X-CSE-MsgGUID: U5jhG2G1QGq/WNMbuXGHxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650026"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 09/18] lib/xe: Add exec_queue set_property ioctl support
Date: Fri, 31 Oct 2025 11:35:46 -0700
Message-ID: <20251031183555.1882721-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

