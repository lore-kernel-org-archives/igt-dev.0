Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF1BC369AC
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 12:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF81610EB8D;
	Fri, 11 Apr 2025 12:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcSpY7J8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F0610EB85
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744373253; x=1775909253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BVYXpEYzwQ1lf919tgDIH72xgbhE0yPsM9rxxwLmPRg=;
 b=IcSpY7J8B9UwkTXBfFevrzdGnLhWCVpxXYT2lyfjqoECLxTjFsQ2vQ9s
 Be5pzax0HsrPtQfB3/iNAljKK7ha60x4rgXQdWQWfH8ROKWg/hZA5Il3s
 I1IB5lPk14dEvLDvTX8NzqVaIkEJpSM7xejXk7eM6mvlwuIqhABpyrmwH
 H0nZeQMVOTF4tYUMwIpBM5SZCcft7oArNkuw1Zq1KVTa9IXiHkNZ8IDWW
 fiaT1VaBvrh162HSGslsJZbhebfxmSSWLgIHcHGudyW4KCertP13SLSnf
 i6EsOHfcIWd0eAalaOPhNPnm/Lk9nhNc2wHEAp7TFLR3N9zBFlhPGG2Vg A==;
X-CSE-ConnectionGUID: 4VKUnBPTRaSg0Qh3G9sNiQ==
X-CSE-MsgGUID: lT1uvXa1SuyuqqkujVMdEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56907876"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="56907876"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:33 -0700
X-CSE-ConnectionGUID: 5Mo4JBiAR+Kk/+gzZvc5oA==
X-CSE-MsgGUID: NRacOxsXQYmmwL/zPlIWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134045013"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:32 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 09/10] lib/igt_chamelium: Add
 chamelium_frame_eq_or_dump_frame_pair()
Date: Fri, 11 Apr 2025 17:42:37 +0530
Message-Id: <20250411121238.773949-10-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411121238.773949-1-swati2.sharma@intel.com>
References: <20250411121238.773949-1-swati2.sharma@intel.com>
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

Add chamelium_frame_eq_or_dump_frame_pair() to compare frame
dumps captured from chamelium. If they do not, this saves the
reference and captured frames to a png file. This function does
exact comparison.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_chamelium.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_chamelium.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index a96e36b5b..463ba31ed 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1893,6 +1893,44 @@ static void compared_frames_dump(cairo_surface_t *reference,
 	free(capture_suffix);
 }
 
+/**
+ * chamelium_frame_eq_or_dump_frame_pair:
+ * @chamelium: The chamelium instance the frame dump belongs to
+ * @frame0: The chamelium frame dump to check
+ * @frame1: The chamelium frame dump to check
+ *
+ * Returns bool that the provided captured frame dumps are identical.
+ * If they do not, this saves the frames to a png file.
+ */
+bool chamelium_frame_eq_or_dump_frame_pair(const struct chamelium *chamelium,
+			                   const struct chamelium_frame_dump *frame0,
+			                   const struct chamelium_frame_dump *frame1)
+{
+	cairo_surface_t *reference;
+	cairo_surface_t *capture;
+	bool eq;
+
+	/* Grab the captured reference frame from chamelium */
+	reference = convert_frame_dump_argb32(frame0);
+
+	/* Grab the captured frame from chamelium */
+	capture = convert_frame_dump_argb32(frame1);
+
+	if (frame0->size != frame1->size)
+		return false;
+
+	/* Now do the actual comparison */
+	eq = memcmp(frame0->bgr, frame1->bgr, frame0->size) == 0;
+
+	if (!eq && igt_frame_dump_is_enabled())
+		compared_frames_dump(reference, capture, 0, 0);
+
+	cairo_surface_destroy(reference);
+	cairo_surface_destroy(capture);
+
+	return eq;
+}
+
 /**
  * chamelium_assert_frame_eq:
  * @chamelium: The chamelium instance the frame dump belongs to
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 8882e13fb..b5d13ddc8 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -262,6 +262,9 @@ bool chamelium_frame_match_or_dump_frame_pair(struct chamelium *chamelium,
 					      const struct chamelium_frame_dump *frame0,
 					      const struct chamelium_frame_dump *frame1,
 					      enum chamelium_check check);
+bool chamelium_frame_eq_or_dump_frame_pair(const struct chamelium *chamelium,
+			                   const struct chamelium_frame_dump *frame0,
+			                   const struct chamelium_frame_dump *frame1);
 void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
 				 int height);
 void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
-- 
2.25.1

