Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E6AC3600C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 09:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF8E10E095;
	Mon, 24 Mar 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYH26gm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AC510E081
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742807069; x=1774343069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zCwbHUc2b8gmDQnHB+uHU70GKD3ZR7DdO8W4+RZBDbU=;
 b=lYH26gm6TuARhep26jWaBzvc4QJ8hzxkV6pEGfswS4prNlfUvIg6hTNA
 C6LoipYzaSVXZCF1wYPNaAqfWXyOwyiVUgeojNVGLCcoxNTQwOgCMPkRg
 b3QrgX/z/z2jSDH5bArSm5WJxXzIHM5H2qL9cP0G4a4lPnWOT4ICozlV/
 tFHEIfhhbBZ3/cINbTJ3Ek5c5UmYvUh7irxjEhDVi1Kg5EgyNTQZ381cp
 T3sHegVygESw6S3sLb9QOXefdQmBDFy5ZIJJ0sdcc/827UFl7lRX1C0n+
 6/8UG4Am2uu29HohYVXNyIDqBd6LOY+LH+s/Fmp0w20ZgFU9oQPa4BmQ5 A==;
X-CSE-ConnectionGUID: Us2NSHcvQdelNEvIVe6iLg==
X-CSE-MsgGUID: txD48p2oTwe7jksM30rH3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54999667"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="54999667"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:29 -0700
X-CSE-ConnectionGUID: NgucfYipQfigJGaaCtXesA==
X-CSE-MsgGUID: Is3rK3b/RlmBjdXhXhe8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="129097359"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:27 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Date: Mon, 24 Mar 2025 14:39:47 +0530
Message-Id: <20250324090949.614233-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324090949.614233-1-swati2.sharma@intel.com>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
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

Add chamelium_frame_match_or_dump_frame_pair() to compare frame
dumps captured from chamelium.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_chamelium.c | 60 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_chamelium.h |  6 +++++
 2 files changed, 66 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 620fbbf7d..44a169b29 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2070,6 +2070,66 @@ bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
 	return match;
 }
 
+/**
+ * chamelium_frame_match_or_dump:
+ * @chamelium: The chamelium instance the frame dump belongs to
+ * @frame0: The chamelium reference frame dump to match
+ * @frame1: The chamelium capture frame dump to match
+ * @reference_crc: CRC of chamelium reference frame
+ * @check: the type of frame matching check to use
+ *
+ * Returns bool that the provided captured frame matches the reference
+ * frame from the framebuffer. If they do not, this saves the reference
+ * and captured frames to a png file.
+ */
+bool chamelium_frame_match_or_dump_frame_pair(struct chamelium *chamelium,
+					      struct chamelium_port *port,
+					      const struct chamelium_frame_dump *frame0,
+					      const struct chamelium_frame_dump *frame1,
+					      igt_crc_t *reference_crc,
+					      enum chamelium_check check)
+{
+	cairo_surface_t *reference;
+	cairo_surface_t *capture;
+	igt_crc_t *capture_crc;
+	bool match;
+
+	/* Grab the captured reference frame from chamelium */
+	reference = convert_frame_dump_argb32(frame0);
+
+	/* Grab the captured frame from chamelium */
+	capture = convert_frame_dump_argb32(frame1);
+
+	switch (check) {
+	case CHAMELIUM_CHECK_ANALOG:
+		match = igt_check_analog_frame_match(reference, capture);
+		break;
+	case CHAMELIUM_CHECK_CHECKERBOARD:
+		match = igt_check_checkerboard_frame_match(reference, capture);
+		break;
+	default:
+		igt_assert(false);
+	}
+
+	if (!match && igt_frame_dump_is_enabled()) {
+		/* Get the captured frame CRC from the Chamelium. */
+		capture_crc = chamelium_get_crc_for_area(chamelium, port, 0, 0,
+							 0, 0);
+		igt_assert(capture_crc);
+
+		compared_frames_dump(reference, capture, reference_crc,
+				     capture_crc);
+
+		free(reference_crc);
+		free(capture_crc);
+	}
+
+	cairo_surface_destroy(reference);
+	cairo_surface_destroy(capture);
+
+	return match;
+}
+
 /**
  * chamelium_analog_frame_crop:
  * @chamelium: The Chamelium instance to use
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index d979de4a2..140d52c95 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -257,6 +257,12 @@ bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
 				   const struct chamelium_frame_dump *frame,
 				   struct igt_fb *fb,
 				   enum chamelium_check check);
+bool chamelium_frame_match_or_dump_frame_pair(struct chamelium *chamelium,
+					      struct chamelium_port *port,
+					      const struct chamelium_frame_dump *frame0,
+					      const struct chamelium_frame_dump *frame1,
+					      igt_crc_t *reference_crc,
+					      enum chamelium_check check);
 void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
 				 int height);
 void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
-- 
2.25.1

