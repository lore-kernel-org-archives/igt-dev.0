Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE0CCD5BD1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 22:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807BB10F639;
	Tue,  2 Jun 2026 22:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtU2ANNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908510F638
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 22:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780439895; x=1811975895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFyGlreSjBzfRC4BQNOLbCZItABUwnrjZ9g2Vf9TTxg=;
 b=TtU2ANNB2jIVG9V++fNG6JX/qZ7a1/UvaBsWmUSMbspFLHlHQ5GmpZk6
 9V9EW6YqbUSGc38mNpJTHMY4pgR08cncErt3qb2Ru77QMbCes7w18Aq7C
 P/0bnIVcmRh0LBY8GKTgAmvpsdppRceCYi/7CoA6BslF3u8CBrW/i69Uw
 qYqGrivvADklKGHwHbFLSauanJ7fKy5XMjWr9+60FtOPx/EDVKvNrx6dI
 Dr2DiOc7EbuXccvqSW+OW+E/5QbVfzdxEgobOKgw2jv6F8Nm4n0GS7eXE
 qL/VIOPWHHbtEIaavMbyRo/u8qAd1ZB6Cq1WTYT0r8vdL07VCKhDDxg8N Q==;
X-CSE-ConnectionGUID: tyk9Y/LySgiXbbQQYgrwzw==
X-CSE-MsgGUID: G2o5e5tQTHC3e7NpiCcsrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81268343"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81268343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 15:38:15 -0700
X-CSE-ConnectionGUID: 4csXV0J3TdaO9pPdtEN+Yg==
X-CSE-MsgGUID: t1fctn5BRCW/J9r0Xm779A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="249121620"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 15:38:14 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 05/10] lib/mocs: Add intel_get_wb_mocs() and intel_buf_mocs()
 for packed MOCS fields
Date: Wed,  3 Jun 2026 00:37:38 +0200
Message-ID: <20260602223756.2543404-6-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602223756.2543404-1-jan.maslak@intel.com>
References: <20260602223756.2543404-1-jan.maslak@intel.com>
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

