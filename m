Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521F7C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 17:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E989210E32A;
	Mon, 19 Aug 2024 17:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dk1bTXUw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BD810E32A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724087783; x=1755623783;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=malAEoUXhgsyjD/BumCKY6hVmVytEuqofErWop8IYB0=;
 b=dk1bTXUwqyEkt3WN9ui5PCfstzAdzpsCQsZpLwjO4jMYYI2uHsQN9U/S
 Y6UZr59fqQuzvIoJXbdsiTDZDHAZuurNwAODOtA6zVxWhUkGKIfz1Tv2u
 lFXPyhPljO9oQYwxCgN/hMDfEomcvGwGFLx4UIMs3KjRl+EzyhahRxM4j
 hlYacJaWARnFkiDJDNo1zYkeAI6Z9HGKEMdOw6TfcZTJEcKrc+GWWLFvT
 hKGFaTyLas8q7N/fIFikXSLyHJ6rAb8Yd4Nly9y+nUzsuUP8fWhrSqa4w
 v+C3brOqWPg6D07R4jjC60v8M+ZLSlOGBY24qgpJHAuEYfrXr7/AxxFaK w==;
X-CSE-ConnectionGUID: Rr3RisJ0SvWWnMijZhmg1A==
X-CSE-MsgGUID: sXkyPJjhRF6ugdGjUvEUQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="25253577"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="25253577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:16:23 -0700
X-CSE-ConnectionGUID: Ym8qmMxjTNaZJtWQiOkimw==
X-CSE-MsgGUID: QFjDrycbSfSvgWPDrdKQaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60759105"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:16:22 -0700
Date: Mon, 19 Aug 2024 19:16:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 1/2] dumb_buffer: Remove invalid-bpp subtest
Message-ID: <20240819171618.hs2jssfois4mgbjm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>
References: <20240814185426.70418-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240814185426.70418-1-robdclark@gmail.com>
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

Hi Rob,
On 2024-08-14 at 11:54:25 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> These allocations are not necessarily invalid.

Please write a little more why. Also look at gitlab log,
you need to delete comments with this subtest name and description
as our CI is creating testlist at build time and that info
is there.

Add also tests/ prefix in subject:

[PATCH 1/2] tests/dumb_buffer: Remove invalid-bpp subtest

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  tests/dumb_buffer.c | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 1d4bf296c53e..579d2f906b6d 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -136,25 +136,6 @@ static void dumb_destroy(int fd, uint32_t handle)
>  	igt_assert_eq(__dumb_destroy(fd, handle), 0);
>  }
>  
> -static void invalid_dimensions_test(int fd)
> -{
> -	struct drm_mode_create_dumb create;
> -
> -	memset(&create, 0, sizeof(create));
> -	create.width = 4032;
> -	create.height = 2016;
> -	create.bpp = 24;
> -	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);

These use 3-Bytes bpp with divisible by 4 screen W x H, so here
you could be right with removing this.

> -
> -	create.bpp = 32;
> -	create.width = 0;
> -	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);

Why 0-width is valid?

> -
> -	create.width = 4032;
> -	create.height = 0;
> -	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);

Same here, imho looks invalid. Btw what about other settings?
Like bpp not divisible by 8 bits?

Regards,
Kamil

> -}
> -
>  static void valid_dumb_creation_test(int fd)
>  {
>  	struct drm_mode_create_dumb create = {
> @@ -397,9 +378,6 @@ igt_main
>  		fd = drm_open_driver(DRIVER_ANY);
>  	}
>  
> -	igt_subtest("invalid-bpp")
> -		invalid_dimensions_test(fd);
> -
>  	igt_subtest("create-valid-dumb")
>  		valid_dumb_creation_test(fd);
>  
> -- 
> 2.46.0
> 
