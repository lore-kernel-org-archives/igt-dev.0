Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8418CC4828D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 17:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B228F11254A;
	Mon,  5 Feb 2024 17:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIFVk3OH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA4211241C
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707154953; x=1738690953;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HIx0fIxg8g7Q7UhyvziVRvn12w8dUdbSEGt07jqSmiY=;
 b=LIFVk3OHRU+mcUWdXkH1PSGMV1gcTiqOtLw7rldRmZN74AKx/Z6Zxt5s
 s2hXJUn799HQ1trQ02pCqSZfrpzLIpBPV4N4+YhqddPBhaCKQuMYKmVyv
 cMtw3ShL++ZUm3Ub2tIeM4dhEegLnbFT1C2NzEdHChy2RLdjxcwFedT8Y
 Vh5LkkumSG3BxzhBjKQebm/G9y8eB+kNQ73bqPvz6zOR58DB+TB+Mwj7J
 ZA+GyXmT7T22Oo5g/6UU0kLf83j/LBnU12T0aHzWkjTiuJKXZj8vdhV78
 OpI8lq+hr+WVl4zaeWNGCwPZqgXp3KXRtg99MnBC1AGu1qA2W5U9H4nrB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="722032"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="722032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 09:42:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5396949"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 09:42:13 -0800
Date: Mon, 5 Feb 2024 18:41:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe/xe_query: Print L3 bank and node masks
Message-ID: <20240205174159.vkfkxbbmdehdt2fy@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20240126155129.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240126155129.6-1-francois.dugast@intel.com>
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

Hi Francois,
On 2024-01-26 at 15:51:29 +0000, Francois Dugast wrote:
> L3 bank and node masks have been added to the uAPI, so print them in
> the topology query test. This aligns to kernel commit ("drm/xe: Add
> L3 bank and node masks to topology query").

Could we have it other way, e.g. more important is a change
in drm-uapi, not in lib for test, also it is incorrect now:

[PATCH i-g-t] lib/xe/xe_query: Print L3 bank and node masks
------------- ^^^^^^^^^^^^^^^
and files changed are:

include/drm-uapi/xe_drm.h | 2 ++
tests/intel/xe_query.c    | 2 ++

So I would suggest something like:

drm-uapi/xe: add L3 bank topology

btw is the kernel commit you refer to in drm-next?
It would help if you provide also http link,

Regards,
Kamil

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 2 ++
>  tests/intel/xe_query.c    | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bacdca787..170cc0de9 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
>  #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
>  #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
>  #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
> +#define DRM_XE_TOPO_L3_BANK		(1 << 3)
> +#define DRM_XE_TOPO_L3_NODE		(1 << 4)
>  	/** @type: type of mask */
>  	__u16 type;
>  
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 9a6799c84..0a754f51c 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -166,6 +166,8 @@ const char *get_topo_name(int value)
>  	case DRM_XE_TOPO_DSS_GEOMETRY: return "DSS_GEOMETRY";
>  	case DRM_XE_TOPO_DSS_COMPUTE: return "DSS_COMPUTE";
>  	case DRM_XE_TOPO_EU_PER_DSS: return "EU_PER_DSS";
> +	case DRM_XE_TOPO_L3_BANK: return "L3_BANK";
> +	case DRM_XE_TOPO_L3_NODE: return "L3_NODE";
>  	}
>  	return "??";
>  }
> -- 
> 2.34.1
> 
