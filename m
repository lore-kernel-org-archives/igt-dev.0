Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62004606A333
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=etHowqMG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29AE11227B;
	Thu, 26 Nov 2026 10:01:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7A112239
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687073; x=1827223073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6TqHtENWlvAGyDmVvOYz8jS6SlR9tZuGxIpsdBc/7Hw=;
 b=etHowqMGGqPX3TIBfDhU1lllPb3uQqHPdDOmgCKV9ivcdVJuJG6icm5i
 3xzyvqBLDco/zpKUBOZeY5gnJ43H7t9R+1Iok6B29ptTRb0ZzG4Mzggzl
 oDk0N0ILC5QHwC1wNiponDZ9u/MRDZDBHeEJAk64353ATA4t3H+xuxVHq
 QL8fuCw0mC+ZlCFudWkaQLfHIhI1gIoZBictZiwklULhL4psUDQFns7lr
 hI2PBwxl4Ch77nWBOyv7HGTuOpNjQWTWnET15oqwFWbM227D9BY1u1fLE
 6+K17Nyea7KcxOPTmO500ReEBDi7rqa823cqhJvVb6LXbAQJK94N4Z5S1 Q==;
X-CSE-ConnectionGUID: 4pykJmM/Q9GD4DjOO0Kt3g==
X-CSE-MsgGUID: haHMEJ8wR+ejv7ESTAeMEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4475183"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4475183"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:37:19 -0800
X-CSE-ConnectionGUID: d2nHn2PSQDeW/w5VLTmD3A==
X-CSE-MsgGUID: BHj9vRSjR6iyG7FCc4R5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12386934"
Received: from slindbla-desk.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.159])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:31:08 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com
Subject: [PATCH i-g-t 3/3] tests/kms_universal_plane: count FBs after the
 first commit
Date: Thu, 26 Nov 2026 10:48:21 +0200
Message-ID: <20261126093003.492469-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126093003.492469-1-luciano.coelho@intel.com>
References: <20261126093003.492469-1-luciano.coelho@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cursor_leak_test_crtc() counts the framebuffers before creating its
own FBs and again after releasing them, and expects the same number.
If an earlier test left an FB on screen, for instance because
kms_cursor_crc failed before cleaning up, that FB is included in the
first count but our first commit releases it.  The second count is
then one lower and the test fails the count1 == count2 assertion,
even though nothing leaked.

Take the first count after the first commit instead, after waiting
for the same 2 vblanks as before the second count so that the old FB
is really gone, and subtract our own FBs, which already exist at that
point.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_universal_plane.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index b01fb3d756f7..291e4a6e3422 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -650,9 +650,6 @@ cursor_leak_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
-	/* Count GEM framebuffers before creating our cursor FB's */
-	count1 = intel_gem_fb_count(data);
-
 	/* Black background FB */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
@@ -684,6 +681,14 @@ cursor_leak_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 	igt_plane_set_fb(primary, &background_fb);
 	igt_display_commit2(display, COMMIT_LEGACY);
 
+	/*
+	 * Count after our first commit, which releases FBs left by earlier
+	 * tests, and don't count our own FBs.  This assumes one line per FB
+	 * in the debugfs file, since intel_gem_fb_count() counts the lines.
+	 */
+	igt_wait_for_vblank_count(crtc, 2);
+	count1 = intel_gem_fb_count(data) - (ARRAY_SIZE(cursor_fb) + 1);
+
 	igt_plane_set_position(cursor, 100, 100);
 
 	/*
-- 
2.53.0

