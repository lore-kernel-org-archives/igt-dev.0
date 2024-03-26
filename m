Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5799FC54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 17:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA20010E32E;
	Tue, 26 Mar 2024 17:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/5rnzEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B8710F192
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711475299; x=1743011299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wcC7wTFtHpQcri+qO7qwW0VfbpVSVZXHJzfOJxF9Cg0=;
 b=V/5rnzEnoGBW92jtz7ZOaMXs5TONK+VcwqXc3P1Fw/x3Y7Cqp5/0jYxb
 Q+kuQkrQNdXkaFtXod//nH4cZ+wbQVKUMF+6XCe3qPJnp8Df5uqFHOKD7
 Y0nxgFkZdyLId5Yy2V3+BlDlbkT6hqHRTtjTh01OkwWW4lV7x4qy3AdM5
 GaxtsPxUXEeWuejJkECfwBZPuiiILSrqzYBbOsBgrH/VJU8BYSU+JT5nX
 UuxeLzB4/eVJ0HYXtx6Nbg7INcBkjnFkMwASfiHtf5kFWC/Sc8YPI0NPZ
 zv/oacRxuLVZLqQxDqWb9NJXz3DoIC8Ju+J4FGYGwzPrr9WnJlqJLvBTl A==;
X-CSE-ConnectionGUID: SwWCey4iRvCSHCAef3VhyA==
X-CSE-MsgGUID: qZ6F4wyrRF+vc/N61SaBBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17928991"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17928991"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 10:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="47046872"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 10:48:18 -0700
Date: Tue, 26 Mar 2024 18:48:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Bernd Kuhls <bernd@kuhls.net>
Subject: Re: [V2 i-g-t] meson: Turn on few warns
Message-ID: <20240326174814.5onowtvypf4b7mi3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Bernd Kuhls <bernd@kuhls.net>
References: <20240326102612.746321-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240326102612.746321-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-03-26 at 15:56:12 +0530, Bhanuprakash Modem wrote:
> dangling-pointer:
>     Warn usage of pointers to objects after their lifetime has ended.
> int-conversion:
>     Warn about incompatible integer to pointer and pointer to
>     integer conversions.

Bernd, could you check if with this igt compiles without problems
with musl libs on Yocto?

> 
> V2: Drop unused-variable
> 

Adding Bernd to Cc.

> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index cee8a7446..223a09853 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -57,8 +57,10 @@ cc_args = [
>  
>  	'-Werror=address',
>  	'-Werror=array-bounds',
> +	'-Werror=dangling-pointer',
>  	'-Werror=implicit',
>  	'-Werror=init-self',
> +	'-Werror=int-conversion',

Looks ok, I will wait for feedback from other devs.

Regards,
Kamil

>  	'-Werror=int-to-pointer-cast',
>  	'-Werror=main',
>  	'-Werror=missing-braces',
> -- 
> 2.43.2
> 
