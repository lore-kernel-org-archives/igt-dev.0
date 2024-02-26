Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1044BC5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 19:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141510E7BE;
	Mon, 26 Feb 2024 19:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="F7i3lrz+";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB7210E7BE
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 19:42:44 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tk9xv6Jcvz9s6r;
 Mon, 26 Feb 2024 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708976564; bh=5QVTFGxc6r8dPOgLQq8IvYN3JuQISFhGvIk/srVluNM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=F7i3lrz+TS2k0DkDSi6GD8Tp+2gUVJO0viU3VPWmFeNF4Fl9p5NvGNIrzZwCRs8Te
 iirPyzuMCRM+V6ojesLPT51fR+5Pd/PsLKEdFE0AF8fBRGdCxM6kLjH1C0Ubb9XWbO
 CjvDJAlZ0i280eGy42M1KNp87d9JmSnjH1Dmquzc=
X-Riseup-User-ID: 9CD4CD522C1ABDA0ED2165B25BCEC70C16F2CDCBCEAE79C0D79778BFDE2566E2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tk9xr5FCgzFt7B;
 Mon, 26 Feb 2024 19:42:40 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 26 Feb 2024 16:42:18 -0300
Subject: [PATCH i-g-t 2/3] benchmarks/kms_fb_stress: Add command line
 options to change the planes and writeback formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-kms_fb_stress-dev-v1-2-1c14942b1244@riseup.net>
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

Currently, the plane formats are hard-coded, with no possibility of
changing them when running the benchmark. Change that by adding command
line options to change the planes and writeback formats.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 50 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 8fea10ef069f..073104b8e4f8 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -125,7 +125,7 @@ static void set_crtc_size(struct data_t *data)
 	igt_assert_f(0, "CRTC size %dx%d not supported\n", crtc->width, crtc->height);
 }
 
-static struct kms_t default_kms = {
+static const struct kms_t default_kms = {
 	.crtc = {
 		.width = 4096, .height = 2160,
 	},
@@ -159,14 +159,56 @@ static struct kms_t default_kms = {
 	},
 };
 
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	struct data_t *data = _data;
+	struct kms_t *kms =  &data->kms;
+
+	*kms = default_kms;
+
+	switch (opt) {
+	case 'p':
+		kms->primary.format = igt_drm_format_str_to_format(optarg);
+		break;
+	case 'a':
+		kms->overlay_a.format = igt_drm_format_str_to_format(optarg);
+		break;
+	case 'b':
+		kms->overlay_b.format = igt_drm_format_str_to_format(optarg);
+		break;
+	case 'w':
+		kms->writeback.format = igt_drm_format_str_to_format(optarg);
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char *help_str =
+	"  --primary-format\t\tSelect the primary plane format (default: XRGB8888)\n"
+	"  --overlay-a-format\t\tSelect the overlay A plane format (default: XRGB16161616)\n"
+	"  --overlay-b-format\t\tSelect the overlay B plane format (default: ARGB8888)\n"
+	"  --writeback-format\t\tSelect the writeback format (default: XRGB8888)\n";
+
+static const struct option long_options[] = {
+	{ .name = "primary-format", .has_arg = true, .val = 'p'},
+	{ .name = "overlay-a-format", .has_arg = true, .val = 'a'},
+	{ .name = "overlay-b-format", .has_arg = true, .val = 'b'},
+	{ .name = "writeback-format", .has_arg = true, .val = 'w'},
+	{}
+};
+
+static struct data_t data = {
+	.kms = default_kms,
+};
 
-igt_simple_main
+igt_simple_main_args(NULL, long_options, help_str, opt_handler, &data)
 {
-	struct data_t data = {0};
 	struct timespec then, now;
 	double elapsed;
 
-	data.kms = default_kms;
 
 	data.fd = drm_open_driver_master(DRIVER_ANY);
 

-- 
2.43.0

