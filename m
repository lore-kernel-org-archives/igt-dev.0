Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03752C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A274010E132;
	Wed, 15 Jul 2026 12:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRe/t9de";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E190B10E132
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784120273; x=1815656273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9I2qhAbNNYZZVTsI+08xrkRL2Sn+png0iucPiBY/69A=;
 b=bRe/t9deeikHeJbo+NcL8jBET/7cchSTWS58LOyEZGVACkv+sQ3tGJVm
 fkJk3lE9txxX2ThXXjjIQED/p27KBXqY4BaVlkMpBQexh5cRxLRrg3NVn
 Pn/+eV1Md06QDt8C7f8+S5Z8B6c9UY3Ayg2ZhE3guYwZoyUDPhGzPznW2
 cTVBwaj0zG3fw1YrDf1d4m6/IE3aY8C7mk56crkBsVeMxNh2yTnQ+tR6a
 n0a/sNd3zHnbAqYDJux/jRxwYYawgiMWsx0ajINySKOcYxv5fG1iYpCFT
 35voxpwrXwcaApuRiFuQ4Zi0/EUDSCdBsYEIYNcTUaIrVvUsi9iILD+it A==;
X-CSE-ConnectionGUID: yt1qlmpzT/iZFB3MAGC+tA==
X-CSE-MsgGUID: 8BCWCyeURsykl1xMFDxZ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95401941"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="95401941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:57:52 -0700
X-CSE-ConnectionGUID: h7j+0YgmQeSpF0d6jkpu9g==
X-CSE-MsgGUID: xCuk5LOHSYeYguQwB7kmcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="258135437"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 05:57:50 -0700
Date: Wed, 15 Jul 2026 14:57:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Chris Wilson <chris.p.wilson@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v4] lib/igt_kms: Fix plane type check in
 igt_crtc_get_plane_type
Message-ID: <20260715125711.uke2opej6fski6cp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260715091541.1010895-2-jingpingjan@google.com>
 <20260715092413.1355785-2-jingpingjan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715092413.1355785-2-jingpingjan@google.com>
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
On 2026-07-15 at 17:24:13 +0800, Jing-Ping Jan wrote:

imho also subject could be improved, as there was no type checks
for cursor or primary plane? imho better:

[PATCH i-g-t v4] lib/igt_kms: Add plane type verification in igt_crtc_get_plane_type

> Verify plane type matches requested type to avoid returning invalid
> planes.
> 
> Fixes: 5426dc0a889a ("lib/kms: Skip rather than fail when a suitable plane can't be found")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>

Should be:
Cc: Chris Wilson <chris.p.wilson@intel.com>

> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> ---
> v4:
>  - Remove unintended changes
> v3:
>  - Moving condition after old one
>  - print type string instead of enum value
> v2:
>  - Cc Swati and Karthik.
>  - split condition with additional branch
> 
>  lib/igt_kms.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e20307923..65bb556bf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3538,6 +3538,13 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crtc, int plane_type)
>  		      "Valid pipe->planes idx not found. plane_idx=%d plane_type=%d n_planes=%d\n",
>  		      plane_idx, plane_type, crtc->n_planes);
>  
> +	igt_require_f(crtc->planes[plane_idx].type == plane_type,
> +		      "Valid pipe->planes idx not found. found plane_idx=%d, "

It was found but it has unexpected plane type?

> +		      "type=%s, requested plane_type=%s\n", plane_idx,
> +		      crtc->planes[plane_idx].type == DRM_PLANE_TYPE_PRIMARY ? "PRIMARY"

You don't know which one it will be, so imho here just
print int value.

> +									     : "CURSOR",
> +		      plane_type == DRM_PLANE_TYPE_PRIMARY ? "PRIMARY" : "CURSOR");

Also print both, int and name, so

	igt_require_f(crtc->planes[plane_idx].type == plane_type,
		      "Unexpected plane type, found plane_idx=%d, "
		      "type=%d != requested plane_type=%d (%s)\n", plane_idx,
		      crtc->planes[plane_idx].type,
		      plane_type,
		      plane_type == DRM_PLANE_TYPE_PRIMARY ? "PRIMARY" : "CURSOR");

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +
>  	return &crtc->planes[plane_idx];
>  }
>  
> -- 
> 2.55.0.141.g00534a21ce-goog
> 
