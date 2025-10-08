Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9CFCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 14:39:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4308D10E833;
	Wed,  8 Oct 2025 14:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtA2Dbg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBBA10E833
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759934364; x=1791470364;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5+jxNKUrVorti9ym1XCdss3aa+9sf9EyLIRh+Oans0I=;
 b=LtA2Dbg/3E0LS8RZzEc2nUc1bhwXNQxM+jWZdyFeLlv7VHES5NXlMU/Y
 p4nBwTSOvS/Nj4Xe2ZUL80t1+DD9nsCXHerWlxC0shlD3RPj8OvZvf8GT
 HKgNnV1V8XWl+DdPAAh1rdUrgmq6GwqZme0zyYxHpXdnVzLj1Nl3Zyrqu
 X23vBJPZ4zQjL61VqDHLAhcSXsnavKl8HrkRPkEOKkfXWZ9sEfZ+JsHzH
 wRkQsb1m7oo8OR29TzMu8bc/VIvGiRwdfTXMk/mw4LVMpEQlOGkSFG++I
 ccSLM8YjOJqDo1CDObUWfEDgMyZqDNsmJ0vOmj95Bvus++Ug8QbNUCD64 g==;
X-CSE-ConnectionGUID: w6dFU2AJS3y56zZCMuWOyg==
X-CSE-MsgGUID: vxf2cZHKT3GPejtRAJsBcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="84747550"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="84747550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:39:23 -0700
X-CSE-ConnectionGUID: ztlSEidCQ7Cjz61k1cPTyg==
X-CSE-MsgGUID: 6zDGKOzZRmuMyp2nN9Ofjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180129897"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 07:39:21 -0700
Date: Wed, 8 Oct 2025 16:39:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_flip: Suspend signal helper while
 creating fb
Message-ID: <20251008143919.ygjm53ozbtdihf5n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
References: <20251008120329.288455-2-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251008120329.288455-2-dev@lankhorst.se>
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

Hi Maarten,
On 2025-10-08 at 14:03:30 +0200, Maarten Lankhorst wrote:

Add description here.

+cc few KMS devs
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Is there any bug this closes?

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  tests/kms_flip.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 0cebbecac7..09017c65eb 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1579,6 +1579,7 @@ restart:
>  			igt_require(bo_size < gem_global_aperture_size(drm_fd));
>  		else
>  			igt_require(bo_size < (1ULL << xe_va_bits(drm_fd)));

Add newline.

Regards,
Kamil

> +		igt_suspend_signal_helper();
>  	}
>  
>  	o->fb_ids[0] = igt_create_fb(drm_fd, o->fb_width, o->fb_height,
> @@ -1590,6 +1591,9 @@ restart:
>  						  IGT_COLOR_YCBCR_LIMITED_RANGE,
>  						  &o->fb_info[1], bo_size, 0);
>  
> +	if (o->flags & TEST_BO_TOOBIG)
> +		igt_resume_signal_helper();
> +
>  	igt_assert(o->fb_ids[0]);
>  	igt_assert(o->fb_ids[1]);
>  
> -- 
> 2.51.0
> 
