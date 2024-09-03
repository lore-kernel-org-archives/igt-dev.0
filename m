Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0650CD3439
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 14:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B37610E096;
	Tue,  3 Sep 2024 14:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8n8Hv4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9864910E096
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725373731; x=1756909731;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=FGjewwgueNl+8V9lbE9ewn/RPuJkqJIUbyi8pqwZ9wk=;
 b=V8n8Hv4TdZvahiGU/eI2R2mYyf5rYmvpz8jHoWCqiSpZ+9flFoQjXLa/
 cCWtcebaydhrXE7jw2hiYfbyLx8Ano0c19IlbiwWPStuXWqqx6QPOZD60
 oSds7NZEvJOhrNFlVIoB70/OLwdz0CHhkb/f73X8beROSWvWw7V+f7Khn
 y7qP5KSECFX4YZ11MsLgVeNf3vZBLg+35WN1ZDW8UQ/oP6ZZadsEjrvg5
 aGb6FcXlnnhLZ3MvM8KTSAgLoSX1fAhr/2puqWk4BUrwvn3tsWyodF/10
 HInatV6Oiyw9+z2ekRY5kc7hsqSnmn2X3TtFvij3bxdftL0hNJpQCTy4B Q==;
X-CSE-ConnectionGUID: vCB/YWv/SmWV0uWqrgbjyw==
X-CSE-MsgGUID: NcsSqz8EQBy9nu9w5BDKCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27860090"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="27860090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:28:50 -0700
X-CSE-ConnectionGUID: 8P+ATkzyRLKdy4VwTyqSrA==
X-CSE-MsgGUID: f3cYbrk6TpqFwmYndkg2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69554977"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:28:49 -0700
Date: Tue, 3 Sep 2024 17:29:11 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 12/14] lib/igt_kms: allow set and reset value to be
 same
Message-ID: <ZtcdN3_PKDlJ0bN9@ideak-desk.fi.intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-13-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825200612.4036178-13-kunal1.joshi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Aug 26, 2024 at 01:36:10AM +0530, Kunal Joshi wrote:
> allow set and reset value to be same, let the caller handle
> this scenario instead.
> 
> example scenario where this is required.
> i915_dp_force_link_rate should be auto before starting test
> should be auto at exit
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b7511ccfc..5427a849e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1572,9 +1572,6 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
>  		return false;
>  	}
>  
> -	if (!strcmp(c->value, c->reset_value))
> -		connector_attr_free(c);
> -

But it's not handled now by the caller. I agree it's better to keep the
behavior for existing users, maybe adding a separate function for this
(named *force_reset() or similar).

>  	return true;
>  }
>  
> -- 
> 2.34.1
> 
