Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132CACA0EFF
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 14:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6C910E83E;
	Wed, 27 Aug 2025 14:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IE6mR006";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C57B10E83E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 14:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756306169; x=1787842169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fP6uC+Wa49Kh+urr5qUnN5ThpJ38JbM4BuQivZuIYLE=;
 b=IE6mR006WP/d7+V5O/1TKcvR0YQNpBhNktXHJoIWItmXScyIzdxxWLvK
 ynDZXNi/BuO6BkfyzA84ejGgDcglxiZpH9udXMeya1uOEhlV7lsm4iAUS
 azv+L4tMr0i7c8g36YLv6s4OAOQVMfU9EHdDQ+Bhi7GumN9DnaQmKjK1e
 zSgm6KDueIjJu0HenXfmzuDoWlnQdCIC9KzAK4Qb9ZMxJ/i8DW6/eOP95
 +ZHOYrKZLlDlnJYtmYx8ySJAgdR21l9RLrTzn8wOsYqYL82SWG+aL8SXV
 IJGHyPDO6h8Pio+/6ikYas8YHdfGZ36hVCI9UHLqV8Rzb7EIZw+k7ovaD A==;
X-CSE-ConnectionGUID: e5llwsalSVSWNeoa6w2ZUw==
X-CSE-MsgGUID: n0Neyug4R0KGGkcW4f3HCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61191656"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61191656"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:49:29 -0700
X-CSE-ConnectionGUID: 74XxzypoSnyUUzIuZKnVUw==
X-CSE-MsgGUID: bsZ+2mFRQVitYdxbjhvrKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174246225"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:49:28 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v2 1/4] lib/igt_sriov_device: Add helper to iterate over
 enabled VFs
Date: Wed, 27 Aug 2025 16:49:13 +0200
Message-Id: <20250827144916.18558-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250827144916.18558-1-lukasz.laguna@intel.com>
References: <20250827144916.18558-1-lukasz.laguna@intel.com>
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

Helper allows to iterate over enabled VFs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

