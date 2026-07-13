Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A1C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A9210E59E;
	Mon, 13 Jul 2026 09:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlrYR4ac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AEC10E59E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783936292; x=1815472292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sO0kfpQISjjs4BDjca6iy5Qfhe5VqAZ/oplpJP/7FKE=;
 b=MlrYR4acdmzxCe+VLGk1LwIc3y2RX7AEzkq/VwjF+IpUKcg1nyuZuUSk
 fo9nMeCMRSgHlP3PorpatfyZEvpIGBDTwyr1yBjMQaq7Bf8YJlU8oiqUe
 UbwtXNnqB5dm7qaFG0JPLX8PdYknRiqNbJaKRHehUPNs6R/UWVscdiUz/
 zh5H6zknqN+uz2DdJFy9SGfcJndGiGVbA6RhQ+8bQUMII66a7q1CIHbE1
 Wfr+zfAdVNJPnrEwJd9v7+eXVxP8l+A3sfqmyM8CLnduvDhzG+cSExnqf
 GC9bz92UTf3P9OYKxzDPQBSnx7e3ZW5iHx+Uq0nqxJGXQqxFLMC7y77aW A==;
X-CSE-ConnectionGUID: S3Fk8uvoRhalfDSjkJLGpQ==
X-CSE-MsgGUID: VZieFC9BSSmXGwoYMH2QtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110084566"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="110084566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:51:31 -0700
X-CSE-ConnectionGUID: uB2y4FZUR9Sfso+Ynw7YTA==
X-CSE-MsgGUID: YRGEJ6IYR2SYRdsno0w5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260398885"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:51:29 -0700
Date: Mon, 13 Jul 2026 11:51:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t 2/2] tests/v3d: Pass the submit struct, not its
 address, to the ioctl
Message-ID: <20260713095127.tqfzokkystjaregk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20260712210328.3690745-1-mcanal@igalia.com>
 <20260712210328.3690745-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260712210328.3690745-2-mcanal@igalia.com>
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

Hi Maíra,
On 2026-07-12 at 18:00:58 -0300, Maíra Canal wrote:
> Some submit subtests pass &job->submit to do_ioctl_err(), but job->submit
> is already a pointer to the drm_v3d_submit_{cl,csd} struct. The ioctl thus
> reads the pointer field's bytes instead of the configured submission, so
> the tests don't exercise what they intend.
> 
> Pass job->submit directly, matching every other submit call site.
> 
> Fixes: 1c7ea154b625 ("tests/v3d_submit_cl: Create test for V3D's Submit CL IOCTL")
> Fixes: 4d6551ca64cf ("tests/v3d_submit_csd: Create test for V3D's Submit CSD IOCTL")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/v3d/v3d_submit_cl.c  | 4 ++--
>  tests/v3d/v3d_submit_csd.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/v3d/v3d_submit_cl.c b/tests/v3d/v3d_submit_cl.c
> index 824b75793..c30fdebb7 100644
> --- a/tests/v3d/v3d_submit_cl.c
> +++ b/tests/v3d/v3d_submit_cl.c
> @@ -218,7 +218,7 @@ int igt_main()
>  		job->submit->flags = DRM_V3D_SUBMIT_CL_FLUSH_CACHE;
>  
>  		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_CACHE_FLUSH)) {
> -			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &job->submit, EINVAL);
> +			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
>  		} else {
>  			job->submit->out_sync = syncobj_create(fd, DRM_SYNCOBJ_CREATE_SIGNALED);
>  
> @@ -238,7 +238,7 @@ int igt_main()
>  		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
>  
>  		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT)) {
> -			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, &job->submit, EINVAL);
> +			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CL, job->submit, EINVAL);
>  		} else {
>  			igt_v3d_set_multisync(&ms, V3D_RENDER);
>  			job->submit->extensions = to_user_pointer(&ms);
> diff --git a/tests/v3d/v3d_submit_csd.c b/tests/v3d/v3d_submit_csd.c
> index ca429f1db..4b342c79a 100644
> --- a/tests/v3d/v3d_submit_csd.c
> +++ b/tests/v3d/v3d_submit_csd.c
> @@ -222,7 +222,7 @@ int igt_main()
>  		job->submit->flags = DRM_V3D_SUBMIT_EXTENSION;
>  
>  		if (!igt_v3d_get_param(fd, DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT)) {
> -			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, &job->submit, EINVAL);
> +			do_ioctl_err(fd, DRM_IOCTL_V3D_SUBMIT_CSD, job->submit, EINVAL);
>  		} else {
>  			igt_v3d_set_multisync(&ms, V3D_CSD);
>  			job->submit->extensions = to_user_pointer(&ms);
> -- 
> 2.54.0
> 
