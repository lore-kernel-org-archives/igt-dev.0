Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE4FE77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 20:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0F810E092;
	Thu, 19 Dec 2024 20:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G33kqIgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3303710E092
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 20:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734639008; x=1766175008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oI09fgI6nKc6mV1GdsQxqxFj+Sy1Zh+n3yAQs+mRR+o=;
 b=G33kqIgvqdc9FOAKJrsT3qyL80sgEeH2B+KBPe2F95uHAAXS0uRN44pH
 lLjarEgcsx3Wm4XuPoKGjDavm1XLvX2+cU/f7rCqT35nGvn+G6G8bNnCH
 gFfSBMYTAGPx4uR22UDDDzCNAKJCRv+MU5FhMxqXF4mBi6O1uyB/3e9xH
 8ajaVpFFIrVzPvgLukLgWlUsq7DVGknONGuyM+QoZ6TAiWEFR92DX0oyL
 4eLi6PvIBP4EHiDppRUdFktXDeYvHCKV8N7iWrxBR1TjM8UUc8hKKweDz
 blKkjYPB5g4kMv5ZUaCAPIWv8PyGQqPGgh+khWpJZCo0bsAJhECPYsUhg Q==;
X-CSE-ConnectionGUID: t+hU9dq2Q2+ADOkQCzqarQ==
X-CSE-MsgGUID: 8rgKDDtSQPKGZrt8r0zEdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="57644249"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="57644249"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:10:07 -0800
X-CSE-ConnectionGUID: twiO6UnoR2eLYcH0PTSq1A==
X-CSE-MsgGUID: OpM7tJjXR3OBECd9TxGbng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98503004"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 12:09:59 -0800
Date: Thu, 19 Dec 2024 21:09:56 +0100
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
Subject: Re: [PATCH i-g-t v3 4/5] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
Message-ID: <20241219200956.vsjqrqwe2suyvy6e@kamilkon-desk.igk.intel.com>
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
 <20241122-b4-cv3-01-igt-kms-v3-4-c5ced6976e11@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-4-c5ced6976e11@bootlin.com>
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
On 2024-11-22 at 16:19:07 +0100, Louis Chauvet wrote:
> Introduce the functions igt_get_connector_from_name() and
> igt_get_connector_id_from_mst_path(). These functions serve to retrieve
> the connector object using a connector name and a connector ID from its
> MST path, respectively.
> 
> Given that the connector id may not be consistent, especially with MST
> connectors, these functions are essential to recognize each connector even
> after system reboots and plug/unplug events.
> 
> The function igt_get_connector_id_from_name() is a convenient wrapper for
> igt_get_connector_from_name() to streamline its usage when the caller only
> requires the connector id.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 106 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |   3 ++
>  2 files changed, 109 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5d3f609d469d741d9fd68a9a0b41ab0162d322b6..5c242a5bdec619d181c3d0d632f1ea7d94d34743 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7314,3 +7314,109 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
>  	return
>  	    connected_count;
>  }
> +
> +
> +/**
> + * igt_get_connector_from_name:
> + * @drm_fd: DRM file descriptor
> + * @port_name: Port name to search
> + *
> + * Returns: The connector if found, NULL otherwise. The pointer must
> + * be freed with drmModeFreeConnector()
> + */
> +drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name)
> +{
> +	drmModeResPtr res = drmModeGetResources(drm_fd);
> +	struct timespec start, end;
> +	int i;
> +
> +	if (!res)
> +		return 0;

return NULL;

> +
> +	for (i = 0; i < res->count_connectors; i++) {
> +		char name[50];
------------------------- ^^
Make it a define here or in a header for example:

#define IGT_KMS_CONNECTOR_NAME_SIZE 50

> +
> +		drmModeConnectorPtr connector = drmModeGetConnector(drm_fd, res->connectors[i]);
> +		/*
> +		 * This time is required as sometimes some id in the connector list are not totally
> +		 * ready or can disappear
> +		 */
> +		clock_gettime(CLOCK_MONOTONIC, &start);
> +		end = start;
> +		while (!connector &&
> +		       igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {
> +			connector = drmModeGetConnector(drm_fd, res->connectors[i]);
> +			clock_gettime(CLOCK_MONOTONIC, &end);
> +		}
> +

You repeat same code here, why not write down a helper for it?
For example:

		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd, res->connectors[i]), timeout);


> +		if (igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {
> +			igt_assert(connector);

Replace these two lines with:

		if (connector) {

> +
> +			/* We have to generate the connector name on our own */
> +			snprintf(name, ARRAY_SIZE(name), "%s-%u",
> +				 kmstest_connector_type_str(connector->connector_type),
> +				 connector->connector_type_id);

to be safe better:

			len = snprintf(name, ARRAY_SIZE(name) - 1, "%s-%u",
			name[len] = 0;

> +
> +			if (strcmp(port_name, name) == 0) {
> +				drmModeFreeResources(res);

Add empty line here.

> +				return connector;
> +			}

Add empty line here.

> +			drmModeFreeConnector(connector);
> +		}
> +	}

Add empty line here.

> +	drmModeFreeResources(res);

Add empty line here.

> +	return NULL;
> +}
> +
> +/**
> + * igt_get_connector_id_from_name:
> + * @drm_fd: DRM file descriptor
> + * @port_name: Port name to find in the connector
> + *
> + * Returns: The connector id if the port is found, 0 if the port is not found
> + */
> +uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name)
> +{
> +	drmModeConnectorPtr connector = igt_get_connector_from_name(drm_fd, port_name);
> +
> +	if (connector) {
> +		int connector_id = connector->connector_id;

s/int/uint32_t/

> +
> +		drmModeFreeConnector(connector);

Add empty line here.

> +		return connector_id;
> +	}

Add empty line here.

> +	return 0;
> +}
> +
> +/**
> + * igt_get_connector_id_from_mst_path:
> + * @drm_fd: DRM file descriptor
> + * @mst_path: MST path to find in the connector
> + *
> + * Returns: 0 when no connector is found with the correct mst path
> + */
> +uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
> +{
> +	drmModeResPtr res = drmModeGetResources(drm_fd);
> +	int i;
> +
> +	if (!res)
> +		return 0;
> +
> +	for (i = 0; i < res->count_connectors; i++) {
> +		uint32_t connector_id = res->connectors[i];
> +
> +		drmModePropertyBlobPtr path_blob = kmstest_get_path_blob(drm_fd, connector_id);
> +
> +		if (path_blob) {
> +			if (strcmp(path_blob->data, mst_path) == 0) {

I do not know KMS that good, is it always a string here in
path_blob->data

> +				drmModeFreePropertyBlob(path_blob);
> +				drmModeFreeResources(res);

Add empty line here.

> +				return connector_id;
> +			}

Add empty line here.

> +			drmModeFreePropertyBlob(path_blob);
> +		}
> +	}

Add empty line here.

> +	drmModeFreeResources(res);

Add empty line here.

Regards,
Kamil

> +	return 0;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 33079b696c070ee7b62ec1d5705b221ba4ad5a7c..d61ddcaa0a25f1f9bc34eff7314eaa49a3de9cc2 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1278,5 +1278,8 @@ float igt_default_detect_timeout(void);
>  bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
>  				   int drm_mode);
>  int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
> +drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
> +uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
> +uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
>  
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.47.0
> 
