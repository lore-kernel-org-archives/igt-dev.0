Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2F3C47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 12:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0177B10ED3E;
	Thu,  1 Feb 2024 12:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VX/iLtMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF410ED3E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706791505; x=1738327505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EWyxvDytIw+zt0yLQ+z/y+7z8obfyGDB9XnlrEuwmk8=;
 b=VX/iLtMU2cQk6P7C9O6z3iCtM+dIKo9j+DkCl/46//NWZfeml7PSEUbj
 9emZJ1bTecThMYVvO5Ig2rLsncDqDx4vMX2qs8litvoDN5O8Rn8luF7qD
 wPNzyCUE9DBvICOric7SFBdZRJkguJJ9BYIQaPqg6dXh/cwG6az6k6aTs
 HoxOXBJcbi4hR7bGm+rMJO1arF/hUAnzEmaRlwsyqorWgOQq6h7hOR6a2
 iYG8a4woOxOJ0c1zKEBO+QkW1X8eZmJqdk3KLxZlJTvy9ue1PnSmrVIbN
 71BU18eDZ0B6loxVpdOPn9MInxFQAo3olJTv+27p3/BRhpzh3wVDlcmJI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="103340"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="103340"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="89270"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 04:45:04 -0800
Date: Thu, 1 Feb 2024 13:45:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/igt_drm_fdinfo: Mandatory drm-fields first
Message-ID: <20240201124500.57iy6xsj5jk3bh47@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <20240201004744.352041-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240201004744.352041-3-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-01-31 at 16:46:25 -0800, Lucas De Marchi wrote:
> drm-driver and drm-client-id are 2 keys that should be on any driver's
> implementation of fdinfo. Move them earlier so it's clear what the
> "good" tracking is doing.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_drm_fdinfo.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 5c0ccf624..17cac4009 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -233,12 +233,13 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>  		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>  			strncpy(info->driver, v, sizeof(info->driver) - 1);
>  			good++;
> -		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
> -			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>  		}  else if ((v = find_kv(l, "drm-client-id",
>  					 strlen("drm-client-id")))) {
>  			info->id = atol(v);
>  			good++;
> +		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
> +			/* optional */
> +			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>  		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>  			idx = parse_engine(l, info,
>  					   strlen("drm-engine-capacity-"),
> -- 
> 2.43.0
> 
