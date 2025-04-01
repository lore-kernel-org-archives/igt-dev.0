Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7C4C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 16:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C39A10E60A;
	Tue,  1 Apr 2025 16:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffZ16YKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC60B10E60A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743523614; x=1775059614;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=36N1cjZvyhbivMP1W8zAr2yhY+pMhzNfOFR1vE0kv3Y=;
 b=ffZ16YKzjMahGS6TLBEc3+/3YWlngrccYE904K6LuSAK2eSIDZLwA/ix
 5DQwYKGBH00CplXVmn4LtuO/q35LPll91KpikoQ4q/dRdIE6Cqdt6LOk6
 6ALQEz26DTfWO4tUmBQPQGFJ/BuZ+1QBYMSjlJSxxSZ3UXXXgWh6TjHhH
 Aqrug4FGjTcuTslJpIxhjEuJ2MuzeKe80UeIDW/ed9aKx0lVDDneTmkCN
 o3OvX3AbwGjwd/rvFmR4ZmZO7RjwoEqWEWMEHQMhqh1aeRYB+4ge2ZTDC
 3ChF2P17fzhGqvEF1LJiXvRvUny21CStMbI1OPzkM/g8t8vMHiM+mj8RI w==;
X-CSE-ConnectionGUID: uRH1m4sfS/elwN3RfON15w==
X-CSE-MsgGUID: HN9rFbeCSDqmMwBKb/Fi9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44868416"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44868416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 09:06:52 -0700
X-CSE-ConnectionGUID: u1T0J2NyTrCl/X2TUvjPYA==
X-CSE-MsgGUID: +Ktw9OrbR+2tlJt+hn1tOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="149606345"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 09:06:51 -0700
Date: Tue, 1 Apr 2025 18:06:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH v3 13/19] drm-uapi/amdgpu: sync with drm-next
Message-ID: <20250401160634.pttztce2lrj2tver@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
 <20250328082416.1469810-13-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328082416.1469810-13-sunil.khatri@amd.com>
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

Hi Sunil,
On 2025-03-28 at 13:54:10 +0530, Sunil Khatri wrote:
> Sync with drm-next commit ("866fc4f7e772c4a397f9459754ed1b1872b3a3c6")
> 

I could not find this commit in drm-next nor drm-tip,
please add also subject to hash, like

Align with kernel commit cd5bbb2532f2 ("drm/xe/uapi: Add a device query to
get EU stall sampling information").

One more point, you could also consider adding all in one patch
unless they come from different trees, then please indicate from which
ones they come.

Regards,
Kamil

> Adds a new subquery (AMDGPU_INFO_UQ_FW_AREAS) in
> AMDGPU_INFO_IOCTL to get the size and alignment of shadow
> and csa objects from the FW setup. This information is
> required for the userqueue consumers.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index fed39c9b4..8108c0c8a 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -1439,6 +1439,27 @@ struct drm_amdgpu_info_hw_ip {
>  	__u32  ip_discovery_version;
>  };
>  
> +/* GFX metadata BO sizes and alignment info (in bytes) */
> +struct drm_amdgpu_info_uq_fw_areas_gfx {
> +	/* shadow area size */
> +	__u32 shadow_size;
> +	/* shadow area base virtual mem alignment */
> +	__u32 shadow_alignment;
> +	/* context save area size */
> +	__u32 csa_size;
> +	/* context save area base virtual mem alignment */
> +	__u32 csa_alignment;
> +};
> +
> +/* IP specific metadata related information used in the
> + * subquery AMDGPU_INFO_UQ_FW_AREAS
> + */
> +struct drm_amdgpu_info_uq_fw_areas {
> +	union {
> +		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
> +	};
> +};
> +
>  struct drm_amdgpu_info_num_handles {
>  	/** Max handles as supported by firmware for UVD */
>  	__u32  uvd_max_handles;
> -- 
> 2.43.0
> 
