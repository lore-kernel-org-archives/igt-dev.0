Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBBCC02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 08:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0E510E918;
	Fri, 24 Jan 2025 08:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IfgPTq/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE2310E918
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737706259; x=1769242259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AubzypeZb1fzYLlz+OTHzPSSWwz0x2OU4seMqF1Ncp8=;
 b=IfgPTq/tB3kRSXy5OD7t0+SIVZ0nD2W7wq9QBacaeHBr7k1Eg93AW7Eq
 LIBTEizuKBpdv7yid1XOvmlqx4VtkbT3qXr9T8s1FdcOvkZcMpGxwSMay
 idLSLoZPuB7knuNDKCM2EcFDCRC622cywoJm6PokLVloMR1igiSbA5S3l
 wJ+YhRGtX1T/ohbQ33yB7gcmNAITAftsCWeK90aLlI5qOT+0JhlvAHFw9
 n3hLZsZN1R+649rkQrfWPo6WO9GIVOnKqidihDtQl1vCo0nwZE33Hr6un
 cDBsrnWV879BY8XUIChXlHxZz/2itOYtfXeS6LA7gF+JvA6TsP0+NJaey A==;
X-CSE-ConnectionGUID: LTpk1S3NR+iSFqIMFDhi0A==
X-CSE-MsgGUID: ZpQ56qQYThSZ7nrARXM8vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63587306"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="63587306"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:59 -0800
X-CSE-ConnectionGUID: uP/jUHf6T4aKEZL3eN1YYQ==
X-CSE-MsgGUID: 2mUxeb9FT3OyMhJgV6Fm1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112340331"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:57 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v1 3/4] lib/igt_sriov_device: Add helper to iterate over
 VFs from starting number
Date: Fri, 24 Jan 2025 09:10:38 +0100
Message-Id: <20250124081039.31201-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250124081039.31201-1-lukasz.laguna@intel.com>
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
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

Helper allows to iterate over VFs associated with given PF, starting
from a specified VF number.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index de25a7d98..741b1bcec 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -86,6 +86,21 @@ igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
 	     ++__vf_num)
 #define for_each_sriov_num_vfs for_each_sriov_vf
 
+/**
+ * for_each_sriov_vf_starting_from - Iterate over VFs starting from a specified VF
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number
+ * @__vf_num: VFs iterator
+ *
+ * For loop that iterates over VFs associated with given PF @__pf_fd,
+ * starting from a specified VF number @__start.
+ */
+#define for_each_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \
+	for (unsigned int __vf_num = __start, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \
+	     __vf_num <= __total_vfs; \
+	     ++__vf_num)
+#define for_each_sriov_num_vfs_starting_from for_each_sriov_vf_starting_from
+
 /**
  * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
  * @__pf_fd: PF device file descriptor
-- 
2.40.0

