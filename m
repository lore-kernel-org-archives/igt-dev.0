Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D59C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 10:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DCB10EC22;
	Tue,  7 Jul 2026 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKvixMaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E334210E482
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783420036; x=1814956036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xiFIXEaXMVgyr1Os+m51OTQYgCE/xao6fdx8LoNmbsA=;
 b=aKvixMaWEbCkB9Q4FVNhBsA/BT5iGNq0jUzEVigsQczeOrorzpi0l+h9
 LnE+wfFDZXFC/rbO3QXnAZ6y8/+6EffEKCNJFNqdtvvvGE1+JEEtkQd7J
 8zyRUHDyZRs562uXOwNN9jl34gzDXWRm858Xy5m4S6ziK+Lf5y/1XxMLU
 UxkOTmZR8Xa2c5zHfF4obtIebF0PGY3dJaVXLTuZJDE5kKUFdIRfuB5ia
 oyHxzth+e+QujDCbLd0yeIfGWzfxiXA9nLwtTTXE/5SxCgFsghn7wiy/E
 wBWd/nzsvxgnscJtCWYED1TI1Fi4ESAhro1I/dqJs5MpDVY7QktI39+OG A==;
X-CSE-ConnectionGUID: NX7RSKydTKWvn3okZrGNkw==
X-CSE-MsgGUID: cpXN23V/RnSAaDWvh2Y0dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="101608516"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101608516"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 03:27:15 -0700
X-CSE-ConnectionGUID: CpgCWz+dQpiRK+zEX4UAvg==
X-CSE-MsgGUID: 28VBgbj9QEiVKJ8h1+1THw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257837750"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 03:27:14 -0700
Date: Tue, 7 Jul 2026 12:27:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Fix plane type check in
 igt_crtc_get_plane_type
Message-ID: <20260707102711.qjparlbi7zedneon@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260706100626.1042084-1-jingpingjan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706100626.1042084-1-jingpingjan@google.com>
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

Hi Jing-Ping,
On 2026-07-06 at 18:06:25 +0800, Jing-Ping Jan wrote:
> From: Jing-Ping <jingpingjan@google.com>
> 
> Verify plane type matches requested type to avoid returning invalid
> planes.
> 
> Fixes: 5426dc0a889a ("lib/kms: Skip rather than fail when a suitable plane can't be found")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

+cc Swati and Karthik

> Signed-off-by: Jing-Ping <jingpingjan@google.com>
> ---
>  lib/igt_kms.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e20307923..43da9a6d9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3534,11 +3534,14 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crtc, int plane_type)
>  		}
>  	}
>  
> -	igt_require_f(plane_idx >= 0 && plane_idx < crtc->n_planes,
> -		      "Valid pipe->planes idx not found. plane_idx=%d plane_type=%d n_planes=%d\n",
> -		      plane_idx, plane_type, crtc->n_planes);
> -
> -	return &crtc->planes[plane_idx];
> +        igt_require_f(plane_idx >= 0 && plane_idx < crtc->n_planes &&
> +                          crtc->planes[plane_idx].type == plane_type,
> +                      "Valid pipe->planes idx not found. plane_idx=%d "
> +                      "plane_type=%d n_planes=%d found plane_type=%d\n",
> +                      plane_idx, plane_type, crtc->n_planes,
> +                      crtc->planes[plane_idx].type);

You cannot use plane_idx here as it can be == crtc->n_planes
(when it will be not found by for loop). Maybe just split
this with the help of 'additional if'?

	if(plane_idx >= 0 && plane_idx < crtc->n_planes)
		igt_require_f(crtc->planes[plane_idx].type == plane_type,
			//skip message here

	//old igt_require here

Also you can change break into return instead?

Also please fix indentation and tabs/spaces at begining of line,
use checkpatch.pl script from Linux kernel.

Regards,
Kamil

> +
> +        return &crtc->planes[plane_idx];
>  }
>  
>  /**
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 
