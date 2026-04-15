Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7AFF433CD
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 22:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C6710E750;
	Wed, 15 Apr 2026 22:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuKvgW5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33FF10E1FA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 22:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776290859; x=1807826859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lVzOsIbs1L5SRdkJj+LKxxHv9/TBEXB4RqpKalohwFI=;
 b=NuKvgW5DnPMlbY4v2PvkzuDkmlKj1QEg7c8HSpjGe+rRkJ6UvSUOsFIk
 BzV37V/C63kzLMIjVniLrqbpiYVhzOIBGdM+fMA5ibTZ0zPn2jiWZlTCU
 EHsX0pYu2qSzEKN50GTw5NsulXwnsYlmWxC5hhTE1Zg9AmSpijsk2GYtj
 K3TVmcyQNah62pu3Z0nAspDLQKgz9eFVvYLCQFZCd42zfrOp8t8kf6QTd
 PYVlidjxUaPc28AlQ7Pf7Tz9A058YZ6NcV4ewUGWWW6NbWwxsCmV7GoGL
 XEyyBmDNdviKsKj7QMY7LqtzHbac39rzTuLQSN6RQDPAJmLnyA+dSgT/S w==;
X-CSE-ConnectionGUID: g8mYdz0ZTCm1wfGwAA4gMw==
X-CSE-MsgGUID: tuYiy+29T2Ws939FpiGsOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77397184"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77397184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:39 -0700
X-CSE-ConnectionGUID: T6Y25loyTGm2Ugu3ny5W4A==
X-CSE-MsgGUID: aqG6RI+KQn2sCCdDCXnq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234926124"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:37 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 05/10] lib/mocs: Add intel_get_wb_mocs() and intel_buf_mocs()
 for genxml MOCS fields
Date: Thu, 16 Apr 2026 00:07:15 +0200
Message-Id: <20260415220720.1594414-6-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415220720.1594414-1-jan.maslak@intel.com>
References: <20260415220720.1594414-1-jan.maslak@intel.com>
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

genxml-generated pack headers represent MOCS as a single 7-bit field
encoding both the 6-bit MOCS table index (bits 6:1) and the PXP
protected-content bit (bit 0).  The existing intel_get_wb_mocs_index()
returns only the 6-bit index; assigning it directly to a genxml .MOCS
field places the index in the wrong bit position.

Add two helpers that return the full 7-bit value ready for direct
assignment to a genxml .MOCS field:

 - intel_get_wb_mocs(fd): write-back policy, PXP clear.  Equivalent to
   intel_get_wb_mocs_index(fd) << 1.

 - intel_buf_mocs(buf): encodes the buffer's mocs_index together with its
   PXP flag: (buf->mocs_index << 1) | intel_buf_pxp(buf).  Use this
   wherever a surface-state or sampler-state MOCS field is set for a
   specific intel_buf.

The old intel_get_wb_mocs_index() and related _index() functions remain
for callers that use hand-crafted bitfield structs with the index occupying
a separate bitfield.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel_bufops.h | 13 +++++++++++++
 lib/intel_mocs.c   | 14 ++++++++++++++
 lib/intel_mocs.h   |  1 +
 3 files changed, 28 insertions(+)

diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index d111346aa..ead2c53e3 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -210,6 +210,19 @@ static inline bool intel_buf_pxp(const struct intel_buf *buf)
 	return buf->is_protected;
 }
 
+/**
+ * intel_buf_mocs:
+ * @buf: the intel_buf
+ *
+ * Returns the full 7-bit MOCS field value for @buf, encoding the 6-bit
+ * table index at bits 6:1 and the PXP protected-content bit at bit 0.
+ * Use this when assigning to a genxml-generated MOCS field.
+ */
+static inline uint8_t intel_buf_mocs(const struct intel_buf *buf)
+{
+	return (buf->mocs_index << 1) | (intel_buf_pxp(buf) ? 1 : 0);
+}
+
 void *intel_buf_cpu_map(struct intel_buf *buf, bool write);
 void *intel_buf_device_map(struct intel_buf *buf, bool write);
 void intel_buf_unmap(struct intel_buf *buf);
diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 778fd848e..08b5985c8 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -81,6 +81,20 @@ uint8_t intel_get_wb_mocs_index(int fd)
 	return mocs.wb_index;
 }
 
+/**
+ * intel_get_wb_mocs:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The full 7-bit MOCS field value for write-back caching, with the
+ * 6-bit table index shifted to bits 6:1 and the PXP bit (bit 0) cleared.
+ * Use this when assigning to a genxml-generated MOCS field, which encodes
+ * both the index and PXP bit in a single 7-bit value.
+ */
+uint8_t intel_get_wb_mocs(int fd)
+{
+	return intel_get_wb_mocs_index(fd) << 1;
+}
+
 /**
  * intel_get_uc_mocs_index:
  * @fd: the DRM file descriptor
diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
index 394bb41be..7d9c7d8b0 100644
--- a/lib/intel_mocs.h
+++ b/lib/intel_mocs.h
@@ -12,6 +12,7 @@
 #define DISPLAYABLE_MOCS_INDEX ((uint8_t)-2)
 
 uint8_t intel_get_wb_mocs_index(int fd);
+uint8_t intel_get_wb_mocs(int fd);
 uint8_t intel_get_uc_mocs_index(int fd);
 uint8_t intel_get_displayable_mocs_index(int fd);
 uint8_t intel_get_defer_to_pat_mocs_index(int fd);
-- 
2.34.1

