Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DBFC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A705D10EE1E;
	Fri, 19 Apr 2024 14:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0T0nibx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6F410E6F2
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713537839; x=1745073839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rNBiRK+K2/6seZP6tLx6GBvQCSFI/JGgCsv+y/KmzKA=;
 b=J0T0nibxiZ1xTVd/HBFnKeAH+VJcqSlM5DqlZsw7eqGuNiKetbJVDmDf
 qV5unnnWzv3yqlN4vFfRiHUi53kfHprxvRlA21gNupPww6lUsNtVK8Kye
 6auxn0A39oB9o42STUSHKYndAeJdGvDZzskHd49gLIErMW3uH9AGvZ13Y
 m1BO2YOwIjhmOGlFkBBc/ov/zGKiNFPkF4JIqIxcf9EUXOqTeWs/fH9SU
 0VAMbHeGmq1aJaQrXJqkAbtn6P8T74SmFbeWm5dKEcQIvQ7ORrQN+lMMy
 ViUB4AMVfuKEeZghkoyqrEHS2hDBL14vfp26kZyOlWMuRSPcYBFyfh6bp A==;
X-CSE-ConnectionGUID: c7UUJDcdQlKkQlu3b2VrEg==
X-CSE-MsgGUID: +k++4KlSSSG7eB99gloORQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26652940"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="26652940"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:43:58 -0700
X-CSE-ConnectionGUID: UKFqSwilQQSzuwI2kaH/Sw==
X-CSE-MsgGUID: Vf4lLhSoTzqqlCJeucNy3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23404762"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:43:56 -0700
Date: Fri, 19 Apr 2024 16:43:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v4 4/7] benchmarks/kms_fb_stress: Free resources on
 the stress procedure
Message-ID: <20240419144353.bot6el53yg7vvntz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240411-kms_fb_stress-dev-v4-0-7a8f3a419ebb@riseup.net>
 <20240411-kms_fb_stress-dev-v4-4-7a8f3a419ebb@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411-kms_fb_stress-dev-v4-4-7a8f3a419ebb@riseup.net>
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

Hi Arthur,
On 2024-04-11 at 15:51:14 -0300, Arthur Grillo wrote:
> On the stress_driver(), the fbs and the sync file are not released. Fix
> that by freeing all the allocated resources.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/kms_fb_stress.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
> index bc548fae61f8..76e82e0d76ea 100644
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
