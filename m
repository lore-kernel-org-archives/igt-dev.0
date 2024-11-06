Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4864D44D58
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 13:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BE510E6E5;
	Wed,  6 Nov 2024 13:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZvlJdex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FE110E6E5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730899348; x=1762435348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FixSPtcGVOXUAbUvfOiduc4Qp2EbIGww9XatoVqtGqg=;
 b=AZvlJdex9TDIa5XjP3G+tuI5M5WRvwHvlZGQnrPiozTSlJQDCFSOrqVg
 YxnAeRpKXXw3RfqxtLtEkyTYJ6WGNDJlIjQ/kewpGEnisK3Jz+DfRk+eX
 1C1IetWkhpne/Dml0lq2haI6blc/Jrxz3u870YTstzC5sCJ8h6gmeTR4L
 wUG/eexHcs1fRQEzYSia6vJbchHRVpfBkkDb/cUkdQ6nLbs5lt+PvI1Kr
 E64Ix/OMJSw6jxAiAww+OuLwVqe3a/pQ8gnpDpjgD5iT3MZF2GWcJLPFm
 HQnAmtKhjRDKkYO8fdpeIMoxsNGqHEo4nWO6b8DqpnERoZDQFIfq5NCrq A==;
X-CSE-ConnectionGUID: b+oq8JhqT2GCr6F8mWFFIg==
X-CSE-MsgGUID: o/oQ3w86QeSHNY8qCuMHMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41318674"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="41318674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 05:22:27 -0800
X-CSE-ConnectionGUID: x1pFDSiRTW6lH9pxK/u5hA==
X-CSE-MsgGUID: zOK8XzdfQDaEVPXeYqJ4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84086843"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:22:20 -0800
Date: Wed, 6 Nov 2024 14:22:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v7 3/3] lib/monitor_edids/hdmi_edids: Shuffle edid
 with the redundant one
Message-ID: <20241106132217.23axb6q2vl7xmkem@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pranay Samala <pranay.samala@intel.com>, karthik.b.s@intel.com,
 kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20241106090820.1831321-1-pranay.samala@intel.com>
 <20241106090820.1831321-4-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106090820.1831321-4-pranay.samala@intel.com>
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

Hi Pranay,
On 2024-11-06 at 14:38:20 +0530, Pranay Samala wrote:
> Edid of 1920x1200 59.950 Hz mode is a redundant edid, shuffling it with
> edid of 2560x1600 59.972 Hz mode to have all edid's coverage.

Please improve description, when I see 'redundant' I expect
deletion, not a swap.

> 

Add here Cc to Mark, I found out also Louis contributed
recently so also adding him to Cc

Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/monitor_edids/hdmi_edids.h | 52 +++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/lib/monitor_edids/hdmi_edids.h b/lib/monitor_edids/hdmi_edids.h
> index 9d75cfa98..f6cfe82ff 100644
> --- a/lib/monitor_edids/hdmi_edids.h
> +++ b/lib/monitor_edids/hdmi_edids.h
> @@ -250,23 +250,15 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "34353732323059575320000000fc0044"
>  		  "454c4c20323430375746500a000000fd"
>  		  "00384c1e5311000a2020202020200068" },
> -	{ .name = "DEL_61462_DELL_U2410_HDMI",
> -	  .edid = "00ffffffffffff0010ac16f04c4e4332"
> -		  "1f13010380342078ea1ec5ae4f34b126"
> -		  "0e5054a54b008180a940d100714f0101"
> -		  "010101010101283c80a070b023403020"
> -		  "360006442100001a000000ff00463532"
> -		  "354d39375332434e4c0a000000fc0044"
> -		  "454c4c2055323431300a2020000000fd"
> -		  "00384c1e5111000a202020202020012e"
> -		  "020329f15090050403020716011f1213"
> -		  "14201511062309070767030c00100038"
> -		  "2d83010000e3050301023a801871382d"
> -		  "40582c450006442100001e011d801871"
> -		  "1c1620582c250006442100009e011d00"
> -		  "7251d01e206e28550006442100001e8c"
> -		  "0ad08a20e02d10103e96000644210000"
> -		  "1800000000000000000000000000003e" },
> +	{ .name = "HWP_12442_HP_Z30i_HDMI",
> +	  .edid = "00ffffffffffff0022f09a3001010101"
> +		  "06180103804028782a1df5ae4f35b325"
> +		  "0d5054a10800d100b30095008100a940"
> +		  "8180d1c081c0e26800a0a0402e603020"
> +		  "360081902100001a000000fd00324618"
> +		  "621b000a202020202020000000fc0048"
> +		  "50205a3330690a2020202020000000ff"
> +		  "00434e34343036304742530a20200078" },
>  	{ .name = "DTV_0_DTV_HDMI",
>  	  .edid = "00ffffffffffff001296000001010101"
>  		  "0c180103803a20780a0dc9a057479827"
> @@ -507,15 +499,23 @@ monitor_edid HDMI_EDIDS_NON_4K[] = {
>  		  "442100001e011d00bc52d01e20b82855"
>  		  "4006442100001e8c0ad08a20e02d1010"
>  		  "3e9600064421000018000000000000c1" },
> -	{ .name = "HWP_12442_HP_Z30i_HDMI",
> -	  .edid = "00ffffffffffff0022f09a3001010101"
> -		  "06180103804028782a1df5ae4f35b325"
> -		  "0d5054a10800d100b30095008100a940"
> -		  "8180d1c081c0e26800a0a0402e603020"
> -		  "360081902100001a000000fd00324618"
> -		  "621b000a202020202020000000fc0048"
> -		  "50205a3330690a2020202020000000ff"
> -		  "00434e34343036304742530a20200078" },
> +	{ .name = "DEL_61462_DELL_U2410_HDMI",
> +	  .edid = "00ffffffffffff0010ac16f04c4e4332"
> +		  "1f13010380342078ea1ec5ae4f34b126"
> +		  "0e5054a54b008180a940d100714f0101"
> +		  "010101010101283c80a070b023403020"
> +		  "360006442100001a000000ff00463532"
> +		  "354d39375332434e4c0a000000fc0044"
> +		  "454c4c2055323431300a2020000000fd"
> +		  "00384c1e5111000a202020202020012e"
> +		  "020329f15090050403020716011f1213"
> +		  "14201511062309070767030c00100038"
> +		  "2d83010000e3050301023a801871382d"
> +		  "40582c450006442100001e011d801871"
> +		  "1c1620582c250006442100009e011d00"
> +		  "7251d01e206e28550006442100001e8c"
> +		  "0ad08a20e02d10103e96000644210000"
> +		  "1800000000000000000000000000003e" },
>  	{ .name = "HWP_12447_HP_Z24i_HDMI",
>  	  .edid = "00ffffffffffff0022f09f3001010101"
>  		  "1a180103803420782e3c50a7544da226"
> -- 
> 2.34.1
> 
