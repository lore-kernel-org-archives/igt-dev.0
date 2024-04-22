Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A358FC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 22:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B7A112DDC;
	Mon, 22 Apr 2024 22:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="lBWVAJXd";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5FE112DDC
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 22:18:39 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VNflz07T0zDqJ4;
 Mon, 22 Apr 2024 22:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1713824319; bh=8nKFr0ohBAd1ONjltz2Ye4N0n2BldDgtOa5qQ8RErBs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lBWVAJXdRADeElBSwg+YBGhGEzdqBUOpncWqh2Zz0ZwDQIBmeiZO1PreNpNX+Sije
 iDfNiHZcir8pN9KwaCbM6OdhnX3WqnWmKO3lr4/lP6R9kFr6LomXPRs14BKOpeSIgw
 uvm88cs9eDBkB21Kv9O8QFvKeHC+93kLIUmScPf4=
X-Riseup-User-ID: 020D63806991B020551BE7456EAA2CE048994D8E7E91989F727E26B9C47946E9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VNflv6fNMzFv5M;
 Mon, 22 Apr 2024 22:18:35 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Mon, 22 Apr 2024 19:18:19 -0300
Subject: [PATCH i-g-t v5 4/8] benchmarks/kms_fb_stress: Free resources on
 the stress procedure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-kms_fb_stress-dev-v5-4-0c577163dc88@riseup.net>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
In-Reply-To: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
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

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 benchmarks/kms_fb_stress.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index d2d7bd12ca86..433e751273e6 100644
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
2.44.0

