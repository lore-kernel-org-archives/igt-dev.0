Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18972D44D75
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 14:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85CC10E6F4;
	Wed,  6 Nov 2024 14:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A43EaXDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273C10E6F4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730903313; x=1762439313;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WeD5HyYf+J6a1xq7hQKpgy8ISAfDqYlL+US2HKjhTr8=;
 b=A43EaXDPvM5ps3z151TM/3FLPZnzs4dL+mK9AHCdEKlC5GB2qugw1MaC
 w+K3NUds5nR5XxXClCYc55F6b1K5RX5GbtC5CYoicqk4lov4FyssfXNy6
 6QHxBkhMS1NhQxV0LQ6dw/9037vL68xqu7wGpTvzkWNrPmEk1i6vDM8rl
 dP9J/1zLNIKBVzJlAi1pp6M2vQGGhN3JZkc1Bzlv/ZXFB/QdmICgdjUxj
 kw+l7qUNMz3PXHN1CA1Ehktw0BUZzNWo+ZXlTfF59tHvt1EAyVEzBX7WU
 pTXPxFcn/5JCpeFuczZxSvo0ulteBvmHCinXpk2JW/Gi3i7IcGuGlVMFO g==;
X-CSE-ConnectionGUID: HXXQx+30RmSKzKuhc74SKg==
X-CSE-MsgGUID: YY9o8O6zS4W5ppfiDIH/uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41326605"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="41326605"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:28:33 -0800
X-CSE-ConnectionGUID: fs+tOI5oR5+S/BtFnqjG2Q==
X-CSE-MsgGUID: 9Bx3/9oqTpe+jowpf9SbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84700843"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 06:28:31 -0800
Date: Wed, 6 Nov 2024 15:28:27 +0100
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
Subject: Re: [PATCH i-g-t v2 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
Message-ID: <20241106142827.hhkxbweo6s3yojdm@kamilkon-desk.igk.intel.com>
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
 <20241022-b4-cv3-01-igt-kms-v2-5-8f654694b513@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-5-8f654694b513@bootlin.com>
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
On 2024-10-22 at 12:28:39 +0200, Louis Chauvet wrote:
> Introduces a new function igt_get_pipe_for_output in igt_kms. The function
> is designed to retrieve a valid pipe for a specific output in a display.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 19 +++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index fce5666cefc6..82d63d6e6229 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7332,3 +7332,22 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
>  	drmModeFreeResources(res);
>  	return 0;
>  }
> +
> +/**
> + * igt_get_pipe_for_output - Get a valid pipe for a specific output
> + * @display: display to fetch the pipes
> + * @output: output to use
> + */
> +enum pipe igt_get_pipe_for_output(igt_display_t *display,
> +				  igt_output_t *output)
> +{
> +	enum pipe pipe;
> +
> +	for_each_pipe(display, pipe) {
> +		if ((igt_output_is_connected((output)) &&
> +		     (output->config.valid_crtc_idx_mask & (1 << (pipe)))))
> +			return pipe;
> +	}
> +
> +	igt_assert_f(false, "No pipe found for output %s\n", igt_output_name(output));

Please try to not assert in lib function.

Regards,
Kamil

> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e9732c247dea..e0d968b52033 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1269,5 +1269,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>  drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
> +enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */
> 
> -- 
> 2.46.2
> 
