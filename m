Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0846ED46BEB
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2EE10E1E7;
	Wed, 28 Jan 2026 18:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elu7yTQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B108910E1E7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623732; x=1801159732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vRa94JRqcpLUN1pFpeFm4FA9pClldV3qyM3XigFKXVM=;
 b=elu7yTQGG1FIlc9PU1rqcdI888ocxfj1iFMF2YPHoZWfIzJZGAemkN/N
 wNMwodCOJ59m2UU/KJFUl05UA1W5YNv4ZHEQ4YCrF+nSy/ldpaKtlTNpK
 Pv5M2ie0BIB/ybZrgD4eJ3Bjj//O3Bm/BLA0jhTyOm+xUN4nYBnXX6wn6
 y1g861DA1BXcH8FlpF859zjjjKWIs8XHoBJxSiTO09EoPZxIf43/Zxa/9
 bqTsYeotxYTYN6gmDkP/PK7tFCR+RX+mT76M1pZMDoqzjKhEyHvY4MyLO
 zsSW71d2iUCClM42oyFHKe7FDbi3rOd9NstJnQhyiJt3TybnzADOpg+5A Q==;
X-CSE-ConnectionGUID: K/h2++KKRkOVkoEjk/b/Yw==
X-CSE-MsgGUID: +2q5k7lfRQqQoxrMrQGvtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70819859"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70819859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:51 -0800
X-CSE-ConnectionGUID: L8mDS/MhRGeV2UncoRz7rQ==
X-CSE-MsgGUID: uEqSSFX3QOW8hLIvjmGxgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231282793"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:50 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 03/10] lib/xe/xe_sriov_provisioning: Add string
 conversion helpers for scheduling priority
Date: Wed, 28 Jan 2026 19:08:09 +0100
Message-ID: <20260128180819.1373376-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
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

Introduce helper functions to convert between xe_sriov_sched_priority
enum values and their string representations.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 58 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 116cd3255..c2a1db4bc 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -5,6 +5,7 @@
 
 #include <errno.h>
 
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sriov_device.h"
@@ -599,6 +600,63 @@ void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
 	igt_fail_on(__xe_sriov_set_sched_if_idle(pf, gt_num, value));
 }
 
+static const char * const xe_sriov_sched_priority_str[] = {
+	[XE_SRIOV_SCHED_PRIORITY_LOW]    = "low",
+	[XE_SRIOV_SCHED_PRIORITY_NORMAL] = "normal",
+	[XE_SRIOV_SCHED_PRIORITY_HIGH]   = "high",
+};
+
+_Static_assert(ARRAY_SIZE(xe_sriov_sched_priority_str) == (XE_SRIOV_SCHED_PRIORITY_HIGH + 1),
+	       "sched priority table must cover 0..HIGH");
+
+/**
+ * xe_sriov_sched_priority_to_string - Convert scheduling priority enum to string
+ * @prio: SR-IOV scheduling priority value
+ *
+ * Converts an enumeration value of type &enum xe_sriov_sched_priority
+ * into its corresponding string representation.
+ *
+ * Return: A pointer to a constant string literal ("low", "normal", or "high"),
+ * or %NULL if the value is invalid or unrecognized.
+ */
+const char *xe_sriov_sched_priority_to_string(enum xe_sriov_sched_priority prio)
+{
+	switch (prio) {
+	case XE_SRIOV_SCHED_PRIORITY_LOW:
+	case XE_SRIOV_SCHED_PRIORITY_NORMAL:
+	case XE_SRIOV_SCHED_PRIORITY_HIGH:
+		return xe_sriov_sched_priority_str[prio];
+	}
+
+	return NULL;
+}
+
+/**
+ * xe_sriov_sched_priority_from_string - Parse scheduling priority from string
+ * @s: NUL-terminated string to parse
+ * @prio: Output pointer to store parsed enum value
+ *
+ * Parses a string representing a scheduling priority ("low", "normal", "high")
+ * into the corresponding &enum xe_sriov_sched_priority value.
+ *
+ * Return: 0 on success, -EINVAL if the string is invalid or unrecognized.
+ */
+int xe_sriov_sched_priority_from_string(const char *s,
+					enum xe_sriov_sched_priority *prio)
+{
+	igt_assert(s && prio);
+
+	for (size_t i = 0; i < ARRAY_SIZE(xe_sriov_sched_priority_str); i++) {
+		const char *name = xe_sriov_sched_priority_str[i];
+
+		if (name && !strcmp(s, name)) {
+			*prio = (enum xe_sriov_sched_priority)i;
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
 /**
  * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
  * @pf: PF device file descriptor
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index ab5347fd6..c9b321d58 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -136,6 +136,8 @@ int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
 void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
 int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
 void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
+const char *xe_sriov_sched_priority_to_string(enum xe_sriov_sched_priority value);
+int xe_sriov_sched_priority_from_string(const char *s, enum xe_sriov_sched_priority *value);
 int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
 				  unsigned int gt_num,
 				  enum xe_sriov_sched_priority *value);
-- 
2.43.0

