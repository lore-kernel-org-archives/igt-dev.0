Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A02E98FA9
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF7910E192;
	Thu,  9 Apr 2026 04:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKjDlIzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5361C10E0FF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775708155; x=1807244155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxo+hOlyRsFr21QWwWYpFMFh4FCM67tcEqQxpLAH9z8=;
 b=VKjDlIzuyZBdvkHXFsMj7tyWL819ZW3pfmmgIRT/YggJDqEK65h6GkQu
 FcEeQO6HCaf4lmE05uS0jfyuhCdBOH8oSOp08T+GzkKGXe1HtEec+T0Np
 F6j8LPKoZKRd/UlOCXmyhVSsV2FEozBgk21Tgbt03WQRyOR2/PH/gY9Ai
 rhIR0TJm48OYoPA1fGHCAAREaNwrL3ZtCKlb0BxfLva8Pkp9CL8/JeHth
 R6Uex7EcEQ1kZVZL8Zq3kF+9fZHxMQkB1oavfxeEyACGQF7M39w+ZNyDs
 DieqCgseTp4KF2XKymqWiJ8CIy8bbKziz184Ty2p3QBidWvqqkNr8oecr w==;
X-CSE-ConnectionGUID: alQAcwZLTmu5M6wBG73qLg==
X-CSE-MsgGUID: 89mcrRxhTnOIQUbhXPNtOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76608376"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76608376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:15:54 -0700
X-CSE-ConnectionGUID: kiOXJWB4QuenI3jdurmymQ==
X-CSE-MsgGUID: uzCQE7ooQ9enWfelziqDUw==
X-ExtLoop1: 1
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:15:53 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@gmail.com>
Subject: [PATCH i-g-t 1/6] lib/igt_edid: add EDID serial extraction helpers
Date: Thu,  9 Apr 2026 10:07:09 +0530
Message-Id: <20260409043714.284108-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260409043714.284108-1-kunal1.joshi@intel.com>
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
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

Add helpers to extract serial identification from EDID data.

 - edid_get_serial_string(): extract ASCII serial from descriptor 0xFF
 - edid_get_serial_number(): extract 32-bit serial from EDID header
 - edid_get_any_serial(): convenience helper that tries ASCII serial
   first, then falls back to 32-bit header serial formatted as hex

These are needed by the connector helper and USB4 switch test suite
for EDID-based display verification after dock/undock events.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@gmail.com>
---
 lib/igt_edid.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_edid.h |  5 +++
 2 files changed, 96 insertions(+)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index c68ccf671..e7fcbf0b9 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -249,6 +249,97 @@ void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size
 	name[0] = '\0';
 }
 
+/**
+ * edid_get_serial_string:
+ * @edid: EDID structure
+ * @serial: buffer to write serial string
+ * @serial_size: size of serial buffer; must be > 1
+ *
+ * Extract the serial string from EDID descriptor block type 0xFF.
+ * The descriptor payload is a 13-byte fixed-width field; trailing
+ * whitespace is stripped and the result is NUL-terminated.
+ * @serial is left empty when no 0xFF descriptor is found.
+ */
+void edid_get_serial_string(const struct edid *edid,
+			    char *serial, size_t serial_size)
+{
+	size_t copy_len, i, n;
+
+	igt_assert(edid);
+	igt_assert(serial);
+	igt_assert(serial_size > 1);
+	serial[0] = '\0';
+
+	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
+		const uint8_t *d = (const uint8_t *)&edid->detailed_timings[i];
+
+		if (d[0] != 0x00 || d[1] != 0x00 || d[2] != 0x00)
+			continue;
+
+		if (d[3] != EDID_DETAIL_MONITOR_SERIAL || d[4] != 0x00)
+			continue;
+
+		/* Descriptor string payload is 13 bytes starting at d[5] */
+		copy_len = serial_size - 1 < 13 ? serial_size - 1 : 13;
+		memcpy(serial, &d[5], copy_len);
+		serial[copy_len] = '\0';
+
+		for (n = strlen(serial);
+		     n > 0 && isspace((unsigned char)serial[n - 1]); n--)
+			serial[n - 1] = '\0';
+
+		return;
+	}
+}
+
+/**
+ * edid_get_serial_number:
+ * @edid: EDID structure
+ *
+ * Extract the 32-bit serial number from the EDID base block header
+ * (bytes 12–15, the manufacturer/product section).  This is different
+ * from the ASCII serial string in descriptor block 0xFF.
+ *
+ * Returns: 32-bit serial number (little-endian), 0 if absent.
+ */
+uint32_t edid_get_serial_number(const struct edid *edid)
+{
+	return (uint32_t)edid->serial[0] |
+	       ((uint32_t)edid->serial[1] << 8) |
+	       ((uint32_t)edid->serial[2] << 16) |
+	       ((uint32_t)edid->serial[3] << 24);
+}
+
+/**
+ * edid_get_any_serial:
+ * @edid: EDID structure
+ * @serial: buffer to write serial string
+ * @serial_size: size of serial buffer; must be > 1
+ *
+ * Convenience helper that tries to extract a serial identifier from EDID.
+ * First tries the ASCII serial string descriptor (0xFF). If that is empty,
+ * falls back to the 32-bit header serial number formatted as 8-char hex.
+ * If neither source provides a usable serial (no 0xFF descriptor and the
+ * header serial is 0), @serial is left empty.
+ */
+void edid_get_any_serial(const struct edid *edid,
+			 char *serial, size_t serial_size)
+{
+	uint32_t serial_num;
+
+	igt_assert(edid);
+	igt_assert(serial);
+	igt_assert(serial_size > 1);
+
+	edid_get_serial_string(edid, serial, serial_size);
+	if (serial[0])
+		return;
+
+	serial_num = edid_get_serial_number(edid);
+	if (serial_num != 0)
+		snprintf(serial, serial_size, "%08X", serial_num);
+}
+
 static void edid_set_mfg(struct edid *edid, const char mfg[static 3])
 {
 	edid->mfg_id[0] = (mfg[0] - '@') << 2 | (mfg[1] - '@') >> 3;
diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index be0ccf529..d9e396065 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -457,5 +457,10 @@ void *dispid_block_tiled(void *ptr,
 			 int hsize, int vsize,
 			 const char *topology_id);
 void edid_get_monitor_name(const struct edid *edid, char *name, size_t name_size);
+void edid_get_serial_string(const struct edid *edid,
+			    char *serial, size_t serial_size);
+uint32_t edid_get_serial_number(const struct edid *edid);
+void edid_get_any_serial(const struct edid *edid,
+			 char *serial, size_t serial_size);
 
 #endif
-- 
2.25.1

