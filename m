Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EA4C0219C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 09:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794CD10EA8A;
	Fri,  7 Feb 2025 09:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csmdJWib";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8256810EA90
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738921250; x=1770457250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbJynQZK2cTSLFDljBO7tFmROZY/0WqkKp4q168lEng=;
 b=csmdJWibvNM7NL3+YvC2txYiwolRLDeHfzn3CT8refcCITGCmyH3XaiV
 hVLDlyiQtorHqcVgn8jmox//vMrT/Vz9Ia/GyftuGcoxbyE6KqWXGTGSE
 ZVdqD/OfUCagtTiNVAJ2RVQ1jm2bA+qg2p6Oa3fVPshSuRXumrHHDyKIs
 h3xKQ0Ifp9SE3Bg73yr1B1RDCvFK7rzuOAS9wgbjIEkJCe0ERG087SgoR
 +1P/SdUEke5U5nd3xvLITlJf55IJrgW9HiauX5POwy3FeT4QKFK9K109M
 fdMetHwfdsAym5px0s2qokOiDxbjntUf8g2UYQdbNXFpO3DqUhr4cwvRE A==;
X-CSE-ConnectionGUID: blx0LU0pROORwQPpjjfxoA==
X-CSE-MsgGUID: GivFl4VmQjalw3/Id3ebTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64913961"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="64913961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:50 -0800
X-CSE-ConnectionGUID: TpDbPLn+T3Kj4Yu+uzK9/A==
X-CSE-MsgGUID: ox/OvlXDS5C8inPWMe5h/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111328536"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:48 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v2 3/4] lib/igt_sriov_device: Add helper to iterate over
 VFs in specified range
Date: Fri,  7 Feb 2025 10:40:30 +0100
Message-Id: <20250207094031.15942-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250207094031.15942-1-lukasz.laguna@intel.com>
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
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

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index de25a7d98..c12a8cf6c 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -86,6 +86,24 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
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
+	for (unsigned int __vf_num = __start & \
+		__is_valid_range(__start, __end, igt_sriov_get_total_vfs(__pf_fd)); \
+	     __vf_num && __vf_num <= __end; \
+	     ++__vf_num)
+#define for_each_sriov_num_vfs_in_range for_each_sriov_vf_in_range
+
 /**
  * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
  * @__pf_fd: PF device file descriptor
-- 
2.40.0

