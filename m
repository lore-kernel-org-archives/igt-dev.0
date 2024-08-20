Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B897C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 10:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C202110E673;
	Tue, 20 Aug 2024 10:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bmp1KZJX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337F910E673
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 10:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724148170; x=1755684170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lME9XkF5tV2sRYQ/LogsF5zC0BcVjk/g5IDZ7CkBLeM=;
 b=Bmp1KZJXgkwvD4bJQRSUW0BBdZCH4kmQT33NGsz46DKe9ArU6qq/7mrN
 siCg7Djx0zwdSla2fqOPLXBIQCszf4L8ZkOiXJ5bahiNKvifKcuNjJ7fw
 6B/bHvBxdBazlakT0ErxIvnVtAVPfZcF1RfbbbUpCn6RruwK6yEJNeUVe
 loV/ro64Plwd4st4sv+rL7ahCpFnJV5CiBPTK6PKo2jHL5NuSN6xOUjPb
 Mvj9I6+roBC1+ONTstljIxclK40w1k/rU+sZ99IG9M+12F+NXeb0c0GAI
 W6fHUgdQoZMZLXh1UVOTghO8dBvcPEq/iAGltRfaGhI0gbby7uEVutyoz A==;
X-CSE-ConnectionGUID: jsGrkw/pTxO/XnFu66p4Og==
X-CSE-MsgGUID: 20jfwA0qSlyVRB7eNrIuEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22566082"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22566082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:02:50 -0700
X-CSE-ConnectionGUID: R5rHBp4zTh2gWeHEjPMoSg==
X-CSE-MsgGUID: 1rYIWmp0Tx2Y9+Wi2dOrGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="65037817"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 03:02:49 -0700
Date: Tue, 20 Aug 2024 12:02:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 2/2] tests/kms_plane_scaling: Improve msm support
Message-ID: <20240820100229.rovgp4gpulhr5qhs@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240819202546.111243-1-robdclark@gmail.com>
 <20240819202546.111243-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819202546.111243-2-robdclark@gmail.com>
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

Hi Rob,
On 2024-08-19 at 13:25:46 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This may undercount number of scalars on hw with rgb pipes, but the
>  scaling on yuv and rgb pipes is functionally equivalent, so for test

Remove space from begin of line.

> coverage this is a good enough approximation.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Looks ok, I do not know msm so
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_kms.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99cdeeb76033..dd530dbabf89 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6682,6 +6682,25 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
>  			igt_assert(start_loc2 = strstr(start_loc1, "num_scalers="));
>  			igt_assert_eq(sscanf(start_loc2, "num_scalers=%d", &num_scalers), 1);
>  		}
> +	} else if (is_msm_device(drm_fd)) {
> +		igt_plane_t *plane;
> +
> +		/*
> +		 * msm devices have dma pipes (no csc, no scaling), rgb
> +		 * pipes (no csc, has scaling), and vid pipes (has csc,
> +		 * has scaling), but not all devices have rgb pipes.
> +		 * We can use the # of pipes that support YUV formats
> +		 * as a rough approximation of the # of scalars.. it may
> +		 * undercount on some hw, but it will not overcount
> +		 */
> +		for_each_plane_on_pipe(display, pipe, plane) {
> +			for (unsigned i = 0; i < plane->format_mod_count; i++) {
> +				if (igt_format_is_yuv(plane->formats[i])) {
> +					num_scalers++;
> +					break;
> +				}
> +			}
> +		}
>  	}
>  
>  	return num_scalers;
> -- 
> 2.46.0
> 
