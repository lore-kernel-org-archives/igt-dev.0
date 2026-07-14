Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C14C44508
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 16:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B8E10E065;
	Tue, 14 Jul 2026 16:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/lOBDxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F6E10E6CD
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784047441; x=1815583441;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZvSAjxuHQnXC9hsrO6TtkgYRAi2Ld13b8H7C/Y0XlJY=;
 b=D/lOBDxrcn60+74QvhvMQHY2KA+n0G1Ye06HaJZfAEGaQkDnq8KAeUYw
 I8F2OkZNbOrUxd5fF6fw8aKH67wcn9jHczH6TXXcOlixenOGS8dwedh4n
 RVc4YD1WDb6++10iKrWjWeZ9ZhxKOV1Goprls2PA0Z1Sky0WdYpDBfI8q
 NFum/gqaXlJ5noF8DxHlKuKqq2Ip2KBl0ejQEwnwke5bhVhe0JfZWRffg
 rjv35rz6PVPHF4KLjolh9XSn3uuJpRnvNO44mx0Yz+c9hb3lPpZHqElAJ
 /5rrcjHR1G8ZTtcjIjCVnyuYsz46ZmVACV2uXh0j6AbM3JUdjCZflfGcJ w==;
X-CSE-ConnectionGUID: YEvJ6upUTj2QTiANhku5zA==
X-CSE-MsgGUID: x37oh2PKTA2auLQ6NPXm+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84637288"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84637288"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 09:44:01 -0700
X-CSE-ConnectionGUID: c+nQ3PJESd2c1oc0tctgrQ==
X-CSE-MsgGUID: YNy1b9g3RWav1Epfco2BfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="259757045"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 09:44:00 -0700
Date: Tue, 14 Jul 2026 18:43:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: Fix plane type check in
 igt_crtc_get_plane_type
Message-ID: <20260714164357.ntqp5zmpqhozqw4p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260707102711.qjparlbi7zedneon@kamilkon-DESK.igk.intel.com>
 <20260708150223.2148857-2-jingpingjan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708150223.2148857-2-jingpingjan@google.com>
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
On 2026-07-08 at 23:02:24 +0800, Jing-Ping Jan wrote:
> Verify plane type matches requested type to avoid returning invalid
> planes.
> 
> Fixes: 5426dc0a889a ("lib/kms: Skip rather than fail when a suitable plane can't be found")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> ---
> v2:
>  - Cc Swati and Karthik.
>  - split condition with additional branch
>  lib/igt_kms.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e20307923..ba8223dd2 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3534,7 +3534,13 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crtc, int plane_type)
>  		}
>  	}
>  
> -	igt_require_f(plane_idx >= 0 && plane_idx < crtc->n_planes,
> +	if (plane_idx >= 0 && plane_idx < crtc->n_planes)

Sorry for confusion, now as I read it I see you could drop
if condition from here by moving igt_require() after old one.

Btw could you also print a type as name for requested plane?
This fail could only occur for PRIMARY or CURSOR plane_type.

Regards,
Kamil

> +		igt_require_f(crtc->planes[plane_idx].type == plane_type,
> +			      "Valid pipe->planes idx not found. found plane_idx=%d, "
> +			      "type=%d, requested plane_type=%d\n",
> +			      plane_idx, crtc->planes[plane_idx].type, plane_type);
> +
> +	igt_require_f(plane_idx >= 0 && plane_idx < crtc->n_planes,
>  		      "Valid pipe->planes idx not found. plane_idx=%d plane_type=%d n_planes=%d\n",
>  		      plane_idx, plane_type, crtc->n_planes);
>  
> -- 
> 2.55.0.795.g602f6c329a-goog
> 
