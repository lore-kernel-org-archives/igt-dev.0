Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A348FC54E4A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 19:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E463C112691;
	Thu,  7 Mar 2024 19:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="J8PBDEr7";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9448F112691
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 19:41:29 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TrKRr6xgbzDqQx;
 Thu,  7 Mar 2024 19:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709840489; bh=hY/Zz9C3Jm+99TMScTM8fF8ojpz8FxTn1PqGrjWmaCI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=J8PBDEr7PtPWc//xEZehCq34NJVsznqvEG9XsX78ILBWDF41LwA5umwtc9yHGMn6T
 X0M2NgwZjZ8B2GVPHM2bPg2vXyxuzZI63kKWjWJLwxs0Sfxk5O47VAomSbNV2ySSWQ
 K7FTp9jjadLi3Ba2Td9k/6NoyGKswkZQHoI8H4AQ=
X-Riseup-User-ID: F5C197E9F3E355DC9A702BC06FCBA59B76643EABDF8685EE53C9D3863EB4257F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TrKRn6GLRzJtZV;
 Thu,  7 Mar 2024 19:41:25 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Thu, 07 Mar 2024 16:41:06 -0300
Subject: [PATCH i-g-t v3 4/7] benchmarks/kms_fb_stress: Free resources on
 the stress procedure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-kms_fb_stress-dev-v3-4-d5b948a541be@riseup.net>
References: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
In-Reply-To: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
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

On the stress_driver(), the fbs and the sync file are not released. Fix
that by freeing all the allocated resources.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index ba4af5970796..c3b32072384e 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -165,11 +165,30 @@ static void stress_driver(struct data_t *data)
 		igt_output_set_writeback_fb(data->wb_output, &data->kms.writeback.fbs[fb_index]);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		if (data->wb_output->writeback_out_fence_fd != -1) {
+			close(data->wb_output->writeback_out_fence_fd);
+			data->wb_output->writeback_out_fence_fd = -1;
+		}
 	}
 
 	igt_assert_eq(igt_gettime(&now), 0);
 	elapsed = igt_time_elapsed(&then, &now);
 
+	igt_plane_set_fb(data->kms.primary.base, NULL);
+	igt_plane_set_fb(data->kms.overlay_a.base, NULL);
+	igt_plane_set_fb(data->kms.overlay_b.base, NULL);
+	igt_output_set_writeback_fb(data->wb_output, NULL);
+
+	for (int i = 0; i < NUM_FBS; i++) {
+		igt_remove_fb(data->fd, &data->kms.primary.fbs[i]);
+		igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
+		igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
+		igt_remove_fb(data->fd, &data->kms.writeback.fbs[i]);
+	}
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
 	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
 }
 

-- 
2.43.0

