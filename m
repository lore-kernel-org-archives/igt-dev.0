Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A373606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7YEdTqi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35C511227A;
	Thu, 26 Nov 2026 10:02:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405BE1121E0
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687068; x=1827223068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OTTKn2QyG0/UR6I4crJHjHz/Xxz8OgZl0RCbLhoNYZY=;
 b=O7YEdTqi9g+hrXPWLqxOC3NgyLwlDH7UirEpDxzn56n0ighsczPuBclY
 XEi/9GH7EMTA+VZ8zRIWn2ewAnoXAr2S7rLU+Na3DzV7KPpZC4dS3m5qN
 qeBtmEB1uSvJkqf4nWxp/f9Wtmt4kgzLVNK/mUwU4+4f5/Cyztg3g/4dg
 cZPdtOR4JpdvQMI+O4pC09nQMHiBVOHiF8a341+GQkXbke+Lapb0sP0UN
 HFaNJHHHrnx/fQAQHmfgB8cUFQBeEGOd6BNPV+cmzsj02KlVKZgE6jDay
 +0oxri3qs35L/+Xxj+tIGwbymvwICjQ0Wj3imMF7x9IIfGhOcWToFx/gJ A==;
X-CSE-ConnectionGUID: koWe3JBrTny/y2mAyecUOw==
X-CSE-MsgGUID: rT8Cd/oTTYGh6mB5g/vvRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4475182"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4475182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:37:19 -0800
X-CSE-ConnectionGUID: ebcV5gwBQp2m81j96S1crA==
X-CSE-MsgGUID: BCKHKQ9BTy6XbxaXhCB/4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12386914"
Received: from slindbla-desk.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.159])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:31:07 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com
Subject: [PATCH i-g-t 2/3] tests/kms_cursor_crc: clean up after a failed
 subtest
Date: Thu, 26 Nov 2026 10:48:20 +0200
Message-ID: <20261126093003.492469-3-luciano.coelho@intel.com>
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

When a subtest fails, for instance on a CRC mismatch, it exits
before calling cleanup_crtc().  The cursor and its FB are then still
on screen when the test ends, so the next test that counts
framebuffers, such as kms_universal_plane@cursor-fb-leak, finds one
FB more at the start than at the end.

To fix this, call cleanup_crtc() from prepare_crtc() and at the end of
the test if pipe_crc is still set, because that means the previous
subtest didn't clean up.  Also use igt_display_reset() in
cleanup_crtc(), so the cursor plane is reset as well and not only the
output and the primary plane.  The igt_pipe_crc_free() in
prepare_crtc() is unnecessary now, since cleanup_crtc() already frees
the CRC.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_cursor_crc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 6334f8f775c8..a060f8e24f6d 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -565,8 +565,8 @@ static void cleanup_crtc(data_t *data)
 	cairo_surface_destroy(data->surface);
 	data->surface = NULL;
 
-	igt_output_set_crtc(data->output, NULL);
-	igt_plane_set_fb(data->primary, NULL);
+	/* Reset all planes, so the cursor FB doesn't stay attached */
+	igt_display_reset(display);
 	igt_display_commit(display);
 
 	igt_remove_fb(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
@@ -581,6 +581,10 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	cairo_t *cr;
 	igt_output_t *output = data->output;
 
+	/* Clean up after a failed subtest */
+	if (data->pipe_crc)
+		cleanup_crtc(data);
+
 	igt_display_reset(display);
 
 	/* select the pipe we want to use */
@@ -609,8 +613,6 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	igt_display_commit(display);
 
 	/* create the pipe_crc object for this pipe */
-	if (data->pipe_crc)
-		igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
@@ -1321,10 +1323,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		run_tests_on_pipe(&data);
 
 	igt_fixture() {
-		if (data.pipe_crc != NULL) {
-			igt_pipe_crc_stop(data.pipe_crc);
-			igt_pipe_crc_free(data.pipe_crc);
-		}
+		if (data.pipe_crc)
+			cleanup_crtc(&data);
 
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.53.0

