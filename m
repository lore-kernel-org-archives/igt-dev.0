Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7C6C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 18:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B22710EFD7;
	Thu, 11 Apr 2024 18:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="jdKKFD+n";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0684910F08B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 18:51:27 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VFpgz2F6vzDqD7;
 Thu, 11 Apr 2024 18:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1712861487; bh=1nXG1ED2qLaYPJLXH4vLjInBe+IxYsPtje41CXuWZ6g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=jdKKFD+nmg4a6Eudiw+nKZ7tS1RDnBGTXWULu4Sgpoaky/h/DtUQ7rYpX0yu9qtlp
 PZsWRQr+tfDjIauzL+Rxh/wVPSwxVldBW2cZgu2f+pY8luxuQj1MEImuDgrj7Jo/tg
 cTzfFSs4O82Fbd1JIrnOSitkHuNyu+Mxmvwc/Xv8=
X-Riseup-User-ID: DAA36A2A59654B6BBF1FDC0EACF2FEC326419E26037788463D144AAD825C1ADC
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4VFpgw2GcMzJrlH;
 Thu, 11 Apr 2024 18:51:24 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 11 Apr 2024 15:51:11 -0300
Subject: [PATCH i-g-t v4 1/7] benchmarks/kms_fb_stress: Assert that we have
 an supported pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-kms_fb_stress-dev-v4-1-7a8f3a419ebb@riseup.net>
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
In-Reply-To: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index 00eaa0a4931a..e9c051318ed6 100644
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
 
@@ -161,24 +181,22 @@ igt_simple_main
 
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
2.44.0

