Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313F2D44D77
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 14:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E2D10E2DF;
	Wed,  6 Nov 2024 14:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ouo6NA6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B3510E2DF
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730902649; x=1762438649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HfV3YJx+UmPR07EKhrvDFdIy9il9kmYwx1Xq6rn4Uhw=;
 b=Ouo6NA6zdb5qfTEFQ9mInKkMoRXFBqBgLMLoo2W4ndXeYLC8hNgrHImU
 t1WpV+dScN7CZSBoYZyn/+EBTMku0Oj+ObDWbAjTplcWeZ6ThQe0uErm9
 B+55VDNqg92hJ9TChfCu5XOCDk6ZOUm/O5sFF9glTXzXpCaKgbvRUhnyf
 7x2WdM/HtO6EOB8WKV4fyHRa6R8MvZzePBqUqNstkGLhUulNC1pxnOYIT
 J9cATYN6DkcQGold5PtAQTUS/LzcJCCRafgRDqqY/qXr2I4kcELqQEh7H
 35kE1ARihDeAdj1osqf/NNl5dr0JHxce/XN7FdWnP3ii65DFMkuelHMv1 w==;
X-CSE-ConnectionGUID: BHpq1DWTT4GpwkAB6FAKDA==
X-CSE-MsgGUID: rnnHWIcWRsa32FxVCB8LGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30472463"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30472463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:17:29 -0800
X-CSE-ConnectionGUID: C47MfYhrR2ytty1P6HHVMQ==
X-CSE-MsgGUID: qxj0xXd2SfyzMG/DoZF7VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="122084233"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:17:25 -0800
Date: Wed, 6 Nov 2024 15:17:23 +0100
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
Subject: Re: [PATCH i-g-t v2 2/5] lib/igt_kms: Add helper to wait for a
 specific status on a connector
Message-ID: <20241106141723.74jwtjujtxxee47m@kamilkon-desk.igk.intel.com>
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
 <20241022-b4-cv3-01-igt-kms-v2-2-8f654694b513@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-2-8f654694b513@bootlin.com>
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
On 2024-10-22 at 12:28:36 +0200, Louis Chauvet wrote:
> During testing with chamelium, it is frequent to wait for a specific
> connector status. This new helper is polling the DRM API to wait for this
> status. This allows detecting new status without notifier systems (which
> can fail if hot plug detection is not working properly on the device under
> test.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 38 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  3 +++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 195868646a14..40c0a207cd17 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7143,3 +7143,41 @@ float igt_default_detect_timeout(void)
>  
>  	return timeout;
>  }
> +
> +/**
> + * igt_wait_for_connector_status - Wait for at most @timeout that the connector @connector_id
> + * status become @drm_mode
> + *
> + * @drm_fd: drm file descriptor
> + * @connector_id: connector to monitor
> + * @timeout: maximum duration to wait, in second
> + * @drm_mode: mode to wait for, see enum drmModeConnection
> + *
> + * Returns: true when the status is reached, false if there is a timeout
> + */
> +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> +				   int drm_mode)
> +{
> +	drmModeConnector *connector;
> +	struct timespec start, end;
> +
> +	if (timeout == 0.0)

Floating comparision is tricky, I would suggest something like
	if (abs(timeout) < epsilon)

> +		timeout = igt_default_detect_timeout();

What if it is still zero here?

Regards,
Kamil

> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	clock_gettime(CLOCK_MONOTONIC, &end);
> +
> +	while (igt_time_elapsed(&start, &end) <= timeout) {
> +		connector = drmModeGetConnector(drm_fd, connector_id);
> +		if (connector && connector->connection == drm_mode) {
> +			free(connector);
> +			return true;
> +		}
> +		free(connector);
> +		clock_gettime(CLOCK_MONOTONIC, &end);
> +	}
> +
> +	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
> +		  connector_id);
> +	return false;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 4f0030264d9f..4cd4a4f65460 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1263,4 +1263,7 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output);
>  
>  float igt_default_detect_timeout(void);
>  
> +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> +				   int drm_mode);
> +
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.46.2
> 
