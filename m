Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8C1C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 08:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456B410E33B;
	Wed, 19 Mar 2025 08:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFklV1a6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2640510E33B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742374004; x=1773910004;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IZ0pQdlcwEPbGGyHDATrt14gXxor5nxpRUdrPuz44c8=;
 b=eFklV1a6PmHmD3O2GYhoNcfyGFhatwSYKQrf8jcTuDL5nnMp4sMTCI7/
 Pgt8TEYSDP9hm0C5SOTkIx2s4Ah1jypiqCzErB5vKD92uWJjl6oTnCJql
 sI1JQLERMoQQ0euwDLhUueFcMkyrwIELFgAt8GT2Co3ObcE+Qa9M5pckv
 EeZMHm1LD78MTINYYPExv6pM5Yc2IMJVMGPPHEoks94DlZBMvVgohZ7ZC
 5az0FkDGRe7nlIw1CT11PREB23wJgdSReNbqBjRlSvF86jJvKFAK/aIrH
 Nhb7oZFTxRWRo1QKyG9jEtrEC6xf1d0YGEptdZuSdGwNW9/tDfpIE0JTx g==;
X-CSE-ConnectionGUID: 7WkC6Qq7Qnypx4mfkpFYVw==
X-CSE-MsgGUID: GkDR+AquTamx6jJ3KMBDYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54928709"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="54928709"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 01:46:43 -0700
X-CSE-ConnectionGUID: LefhSm+sRhaSkB1LRB0qjQ==
X-CSE-MsgGUID: zggjuSCeStal7475bndEUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="145721759"
Received: from anoopn-mobl3.gar.corp.intel.com (HELO [10.247.161.84])
 ([10.247.161.84])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 01:46:35 -0700
Message-ID: <48a41355-b190-42ce-a224-8e71a28613a1@intel.com>
Date: Wed, 19 Mar 2025 14:16:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,2/5] lib/igt_kms: Add helper to wait for a specific
 status on a connector
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com,
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com
References: <20250110-b4-cv3-01-igt-kms-v4-2-0b0474708f9f@bootlin.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250110-b4-cv3-01-igt-kms-v4-2-0b0474708f9f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello Louis,

Can we have all connector related at one place (kms_connector_helper or 
igt_connector),
igt_kms is already crowded and also will be easy to find all connector 
helpers at one place.

Thanks and Regards
Kunal Joshi

On 10-01-2025 23:12, Louis Chauvet wrote:
> During testing with chamelium, it is frequent to wait for a specific
> connector status. This new helper is polling the DRM API to wait for this
> status. This allows detecting it without notifier systems which can fail
> if hot plug detection is not working properly on the device under test.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  3 +++
>   2 files changed, 42 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b3373435b252c9f8c5d5854f738f7f4bbc468964..d0b6c70f135754d0a413f73a0f8e5b24a208a2b3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7245,3 +7245,42 @@ double igt_default_display_detect_timeout(void)
>   
>   	return timeout;
>   }
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
> +		timeout = igt_default_display_detect_timeout();
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
> +	return false;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 91a26f2070efd26f9d107841ae3083b281d5e4c6..6d5582290f61d1a4151dd8e8448fc26c660a1536 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1279,4 +1279,7 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>   
>   double igt_default_display_detect_timeout(void);
>   
> +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> +				   int drm_mode);
> +
>   #endif /* __IGT_KMS_H__ */
