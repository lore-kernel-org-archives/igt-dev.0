Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1473AC83F34
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 09:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A940A10E2F8;
	Thu, 17 Jul 2025 09:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaGk7I2a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3656010E2F8
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752743303; x=1784279303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8mERu7D3gWaZqfdgkJ0fitp8LAJLXUBHM0eA5N+ToZw=;
 b=RaGk7I2aYMABxjAqqaqlVzqEg3Ru8Wcz9uwTanpedMBXKYU6krBv4YZl
 ALB7REBLHD7cxahBIrfp4B5OHLDBb+Wq4dzzdTS9KlN3FKm20gGlCA0Pf
 62S09J9QmN4DYXjQDnhr+dlTmTwMqJFY/lZ0Ok4Uhf/zaym07DlARE6IU
 Lv3L7J1XnqAfx6AIOj0Ln+P0tqlGI1ra1JkUirsX3nKrMiulJoILp2suG
 5qTzetRsGbADNmYBLEnSTmc6GMvz445eJFrdC1I5SNqitD0GO4kDPghix
 DbpXk7ZGIrs0wgKl7A69rDXIr5A+O7yb2+Kmmbxxa3EiOeP6OhexpDie6 g==;
X-CSE-ConnectionGUID: xPN3tfBgQHWdQHIfwbedpg==
X-CSE-MsgGUID: B3jejMSCRtutzZ2vsN1JPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55129519"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="55129519"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:23 -0700
X-CSE-ConnectionGUID: MSLSIURETmaaiFQ/wZplcw==
X-CSE-MsgGUID: +s1iJ2EgSz2Mebjxo84XaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="158444290"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:21 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, satyanarayana.k.v.p@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t 1/4] lib/igt_sriov_device: Add helper to iterate over
 enabled VFs
Date: Thu, 17 Jul 2025 11:08:09 +0200
Message-Id: <20250717090812.28628-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250717090812.28628-1-lukasz.laguna@intel.com>
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
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

Helper allows to iterate over enabled VFs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 912449086..930e97982 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -87,6 +87,18 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
 	     ++__vf_num)
 #define for_each_sriov_num_vfs for_each_sriov_vf
 
+/**
+ * for_each_sriov_enabled_vf - Helper for running code on each enabled VF
+ * @__pf_fd: PF device file descriptor
+ * @__vf_num: VFs iterator
+ *
+ * For loop that iterates over all enabled VFs associated with given PF @__pf_fd.
+ */
+#define for_each_sriov_enabled_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = 1, __enabled_vfs = igt_sriov_get_enabled_vfs(__pf_fd); \
+	     __vf_num <= __enabled_vfs; \
+	     ++__vf_num)
+
 /**
  * for_each_sriov_vf_in_range - Iterate over VFs in a specified range
  * @__pf_fd: PF device file descriptor
-- 
2.40.0

