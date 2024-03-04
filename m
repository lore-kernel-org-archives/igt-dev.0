Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8C0C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8CB10FF2B;
	Mon,  4 Mar 2024 10:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GL2thWpr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F162B10FF2B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709547029; x=1741083029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NHjc5DSjHeFwvSPG8X0BoB43xszwMZl+MgD7BTZaNng=;
 b=GL2thWpr34w8wkmLxVDvFqRn3h0ppjiX3qDgyavj9Z0Th9WUu4TJakk7
 vZ2YRfsmAARL/i6MtthfDrCZhsCMceSEi8Cpzsv4hxNZIevnsBjWpCj8s
 Kd8jL/cDVjFm3Vu0g1YtdjE3m7PwvSLDb3xbT4Vjj6B0DD9TQ/nGWCGp1
 9Ds6w2KR3ALh2EFEMz9W1tRX1xImUFTVkju1OBIB0xGYCnsoAlIQRZy4x
 IdT2bvBaYXGr53/yU724EWEbGJW2nhz/vUjSNeo6nrdzujWWLEDIB7usQ
 u1HgpNxlJMs+GeBTWIGuHnE/oqmQ3q+hVaP/bEdGh+wETEvQ7hb2kM5XP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4192865"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4192865"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13504266"
Received: from unknown (HELO localhost) ([10.245.244.101])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:10:27 -0800
Date: Mon, 4 Mar 2024 11:10:24 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] lib/rendercopy_gen9: use MOCS index helper
Message-ID: <20240304101024.mfgosylh35srvveg@zkempczy-mobl2>
References: <20240301171618.395851-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301171618.395851-1-matthew.auld@intel.com>
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

On Fri, Mar 01, 2024 at 05:16:14PM +0000, Matthew Auld wrote:
> UC looks to be the sensible default here, since it will work with
> display engine if rendering onto scanout surface. Use the matching
> helper.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/rendercopy_gen9.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index efd7cb37c..404406e5f 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -180,10 +180,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
>  
>  	if (HAS_4TILE(ibb->devid)) {
> -		/*
> -		 * mocs table version 1 index 3 groub wb use l3
> -		 */
> -		ss->ss1.mocs_index = 3;
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>  		ss->ss5.mip_tail_start_lod = 0;
>  	} else {
>  		ss->ss0.render_cache_read_write = 1;
> -- 
> 2.43.2
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
