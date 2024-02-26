Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909F8C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 19:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699910E7BA;
	Mon, 26 Feb 2024 19:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="b61NPK26";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EB410E7B2
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 19:42:40 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tk9xr01qcz9tdb;
 Mon, 26 Feb 2024 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708976560; bh=+OOO77HS/VEtai+q+k+XSBu94X1OtXG3DJkl+fpINKc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=b61NPK26D5q9uVOHaOwfV+1cj3CkDjhCY+c8Ml4LMqcjEvidXIZuExhoa45AXaHhb
 AJqBmtf79zQkNPthWjV3mHKQiv+RcwXT1Zn0PGbkU+w/MeQZ35ZVNKURcmI4hcPVFs
 Tw41ufxR2peaQsmpo00vgQhC6plAsKz3xy1ATBck=
X-Riseup-User-ID: 9FC659888962502853235C9C20557366A19DDC4FFA3BD3664609982BB5237643
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4Tk9xn3xt2zFtBt;
 Mon, 26 Feb 2024 19:42:37 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 26 Feb 2024 16:42:17 -0300
Subject: [PATCH i-g-t 1/3] benchmarks/kms_fb_stress: Assert that we have an
 supported pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-kms_fb_stress-dev-v1-1-1c14942b1244@riseup.net>
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

Some driver may not support overlay planes. Add a check for that.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 9a0e98bed8ad..8fea10ef069f 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -87,6 +87,27 @@ static igt_output_t *find_wb_output(struct data_t *data)
 	return NULL;
 }
 
+static void set_wb_pipe(struct data_t *data)
+{
+	enum pipe pipe = PIPE_NONE;
+
+	for_each_pipe(&data->display, pipe) {
+		igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
+
+		if (igt_pipe_count_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY) < 2)
+			continue;
+
+		igt_debug("Selecting pipe %s to %s\n",
+			  kmstest_pipe_name(pipe),
+			  igt_output_name(data->wb_output));
+		igt_output_set_pipe(data->wb_output, pipe);
+
+		return;
+	}
+
+	igt_assert_f(0, "No pipe supports this benchmark\n");
+}
+
 static void set_crtc_size(struct data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -142,7 +163,6 @@ static struct kms_t default_kms = {
 igt_simple_main
 {
 	struct data_t data = {0};
-	enum pipe pipe = PIPE_NONE;
 	struct timespec then, now;
 	double elapsed;
 
@@ -163,24 +183,22 @@ igt_simple_main
 
 	data.wb_output = find_wb_output(&data);
 	igt_require(data.wb_output);
-
-	for_each_pipe(&data.display, pipe) {
-		igt_debug("Selecting pipe %s to %s\n",
-			  kmstest_pipe_name(pipe),
-			  igt_output_name(data.wb_output));
-		igt_output_set_pipe(data.wb_output, pipe);
-		break;
-	}
+	set_wb_pipe(&data);
 
 	set_crtc_size(&data);
 
 	gen_fbs(&data);
 
 	data.kms.primary.base = igt_output_get_plane_type(data.wb_output, DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(data.kms.primary.base != NULL);
+
 	data.kms.overlay_a.base = igt_output_get_plane_type_index(data.wb_output,
 								  DRM_PLANE_TYPE_OVERLAY, 0);
+	igt_assert(data.kms.overlay_a.base != NULL);
+
 	data.kms.overlay_b.base = igt_output_get_plane_type_index(data.wb_output,
 								  DRM_PLANE_TYPE_OVERLAY, 1);
+	igt_assert(data.kms.overlay_b.base != NULL);
 
 	igt_assert_eq(igt_gettime(&then), 0);
 

-- 
2.43.0

