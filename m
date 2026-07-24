Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AD5C531FA
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 10:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BE310F367;
	Fri, 24 Jul 2026 10:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlaffvUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6FF10F367
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784889823; x=1816425823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sE+rK7iz178hpKRYRvoEM1izKSnQ2dpi32fKLq4xeu4=;
 b=mlaffvUWcgj1xPYFl1IJgtgreOYft8jW8DIdKABun02yYjSEVCeYY84F
 jVfQNs/NwklzQmALbRt50ycbLwEhxoodS2GlOz3vVvGpKYcYmEA2TJy9A
 H1/gCR50iUqyrOhZA2nuB98N3iclwdl9hlqzIjFznXxlkTZNGpTBlgWbp
 31L+wR23KvilnqiZQv5v6rdzO5IH3oUJ2IO/SJlNGju6JnbVomjBElLlz
 SdFYcIfPA369TSg6K3AFuzbaszZGa42j8KvT8UfU4pyjIdhD0fyxZKq3p
 mlzE9E+1TeR4ViHirirhyWknu2a3b+AKoFDMIY9IEMoblqr95/NBF91ij g==;
X-CSE-ConnectionGUID: k1PymUbEQN+7zW0wzc190g==
X-CSE-MsgGUID: Qo/O96tqQjykL/6CLhrOWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85405844"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85405844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 03:43:42 -0700
X-CSE-ConnectionGUID: HR0KpP64RU6ulWl521m8wg==
X-CSE-MsgGUID: aOt44CD5Rvuxa1/xIkLawg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 03:43:40 -0700
Date: Fri, 24 Jul 2026 12:43:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Chris Wilson <chris.p.wilson@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t v5] lib/igt_kms: Add plane type verification in
 igt_crtc_get_plane_type
Message-ID: <20260724104324.3y2lh7scptplauav@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20260715125711.uke2opej6fski6cp@kamilkon-DESK.igk.intel.com>
 <20260723091803.3883040-1-jingpingjan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723091803.3883040-1-jingpingjan@google.com>
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
On 2026-07-23 at 17:18:02 +0800, Jing-Ping Jan wrote:
> Verify plane type matches requested type to avoid returning invalid
> planes.
> 
> Fixes: 5426dc0a889a ("lib/kms: Skip rather than fail when a suitable plane can't be found")
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>

Applied, thanks!

Regards,
Kamil

> ---
> v5:
>  - update Chris's email
>  - update commit subject
>  - print found type value only
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
> index 2eefb773b..6b4d58237 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3537,6 +3537,13 @@ igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crtc, int plane_type)
>  		      "Valid pipe->planes idx not found. plane_idx=%d plane_type=%d n_planes=%d\n",
>  		      plane_idx, plane_type, crtc->n_planes);
>  
> +	igt_require_f(crtc->planes[plane_idx].type == plane_type,
> +		      "Unexpected plane type, found plane_idx=%d, "
> +		      "type=%d != requested plane_type=%d (%s)\n", plane_idx,
> +                      crtc->planes[plane_idx].type,
> +                      plane_type,
> +		      plane_type == DRM_PLANE_TYPE_PRIMARY ? "PRIMARY" : "CURSOR");
> +
>  	return &crtc->planes[plane_idx];
>  }
>  
> -- 
> 2.55.0.229.g6434b31f56-goog
> 
