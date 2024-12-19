Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4CDE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 19:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0EA10E2AF;
	Thu, 19 Dec 2024 19:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMt2YTv0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EDC10E2AF
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 19:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734637480; x=1766173480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=55lgByI63tu26HzGOuYW0ENyqTiu3872rr6uhrPxIaU=;
 b=JMt2YTv0xWpy5LJzJCqnr9/SSOSkJeVbq2MTWmtgE6pTV+40qCA6HluI
 Bn5Bxao/+uFoZ5CXkocOie9A3Ni8p8P8IonCyGcyVEPh1yyc9vSKCWWTz
 dZMBlYths5D675DCACMO+1DgcuwZtC/5sphudzi8Mwg3RuGuqMcfGhWJl
 IHnFZtTmiCsETRKxjaPguDZ/x27ut0znOCToqvE2U1tl83dhHlP7KPHrk
 sSg6tN9YSVBij7epTf2l4Z6uurwMUILVhC5M9yAIDEUCaC6jsQtNOKNbV
 IM4Io9J6RE+RgB+7MAUGEvxbr/tF6LO+I9gIGDWcMQWmROSlvDTXTdrf6 w==;
X-CSE-ConnectionGUID: bJcz9L9FRpOJNatIjN30YQ==
X-CSE-MsgGUID: n1psphbqTKmA7sCzf50/9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="57641848"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="57641848"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 11:44:40 -0800
X-CSE-ConnectionGUID: VrNVchPyTWqWWkfrGq6TTA==
X-CSE-MsgGUID: xcj0QjOBSsSAuMFl+7XWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99117549"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 11:44:37 -0800
Date: Thu, 19 Dec 2024 20:44:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v3 3/5] lib/igt_kms: Add function to list connected
 connectors
Message-ID: <20241219194434.zwl6u6pdnwa3dmcx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
 <20241122-b4-cv3-01-igt-kms-v3-3-c5ced6976e11@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-3-c5ced6976e11@bootlin.com>
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
On 2024-11-22 at 16:19:06 +0100, Louis Chauvet wrote:
> Introduce the igt_get_connected_connectors() function, which returns a
> list of connector IDs that are currently connected according to DRM.
> 
> This function includes a timeout mechanism because connectors can be
> unplugged at any time. Also, especially with MST, the connector can be
> listed by drmModeGetResources() but not yet accessible with
> drmModeGetConnector().
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 58 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 626f56b8caa4bc0ba98c69aa22d0a6bf80aadedf..5d3f609d469d741d9fd68a9a0b41ab0162d322b6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7257,3 +7257,60 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
>  		  connector_id);
>  	return false;
>  }
> +
> +/**
> + * igt_get_connected_connectors:
> + *
> + * @drm_fd: DRM file description
> + * @connector_ids: Out pointer for the list of connector ids connected. It must be freed by the
> + * caller.
> + *
> + * This will probe all the connectors and return the list of all
> + * connected connectors.
> + * Returns: The number of connectors in @connector_ids
> + */
> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
> +{
> +	int connected_count = 0;
> +	drmModeResPtr resources;
> +	struct timespec start, end;
> +
> +	*connector_ids = NULL;
> +
> +	resources = drmModeGetResources(drm_fd);
> +	for (int j = 0; j < resources->count_connectors; j++) {
> +		drmModeConnectorPtr connector = NULL;
> +
> +		connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
> +		/*
> +		 * This time is required as sometimes some id in the connector list are not totally
> +		 * ready or can disappear
> +		 */
> +		clock_gettime(CLOCK_MONOTONIC, &start);
> +		end = start;
> +
> +		while (!connector &&
> +		       igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {

Get this timeout ahead of loop into a var,
for example 'timeout':
	double timeout = igt_default_detect_timeout();
	int connected_count = 0;
	...
and here:
		       igt_time_elapsed(&start, &end) <= timeout) {

> +			connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
> +			clock_gettime(CLOCK_MONOTONIC, &end);
> +		}
> +
> +		if (igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {

Use if() instead:
		if(connector) {


> +			igt_assert(connector);

imho you should not assert here. Try to write lib functions
without asserts (if possible).

> +
> +			if (connector->connection == DRM_MODE_CONNECTED) {
> +				*connector_ids = reallocarray(*connector_ids,
> +							      connected_count
> +							      + 1, sizeof(**connector_ids));
> +				igt_assert(*connector_ids);

Here assert is ok.

Regards,
Kamil

> +				(*connector_ids)[connected_count] = resources->connectors[j];
> +				connected_count++;
> +			}
> +			drmModeFreeConnector(connector);
> +		}
> +	}
> +	drmModeFreeResources(resources);
> +
> +	return
> +	    connected_count;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6c6df3f18dde72459d09b56192e108da5d951bdd..33079b696c070ee7b62ec1d5705b221ba4ad5a7c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1277,5 +1277,6 @@ float igt_default_detect_timeout(void);
>  
>  bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
>  				   int drm_mode);
> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>  
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.47.0
> 
