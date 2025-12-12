Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F2D4336C
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 01:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCA310E553;
	Fri, 12 Dec 2025 01:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuqszXAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29AC10E315
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 01:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765501884; x=1797037884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=39wT4WqfFtzlNtB/BS5Jn8T0fTcUT8fPHhf9ieUGb6c=;
 b=YuqszXAVrBLOzgmkxmgl48WyXoq3Xq9qbX/L5+12LSBV/6f9EFXpysz8
 YC8petQbbcFLnS8HOSwtgVi5cGX5cnB9WYY2ZWkx6WdQ8rbKH0twIDUNv
 UDit70Hfs/HHzeg+fkBkN0GKh6iYZSAB4O6zViPE0+ZzNQEUvGvA2bmvv
 xEgxo8vXCWHcd8V1+xaJffdhyRFKS5T2EChs/vMea8f4bs4tMKOkltEEw
 hrlr/4HbiGbbOQUNX9jDs0haxGNbQA/BBMNkRJT3b4IbO1bzYGgSwRJsU
 vLsyw5sNMAZBi66cdRk+LQi0Px3sXa1N0fFDPkn0ZxxwO3DDlM1GvFlI+ w==;
X-CSE-ConnectionGUID: WRpE5k4bTim9/fQw2d3RJA==
X-CSE-MsgGUID: 7omLO3huQ3mwsk/eHKsmew==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71118044"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71118044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:23 -0800
X-CSE-ConnectionGUID: lyxdTEJfTY+JdIgqz7JaaQ==
X-CSE-MsgGUID: Ve4VP7EZTp243r/xexl8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196031235"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 17:11:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v5 09/18] lib/xe: Add exec_queue set_property ioctl support
Date: Thu, 11 Dec 2025 17:11:21 -0800
Message-ID: <20251212011115.1685703-29-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
References: <20251212011115.1685703-20-niranjana.vishwanathapura@intel.com>
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

