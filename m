Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726C1E77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 15:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308B510E362;
	Tue, 14 Jan 2025 15:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Srg8zYX+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA31310E37C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736867460; x=1768403460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pup2MVAImnwLXZ+LwtShqJCbq7r2LMj6hdlkNOKgk4k=;
 b=Srg8zYX+PkLVWXAsTRLJjlgbH8ysHv56CDzjdS+VdsibVUrb9AlcjTQd
 SXoBnegtFa8Nlk4pNm/ya4YgBcjoE3UaSR+r0g/571P7nSPssDqPBWFEk
 roOqp42L9rakr6hk9ZlgvyMxxLF2xbTheh7Pdu/bIf435JSsih27XH+DW
 R/pIndLHq8JmoQWCDAVrQlQ4aL58/WW4YwtcxHZnHY1vc+meIGsFrJhTT
 oarozrE38TaPzdrxwclu8QOWj4iNFDwQwHURa8tqSZv21M/0NjhiK+vZI
 LoBVOlzD9KIxABiLZLOImr1xi/ZwEQXA4LECYPatG6884pFUChCM0AX+M w==;
X-CSE-ConnectionGUID: yUntvaJUSN2cJHsIFFe94A==
X-CSE-MsgGUID: n7QAKwZDQpmz/dCy0A+TSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="62540136"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="62540136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:38 -0800
X-CSE-ConnectionGUID: GPg8fEVYQiyPLyjLfWvSWQ==
X-CSE-MsgGUID: mb+xLWeXQ3GUHYoCozQ8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="105346221"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.29])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:35 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 5/7] lib/igt_sriov_device: Add helper functions for
 VF range validation
Date: Tue, 14 Jan 2025 16:08:46 +0100
Message-Id: <20250114150848.332708-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
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

Add __is_valid_range() to check if a VF range is valid. Introduce
igt_sriov_random_vf_in_range() to get a random VF number within a
specified range. Update for_random_sriov_vf to use the new helper
functions for better range handling.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.h | 82 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 4b63ceb22..de25a7d98 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -34,6 +34,45 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 
+/**
+ * __is_valid_range - Helper to check VF range is valid
+ * @start_vf: Starting VF number
+ * @end_vf: Ending VF number
+ * @total_vfs: Total number of VFs
+ *
+ * Return: true if the range is valid, false otherwise.
+ */
+static inline bool __is_valid_range(unsigned int start_vf, unsigned int end_vf,
+				    unsigned int total_vfs)
+{
+	return !igt_warn_on_f(start_vf > end_vf || end_vf > total_vfs || start_vf == 0,
+			      "start_vf=%u, end_vf=%u, total_vfs=%u\n",
+			      start_vf, end_vf, total_vfs);
+}
+
+/**
+ * igt_sriov_random_vf_in_range - Get a random VF number within a specified range
+ * @pf_fd: PF device file descriptor
+ * @start: Starting VF number in the range
+ * @end: Ending VF number in the range
+ *
+ * Returns a random VF number within the specified range [start, end].
+ * If the range is invalid (start > end, end > total VFs,
+ * or start == 0), the function returns 0.
+ *
+ * Return: A random VF number within the range, or 0 if the range is invalid.
+ */
+static inline unsigned int
+igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
+{
+	unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+	if (!__is_valid_range(start, end, total_vfs))
+		return 0;
+
+	return start + random() % (end - start + 1);
+}
+
 /**
  * for_each_sriov_vf - Helper for running code on each VF
  * @__pf_fd: PF device file descriptor
@@ -48,17 +87,46 @@ bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 #define for_each_sriov_num_vfs for_each_sriov_vf
 
 /**
- * for_random_sriov_vf - Helper for running code on random VF
+ * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number in the range
+ * @__end: Ending VF number in the range
+ * @__vf_num: Variable to store the random VF number
+ *
+ * Iterates over a random VF number within the specified range [__start, __end].
+ * The loop runs only if the range is valid and a random
+ * VF number is successfully selected.
+ */
+#define for_random_sriov_vf_in_range(__pf_fd, __start, __end, __vf_num) \
+	for (unsigned int __vf_num = igt_sriov_random_vf_in_range(__pf_fd, __start, __end); \
+	     __vf_num != 0; __vf_num = 0)
+
+/**
+ * for_random_sriov_vf_starting_from - Iterate over a random VF starting from a specified VF
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number
+ * @__vf_num: Variable to store the random VF number
+ *
+ * This macro iterates over a random VF number starting from the specified
+ * VF number @__start to the total number of VFs associated with the given
+ * PF @__pf_fd.
+ */
+#define for_random_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \
+	for_random_sriov_vf_in_range(__pf_fd, __start, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
+
+/**
+ * for_random_sriov_vf - Iterate over a random VF for a given PF
  * @__pf_fd: PF device file descriptor
- * @__vf_num: stores random VF
+ * @__vf_num: Variable to store the random VF number
  *
- * Helper allows to run code using random VF number (stored in @__vf_num)
- * picked from the range of all VFs associated with given PF @__pf_fd.
+ * Iterates over a random VF number selected from the range
+ * of all VFs associated with the given PF @__pf_fd. The loop runs only
+ * if a random VF number is successfully selected.
  */
 #define for_random_sriov_vf(__pf_fd, __vf_num) \
-	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
-	     __tmp < 1; \
-	     ++__tmp)
+	for_random_sriov_vf_in_range(__pf_fd, 1, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
+
+/* for_random_sriov_num_vfs - Alias for for_random_sriov_vf */
 #define for_random_sriov_num_vfs for_random_sriov_vf
 
 /**
-- 
2.31.1

