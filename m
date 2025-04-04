Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB641C3601E
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 07:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2AF10EA5F;
	Fri,  4 Apr 2025 07:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLylBcKX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0662010EA5F
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 07:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743751450; x=1775287450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7UyII46PVEU3IaN83TckYWr6QZAslBypMsEH51f3jNI=;
 b=dLylBcKXIJCHJUAge8rglPbxaxAZAyYKdxv6Q8qpggBmH2t2GPCq0/Gp
 0Z78sS4E8Zc1aJzicnNxNiY5GngYq7Un1YUuKX+JFyiI/+X2TkxM7lRn/
 WP7mStA3Z/wJVe9CISv8ToXY0D674e8CdbNAs6DWAonZNj4dfWgl2dPRB
 y0a5cB4V/0cV5rCrtAAvPljB0QodyBlRgkyrf6+y6CPzfBhin6w/9dNqX
 G1AdwToqqyv1Ca4Q1QoSa5iN07i6yYAJ/762fp+krT/8fbDiilKmE3Fdj
 iaDQVSRVhAzYE+Oif9UyHctQLBu93R/BEDrwySLJ7Z2eJIA4VUvQukuid w==;
X-CSE-ConnectionGUID: 55g0CTmSRMOv+KFfuN6SQg==
X-CSE-MsgGUID: qTYuNdclQVKZw+iJn7gjvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45359300"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45359300"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:10 -0700
X-CSE-ConnectionGUID: C6tTVNmLRC63UmXNHxOs9A==
X-CSE-MsgGUID: fGBr/h/DSlO0504VrJ+LDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132361882"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:08 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, juhapekka.heikkila@gmail.com,
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t, v2 1/3] lib/igt_chamelium: Add
 chamelium_frame_match_or_dump_frame_pair()
Date: Fri,  4 Apr 2025 12:59:28 +0530
Message-Id: <20250404072930.695363-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404072930.695363-1-swati2.sharma@intel.com>
References: <20250404072930.695363-1-swati2.sharma@intel.com>
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
dumps captured from chamelium. If they do not, this saves the
reference and captured frames to a png file.

v2: -let crc be computed from compared_frames_dump() (Chaitanya)
    -remove passing of reference_crc (Chaitanya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_chamelium.c | 46 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_chamelium.h |  5 +++++
 2 files changed, 51 insertions(+)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 620fbbf7d..c86773898 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2070,6 +2070,52 @@ bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
 	return match;
 }
 
+/**
+ * chamelium_frame_match_or_dump_frame_pair:
+ * @chamelium: The chamelium instance the frame dump belongs to
+ * @frame0: The chamelium reference frame dump to match
+ * @frame1: The chamelium capture frame dump to match
+ * @check: the type of frame matching check to use
+ *
+ * Returns bool that the provided captured frames matches.
+ * If they do not, this saves the frames to a png file.
+ */
+bool chamelium_frame_match_or_dump_frame_pair(struct chamelium *chamelium,
+					      struct chamelium_port *port,
+					      const struct chamelium_frame_dump *frame0,
+					      const struct chamelium_frame_dump *frame1,
+					      enum chamelium_check check)
+{
+	cairo_surface_t *reference;
+	cairo_surface_t *capture;
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
+	if (!match && igt_frame_dump_is_enabled())
+		compared_frames_dump(reference, capture, 0, 0);
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
index d979de4a2..8882e13fb 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -257,6 +257,11 @@ bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
 				   const struct chamelium_frame_dump *frame,
 				   struct igt_fb *fb,
 				   enum chamelium_check check);
+bool chamelium_frame_match_or_dump_frame_pair(struct chamelium *chamelium,
+					      struct chamelium_port *port,
+					      const struct chamelium_frame_dump *frame0,
+					      const struct chamelium_frame_dump *frame1,
+					      enum chamelium_check check);
 void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
 				 int height);
 void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
-- 
2.25.1

