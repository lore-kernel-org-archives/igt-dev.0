Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F51FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 07:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCED10E303;
	Tue, 28 Apr 2026 07:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJJbPWrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B3010E303
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777360865; x=1808896865;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U6mhNf5W1F4PS51B76UqNoXIvk9tSb3yeXa+IEtxSpE=;
 b=jJJbPWrn6NI4qzhN8S0S2gGL7sFHCGMXb2tsd4X7KblzZ13odUPFFuis
 MtN1B7cPlxWdQYYu06E3lGUdw5Ws6Ln0SUJYnrchI8SN4Fo9KVCyGk6vo
 ww67sM+zuMohE8qdQXnBlci4Nh8iRAXqw55TQ6UkZQWxNFO8hE5nG7bpr
 FvXbCA6YBsFY9/1xy+kVTLRqQYgT06k4znAR3H3scythzdtVB7i5OQ0Vo
 a7CbUCc8nSMv3PKQYL04CBICzosmSyJocCC2hJBhZTDyPIpYm+Q2WgI49
 fnRGNL0otj/NYymiXHtQTZkZ8y1ifaa5Me/UCPQ1TnzF93AibLjqWhLRo A==;
X-CSE-ConnectionGUID: ZkZRZ4zWT6ShemrW+jePGA==
X-CSE-MsgGUID: MQOzgxrHTwql7ZDhHfvMjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78281457"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78281457"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:21:04 -0700
X-CSE-ConnectionGUID: hPtshxF1QQGJYvO4i/JDWg==
X-CSE-MsgGUID: AKGKbXbcQ/+9b+vgWY7pXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="237828065"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:21:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v1 05/25] lib/igt_kms: Add function to get valid
 pipe for specific output
In-Reply-To: <20260428044644.257001-6-mohammed.bilal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
 <20260428044644.257001-6-mohammed.bilal@intel.com>
Date: Tue, 28 Apr 2026 10:21:00 +0300
Message-ID: <6b45259b78590383ea288a7ea43ee0c762e2d10c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 28 Apr 2026, Mohammed Bilal <mohammed.bilal@intel.com> wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
>
> Introduces a new function igt_get_pipe_for_output in igt_kms. The function
> is designed to retrieve a valid pipe for a specific output in a display.

Please avoid using pipes. Why would you need the pipe here?

The function isn't even used in the entire series.

>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_kms.c | 22 ++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 23 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index aa086e96c..73d65f70a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -8426,3 +8426,25 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
>  
>  	return 0;
>  }
> +
> +/**
> + * igt_get_pipe_for_output:
> + * @display: display to fetch the pipes
> + * @output: output to use
> + *
> + * Get a valid pipe for a specific output. The return value is the pipe first valid pipe for a
> + * specific output.
> + */
> +enum pipe igt_get_pipe_for_output(igt_display_t *display,
> +				  igt_output_t *output)
> +{
> +        igt_crtc_t *crtc;
> +
> +        for_each_crtc(display, crtc) {
> +                if (igt_output_is_connected(output) &&
> +                     (output->config.valid_crtc_index_mask & (1 << crtc->crtc_index)))
> +                        return crtc->pipe;
> +        }
> +
> +        return PIPE_NONE;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index bc921f4ff..70b7d1a58 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1305,5 +1305,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>  drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
>  uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
> +enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
>  
>  #endif /* __IGT_KMS_H__ */

-- 
Jani Nikula, Intel
