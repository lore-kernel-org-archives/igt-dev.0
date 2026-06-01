Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DB2CD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 16:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250E311356A;
	Mon,  1 Jun 2026 16:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvU0qDyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621D0113568
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780330414; x=1811866414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eH5BmOiX7i8DsZSzCUIIIpP/qghsYplcU+OF7hpI7gg=;
 b=jvU0qDyXIQfN6R7/bFRBB03WNqiH/+28FNEVgenImydWI6/rZ/+m3LXP
 f60rVkbvH+iLmKds4vAQz6bWtNQ3I0GKbKjE2nJFxzyRgYFfHeBQ1Nyvs
 lX/tu/z8ZabrYfg6p/gvjfREKdGpP9ZBjoxphEJl9AOkSoqY/MI3Vr29n
 BfDaoX1CpykeacveFv6GhkVTRpmKUTvfF1ckg8kxdR0PaFPszm/NSwh2a
 SwsUKYCj+iJnskgTr1YnZ5Cyr9WhKkYoB6yaA0R+WaI4WajPPaEbgXfT0
 GeZ8vgG5Jtj7lxTpke20oybLix+NVwjkyX0gIC+PJy8S4M4ySZvs4aPjz A==;
X-CSE-ConnectionGUID: Cp73cn4CQ/KWjPd1fFaRAQ==
X-CSE-MsgGUID: lQfIjozKSrWRhIhgkp77VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92477311"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="92477311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 09:13:34 -0700
X-CSE-ConnectionGUID: BnI4JNMQQUeg8b12O7fo2Q==
X-CSE-MsgGUID: +Mji3vSmRvKK+j1f0juj0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267503145"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 09:13:33 -0700
Date: Mon, 1 Jun 2026 18:13:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
Subject: Re: [PATCH i-g-t v5 2/2] tools/igt_power: initialize xe_device cache
Message-ID: <20260601161330.2b7ujgskyn5tljhk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 zbigniew.kempczynski@intel.com, x.wang@intel.com
References: <cover.1780317251.git.sebastian.brzezinka@intel.com>
 <7b866a298e08e0b6737818a9497bea668aff7f0d.1780317251.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b866a298e08e0b6737818a9497bea668aff7f0d.1780317251.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-06-01 at 14:46:20 +0200, Sebastian Brzezinka wrote:
> Opening a DRM device with plain open() does not initialize the Xe device
> cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
> it reaches find_in_cache() which asserts the cache entry exists, causing
> a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev
> 
> Switch both open/close call sites to drm_open_driver_path() and
> __drm_close_driver() so that Xe cache setup and teardown are paired with
> the fd lifecycle, keeping igt_power free of Xe-specific handling.

We could go this way for now but imho it should read
sysfs directly without any need for device opening.
This is something to improve in future.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/igt_power.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/igt_power.c b/tools/igt_power.c
> index 6dd180d34..9458315a3 100644
> --- a/tools/igt_power.c
> +++ b/tools/igt_power.c
> @@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
>  		int ret, fd = -1;
>  
>  		if (m->drm_device) {
> -			fd = open(m->drm_device, O_RDONLY);
> +			fd = drm_open_driver_path(m->drm_device);
>  			if (fd < 0) {
>  				fprintf(stderr, "Unable to open drm device %s (%d)\n",
>  					m->drm_device, -errno);
> @@ -54,12 +54,12 @@ static bool prepare(struct measurement *m)
>  			else
>  				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
>  					m->rapl_domain, ret);
> -			close(fd);
>  
> +			__drm_close_driver(fd);
>  			return false;
>  		}
>  
> -		close(fd);
> +		__drm_close_driver(fd);
>  	}
>  
>  	return true;
> -- 
> 2.53.0
> 
