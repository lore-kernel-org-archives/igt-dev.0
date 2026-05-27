Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A79BCD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 13:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FA210E7D0;
	Wed, 27 May 2026 13:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hie2Boxd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2930B10E7BE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 13:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779887782; x=1811423782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFyGlreSjBzfRC4BQNOLbCZItABUwnrjZ9g2Vf9TTxg=;
 b=hie2BoxdfTvSfICmVpmFtZ/DgJdfrGeOiP92OQ6bsV6hPT3hDmerVtde
 C2NYh5eM/YUebR2rEIWzTu7iOj/gjU9u9GwtUJMQRGRiXM45WMyk3rXu7
 GnMGTw2iUHWjqjgK6/wq29dxcsGB+OyTtMa26epknMKFRxCBIOE9g3tRx
 sCpPAWq+NOg7DrQVuvE5qv8FVqMf6ilV2M4AWE1XTnh0MfUSxFCvPIKbk
 KA7892lnpFqIE2rRfM/lEiPDODq3SvU3/Hq9UNQy8XWeu+U9t7PShAK2G
 IApFaATdvX13469aFrjB/KeAkjNbhVtMsY6YrNY6lDIezaN7NiUMPBCE+ w==;
X-CSE-ConnectionGUID: DwMe9jbyQkyORHTLtWL6Ig==
X-CSE-MsgGUID: Y4u1VqC1Ql6B8m1RtlXtLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80686843"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80686843"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:16:01 -0700
X-CSE-ConnectionGUID: ZCh4infPR/iFVNtt41xoAw==
X-CSE-MsgGUID: WNU1E3TQSHOXB2gNEXxpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="241201570"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:15:58 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 05/10] lib/mocs: Add intel_get_wb_mocs() and intel_buf_mocs()
 for packed MOCS fields
Date: Wed, 27 May 2026 15:15:16 +0200
Message-ID: <20260527131524.1649421-6-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527131524.1649421-1-jan.maslak@intel.com>
References: <20260527131524.1649421-1-jan.maslak@intel.com>
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

Some genxml-generated pack headers represent MOCS as a single 7-bit
field encoding both the 6-bit MOCS table index (bits 6:1) and the PXP
protected-content bit (bit 0). The existing intel_get_wb_mocs_index()
returns only the 6-bit index; assigning it directly to a genxml .MOCS
field places the index in the wrong bit position.

Add two helpers that return the full 7-bit value ready for direct
assignment to genxml fields that use this encoding:

 - intel_get_wb_mocs(fd): write-back policy, PXP clear. Equivalent to
   intel_get_wb_mocs_index(fd) << 1.

 - intel_buf_mocs(buf): encodes the buffer's mocs_index together with its
   PXP flag: (buf->mocs_index << 1) | intel_buf_pxp(buf).

Keep intel_get_wb_mocs_index() and the related _index() helpers for
callers using layouts where the MOCS index and protection/encryption bit
are represented separately.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/intel_bufops.h | 13 +++++++++++++
 lib/intel_mocs.c   | 28 ++++++++++++++++++++++++++++
 lib/intel_mocs.h   |  2 ++
 3 files changed, 43 insertions(+)

diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index d111346aaa..ead2c53e3f 100644
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
index 778fd848ed..973bf9e7b9 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -81,6 +81,34 @@ uint8_t intel_get_wb_mocs_index(int fd)
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
+/**
+ * intel_get_uc_mocs:
+ * @fd: the DRM file descriptor
+ *
+ * Returns: The full 7-bit MOCS field value for uncached accesses, with the
+ * 6-bit table index shifted to bits 6:1 and the PXP bit (bit 0) cleared.
+ * Use this when assigning to a genxml-generated MOCS field, which encodes
+ * both the index and PXP bit in a single 7-bit value.
+ */
+uint8_t intel_get_uc_mocs(int fd)
+{
+	return intel_get_uc_mocs_index(fd) << 1;
+}
+
 /**
  * intel_get_uc_mocs_index:
  * @fd: the DRM file descriptor
diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
index 394bb41be0..6a1c0f99ce 100644
--- a/lib/intel_mocs.h
+++ b/lib/intel_mocs.h
@@ -12,6 +12,8 @@
 #define DISPLAYABLE_MOCS_INDEX ((uint8_t)-2)
 
 uint8_t intel_get_wb_mocs_index(int fd);
+uint8_t intel_get_wb_mocs(int fd);
+uint8_t intel_get_uc_mocs(int fd);
 uint8_t intel_get_uc_mocs_index(int fd);
 uint8_t intel_get_displayable_mocs_index(int fd);
 uint8_t intel_get_defer_to_pat_mocs_index(int fd);
-- 
2.43.0

