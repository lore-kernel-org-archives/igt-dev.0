Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB1606A32C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYHvrWIa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C0710EA77;
	Thu, 26 Nov 2026 19:42:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99AB10EA63
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 19:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795722092; x=1827258092;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qQa1C3x2sZw7tXGJhz1SZA2OOvikkyrIFvDAm+wG1SI=;
 b=cYHvrWIak0+VIuMuX2Y40bg/Xl1JyY3Ujd5Sp0pQoG702zdb2Y1EKqAb
 VrCG119BILcXk491KRugzPXt2SjlHMuIaFdd40nonFBRDM8Yxr0465TGl
 G8Nf/1T9ApFJZ7MiGyXOH07MU++bNDTzQUWvoapF5ETC0+cvosiU6w1Rt
 yxy2R65xEWxdI/oqs4btMLiKMRv8p8oIIhR044UgvpJhhmEuu+I28yFB+
 efJRvu2vxDWF22GLd9xMKMR2e3o8xEj5jtF+/HhvZmAHGQ5LaB7IIuFTs
 HCKXvrNt20rrs9VwtzNU69NP0PGl9kYCYFjbPuu8z1CQXLohPiv6b5cmG g==;
X-CSE-ConnectionGUID: 7MNu2gl1QTyVenexsvXXyA==
X-CSE-MsgGUID: fNcufgOhSoudTzR53GdFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4708068"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4708068"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 11:41:30 -0800
X-CSE-ConnectionGUID: yd5+uz2NS8WRWYmFiMEK0g==
X-CSE-MsgGUID: rbyfVpGbShuBp3nEmC6Bug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12544905"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 11:41:30 -0800
Date: Thu, 26 Nov 2026 20:41:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: David Francis <David.Francis@amd.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v6 1/2] include: Add GEM_CHANGE_HANDLE to drm.h
Message-ID: <jsd24hhfbwpyfwzdjqawqlsfyahebkasxszqt3po55z4nixbzn@grm3ytmb2tw3>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 David Francis <David.Francis@amd.com>, igt-dev@lists.freedesktop.org
References: <20261125144110.2198338-1-David.Francis@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125144110.2198338-1-David.Francis@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,
On 2026-11-25 at 09:41:09 -0500, David Francis wrote:
> This ioctl was added in kernel patch
> https://lore.kernel.org/dri-devel/20250717143556.857893-2-David.Francis@amd.com/

imho you should resend this as now it is over a year old.

> 
> It provides an interface to change the handle of a gem object.
> 
> To test it, we need this interface
> 
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  include/drm-uapi/drm.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> index baa620e3f..cf131da24 100644
> --- a/include/drm-uapi/drm.h
> +++ b/include/drm-uapi/drm.h
> @@ -619,6 +619,21 @@ struct drm_gem_open {
>  	__u64 size;
>  };
>  
> +/**
> + * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
> + * @handle: The handle of a gem object.
> + * @new_handle: An available gem handle.
> + *
> + * This ioctl changes the handle of a GEM object to the specified one.
> + * The new handle must be unused. On success the old handle is closed
> + * and all further IOCTL should refer to the new handle only.
> + * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
> + */
> +struct drm_gem_change_handle {
> +	__u32 handle;
> +	__u32 new_handle;
> +};
> +
>  /**
>   * DRM_CAP_DUMB_BUFFER
>   *
> @@ -1296,6 +1311,14 @@ extern "C" {
>   */
>  #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
>  
> +/**
> + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> + *
> + * Some applications (notably CRIU) need objects to have specific gem handles.
> + * This ioctl changes the object at one gem handle to use a new gem handle.
> + */
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)

Should this be 0xD1? imho drm ioctl numbers should be consecutive.

Can you just sync drm.h with kernel drm-next commit a1b6cf8e5e7e
("drm: uapi: Use SPDX in DRM core uAPI headers")

While at this, please also try to write it in format similar to igt
commit a31c48a76e8849084afd70331484a019d55d82f8 ("drm-uapi/xe: sync with kernel f99a05cc0b85")
e.g. write out which changes are there since last sync and
use as subject 'drm-uapi/drm: sync with kernel a1b6cf8e5e7e'.


Regards,
Kamil


> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
> -- 
> 2.34.1
> 
