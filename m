Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0991E9A758
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 10:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C7C10E0A2;
	Tue, 24 Mar 2026 10:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apStrGRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389F210E0A2
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774347757; x=1805883757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7qPvksgwLOx1f+Vr7mXDZiqzmobwwO2xhMFt2/K578E=;
 b=apStrGRhHTClg/MiUFD10uXMG27dNWYABJafQtF016pfYzX+SWgTSLvs
 EyU+6XDXQau+6eWYQauGtJcrwgctljVyGzUEZNR+JcNVD8O+5C0YNSbAx
 rUDOjHKrKHNT0y9xboHraGWIBzZZu7oqvr6FAciDLRblG5W3k9IxSh/oh
 fsZH1zpNwSAEuHSixoJ+juEQfT9TU70v7G5Fx+vgjVLQnQ5TfmiecmrO4
 i2qhs09AKSVr3sqX/ZZQ9qwJFhzTXLxk0V6Il9THkdFaDrGDixprbAXtm
 kr6S04a5zuwxj4n2cE9VBS2IIijFr7JFhKx1b4+iUdjNYNtv9UqbatjbK Q==;
X-CSE-ConnectionGUID: e0oLU3DIQUOAPHfiJRdOpQ==
X-CSE-MsgGUID: HHo9nwxVQDiH1IA0xNZ8tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75265420"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75265420"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 03:22:36 -0700
X-CSE-ConnectionGUID: v/fmuTy3SheusD2oUMDAuQ==
X-CSE-MsgGUID: vU1ZAjY2SBak5HnO+i0p4g==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:22:35 -0700
Date: Tue, 24 Mar 2026 11:22:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 02/49] lib/igt_kms: Add helper to wait for a
 specific status on a connector
Message-ID: <20260324102232.n5ehoylqm4blos6r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-2-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-unigraf-integration-v9-2-a01dffc3b0cb@bootlin.com>
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
On 2026-03-16 at 17:17:23 +0100, Louis Chauvet wrote:
> During testing with chamelium, it is frequent to wait for a specific
> connector status. This new helper is polling the DRM API to wait for this
> status. This allows detecting it without notifier systems which can fail
> if hot plug detection is not working properly on the device under test.
> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  3 +++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 692d75b70ecc..4a496ab256f0 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8093,3 +8093,44 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
>  
>  	return crtcs[rand() % n];
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

Checks for equality are risky for floating numbers, instead use
inequality:

	if (timeout < 0.0)

> +		timeout = igt_default_display_detect_timeout();
> +
> +	igt_assert_eq(igt_gettime(&start), 0);
> +	end = start;
> +
> +	while (igt_time_elapsed(&start, &end) <= timeout) {
> +		connector = drmModeGetConnector(drm_fd, connector_id);
> +		if (connector && connector->connection == drm_mode) {
> +			drmModeFreeConnector(connector);
> +			return true;
> +		}
> +		drmModeFreeConnector(connector);
> +		usleep(10000);

imho this should be defined as constant or with #define and used
here.


Regards,
Kamil

> +		igt_assert_eq(igt_gettime(&end), 0);
> +	}
> +
> +	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
> +		  connector_id);
> +
> +	return false;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 081613a4b949..934f24d5915b 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1301,4 +1301,7 @@ void igt_get_and_wait_out_fence(igt_output_t *output);
>  
>  igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>  
> +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> +				   int drm_mode);
> +
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.52.0
> 
