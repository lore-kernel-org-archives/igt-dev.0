Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03484606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GKov4I8Y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840D810E93B;
	Thu, 26 Nov 2026 08:46:56 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0410E082
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 03:00:39 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1b563e32936so2425394c88.1
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 19:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795662038; x=1796266838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RzT8IR75v36VDM3xO36eZkot3IvqqB0H0mN8yr4puAE=;
 b=GKov4I8Y+suKhG1L2kPFcjteCSS9r//yftIgUyfZy8T31cc96td9B44NQRSNtE3WuZ
 0zKRUEhKuqqRB9sBlYaaxOyeI7SoK9KJ91mEpqHL5cNDOuybFEGvZcQQiO5iqi8Mn7gk
 mSNGiYD0saNsfWUQJEfqm8EeLbZiB2QE2/bem3efGeN0flr0dCrUVzWh32/gpVQ0/KQg
 kxsOviUUHA9NOHh6eeoR0mdQzmEzwYaJi49c73/IpwLGlo0aa2vGvdEoFh24EaPdx//W
 gg2iCFIH2Cam6bBvqJsJu3Bb0G/v9+PKsn7SUHshxsCvRj1zAQQPG+hoJRYyj+m9ScF+
 Q5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795662038; x=1796266838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RzT8IR75v36VDM3xO36eZkot3IvqqB0H0mN8yr4puAE=;
 b=kvM0AQkgKkl4nqi+eefrB/16STdspLzEnqT4LhP6nkwDhk4um5Y6DybH+Z3QfTDppi
 0zeydv0xJ8f9eYLOYkq31HtvtYjptxBQIytDX2gl9wNlSscWHaC8Q2EyCvpJP5EJG0ya
 zFrF1TTc1RpiBP8rvSX/9BuK0XgseFsE8WzndtqlcxKB0fT1pJiSV8zBmJoyEtq4ghSd
 iQRoKyEU0HZMN+HR9zkuDa0eEFCRPAYo1vJp5JbqYPvU7Nj8mL3eC5WssdjaQbJpL8Cb
 oHaPpighDCZjhqrM/HLhjNdkmIwj+8112EYRsQhc6PjW2umxgacqNLnLzPXblhlCIMi7
 A81Q==
X-Gm-Message-State: APuU4Z8DH0Jd+R99+kk0JuXZRTlAr/9lQqTOAZ3FLWJQYpPEu43i1FDS
 I73JIgg2M+ZhQz8fRL08IxT9jMtAsFCkcreRZy6sgX7KQo2tPI4SlH7b4LTVWlmM
X-Gm-Gg: AZFdTZdJzFNuPwhIXCfanKHYCbzIWinQ73kIvubz/CbjwH769WbFhYyKW7gwf24JvOt
 b0WTEE1ztliyCQ2I0u6T+Ba/dc9rSk19WMnXZVfR7oZs6+seEImsS3i1vYxAobEUIsuO8DxHRo+
 QXZbrAWcyYvvrSaxvi03Eo6szl/7TPjquLra1GaUnGtxf2mMvJ5P7xkh3fXYUvRzpp2wGTlaiQl
 OyRdGFqFaoaXWd7/ik316F6TuUrPdR15aJodrj7iEpSHd6cFPPglEJlyj+apKfPgfSaNDnvMw7k
 POBuOGROLBncw+Uis2RWMFIE/j7nKXq0QxCk2pEi50IsxdaleZS36RD4Abely4R81aOcSqgyBNI
 9cGkJAAdvxgZzB8YIxDBs2xs8kqmg6BBxZ8+8tTwVEE7e2nJxY2FHgXx9yFJ6LgupgJw2sFDjV0
 y6GqSYCzd09g0cXrD8jFqLoCrMsJeOAGRmUzpdU83OZMJUNOM1tZyZ8DSLeF8pr3M4o41qKHHKd
 Bp4iTfBlzKRdDi9ztAeL1sINbkBLwc5DpIwzqkdFhHLlAUxm3sDqpJUcv7/8J3LQrXFxKlDOcWC
 sMHM7Tt2gjFet6XzIQ8/IC35C5ipH/ah8q3wRPpqqhdU5aJxxlqzLBTae5npYtM1OYcE9b4zhLg
 YypzF7G18tQ==
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id
 a92af1059eb24-1b55693aaabmr26898575c88.38.1795662037854; 
 Wed, 25 Nov 2026 19:00:37 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net.
 [36.226.201.204]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55682d301sm46179253c88.10.2026.11.25.19.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 19:00:37 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Roy <rongh7426@gmail.com>
Subject: [PATCH i-g-t] tests/kms_vblank: Query the pipe under test in the
 invalid subtest
Date: Thu, 26 Nov 2026 11:00:34 +0800
Message-ID: <20261126030034.641144-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Nov 2026 08:45:46 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

invalid_subtest() sets up data->crtc but builds its vblank requests
without the pipe flag, so every request goes to CRTC 0. The other
subtests add igt_crtc_get_vbl_flag(data->crtc).

That breaks on hardware where the output under test can't be driven by
CRTC 0. On a Raspberry Pi 5 (vc4), HDMI-A-1 only works with pipe C, so
CRTC 0 is off and the first, valid query already fails:

  Starting dynamic subtest: pipe-C-HDMI-A-1
  (kms_vblank) CRITICAL: Failed assertion: wait_vblank(fd, &vbl) == 0
  (kms_vblank) CRITICAL: Last errno: 22, Invalid argument
  Subtest invalid: FAIL

The invalid-flag checks after it have the same problem: with CRTC 0
off, an -EINVAL can't tell a rejected flag from a CRTC that isn't
running.

Add the pipe flag to the valid query and to the invalid-flag checks.
The final check, which asks for an out-of-range pipe on purpose, is
left as is.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39): the
invalid subtest fails before and passes after.

This change and its description were written with the help of an AI
coding assistant (Claude); the test runs above were done on real
hardware.

Signed-off-by: Roy <rongh7426@gmail.com>
---
 tests/kms_vblank.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 47b733a..018bc6f 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -582,12 +582,14 @@ static void invalid_subtest(data_t *data, int fd)
 	union drm_wait_vblank vbl;
 	unsigned long valid_flags;
 	igt_output_t *output = data->output;
+	uint32_t crtc_flag;
 
 	prepare_crtc(data, fd, output);
+	crtc_flag = igt_crtc_get_vbl_flag(data->crtc);
 
 	/* First check all is well with a simple query */
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = _DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE | crtc_flag;
 	igt_assert_eq(wait_vblank(fd, &vbl), 0);
 
 	valid_flags = (_DRM_VBLANK_TYPES_MASK |
@@ -596,7 +598,7 @@ static void invalid_subtest(data_t *data, int fd)
 
 	/* pick some interesting invalid permutations */
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = _DRM_VBLANK_RELATIVE | ~valid_flags;
+	vbl.request.type = _DRM_VBLANK_RELATIVE | crtc_flag | ~valid_flags;
 	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
 	for (int bit = 0; bit < 32; bit++) {
 		int err;
@@ -605,7 +607,7 @@ static void invalid_subtest(data_t *data, int fd)
 			continue;
 
 		memset(&vbl, 0, sizeof(vbl));
-		vbl.request.type = _DRM_VBLANK_RELATIVE | (1 << bit);
+		vbl.request.type = _DRM_VBLANK_RELATIVE | crtc_flag | (1 << bit);
 		err = wait_vblank(fd, &vbl);
 		igt_assert_f(err == -EINVAL,
 			     "vblank wait with invalid request.type bit %d [0x%08x] did not report -EINVAL, got %d\n",
-- 
2.51.1.windows.1

