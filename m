Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7CCCF9C5B
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573B610E38F;
	Mon, 23 Sep 2024 07:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghHbRcaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE9C10E38F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727075575; x=1758611575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gjUR2IfCKBw8yeXRYVxrMI1wnPhSCg6nUd7VGoGl1ks=;
 b=ghHbRcaQELpjBmYquz1cTvNQUB0beCEOQArr0JHflope7cuboTTr5KZL
 8/8Ot8lZsy4+pbyVI6c1rqAKf3kmjGxd8bhIhRUTW8vNUkcikc21pvqW5
 biYfOy6wQt1JjzLD48YlzjwVMadWvd46k/3iseIkdZflIpD8YEB7RK4ib
 5xlJkxxKIONNHLuHh37N6BpCs/F1eAvTKe1L1bjUWQiRSsVZTryDczSmg
 8Jwqd9OL8tMkJNdkej19RviZ6S6w3WgBUihjNkbJkeMDPatoeren42cLK
 ibRg3BdHuzKFNZA0yJgfBWH+x39BbcrbRB91Ogt/FjMh0lO6/ra3tUR7k g==;
X-CSE-ConnectionGUID: m6qbb0jeRPa3JqzkLCdENg==
X-CSE-MsgGUID: 8EaWntrIQ7uV2zrhmFIMWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25487725"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25487725"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:12:55 -0700
X-CSE-ConnectionGUID: vukm4n+kR1WAwGOTJxPWPA==
X-CSE-MsgGUID: WZbZ/OqKQbW7I+pIzSEpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75927120"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:12:54 -0700
Date: Mon, 23 Sep 2024 09:12:49 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/gpu_cmds: Correct number of threads in
 CFE_STATE instruction
Message-ID: <20240923071249.3hwoviata2mys3yn@zkempczy-mobl2>
References: <20240920132425.226069-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240920132425.226069-1-dominik.grzegorzek@intel.com>
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

On Fri, Sep 20, 2024 at 03:24:25PM +0200, Dominik Grzegorzek wrote:
> Since xe2 there was a change in CFE_STATE instruction format.
> Field describing maximal number of threads now has type of u16,
> not u16-1 as it used to have.
> 
> Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/gpu_cmds.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index c44b24c79..2638e3791 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -992,6 +992,7 @@ void
>  xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
>  {
>  	bool dfeud = CFE_CAN_DISABLE_FUSED_EU_DISPATCH(ibb->devid);
> +	bool u16minus1 = intel_graphics_ver(ibb->devid) < IP_VER(20, 0);
>  
>  	intel_bb_out(ibb, XEHP_CFE_STATE | (6 - 2));
>  
> @@ -1001,7 +1002,8 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
>  
>  #define _LEGACY_MODE (1 << 6)
>  	/* number of threads & urb entries */
> -	intel_bb_out(ibb, (max_t(threads, threads, 64) - 1) << 16 | (dfeud ? _LEGACY_MODE : 0));
> +	threads = max_t(threads, threads, 64);
> +	intel_bb_out(ibb, (u16minus1 ? threads - 1 : threads) << 16 | (dfeud ? _LEGACY_MODE : 0));
>  
>  	intel_bb_out(ibb, 0);
>  	intel_bb_out(ibb, 0);
> -- 
> 2.34.1
> 
