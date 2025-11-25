Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2136CFD377
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E2410E3A7;
	Tue, 25 Nov 2025 10:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8PbJ65M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128FD10E3A7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066216; x=1795602216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rnsMZXxtV46BvBSvHAhZ+X1+AGSnGBRMcbf8Lnu1eWM=;
 b=b8PbJ65MzOMhDDdVHSekmq9sqBiYnu+vUxbiba6IXcA+Ye82mqsi7Za2
 7UaYVgXsRb+bNqOeGy++E6MPayLM9BoTFOfts3Ifnj4hO1lUY7+XB9RXA
 4zfX7tfHDh+NvTQ+wwrf1vlROBogJA2Gst0CcA8VxYRySpGX5uDbaLwAa
 y+0E987nurQy/vwK5RlAx4bFf9EEtjo8h/dSzvPHOXDN/+LlVm54gWdWM
 2kC+X2kbXH+prg3q2T15OzSEJTdwhTv2ikdeMHKhDlGVgck2UUr51M0tj
 PPcGUKkKhHjCKtAjAYVIvzUHRGvK1Ex5/St5L6ZSmk3+W6HUIC40GV9wL g==;
X-CSE-ConnectionGUID: rFECrXY2QoadyexwkvgPYw==
X-CSE-MsgGUID: K/9xx3WrR+ikUDG63ge9Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65080919"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65080919"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:36 -0800
X-CSE-ConnectionGUID: kP00C0p5Q9SozGy4bA6VTw==
X-CSE-MsgGUID: qonjdJu3TVu3CbvSyULLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193033728"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:34 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 03/10] lib/xe/xe_sriov_provisioning: Add string
 conversion helpers for scheduling priority
Date: Tue, 25 Nov 2025 11:23:02 +0100
Message-ID: <20251125102312.43142-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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

