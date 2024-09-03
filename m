Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F36ACD342C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 12:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE6610E58A;
	Tue,  3 Sep 2024 12:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akM4wobM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736CC10E58F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725367947; x=1756903947;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=GLGb98fvnNJfOCz1mDZ36kOP4c8S74FE6lMYDvz6Yg8=;
 b=akM4wobM2LpmzPaPS4oAwnFQKTUpBDn0+Rbx4Qwz53/jgV7zzcVVrgTy
 97yMY/mswaRDF5+26b7iwF4P3I6sw7YxR619CO4/LrRRDdIX5shg7z+q1
 mkVhuCnkh5stoF1V4Y0ye9cFgpoalEJ6AEzU2ghTrnCbRZzGYTha2dmEY
 aoC0u/xkvTdvB+wnODXVGFAFOKRzppurVPKySx/1bJ8+KXh+CQuO7mGa9
 XX/OdN01SegFbVhCZyfIaPLuELmJJWc7tPLsIbKBcIqpj0To35BZtAAr4
 z6X5ZKIdio0ERvUoQ0u22g/6ypUttoOAzcVNDL3oYuK3cg0aHd+I5hFn4 A==;
X-CSE-ConnectionGUID: ZJrb4IKKTleUwkAGcE/m8g==
X-CSE-MsgGUID: 2gG7GFxrRKaAfWVHqL/EKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27843940"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="27843940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:52:26 -0700
X-CSE-ConnectionGUID: wNY+zFGHQte3MV0m8gQ9KQ==
X-CSE-MsgGUID: Urvn4sgBTFSXcxECj0LhBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="102320580"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 05:52:25 -0700
Date: Tue, 3 Sep 2024 15:52:47 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/14] lib/igt_kms: add enum for link rate and lane
 count
Message-ID: <ZtcGnwYnI_7ektVq@ideak-desk.fi.intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-2-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825200612.4036178-2-kunal1.joshi@intel.com>
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

On Mon, Aug 26, 2024 at 01:35:59AM +0530, Kunal Joshi wrote:
> add enums for link rate, lane count
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 25ba50916..999921f9f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -258,6 +258,29 @@ enum intel_broadcast_rgb_mode {
>  	BROADCAST_RGB_16_235
>  };
>  
> +enum dp_link_rate {
> +	DP_LINK_RATE_162000 = 162000,
> +	DP_LINK_RATE_216000 = 216000,
> +	DP_LINK_RATE_243000 = 243000,
> +	DP_LINK_RATE_270000 = 270000,
> +	DP_LINK_RATE_324000 = 324000,
> +	DP_LINK_RATE_432000 = 432000,
> +	DP_LINK_RATE_540000 = 540000,
> +	DP_LINK_RATE_675000 = 675000,
> +	DP_LINK_RATE_810000 = 810000,
> +	DP_LINK_RATE_1000000 = 1000000,
> +	DP_LINK_RATE_1350000 = 1350000,
> +	DP_LINK_RATE_2000000 = 2000000
> +};

Imo, there is no point to define enums for the rates or lane counts.

> +
> +#define DP_MAX_LINK_RATE_COUNT 12

This is not used.

> +
> +enum dp_lane_count {
> +	DP_LANE_COUNT_1 = 1,
> +	DP_LANE_COUNT_2 = 2,
> +	DP_LANE_COUNT_4 = 4
> +};
> +
>  struct edid;
>  
>  bool kmstest_force_connector(int fd, drmModeConnector *connector,
> -- 
> 2.34.1
> 
