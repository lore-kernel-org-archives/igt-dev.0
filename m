Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58977D44D77
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 14:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9E810E6F4;
	Wed,  6 Nov 2024 14:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlNlFTrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BBC10E6F4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730902849; x=1762438849;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tKFdLTELiH6vckZ+HDnUdey9W6oGAzX23ggl87DOGi0=;
 b=HlNlFTrIe2podfgedNmYdMc4kAHwYt/K/yKHXaexB7i88zSWkuAbqGcR
 xySAyQGgGtLaAKi9kJvsuzJHBrWlUglyVbIc8a1Kh4q/irkGiru4FpiFZ
 fpvVS6sCBjt0T0JrT4OSWn24qTeVwUV4c2M0s98Np+LQq9J5e3ju9kPr/
 PaDjjZud7gTWRrJbitVSJzAKgVi3GFpXw2FWAZ6r82q0Igl/PX1VoMe3r
 dsTD0T4vaA/xY/RCCkS5CHq5ZVs2MmNDdpsWm867FNYpfocypew9Q/VTx
 MLZ1D1P85XcQ3r/vVIkg+Ytat4sMQYqhjIvFhhguULVPh7MlmD3HvzgCr g==;
X-CSE-ConnectionGUID: FW6gReaFTp2Tz+43BlyzPA==
X-CSE-MsgGUID: EbWtUegIQvaOC9oEgfUHew==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="48217999"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="48217999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:20:49 -0800
X-CSE-ConnectionGUID: 26XYpUPJTUCJPp5O/RUA9g==
X-CSE-MsgGUID: 3X/L+6GgTHOGQGzPViaWMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="115359112"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:20:46 -0800
Date: Wed, 6 Nov 2024 15:20:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 3/5] lib/igt_kms: Add function to list connected
 connectors
Message-ID: <20241106142044.4jbxxwd5wqimxpxi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
 <20241022-b4-cv3-01-igt-kms-v2-3-8f654694b513@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-3-8f654694b513@bootlin.com>
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
On 2024-10-22 at 12:28:37 +0200, Louis Chauvet wrote:
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
>  lib/igt_kms.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 40c0a207cd17..44b546ae52dc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7181,3 +7181,57 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
>  		  connector_id);
>  	return false;
>  }
> +
> +/**
> + * igt_get_connected_connectors - List all connectors reported as CONNECTED by DRM.
> + *
> + * @drm_fd: DRM file description
> + * @connector_ids: out pointer for the list of connector ids connected. It must be freed by the
> + * caller.
> + *
> + * The returns value is the number of connectors
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
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +		while (!connector &&
> +		       igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
> +			connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
> +			clock_gettime(CLOCK_MONOTONIC, &end);
> +		}
> +
> +		if (igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
> +			igt_assert(connector);

Please try to not assert in lib functions, unless abslutly nessesery.
Why not just return zero in case no connected connectors are detected.

Regards,
Kamil

> +
> +			if (connector->connection == DRM_MODE_CONNECTED) {
> +				*connector_ids = reallocarray(*connector_ids,
> +							      connected_count
> +							      + 1, sizeof(**connector_ids));
> +				igt_assert(*connector_ids);
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
> index 4cd4a4f65460..4674b271638a 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1265,5 +1265,6 @@ float igt_default_detect_timeout(void);
>  
>  bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
>  				   int drm_mode);
> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>  
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.46.2
> 
