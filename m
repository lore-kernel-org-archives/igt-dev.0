Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E46CF9C5E
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 17:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A12810E2F7;
	Fri, 20 Sep 2024 17:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkE6qvCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFFD10E2F7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726854216; x=1758390216;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Oe8hYsr49lqUIY/it3xd8O2g29+xJpLCM9bdQzjzaXg=;
 b=GkE6qvCdq/l6RYo3/7g1BjZsrHG8wwOWUIxsBCu6WrE+rYqMA+2YiHlR
 W9Vjgyk0g3MSR08GNRO0xO6j/LOJYZVEsxnY57XkfFh/4GujNBj6+B0Ud
 bkyRBHhqQc43LB4YM9WXvySgSLcWTMjW80un/n6lODRg1I0Xu1lL66Vpo
 dYG+0JJQT02zX7s2kz/G2yPH5lD4HvGvMRMyRATnzikOLNjpRZBVDIO+s
 XshU5SZPAhohwwrMMJ/ZXXJyZ2GaJU36x9VuKAD7waBf4UjHNPqZwgwdn
 GRybGkj/kdOVnO5HNWOMuNOrZ1phFWd4xryWrcLhT8SpZCfquAuZr3S9Z w==;
X-CSE-ConnectionGUID: 5zQSo4bsSASBb55aDApEtA==
X-CSE-MsgGUID: aVVHz5ywRFy/lE6xAqR8FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26054876"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="26054876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:43:35 -0700
X-CSE-ConnectionGUID: fM7iypK6TPmwXSJAJk9PLw==
X-CSE-MsgGUID: /yHuz8OVTFeI+tMtCsdIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70523431"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 20 Sep 2024 10:43:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2024 20:43:31 +0300
Date: Fri, 20 Sep 2024 20:43:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/6] tools/intel_reg: Add forcewake support to xe
Message-ID: <Zu20Q9XQBMYfu6eC@intel.com>
References: <20240918163629.1186314-1-lucas.demarchi@intel.com>
 <20240918163629.1186314-7-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918163629.1186314-7-lucas.demarchi@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Sep 18, 2024 at 09:36:29AM -0700, Lucas De Marchi wrote:
> Now that the igt lib is prepared, start passing the open driver fd so
> the correct forcewake is taken.
> 
> Before:
> $ sudo ./build/tools/intel_reg read 0x2358
>                                     (0x00002358): 0xffffffff
> 
> After:
> $ sudo ./build/tools/intel_reg read 0x2358
> Opened device: /dev/dri/card0
>                                     (0x00002358): 0x91e59eeb
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel_reg.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> index 906ae9b84..b650c3697 100644
> --- a/tools/intel_reg.c
> +++ b/tools/intel_reg.c
> @@ -802,7 +802,18 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
>  
>  static int register_access_init(struct config *config)
>  {
> -	return intel_register_access_init(&config->mmio_data, config->pci_dev, 0, -1);
> +	int drm_fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> +	int ret;
> +
> +	if (drm_fd < 0) {
> +		fprintf(stderr, "could not open i915 or xe device\n");
> +		return EXIT_FAILURE;

Nak. The tool must work without a driver.

> +	}
> +
> +	ret = intel_register_access_init(&config->mmio_data, config->pci_dev, 0, drm_fd);
> +	close(drm_fd);
> +
> +	return ret;
>  }
>  
>  /* XXX: add support for register ranges, maybe REGISTER..REGISTER */
> -- 
> 2.46.1

-- 
Ville Syrjälä
Intel
