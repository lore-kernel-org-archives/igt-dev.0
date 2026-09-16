Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BC4C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512C110E0D8;
	Wed, 16 Sep 2026 04:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSV8AEBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCD010E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532807; x=1821068807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/M75A5zyyKgpbqPB9iLGP7KUnRTeUd1o5a7DnWgs45o=;
 b=WSV8AEBBw5x6w0ioLVjkoIVISlUTYZrpoBLejKJEr/VkPdl4ShDUnttG
 KJW8sTu2vwrVigdxNJVXF5iGiZrsqCxJHoudCQc6x0R/ODJRyhuYKbmAl
 pkbQeG7vmdNgr5Y66tF77ZrRBtxiA7rNMK7PrkWOG9TFGedju4b0cPNnd
 Qj9WCm6n7CE64QNoT3J5EvRJVeZ/nrgxiKixwv7U5Zx20Yw/0W8pWI/8A
 +6voaDfjo5ToXp+Y81bHS1+KZdGsq6hbczLNo1dSM05H5dwzPLZqJhcih
 rfmTRIlgSO/BcmxeHCgHpw1N5C1bx6Y6FrSlGEd1zDkCKKdnoyE6Ff8RR Q==;
X-CSE-ConnectionGUID: dgCAV5zHSXi9NCu4YZKZeQ==
X-CSE-MsgGUID: O/4WeaLTRyeWmtqCXrhQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503261"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:47 -0700
X-CSE-ConnectionGUID: 8eo8EnEyQJ2NFCPwkhzycQ==
X-CSE-MsgGUID: kxt1i0sXT/SKUEC3I/iuZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765072"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:46 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 12/13] lib/igt_dp: Add link status predicates for both
 channel codings
Date: Wed, 16 Sep 2026 10:18:00 +0530
Message-Id: <20260916044801.1279102-13-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

A link that is up has, for every lane in use, clock recovery done,
channel equalisation done and symbols locked, plus interlane alignment
done for the link as a whole. 128b/132b reports that differently from
8b/10b: there is no clock recovery phase and so no CR_DONE bit, and a
training failure has its own bit in DP_LANE_ALIGN_STATUS_UPDATED.

Add igt_dp_link_status_ok() covering both, mirroring
drm_dp_channel_eq_ok() and the drm_dp_128b132b_* predicates in
drm_dp_helper.c, so a caller does not have to know which set of bits
applies to the rate it forced.

Add igt_dp_channel_coding_ok() next to it, reading
MAIN_LINK_CHANNEL_CODING_SET, so that the DPCD offsets stay inside the
library and a test can ask the two questions it cares about without
handling raw registers.

Both return 1, 0 or a negative error code, so that a caller can tell a
sink which disagrees apart from a DPCD it could not read at all. That
matters because the AUX character device is not always there.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_dp.c | 103 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dp.h |   4 ++
 2 files changed, 107 insertions(+)

diff --git a/lib/igt_dp.c b/lib/igt_dp.c
index 0b1fe73de..a7d9f1e77 100644
--- a/lib/igt_dp.c
+++ b/lib/igt_dp.c
@@ -281,3 +281,106 @@ int igt_dp_dpcd_read_byte(int aux_fd, unsigned int offset, uint8_t *val)
 
 	return ret == 1 ? 0 : -EIO;
 }
+
+/*
+ * DPCD registers and bits used by the sink side link checks, mirroring the
+ * kernel's include/drm/display/drm_dp.h.
+ */
+#define DPCD_MAIN_LINK_CHANNEL_CODING_SET	0x108
+#define  DPCD_SET_ANSI_8B10B			(1 << 0)
+#define  DPCD_SET_ANSI_128B132B			(1 << 1)
+
+#define DPCD_LANE0_1_STATUS			0x202
+#define DPCD_LINK_STATUS_SIZE			6
+#define  DPCD_LANE_CR_DONE			(1 << 0)
+#define  DPCD_LANE_CHANNEL_EQ_DONE		(1 << 1)
+#define  DPCD_LANE_SYMBOL_LOCKED		(1 << 2)
+
+/* DP_LANE_ALIGN_STATUS_UPDATED, the third byte of the status block. */
+#define  DPCD_INTERLANE_ALIGN_DONE		(1 << 0)
+#define  DPCD_128B132B_LT_FAILED		(1 << 4)
+
+static uint8_t dpcd_lane_status(const uint8_t link_status[DPCD_LINK_STATUS_SIZE],
+				int lane)
+{
+	return (link_status[lane / 2] >> (4 * (lane % 2))) & 0xf;
+}
+
+/**
+ * igt_dp_channel_coding_ok: Check the channel coding the sink was told to use
+ * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
+ * @uhbr:	Whether 128b/132b is expected
+ *
+ * Read MAIN_LINK_CHANNEL_CODING_SET and check that it selects the encoding the
+ * link rate implies. This is the only direct evidence that the coding a UHBR
+ * rate implies is the coding that reached the wire.
+ *
+ * Returns:
+ * 1 when the expected coding is selected, 0 when it is not, or a negative
+ * error code when the DPCD could not be read.
+ */
+int igt_dp_channel_coding_ok(int aux_fd, bool uhbr)
+{
+	uint8_t coding;
+	int ret;
+
+	ret = igt_dp_dpcd_read_byte(aux_fd, DPCD_MAIN_LINK_CHANNEL_CODING_SET,
+				    &coding);
+	if (ret < 0)
+		return ret;
+
+	return !!(coding & (uhbr ? DPCD_SET_ANSI_128B132B : DPCD_SET_ANSI_8B10B));
+}
+
+/**
+ * igt_dp_link_status_ok: Check the sink considers the link trained
+ * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
+ * @lane_count:	Number of lanes in use
+ * @uhbr:	Whether the link runs at a UHBR rate, i.e. uses 128b/132b
+ *
+ * Read the link status block at DP_LANE0_1_STATUS and check that every lane in
+ * use is locked and the lanes are aligned.
+ *
+ * 128b/132b reports this differently from 8b/10b: there is no clock recovery
+ * bit, and a training failure has its own bit in
+ * DP_LANE_ALIGN_STATUS_UPDATED. Mirrors drm_dp_channel_eq_ok() and the
+ * drm_dp_128b132b_* predicates.
+ *
+ * Returns:
+ * 1 when the sink considers the link trained, 0 when it does not, or a
+ * negative error code when the DPCD could not be read.
+ */
+int igt_dp_link_status_ok(int aux_fd, int lane_count, bool uhbr)
+{
+	uint8_t link_status[DPCD_LINK_STATUS_SIZE];
+	uint8_t lane_mask;
+	uint8_t align;
+	int ret;
+	int lane;
+
+	ret = igt_dp_dpcd_read(aux_fd, DPCD_LANE0_1_STATUS, link_status,
+			       sizeof(link_status));
+	if (ret < 0)
+		return ret;
+	if (ret != sizeof(link_status))
+		return -EIO;
+
+	align = link_status[2];
+
+	if (uhbr && (align & DPCD_128B132B_LT_FAILED))
+		return 0;
+
+	if (!(align & DPCD_INTERLANE_ALIGN_DONE))
+		return 0;
+
+	/* 128b/132b has no clock recovery phase, so no CR_DONE bit. */
+	lane_mask = DPCD_LANE_CHANNEL_EQ_DONE | DPCD_LANE_SYMBOL_LOCKED;
+	if (!uhbr)
+		lane_mask |= DPCD_LANE_CR_DONE;
+
+	for (lane = 0; lane < lane_count; lane++)
+		if ((dpcd_lane_status(link_status, lane) & lane_mask) != lane_mask)
+			return 0;
+
+	return 1;
+}
diff --git a/lib/igt_dp.h b/lib/igt_dp.h
index 44f3b11a1..332656aae 100644
--- a/lib/igt_dp.h
+++ b/lib/igt_dp.h
@@ -36,4 +36,8 @@ int igt_dp_dpcd_read(int aux_fd, unsigned int offset, void *buf, size_t size);
 
 int igt_dp_dpcd_read_byte(int aux_fd, unsigned int offset, uint8_t *val);
 
+int igt_dp_channel_coding_ok(int aux_fd, bool uhbr);
+
+int igt_dp_link_status_ok(int aux_fd, int lane_count, bool uhbr);
+
 #endif
-- 
2.25.1

