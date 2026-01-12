Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C8D2504D
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7743D10E324;
	Mon, 12 Jan 2026 08:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIQOw09f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE96310E324
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768207739; x=1799743739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uKzsFXsuIhtPzLEYS3FVzQWDZKU6KYpow/27TmkgEQ=;
 b=QIQOw09f8jSJQjVZ+GXkhlSJDuPC8ldgAD+68cv+o9kjJZRf69sjvZfB
 D8Q7XFhuePNIAjxtgCpusuzpdy1mxBDICjjXfDhkfaxSdc74TPEFzPvTc
 S4SF5zvtHGuSsEanPSc0hRS5EhhfKtrWhqKElIK8Sz2rgS0DHXdscSWr4
 QWxkQj6Y1ADzK9rPLhAYE93w/YoMV+1Aho6Eosucx+8NzKm8pbwU7iPl/
 W0Ez113j1DtjbzazlhzG+d7l4q2/j4XSDy1RE6Avm/BNLChOt0OsRl0Ef
 6SHH/SdocFiOlmMqObyPVTXF9zI9g7IBANO8cjnzL58T5dGXN7rPVBPLa Q==;
X-CSE-ConnectionGUID: VHmWlXTYSNWHOCZPg5E0Jw==
X-CSE-MsgGUID: otcpycrbRBaSQEJe35Uixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69461969"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69461969"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:48:59 -0800
X-CSE-ConnectionGUID: ggSaaFhkQwenBLZDz8sEnA==
X-CSE-MsgGUID: hXGjYpYGSASC6WpNngcFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208562175"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:48:58 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, swati2.sharma@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Add helper to validate modes
Date: Mon, 12 Jan 2026 14:14:54 +0530
Message-ID: <20260112084455.157949-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112084455.157949-1-karthik.b.s@intel.com>
References: <20260112084455.157949-1-karthik.b.s@intel.com>
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

Add a helper function kmstest_mode_is_valid() that checks if
a given drmModeModeInfo pointer is non-NULL and has positive
width, height, and pixel clock.

This allows tests to safely check if an output mode is usable before
assigning it to a pipe or creating a framebuffer.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c | 14 ++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a58f41b48..9e5820d43 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5197,6 +5197,20 @@ const char *igt_output_name(igt_output_t *output)
 	return output->name;
 }
 
+/**
+ * kmstest_mode_is_valid:
+ * @mode: pointer to drmModeModeInfo
+ *
+ * Returns: True if the mode is non-NULL and has valid width, height and RR.
+ */
+bool kmstest_mode_is_valid(const drmModeModeInfo *mode)
+{
+	return mode &&
+	       mode->hdisplay > 0 &&
+	       mode->vdisplay > 0 &&
+	       mode->vrefresh > 0;
+}
+
 /**
  * igt_output_get_mode:
  * @output: Target output
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4a814f0e9..e10441017 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -585,6 +585,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
 }
 
 const char *igt_output_name(igt_output_t *output);
+bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
-- 
2.43.0

