Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5B3CCF9EB
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 07:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBCF10EABD;
	Fri, 31 Oct 2025 07:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miB9RZak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ECB10EABC
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897551; x=1793433551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=edFfmdXfgP0xi/PpKs/VrV65v2XUITLI2Ke1mhzrlwc=;
 b=miB9RZakSyzvptUviXzKIKoSL6iwWOKLyJIn8NrGvA3OXiuF9Lj2hkvi
 rFgz3JBCVPy+LPZa9a0dIZtGx5Vks+vDaUCHTMwlm3HoJoh7tX/WN+QtD
 +L4uNsHrfFhhT7dUzONdAeAeMrrbPfrZu7xoOEmp1PhyCTH4qbJSiLRwX
 28ExAKG1hvLSReyhq0fV4LQgsPyDr0PE9ReE3OjfILIR3wMUDO48L7cC0
 OaurOhYJiv3ZfibPsKof3GDoO0/cbrBzjHleCLIQV5fU71Iv2rM6APRZM
 Igfp6AtM18admKys6y1t1bh4hD/mEtMEyjZAA0YB4tgd3LAB8vaYdwtXL A==;
X-CSE-ConnectionGUID: r/FmlL7kS6eBSFI/iJr8YQ==
X-CSE-MsgGUID: OhKfLNrxSzmdsMzRBWT4SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75169905"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75169905"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 00:59:11 -0700
X-CSE-ConnectionGUID: Fn4mVZNTTi2JY2F+EVoidQ==
X-CSE-MsgGUID: 8sWFbvUrTyeMMIH2kg0/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186287431"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:59:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t, v2 09/10] lib/igt_chamelium: Add
 chamelium_frame_eq_or_dump_frame_pair()
Date: Fri, 31 Oct 2025 13:35:33 +0530
Message-Id: <20251031080534.880321-10-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
References: <20251031080534.880321-1-swati2.sharma@intel.com>
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

v2: -rephrase func() desc (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_chamelium.c | 38 ++++++++++++++++++++++++++++++++++++++
 lib/igt_chamelium.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index d19a78ffa..cb240a7df 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -1897,6 +1897,44 @@ static void compared_frames_dump(cairo_surface_t *reference,
 	free(capture_suffix);
 }
 
+/**
+ * chamelium_frame_eq_or_dump_frame_pair:
+ * @chamelium: The chamelium instance the frame dump belongs to
+ * @frame0: The chamelium frame dump to check
+ * @frame1: The chamelium frame dump to check
+ *
+ * Returns true if frames are identical. If they are not, saves the frames
+ * to a png file and returns false.
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

