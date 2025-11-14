Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A8CE8D79
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 19:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED88B10E25B;
	Fri, 14 Nov 2025 19:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZRjK3+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ECE10E25B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763147295; x=1794683295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPvk0WA5RinsFuFx1E4nxrd4upnhoQJuQ7rm6R8fF6I=;
 b=cZRjK3+Nho2kuu/UPiX5AxUIz40BDXNfiLaYuK5ik8vB52U583i/SOmI
 M+XSRsRPBGAXWXmzWAl1drQjN5OUpxEVxDs41PjRsUKdZnKfQ1z5Tlb4H
 wtSfTdL2gKuTTMJZfOjY9/3qU8J6+X91cDQtxnPNAw10Wu57Q78N5Gpev
 15NnL6MeUrYhGc+xmIH8jJCd/MTOpT3okIPWXM4mOEw4ZeKkY0wFa95FX
 BvC3wa+t0S+3tougrumCJxEQEk0Q3NF3RQvqHDmU0XCN8tDrHILnzywDK
 UGVTz1Yi5vsJtvIJvsimPYbTt2Jmeo71ljbHoXfCsBfINnFz40Ny1OBU0 w==;
X-CSE-ConnectionGUID: E1zw58WAQomgP0e9u4fBfw==
X-CSE-MsgGUID: O7tgT1PqQXWPgZdJoXP01Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76593001"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76593001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:14 -0800
X-CSE-ConnectionGUID: z69dLb5sRz6uH1+lIrgqiA==
X-CSE-MsgGUID: p50l8w2FS+SYwfhxQ6Xq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190104303"
Received: from mkrakus-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.23.186])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:08:13 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/5] lib/xe/xe_sriov_provisioning: Add sched priority
 mask to string helper
Date: Fri, 14 Nov 2025 20:07:52 +0100
Message-ID: <20251114190757.2295174-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
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

Introduce xe_sriov_sched_priority_mask_to_string() to format a
scheduling priority bitmask as a space-separated list of priority names.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 54 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h | 11 +++++++
 2 files changed, 65 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 532335abe..da0df4d31 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -693,6 +693,60 @@ int xe_sriov_sched_priority_from_string(const char *s,
 	return -EINVAL;
 }
 
+_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_LOW) == XE_SRIOV_SCHED_PRIORITY_MASK_LOW,
+	       "LOW mask bit must match enum order");
+_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_NORMAL) == XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL,
+	       "NORMAL mask bit must match enum order");
+_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_HIGH) == XE_SRIOV_SCHED_PRIORITY_MASK_HIGH,
+	       "HIGH mask bit must match enum order");
+
+/**
+ * xe_sriov_sched_priority_mask_to_string - Format priority mask as text
+ * @mask: Priority bitmask.
+ * @sel: Optional selected priority (NULL for none).
+ * @buf: Output buffer.
+ * @buf_sz: Size of @buf.
+ *
+ * Converts @mask to a space-separated string of priority names. If @sel is
+ * non-NULL and present in @mask, that priority is wrapped in brackets, e.g.
+ * "low [normal] high". Writes "none" if the mask is empty.
+ *
+ * Returns: @buf.
+ */
+const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask,
+						   const enum xe_sriov_sched_priority *sel,
+						   char *buf, size_t buf_sz)
+{
+	size_t n = buf_sz;
+	bool first = true;
+	char *p = buf;
+
+	igt_assert(buf && buf_sz);
+
+	for (enum xe_sriov_sched_priority prio = XE_SRIOV_SCHED_PRIORITY_LOW;
+	     prio <= XE_SRIOV_SCHED_PRIORITY_HIGH; prio++) {
+		const char *name = xe_sriov_sched_priority_to_string(prio);
+		unsigned int bit = BIT(prio);
+
+		if (mask & bit) {
+			bool highlight = sel && (*sel == prio);
+
+			p += snprintf(p, n, "%s%s%s%s",
+				      first ? "" : " ",
+				      highlight ? "[" : "",
+				      name ?: "?",
+				      highlight ? "]" : "");
+			n = buf_sz - (p - buf);
+			first = false;
+		}
+	}
+
+	if (first)
+		snprintf(buf, buf_sz, "none");
+
+	return buf;
+}
+
 /**
  * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
  * @pf: PF device file descriptor
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index 65f0597fe..9305eceec 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -75,6 +75,14 @@ enum xe_sriov_sched_priority {
 	XE_SRIOV_SCHED_PRIORITY_HIGH
 };
 
+#define XE_SRIOV_SCHED_PRIORITY_MASK_LOW    (1u << XE_SRIOV_SCHED_PRIORITY_LOW)
+#define XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL (1u << XE_SRIOV_SCHED_PRIORITY_NORMAL)
+#define XE_SRIOV_SCHED_PRIORITY_MASK_HIGH   (1u << XE_SRIOV_SCHED_PRIORITY_HIGH)
+#define XE_SRIOV_SCHED_PRIORITY_MASK_ALL \
+	(XE_SRIOV_SCHED_PRIORITY_MASK_LOW | \
+	 XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL | \
+	 XE_SRIOV_SCHED_PRIORITY_MASK_HIGH)
+
 /**
  * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
  * @vf_id: The ID of the VF
@@ -143,6 +151,9 @@ int xe_sriov_sched_priority_from_string(const char *s, enum xe_sriov_sched_prior
 int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
 				  unsigned int gt_num,
 				  enum xe_sriov_sched_priority *value);
+const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask,
+						   const enum xe_sriov_sched_priority *sel,
+						   char *buf, size_t buf_sz);
 enum xe_sriov_sched_priority xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
 							 unsigned int gt_num);
 int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
-- 
2.43.0

