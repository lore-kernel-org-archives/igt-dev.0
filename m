Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269BFC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 16:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F1A10E70A;
	Tue, 11 Feb 2025 16:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5oU7HmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41A310E70A
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739291377; x=1770827377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/tNNHC1cvb4eejlM3Vf/nGz3fzVDhUHeghpUvi3urjI=;
 b=P5oU7HmMpooWPouVtdaiZwB4XJtFxf5iHQliKCAMbneKDNNarKm5/N/C
 k0app8g8aLTe+LJXNXCaf9UhEJSvtvsce4A9cs6pOaFuNIKXsfxhqrrzH
 wQQU+PNDyzvzBtLinKecYHJaQVuG3+/ovKOQrfS6n7WhMxZhdMHtf1lHL
 GzeAOxyBJJh30AKUBV33iwDesRGLskeOciP+83ePbyBFfEXQbBKrt2sJH
 bUdaU4Zn5QNGv1vIOdhGb/QrwsH3C4rA0WmeeJnMnJVuZHVhK9zyuBmDc
 RySo4AXYWneqZA3v9ThyiTaBIsWU4jVPNDwl8m6w0iUSW9SpiwKOZtx+x g==;
X-CSE-ConnectionGUID: Hm3UNLv1QdusDbgp7UI4AA==
X-CSE-MsgGUID: 2r2/Ly/2QPO1yqFZjFyQ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39113943"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39113943"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:37 -0800
X-CSE-ConnectionGUID: THVP6+m+QMat5/iLZ9BKIw==
X-CSE-MsgGUID: eJ8qvNp+Tm6176TQ6/STLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116643059"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:34 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v3 3/4] lib/igt_sriov_device: Add helper to iterate over
 VFs in specified range
Date: Tue, 11 Feb 2025 17:29:18 +0100
Message-Id: <20250211162919.15076-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250211162919.15076-1-lukasz.laguna@intel.com>
References: <20250211162919.15076-1-lukasz.laguna@intel.com>
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

Helper allows to iterate over VFs within the specified range.

v2:
 - fix macro (Marcin)

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index de25a7d98..2b6acb6d7 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -86,6 +86,25 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
 	     ++__vf_num)
 #define for_each_sriov_num_vfs for_each_sriov_vf
 
+/**
+ * for_each_sriov_vf_in_range - Iterate over VFs in a specified range
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number in the range
+ * @__end: Ending VF number in the range
+ * @__vf_num: Variable to store the random VF number
+ *
+ * For loop that iterates over VFs associated with given PF @__pf_fd,
+ * within the specified range [__start, __end]. The loop runs only if
+ * the range is valid.
+ */
+#define for_each_sriov_vf_in_range(__pf_fd, __start, __end, __vf_num) \
+	for (unsigned int __vf_num = __is_valid_range((__start), (__end), \
+						      igt_sriov_get_total_vfs(__pf_fd)) ? \
+						      (__start) : 0; \
+	     __vf_num && __vf_num <= (__end); \
+	     ++__vf_num)
+#define for_each_sriov_num_vfs_in_range for_each_sriov_vf_in_range
+
 /**
  * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
  * @__pf_fd: PF device file descriptor
-- 
2.40.0

