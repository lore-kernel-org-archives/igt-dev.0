Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A017ACD3435
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 13:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BEF10E5B1;
	Tue,  3 Sep 2024 13:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MPUba+K9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DF010E5B1
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 13:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725371760; x=1756907760;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=mLB2btbh6T6ckUXqMyWpT+ZaMLsevzu9iFnMes7K0C4=;
 b=MPUba+K9SSjdFRxeqXfVezodU/nCX3udwp/IaKJY0kQgtaHMP/kleZ7Q
 6yNuxsxk6lu7d4Doz/oDIQEorrx49ODEYM02g12km9+CgfLAE7mBviSoo
 lRLKRTOy7e2UTQBl4GLNH+zCQftWzVM5UDt5Zq6WA1x07M0/dq+tPsXhj
 a2wzQvwcNeHhgIX8/wcb6LG2EyAP8aQa0kmRmqmmqzJyHQQrW2/e5Xbuj
 X7EPgJlNqN3HPOY30hqOKThBz6bTWnXQMTSPbjCWGmT7pkaLGdUmz5Mu6
 sJY9kVA0pCK7eSCzDisHb4F/DC62i3Bs7VSvKuHzQ/YSqrrysRmJv0jhK Q==;
X-CSE-ConnectionGUID: Xo2p4OsbRgyphCDsmdzT6A==
X-CSE-MsgGUID: cj3n0/wURh6cuQeiMVLGYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23776211"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23776211"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:55:59 -0700
X-CSE-ConnectionGUID: sx68LEH1QvmrONWZi3hnsA==
X-CSE-MsgGUID: Tc7PknjYQeGEHWOQRkGMtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65430798"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:55:59 -0700
Date: Tue, 3 Sep 2024 16:56:20 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/14] lib/igt_kms: add helper to set connector
 link status
Message-ID: <ZtcVhEy0PMwIu2F9@ideak-desk.fi.intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-11-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825200612.4036178-11-kunal1.joshi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Aug 26, 2024 at 01:36:08AM +0530, Kunal Joshi wrote:
> add helper to set connector's link status property
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  2 ++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 91f75243d..e0533f6ae 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2213,6 +2213,42 @@ void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode)
>  					       dpms, mode) == 0);
>  }
>  
> +/**
> + * kmstest_set_connector_link_status
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @link_status: DRM link status value
> + * 
> + * This function sets the link status of @connector to @link_status.
> + */
> +void kmstest_set_connector_link_status(int drm_fd, drmModeConnector *connector,
> +				       int link_status)
> +{
> +	int i, link_status_prop = 0;

The property ID's type is uint32_t.

> +	bool found_it = false;
> +
> +	for (i = 0; i < connector->count_props; i++) {
> +		struct drm_mode_get_property prop = {
> +			.prop_id = connector->props[i],
> +		};
> +
> +		if (drmIoctl(drm_fd, DRM_IOCTL_MODE_GETPROPERTY, &prop))
> +			continue;
> +
> +		if (strcmp(prop.name, "link-status"))

Maybe better looking up the name from igt_connector_prop_names[]. Looks
like the property ID is also already cached in
igt_output_t::props[IGT_IGT_CONNECTOR_LINK_STATUS], but looking it up
again here matches the related DPMS helper, so for now it's ok to do the
same.


> +			continue;
> +
> +		link_status_prop = prop.prop_id;
> +		found_it = true;
> +		break;
> +	}
> +	igt_assert_f(found_it, "LINK_STATUS property not found on %d\n",
> +		     connector->connector_id);
> +
> +	igt_assert(drmModeConnectorSetProperty(drm_fd, connector->connector_id,
> +					       link_status_prop, link_status) == 0);
> +}
> +
>  /**
>   * kmstest_get_property:
>   * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 640ec4e09..3d7842b36 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -301,6 +301,8 @@ bool kmstest_probe_connector_config(int drm_fd, uint32_t connector_id,
>  void kmstest_free_connector_config(struct kmstest_connector_config *config);
>  
>  void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode);
> +void kmstest_set_connector_link_status(int drm_fd, drmModeConnector *connector,
> +				       int link_status);
>  bool kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
>  			  const char *name, uint32_t *prop_id, uint64_t *value,
>  			  drmModePropertyPtr *prop);
> -- 
> 2.34.1
> 
