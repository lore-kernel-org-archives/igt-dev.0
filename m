Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB19DF01835
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781F910ED31;
	Fri,  6 Mar 2026 13:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqulHbcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC5310ED31
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803453; x=1804339453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aC6rX8ykI6qQC2nQXRPRXjCdof1bGZFGUrfqxkEgvQY=;
 b=bqulHbcncSXouRXWSUDtiCL0QG7uh4OP0r78Y9g0PHu+xFN4bTt4ZOHW
 8BgBf5UgIi4hC+D2Y+S+91SdbNlZ0TgxWxD3g2VWrFS2DLi7ZtpFoxfYX
 uT1Te4b39YS0p0pttvmxNUrPqb0wOrWuRPl7Meb9j/DLoqoDyT5Lyd5yK
 G287CKChzIgAM1W5p9pimMzVTEmqfVwYVzDv/KOlAhXKYa151CRl1kpaG
 8YIHKPylMuutO3gCbdkyqQuhXP2Dw2BSN6NGujRV5zLTFla1D4FNrhO6v
 24SI+3E3lmbkvNr1km8FmrLejpK3CItPCTtYn2VExc4LdfX9rOUY+1wJQ A==;
X-CSE-ConnectionGUID: kBq12YnPSwSkMj+BUMd38w==
X-CSE-MsgGUID: X4FNfXyGS3Cdo5zlzyA8Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85385039"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="85385039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:11 -0800
X-CSE-ConnectionGUID: IE7tjYLyRsmEaMP8PsivCQ==
X-CSE-MsgGUID: wVhetF8+Q36UZZaGMe+yVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="214918482"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 1/5] lib/kms: add igt_next_crtc()
Date: Fri,  6 Mar 2026 15:23:54 +0200
Message-ID: <9c74f8474521c5adb39ce02968c61bc4248fe06d.1772803372.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772803372.git.jani.nikula@intel.com>
References: <cover.1772803372.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Add a helper to get the next valid CRTC after a given CRTC, or the first
if NULL CRTC is given.

There are a number of tests that seem difficult to convert to
for_each_crtc(), as they have some other loops, but basically need a
helper for "give me another CRTC". This should fit the bill.

As most tests currently loop pipes, this also gives CRTCs in pipe order.

Open question is whether this should skip or not if there are no CRTCs
left.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ebf77b74d04..240200a98772 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8021,3 +8021,22 @@ igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output
 
 	return NULL;
 }
+
+/*
+ * igt_next_crtc:
+ * @display: pointer to igt_display_t
+ * @crtc: pointer to igt_crtc_t, or NULL for first
+ *
+ * Returns: The next CRTC on the device
+ */
+igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
+{
+	igt_crtc_t *next;
+
+	for_each_crtc(display, next) {
+		if (!crtc || next->pipe > crtc->pipe)
+			return next;
+	}
+
+	return NULL;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e91c6567757e..23169e87ff2d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -585,6 +585,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
 igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
 igt_crtc_t *igt_first_crtc(igt_display_t *display);
 igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
+igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc);
 
 uint32_t igt_crtc_get_vbl_flag(igt_crtc_t *crtc);
 unsigned int igt_crtc_get_vblank(igt_crtc_t *crtc, unsigned int flags);
-- 
2.47.3

