Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF1CC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FCD10E993;
	Mon, 25 Mar 2024 15:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqPt/frh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C968F10E993
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711381636; x=1742917636;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v5bmW5tJJVVlOX0/M089AJU0uM9CTq7ck4WA+/hSDMQ=;
 b=lqPt/frhdfB1z+hjupNmCoGKripW9lNduVHIqxvuUl8Y/ky5VvlJIHJr
 Ro5WR+d5zlGnfbLLvRwjvaQcZGynzwR0TG4dtC+r/Y4BZssGnTLpO5fhL
 IgKJ2PtYC83zTl7viIvU4fhA1Rrxky+IsIc9p1Dg9DUVfJ4EyLEHKPdGB
 qn9jO8ob9MX4SHKIm7GFa1QCwC/u3fAKE8KvwWM6lUcjavRf0gwVOkMFH
 9FIvWkhRb2r2q9BH5rElaveyH9fw9A57omJ6C7Icnl75QOE18Z8dIWrtJ
 Xg3/J1rhPc7wnhdmt32klztDRdojCr5j9dzYn17TQWlDG5xGAlbiA8Ciw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6223181"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6223181"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="16055565"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:47:14 -0700
Date: Mon, 25 Mar 2024 16:47:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] meson: Turn on few warns
Message-ID: <20240325154711.sjloei77ecz2iowh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240325082422.691115-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240325082422.691115-1-bhanuprakash.modem@intel.com>
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
On 2024-03-25 at 13:54:22 +0530, Bhanuprakash Modem wrote:
> dangling-pointer:
>     Warn usage of pointers to objects after their lifetime has ended.
> int-conversion:
>     Warn about incompatible integer to pointer and pointer to
>     integer conversions.
> unused-variable:
>     Warn whenever a local or static variable is unused aside from its
>     declaration.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  meson.build | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index cee8a7446..df062abc3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -57,8 +57,10 @@ cc_args = [
>  
>  	'-Werror=address',
>  	'-Werror=array-bounds',
> +	'-Werror=dangling-pointer',

This looks ok.

>  	'-Werror=implicit',
>  	'-Werror=init-self',
> +	'-Werror=int-conversion',

I do not know why it wasn't included in meson,
looks like pointer conversions are catched by new gcc
with other warning name.

>  	'-Werror=int-to-pointer-cast',
>  	'-Werror=main',
>  	'-Werror=missing-braces',
> @@ -67,6 +69,7 @@ cc_args = [
>  	'-Werror=return-type',
>  	'-Werror=sequence-point',
>  	'-Werror=trigraphs',
> +	'-Werror=unused-variable',

Could you drop this?

Also +cc Petri.

Regards,
Kamil

>  	'-Werror=write-strings',
>  # Disable the memory allocating builtins as they may cause unexpected behavior
>  # with our framework. They *may* get optimized out in favor of a register or
> -- 
> 2.43.2
> 
