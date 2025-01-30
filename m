Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E38C02193
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 23:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84310E0ED;
	Thu, 30 Jan 2025 23:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvuyWLhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3191710E0ED
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738280235; x=1769816235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ela7+jy5O8HvUHbW3tqcbADV4Gd5WVOeiU2eVt1u9Fc=;
 b=hvuyWLhQGr6f/KMzr6P4OpJmo/pHz3tS2mImc502tkuFzqJvD20lBZLw
 Llo2AxFQeGodm+vZCMfzI4pW5POrPFGDW3ZOZ6F9mbqARFZXARMxafY5M
 KeRg7asDxNX+7xaZqCCTEKUCf/1so0L5qFnKP82iEEQoaj81/cumQE1QM
 fQPkdMtk8PiQbJrSEmwmc1q7XE0EqDU/n0CJyb7w3BSzH5yoq7zPuixoH
 DGiI7hNYBOxfnIEsLrnT8IvS9xMlKxEVWKd+bNX77nvHDyhDfBg7u1LeV
 StmYPsJ/r2bKwNNIO/7rW/qr0RS2t948oFg65EDjkkgqFnqNF3vGsxQ5R w==;
X-CSE-ConnectionGUID: +ftrpy4NRyqv04VOCEpt+g==
X-CSE-MsgGUID: S85MmD94SNWlD7v5Qvd0qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56278800"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="56278800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 15:37:15 -0800
X-CSE-ConnectionGUID: m+cbmIvSTFuab9SzNZewGQ==
X-CSE-MsgGUID: 4q2DMkZdSOyzsNY10OUkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109619112"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 15:37:13 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_vrr: Add function to return vblank
 timestamp
Date: Fri, 31 Jan 2025 05:22:45 +0530
Message-Id: <20250130235246.4142758-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250130235246.4142758-1-ramanaidu.naladala@intel.com>
References: <20250130235246.4142758-1-ramanaidu.naladala@intel.com>
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

This is useful for subtests that require precise vblank
timestamps.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e7d2ff1db..fac7cb4f7 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -172,6 +172,27 @@ static uint64_t get_kernel_event_ns(data_t *data, uint32_t event)
 	return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;
 }
 
+/*
+ * Wait for an vblank event and return its timestamp in microseconds.
+ *
+ * This blocks untill the event is received.
+ */
+static uint64_t wait_for_vblank(data_t *data, int pipe)
+{
+	uint32_t pipe_id_flag;
+	drmVBlank vbl;
+
+	memset(&vbl, 0, sizeof(vbl));
+
+	pipe_id_flag = kmstest_get_vbl_flag(pipe);
+
+	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
+	vbl.request.sequence = 1;
+	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
+
+	return (vbl.reply.tval_sec * 1000000 + vbl.reply.tval_usec);
+}
+
 /*
  * Returns the current CLOCK_MONOTONIC time in nanoseconds.
  * The regular IGT helpers can't be used since they default to
-- 
2.25.1

