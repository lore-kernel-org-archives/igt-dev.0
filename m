Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9FCC0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 12:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDBF10EAA5;
	Fri, 31 Jan 2025 12:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvVF3x1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB010EAA5
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738328373; x=1769864373;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w7sdc6i4qrg3t2seu+P2YZc0rby/oxsxK/4Pcdcrmn0=;
 b=FvVF3x1h2266Z9HnoRwg1Es6JKbGrkyIiAJBoxP+Y/3uBjgeeDJZ2plC
 UKP29C0xjIft/T7/w2+4kkVzIqodu/TjKIw5NBMxsOSr7D/X/+qLC0Q7M
 GteleflMP1FSSia/IhF6pkoPDFCUzQuOsZhAtqzsQaLSv4zlTYrtPx/N4
 UpQ021pjXLaKocXzCEHm0YABsKjI7/G5cC7uElw5d751SovFGT4RdEj0B
 Lj+2YCAoLE+iZY+fY3e1eOYLq2c2gI1V/tID5axXqpYVBOHAIWMkAxhOW
 IZ+UpdB25t7TSjidruM1H6u+j1JkEYQIkAAjnY0ddkdH607K+wEZDIJTv w==;
X-CSE-ConnectionGUID: wlvFhRtTRKOB3hduJbBbHQ==
X-CSE-MsgGUID: SOkcGqVARW2DakUggPB08w==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39034171"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="39034171"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:59:33 -0800
X-CSE-ConnectionGUID: P3NZvdVrRG2EvmgN2WEqJg==
X-CSE-MsgGUID: R1aC+GE4R2eeDnmnkOhFtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146809307"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:59:31 -0800
Date: Fri, 31 Jan 2025 13:59:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_create: Stop treating the
 extension field as MBZ
Message-ID: <20250131125928.ivnojwqamlsvem6s@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 igt-dev@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
 <20250130221457.1092670-3-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250130221457.1092670-3-daniele.ceraolospurio@intel.com>
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

Hi Daniele,
On 2025-01-30 at 14:14:56 -0800, Daniele Ceraolo Spurio wrote:
> A new extension for the xe_create ioctl will be added to support PXP [1],
> so in preparation for that to be merged stop expecting the field to always
> be zero.
> 
> [1] https://patchwork.freedesktop.org/patch/634550/

Please add also lore.kernel.org link (could be done at merge)
here and in next patch, Thanks!

Regards,
Kamil

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/intel/xe_create.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index e3be6b774..e3ebb9fd4 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -243,11 +243,6 @@ static void create_invalid_mbz(int fd)
>  	gem_close(fd, create.handle);
>  	create.handle = 0;
>  
> -	/* No supported extensions yet */
> -	create.extensions = -1;
> -	igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
> -	create.extensions = 0;
> -
>  	/* Make sure KMD rejects non-zero padding/reserved fields */
>  	for (i = 0; i < ARRAY_SIZE(create.pad); i++) {
>  		create.pad[i] = -1;
> -- 
> 2.43.0
> 
