Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D710C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 19:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1566610E7C3;
	Mon, 26 Feb 2024 19:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="nDpGq0vG";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C850410E7BE
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 19:42:47 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tk9xz3KZjz9s6r;
 Mon, 26 Feb 2024 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708976567; bh=4lAccvqFbojM5SADA/NWyhWD6pd0Y8aIGzwGUjZmIqk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nDpGq0vGvXFpKF3tKAJhlPjYwPo8sQO8kqypdqfRmGs3caEeP45duQUsLGvqyfCN7
 SxDEwcFuiNgF/eUqIbjcMXs/QaKEhY78wlnVE5t18SU52Z90MI26+OJUr2WFiPhrte
 mxcM+7Hcg1KCI1B9BV/nB44CWRDcS5DHVzCP36w0=
X-Riseup-User-ID: 797EAB370612057A34B51FA175FE9A201CD4FE7750CFE0694E38D74C3AF52E72
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tk9xw1HSwzFt7B;
 Mon, 26 Feb 2024 19:42:43 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 26 Feb 2024 16:42:19 -0300
Subject: [PATCH i-g-t 3/3] benchmarks/kms_fb_stress: Log the KMS structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-kms_fb_stress-dev-v1-3-1c14942b1244@riseup.net>
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
In-Reply-To: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>
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

Now that we can change the planes and writeback formats, log the KMS
structure to the user.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 073104b8e4f8..ee34df3da826 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -8,6 +8,9 @@
 #define FRAME_COUNT 100
 #define NUM_FBS 2
 
+#define RECT_FMT    "%dx%d%+d%+d"
+#define RECT_ARG(r) (r)->width, (r)->height, (r)->x, (r)->y
+
 struct rect_t {
 	int x, y;
 	int width, height;
@@ -209,7 +212,6 @@ igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
 	struct timespec then, now;
 	double elapsed;
 
-
 	data.fd = drm_open_driver_master(DRIVER_ANY);
 
 	igt_display_require(&data.display, data.fd);
@@ -231,6 +233,22 @@ igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
 
 	gen_fbs(&data);
 
+	igt_info("KMS structure:\n");
+	igt_info("\tCRTC:\n");
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.crtc));
+	igt_info("\tprimary:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.primary.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.primary.rect));
+	igt_info("\toverlay A:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_a.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_a.rect));
+	igt_info("\toverlay B:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.overlay_b.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.overlay_b.rect));
+	igt_info("\twriteback:\n");
+	igt_info("\t\tformat: %s\n", igt_format_str(data.kms.writeback.format));
+	igt_info("\t\trectangle: " RECT_FMT "\n", RECT_ARG(&data.kms.writeback.rect));
+
 	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
 	igt_assert(data.kms.primary.base != NULL);
 

-- 
2.43.0

