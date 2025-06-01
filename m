Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F0EC5B549
	for <igt-dev@archiver.kernel.org>; Sun,  1 Jun 2025 19:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6BD10E061;
	Sun,  1 Jun 2025 19:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZskgdhcH";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E61010E061
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Jun 2025 19:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b4TgfIx9Huy/uR6RHHgIWHOSQdjpsFynfer5V6X2wWw=; b=ZskgdhcHtO8gmfY1k/7hGKr0ob
 BN7A11j6Y9wNXiecJc/cjfyloRbHIK0kCmHVPGaBqufWD9uFrM95haD1l43lF5zU2MCSoU7vIf6UP
 +K3YxNEEjPS/mNBIHumspZliRBTIYz2EbbokkYUniMiXcK+xynM+pZlzUb+G0zc4R1Ocz1t0cN042
 tEt/g4mS61XnbKYH7rmMhT0x+itm4D7D0DaqKJjjPTK7RmEyj6q2vhLUjaXlg5XalHyItIi7RZojX
 ZmFilTXFDqBIdLHhaFC3YqbH3Q3uYjFpLlUNV7JMsF7FEhYv9acvCU7k0n1mtnlVlQ6ZJHLdzKm8y
 DOadfppg==;
Received: from [191.195.103.116] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uLoAO-00FzVn-Oj; Sun, 01 Jun 2025 21:16:21 +0200
From: Melissa Wen <mwen@igalia.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t 1/3] tests/amdgpu/amd_color: fix EINVAL failure in DCN2.1
Date: Sun,  1 Jun 2025 16:14:44 -0300
Message-ID: <20250601191459.46759-2-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250601191459.46759-1-mwen@igalia.com>
References: <20250601191459.46759-1-mwen@igalia.com>
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

Creating a 64x64 fb for primary returns EINVAL in DCN2.1, as below:

Starting subtest: crtc-lut-accuracy
(amd_color:14772) igt_kms-CRITICAL: Test assertion failure function igt_display_commit_atomic, file ../lib/igt_kms.c:4530:
(amd_color:14772) igt_kms-CRITICAL: Failed assertion: ret == 0
(amd_color:14772) igt_kms-CRITICAL: Last errno: 22, Invalid argument
(amd_color:14772) igt_kms-CRITICAL: error: -22 != 0
Stack trace:
  #0 ../lib/igt_core.c:1989 __igt_fail_assert()
  #1 [igt_display_commit_atomic+0x44]
  #2 ../tests/amdgpu/amd_color.c:159 __igt_unique____real_main395()
  #3 ../tests/amdgpu/amd_color.c:395 main()
  #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #6 [_start+0x21]
Subtest crtc-lut-accuracy failed.

crtc-lut-accuracy fails due to `[drm] Mode Validation Warning: Unknown
Status failed` likely related to dml/bandwidth limitation in this
hardware and therefore not related to any CRC mismatches. Use the
display size instead, as usual to all color tests, and also because
64x64 size seems unsupported by this hw.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/amdgpu/amd_color.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 4a98df3be..e34d11ef0 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -333,7 +333,7 @@ static void test_crtc_lut_accuracy(data_t *data)
 	igt_crc_t ref_crc, new_crc;
 	igt_fb_t afb;
 	lut_t lut_degamma, lut_regamma;
-	int i, w, h;
+	int i;
 
 	test_init(data);
 
@@ -352,11 +352,7 @@ static void test_crtc_lut_accuracy(data_t *data)
 	lut_init(&lut_regamma, data->regamma_lut_size);
 	lut_gen_regamma_srgb(&lut_regamma, 0xffff);
 
-	/* Don't draw across the whole screen to improve perf. */
-	w = 64;
-	h = 64;
-
-	igt_create_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_create_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &afb);
 	igt_plane_set_fb(data->primary, &afb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-- 
2.47.2

