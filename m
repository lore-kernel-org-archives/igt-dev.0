Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95298C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 09:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1090610E173;
	Wed, 22 May 2024 09:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZXYKG8qw";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3610EE14
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 09:04:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9ECDBFF804;
 Wed, 22 May 2024 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716368654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnP9mnswgzaKTlFf85YCkK3Gvak1rgsUIYHnG+5gdL8=;
 b=ZXYKG8qw89g1kyB46cWlQ/j3s8R4QlX/OYaaZyCJLo5wcnmN9CBpFvGpKeItnPegpR4I3X
 BNn4G/QIUkFNtO0VaJNcR7m/ADg52GfdTH3iNG1n3bmSGFNMlvjOzIiZlYYWmNsNenLzqF
 mhfXqo+oLR4rCdf2uLyKS6WaMtYKhm9YnsMT9P7m90PeWM5vuUBrcG81qxlSW16vfvFce1
 s/mG0I/a3kAjQzY1cPrhuEflEf3QeIjuLVTBzh8PeyxCL5KH29CGOOiGIYCfPp6DV0jc0o
 vmTi4YZotVrHq5PbZSIAk8GtqE+223S1U7lrjM+hYIXIglwQflBK1p286yFSdA==
Date: Wed, 22 May 2024 11:04:12 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH i-g-t v5 4/8] benchmarks/kms_fb_stress: Free resources on
 the stress procedure
Message-ID: <Zk21DLrzyhyeW820@localhost.localdomain>
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <20240422-kms_fb_stress-dev-v5-4-0c577163dc88@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422-kms_fb_stress-dev-v5-4-0c577163dc88@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>

Le 22/04/24 - 19:18, Arthur Grillo a écrit :
> On the stress_driver(), the fbs and the sync file are not released. Fix
> that by freeing all the allocated resources.
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index d2d7bd12ca86..433e751273e6 100644
> --- a/benchmarks/kms_fb_stress.c
> +++ b/benchmarks/kms_fb_stress.c
> @@ -165,11 +165,30 @@ static void stress_driver(struct data_t *data)
>  		igt_output_set_writeback_fb(data->wb_output, &data->kms.writeback.fbs[fb_index]);
>  
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		if (data->wb_output->writeback_out_fence_fd != -1) {
> +			close(data->wb_output->writeback_out_fence_fd);
> +			data->wb_output->writeback_out_fence_fd = -1;
> +		}
>  	}
>  
>  	igt_assert_eq(igt_gettime(&now), 0);
>  	elapsed = igt_time_elapsed(&then, &now);
>  
> +	igt_plane_set_fb(data->kms.primary.base, NULL);
> +	igt_plane_set_fb(data->kms.overlay_a.base, NULL);
> +	igt_plane_set_fb(data->kms.overlay_b.base, NULL);
> +	igt_output_set_writeback_fb(data->wb_output, NULL);
> +
> +	for (int i = 0; i < NUM_FBS; i++) {
> +		igt_remove_fb(data->fd, &data->kms.primary.fbs[i]);
> +		igt_remove_fb(data->fd, &data->kms.overlay_a.fbs[i]);
> +		igt_remove_fb(data->fd, &data->kms.overlay_b.fbs[i]);
> +		igt_remove_fb(data->fd, &data->kms.writeback.fbs[i]);
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
>  	igt_info("Time spent in the loop with %d frames: %lfs.\n", FRAME_COUNT, elapsed);
>  }
>  
> 
> -- 
> 2.44.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
