Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB8FC10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 14:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C605510E53E;
	Thu,  9 May 2024 14:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feiTcF47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B732910E53E
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715265330; x=1746801330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bjqqW2AdM64oFgyaxOB0WwSjsC2GAznLjvzjytm/Cvs=;
 b=feiTcF47tj9gf6/mVfudgUaPq5Ev59G/+C5LG2UBzn/kZBaVXI9iJY4t
 Keq1iDJQwqXf25fET9YvZh+jWuU6J3h4obEH2mz4zfqiI4x0lsHb5IJja
 20txpUmwF+pgB+/S5Ub/vyZvUFB52IBzJTcYlrcKfSM/EKce2jNoS83xX
 +kNXxy59Vm9mSO4qj0vPz4Ac1ekVG9cZBT6CwL+xHIf3FvVZPwfP1Vw+p
 oTxMj4Ra/lz30ZpcsN1Z8ZaPaIxLxjalag4RPaiGYgJqBqbdHtLqCAB8q
 fwXkiBByOxf+6JAdvJsCa2ji35oXkGApBT+sOMxIub++2X4y2cEqp+uWl w==;
X-CSE-ConnectionGUID: Q95KMkpRSC2LVPTWYY25iA==
X-CSE-MsgGUID: b18cgFIfQ3ytuOfyNHB3+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="28673650"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="28673650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 07:35:30 -0700
X-CSE-ConnectionGUID: V/7dI++BTM2NM0zVxtg1Xw==
X-CSE-MsgGUID: xp1BBrzwRhuo5HkuT4W7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="29805788"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 07:35:29 -0700
Date: Thu, 9 May 2024 16:35:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [V2 i-g-t] meson: Turn on few warns
Message-ID: <20240509143506.eshibktzb2pzlyfq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
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
> 
> V2: Drop unused-variable
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
>  	'-Werror=int-to-pointer-cast',
>  	'-Werror=main',
>  	'-Werror=missing-braces',
> -- 
> 2.43.2
> 
