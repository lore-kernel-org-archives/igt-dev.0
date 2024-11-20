Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D2BD6392B
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 11:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAF010E27A;
	Wed, 20 Nov 2024 11:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqaXf0Iz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956EF10E27A
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732101508; x=1763637508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SaBUnD0hXtfTGaNWyx31Hv7gSh5v6UVqbWXN9ZZWFXg=;
 b=gqaXf0IzM8pnuaAtarbrNbyQLzqIOZbuXMniys6g8WxrYJRs6KIy3jgl
 WOZobtInoJB96mjdWFWQmVQGID0jR+rb4yXG8+asuuN46w/ZjY8QDdXxo
 NKIkTFt4VjzzpnqzeN/J9rpNoCsgIK+PRrRvzcEVybrrpQF6EfyUYrI+w
 OaERueZT5GsEb5VVaFc8/NzA6XDxKpkB9uwbq6CY2GAgf7Av8aKwa+czB
 k4NOFSrLwIXddibPmQEczG0XK5VEvBoCVL9R0AvEGw246hWkGN0AbfqO/
 PjMLn3VeaItHziEh+mMmIqIN1Fv+USx0U1vYOqhIHgRqB+K9EldZeyjuv w==;
X-CSE-ConnectionGUID: 6gH7NWEATjSenNMl45vRDw==
X-CSE-MsgGUID: lkSZl2bzSHS/AHuFnKeLAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="36060876"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="36060876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:18:28 -0800
X-CSE-ConnectionGUID: +4Yc5qiLQfeNXNWk8koPIw==
X-CSE-MsgGUID: xxaOplOFQCmtkWpgtajAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="90043597"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:18:27 -0800
Date: Wed, 20 Nov 2024 12:18:24 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/xe_eudebug: Convert comments to be C-styled
Message-ID: <20241120111759.xarw2x3bfezpb74c@zkempczy-mobl2>
References: <20241114144156.82071-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114144156.82071-1-dominik.grzegorzek@intel.com>
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

On Thu, Nov 14, 2024 at 03:41:56PM +0100, Dominik Grzegorzek wrote:
> Change two comments in xe_eudebug testcase to be properly formatted.
> This was pointed in the review, but the patch has been merge before
> correcting mentioned nits.
> 
> Fixes "05659c7f2 tests/xe_eudebug: Validate exec queue placements"
> 
> Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Thanks:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/intel/xe_eudebug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 39db16457..e9765d06e 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -474,13 +474,13 @@ static void placements_client(int fd, struct xe_eudebug_client *c)
>  		xe_eudebug_client_exec_queue_create(c, fd, &create);
>  		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
>  
> -		// every other instance (logical_mask ~ 1010, 0101)
> +		/* every other instance (logical_mask ~ 1010, 0101) */
>  		create.width = 2;
>  		create.num_placements = count/2;
>  		xe_eudebug_client_exec_queue_create(c, fd, &create);
>  		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
>  
> -		// logically contigous placement (logical_mask ~ 1100, 0110, 0011)
> +		/* logically contigous placement (logical_mask ~ 1100, 0110, 0011) */
>  		for (i = 0; i < count * count - 2; i++)
>  			eci[i].engine_instance = i / 2 + i % 2;
>  
> -- 
> 2.34.1
> 
