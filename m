Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AABD10DCF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 08:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8022A10E677;
	Mon,  2 Dec 2024 08:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KSnC/E6q";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24A810E06D
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Dec 2024 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MSMg3Ha+E/q2q2YLi1zOP1aQr27vtjJNh6UUMlSyu2E=; b=KSnC/E6qd4x6FRry5DYxpg6pLY
 Zu0LzFnuieC7Eyhvg6+MBgpGBYZIJ1amcYmp+qi34siKufTzgNBxEDC0SjCa+Vh1f/uDgTOaJCds/
 k1nDvgQLsC5FxIl+FhfEtnZ4tgcgLjxUGhnt4FDHxON8W4IH/LdUHKxgppNhmvjB70CdYU2G/JgWb
 GLGIwf/cgrRHv/9EIGAGO2EaXPxARgqok5AQFDu3gcb2Iymgkxy3dLHfJoIT5+2+vPkrZ39t6Iglo
 sezL2RvU59/CmuADlSYTjmjWw/GMtHsi3pVhpRrFhAOukn3Zn/N2imR5zBVaGAeLtUO/cGOJkICpK
 u4oNJYOQ==;
Received: from [177.139.20.227] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tHoqk-00F4Q3-FF; Sun, 01 Dec 2024 19:39:18 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 kernel-dev@igalia.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 1/1] tests/kms_async_flips: add atomic test
Date: Sun,  1 Dec 2024 15:38:41 -0300
Message-ID: <20241201183841.71046-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241201183841.71046-1-andrealmeid@igalia.com>
References: <20241201183841.71046-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Dec 2024 08:56:47 +0000
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

From: Simon Ser <contact@emersion.fr>

This adds a simple test for DRM_MODE_PAGE_FLIP_ASYNC with the
atomic uAPI.

Signed-off-by: Simon Ser <contact@emersion.fr>
[Rebased and added modeset commit]
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 tests/kms_async_flips.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..ce02db8e7 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -331,6 +331,42 @@ static void test_async_flip(data_t *data)
 	}
 }
 
+static void test_async_flip_atomic(data_t *data)
+{
+	int frame;
+	long long int fps;
+	struct timeval start, end, diff;
+
+	test_init(data);
+
+	/*
+	 * Async flips doesn't allow mode sets, so do a initial sync flip
+	 * setting this mode
+	 */
+	igt_plane_set_fb(data->plane, &data->bufs[0]);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, data);
+
+	gettimeofday(&start, NULL);
+	frame = 1;
+	do {
+		uint32_t flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+
+		igt_plane_set_fb(data->plane, &data->bufs[frame % 4]);
+		igt_display_commit_atomic(&data->display, flags, data);
+
+		wait_flip_event(data);
+
+		gettimeofday(&end, NULL);
+		timersub(&end, &start, &diff);
+
+		frame++;
+	} while (diff.tv_sec < RUN_TIME);
+
+	fps = frame * 1000 / RUN_TIME;
+	igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
+		     "FPS should be significantly higher than the refresh rate\n");
+}
+
 static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int *seq)
 {
 	drmVBlank wait_vbl;
@@ -765,6 +801,14 @@ igt_main
 		run_test(&data, test_async_flip);
 	}
 
+	igt_describe("Verify the async flip functionality and the fps during atomic async flips");
+	igt_subtest_with_dynamic("atomic-async-flip") {
+		require_monotonic_timestamp(data.drm_fd);
+		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+			      "Atomic async page-flips are not supported\n");
+		run_test(&data, test_async_flip_atomic);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.47.0

