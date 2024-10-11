Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2553AD24470
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 17:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1CC10E06B;
	Fri, 11 Oct 2024 17:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQJxBNgC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C87410E06B
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 17:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728667026; x=1760203026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b2haur/67dClmIw2ITSAmLw+2wBwVAUrKXJEIuCCMP8=;
 b=VQJxBNgCuQsRksTm5FSIdVVplbKjdYL3J9Jf3FHkEvhqlj0TXTTbX71w
 DxNF6X+lnTM3Ui6O0F40Zx3l8j615FtFWgvGpBMQm+odi6eT/5o4J4l3E
 ZKviXXSrqQOOJwDtTVuMHnvUzHgOanMFDP1oAr3oQSm1XBboj4DZNINGq
 SF3m3GT8rl4DRI33SoH7ZrygHabh4rIf6ydFc+k0pAVaeCmfe6eanDtJO
 O2fOMK8VBv93LNJWkECnW+UkpWYE03s40EHHXnnyvGgkWcu5pbJ90iadP
 jcX8JgbjS8yIpulPbqTfYf46SDLvKtP9ZFpZeVHXCZSMeMNgQeRUW3eUk Q==;
X-CSE-ConnectionGUID: Ryo8eCfiQUurF0Jy7uX8CA==
X-CSE-MsgGUID: 3NVJPoduTb+sbrkN4xs+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39200392"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="39200392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 10:17:06 -0700
X-CSE-ConnectionGUID: yoPz2Vv9R0KswJg9AIrwHg==
X-CSE-MsgGUID: qAxuhBI+Rf6ko7DyxrNHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="114427483"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 10:17:05 -0700
Date: Fri, 11 Oct 2024 19:17:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/5] lib/power: Allow use of rapl by specifying fd=-1
Message-ID: <20241011171702.cwhzh4wnwmh2i6oy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916201841.29592-2-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-09-16 at 23:18:37 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> igt_power_open() is currently defunct when you don't have
> the GPU driver loaded, or when you explicitly want to measure
> via rapl even when using a DGPU. Allow those use cases by
> accepting fd<0 to indicate that we explicitly want to use rapl.


This is ok but imho you should document it in function description.

With that
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_power.c b/lib/igt_power.c
> index 810859b134dc..f4d3efcf0cec 100644
> --- a/lib/igt_power.c
> +++ b/lib/igt_power.c
> @@ -106,7 +106,7 @@ int igt_power_open(int fd, struct igt_power *p, const char *domain)
>  	p->hwmon_fd = -1;
>  	p->rapl.fd = -1;
>  
> -	is_dgfx = is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd);
> +	is_dgfx = fd >= 0 && (is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd));
>  	if (is_dgfx) {
>  		if (strncmp(domain, "gpu", strlen("gpu")) == 0) {
>  			p->hwmon_fd = igt_hwmon_open(fd);
> -- 
> 2.44.2
> 
