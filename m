Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F178E7718A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 19:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489DE10E030;
	Thu, 19 Dec 2024 19:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keOjIX//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F62410E030
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734636008; x=1766172008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zlIcDR4eKuTMlFULFzjaq6Dlbb9Gxgije/Fmuap5mp4=;
 b=keOjIX//qjocxWkLB5P56MnQ4V8B6cPfCTi+5yuwLjdsdE3my9GugzJw
 aVOUqbEZ/eTt8wQqM0xyAgK+3pr8NHiBNJwJHiKZI/ZnYCOrUYguZ8EvQ
 pZfqaTK83Qr1ddy1/X67A7RE7xQEAGzGPPGtENkIQUxXuMbygfVHCKyAP
 Z6HAvikTgidyyYgtgh/aCr0h+hmIknIAjwbHXikBqy0NPCSyWh30nWBZn
 FCjKb7IIMH8wwd+t32sUm1QjsMJzgnaQtndM7Jg81x64ek4SGGaFX7wo+
 g3u82VWxK1kvayhQ2/SsdtQ66YEWCPALPHFOSF7Vb7fpOVErtIt9CAGnR Q==;
X-CSE-ConnectionGUID: aI+MfEXLS8O5k29EqHpyBA==
X-CSE-MsgGUID: ZUUZZHjLQhOdHEXCxkIWAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35387348"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35387348"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 11:20:08 -0800
X-CSE-ConnectionGUID: +AFVWCbnRiW35ilwyNl2LQ==
X-CSE-MsgGUID: epLvDHpfQiKEn4deydbvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98086440"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 11:20:05 -0800
Date: Thu, 19 Dec 2024 20:19:45 +0100
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
Subject: Re: [PATCH i-g-t v3 2/5] lib/igt_kms: Add helper to wait for a
 specific status on a connector
Message-ID: <20241219191945.zhneym3nah3fdt5p@kamilkon-desk.igk.intel.com>
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
 <20241122-b4-cv3-01-igt-kms-v3-2-c5ced6976e11@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-2-c5ced6976e11@bootlin.com>
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
On 2024-11-22 at 16:19:05 +0100, Louis Chauvet wrote:
> During testing with chamelium, it is frequent to wait for a specific
> connector status. This new helper is polling the DRM API to wait for this
> status. This allows detecting new status without notifier systems (which
------------------------------- ^^^^^^^^^^ ------------------------ ^
s/new status/it/
s/\(//

status. This allows detecting it without notifier systems which

> can fail if hot plug detection is not working properly on the device under
> test.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

I changed Bhanu e-mail.

> ---
>  lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  3 +++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0b76a47eb2135cca21881d97c2fd78e724d9a30e..626f56b8caa4bc0ba98c69aa22d0a6bf80aadedf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7218,3 +7218,42 @@ float igt_default_detect_timeout(void)
>  
>  	return timeout;
>  }
> +
> +/**
> + * igt_wait_for_connector_status:
> + * @drm_fd: drm file descriptor
> + * @connector_id: connector to monitor
> + * @timeout: maximum duration to wait, in second. Use -1.0 to set the timeout
> + *           to igt_default_detect_timeout().
> + * @drm_mode: mode to wait for, see enum drmModeConnection
> + *
> + * Wait for at most @timeout that the connector @connector_id  status
> + * become @drm_mode
> + * Returns: true when the status is reached, false if there is a timeout
> + */
> +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> +				   int drm_mode)
> +{
> +	drmModeConnector *connector;
> +	struct timespec start, end;
> +
> +	if (timeout == -1.0)

Do not make comparisions with double or float, better:
	if (timeout < 0.0)

> +		timeout = igt_default_detect_timeout();
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +	end = start;
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

Print also timeout used.

With above corrected
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +	return false;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 3509283b6da5b3fdbd70ebdc9bdd241326bc5073..6c6df3f18dde72459d09b56192e108da5d951bdd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1275,4 +1275,7 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>  
>  float igt_default_detect_timeout(void);
>  
> +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> +				   int drm_mode);
> +
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.47.0
> 
