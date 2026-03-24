Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4D7E9A75A
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 10:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB8D10E0B0;
	Tue, 24 Mar 2026 10:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brzEl5FY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EF310E0B0
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 10:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774348448; x=1805884448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=h2NYN+M0oDhHff/6vo6I45WVPHU1bzNxIfzWAxioTXY=;
 b=brzEl5FYQGlBDY6PRIccT08e86DTNTHxaQ282oUlvntTc8lwSCzbmcOk
 EejtzUgfWUNYi6fH5bCfEQses4uvXn0eLmqtMHqM9WdyX9HXlPJp2MJTQ
 mLm1fhyaJ2sTs6rOcbzleYABNnP8F6wz1k8u3lJqEWZdwGHBWXgsj0+yW
 6ZbCYXev6WkL5MaD8xk1owNBXeY9rqiBn15duy1ZSE4YURZy8OErsK/M5
 +oaucQPBJFZT5GSX8hf6KZkATQ4Z2FJahI1zaGBMIkS8k1/lh8s16nS+h
 h3ZlnkvakDZ23lNeescYriY/Xwlhvs06YT715gJn2CtHXrtIil5gBO8bC g==;
X-CSE-ConnectionGUID: HlmfrzSdR/C+Yb99lrUmnw==
X-CSE-MsgGUID: FE1DRGhXRvy41JLxlh38pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75428957"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75428957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 03:34:07 -0700
X-CSE-ConnectionGUID: tRPxwuxOTQOVAwp9eOhpew==
X-CSE-MsgGUID: sdlt7pMwSPOUqiR64ENv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228792785"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:34:04 -0700
Date: Tue, 24 Mar 2026 11:34:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 03/49] lib/igt_kms: Add function to list
 connected connectors
Message-ID: <20260324103402.oslsmbm6zkglw2kg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-3-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-unigraf-integration-v9-3-a01dffc3b0cb@bootlin.com>
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

Hi Louis,
On 2026-03-16 at 17:17:24 +0100, Louis Chauvet wrote:
> Introduce the igt_get_connected_connectors() function, which returns a
> list of connector IDs that are currently connected according to DRM.
> 
> This function includes a timeout mechanism because connectors can be
> unplugged at any time. Also, especially with MST, the connector can be
> listed by drmModeGetResources() but not yet accessible with
> drmModeGetConnector().
> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 81 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 4a496ab256f0..72a38334f921 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8094,6 +8094,31 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
>  	return crtcs[rand() % n];
>  }
>  
> +static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned int connector_id,
> +						  double timeout)
> +{
> +	drmModeConnectorPtr connector = NULL;
> +	struct timespec start, end;
> +
> +	connector = drmModeGetConnector(drm_fd, connector_id);
> +	/*
> +	 * This time is required as sometimes some id in the connector list are not totally
> +	 * ready or can disappear
> +	 */
> +	igt_assert_eq(igt_gettime(&start), 0);
> +	end = start;
> +
> +	while (!connector &&
> +	       igt_time_elapsed(&start, &end) <= timeout) {
> +		drmModeFreeConnector(connector);
> +		connector = drmModeGetConnector(drm_fd, connector_id);
> +		usleep(10000);

Same here, use defined constant.

> +		igt_assert_eq(igt_gettime(&end), 0);
> +	}
> +
> +	return connector;
> +}
> +
>  /**
>   * igt_wait_for_connector_status:
>   * @drm_fd: drm file descriptor
> @@ -8134,3 +8159,58 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
>  
>  	return false;
>  }
> +
> +/**
> + * igt_get_connected_connectors:
> + *
> + * @drm_fd: DRM file descriptor
> + * @connector_ids: Out pointer for the array of connector ids connected. The function
> + * will allocate and store the pointer in this out pointer. The caller is
> + * responsible to free the inner pointer using free(*connector_ids). caller.

s/ caller.//

> + *
> + * This will probe all the connectors and return the list of all
> + * connected connectors.

Document that this could assert. Also add newline here.

> + * Returns: The number of connectors in @connector_ids
> + */
> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
> +{
> +	uint32_t *tmp_alloc;
> +	int connected_count = 0;
> +	double timeout = igt_default_display_detect_timeout();
> +	drmModeResPtr resources;
> +
> +	igt_assert(drm_fd);

-1 is invalid but will not assert.

> +	*connector_ids = NULL;
> +
> +	resources = drmModeGetResources(drm_fd);
> +	igt_assert(resources);

Cannot you just return 0 instead of asserting?
Or at least use igt_assert_f() with explanation message.

> +	for (int j = 0; j < resources->count_connectors; j++) {
> +		int status = DRM_MODE_UNKNOWNCONNECTION;
> +
> +		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd,
> +								       resources->connectors[j],
> +								       timeout);
> +
> +		if (connector)
> +			status = connector->connection;
> +		drmModeFreeConnector(connector);
> +
> +		if (status == DRM_MODE_CONNECTED) {
> +			tmp_alloc = reallocarray(*connector_ids,
> +						 connected_count
> +						 + 1, sizeof(**connector_ids));

Why this line breaks? imho better:
			tmp_alloc = reallocarray(*connector_ids,
						 connected_count + 1,
						 sizeof(**connector_ids));

> +			if (tmp_alloc) {
> +				*connector_ids = tmp_alloc;
> +			} else {
> +				free(*connector_ids);
> +				drmModeFreeResources(resources);
> +				igt_assert(false);

Use igt_assert_f() with explanation message.

> +			}

Btw better flow is with error check first:
			if (!tmp_alloc) {
				...handle error here with assert
			}

			*connector_ids = tmp_alloc;

Regards,
Kamil

> +			(*connector_ids)[connected_count] = resources->connectors[j];
> +			connected_count++;
> +		}
> +	}
> +	drmModeFreeResources(resources);
> +
> +	return connected_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 934f24d5915b..4efd40a3ad08 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1303,5 +1303,6 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>  
>  bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
>  				   int drm_mode);
> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>  
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.52.0
> 
