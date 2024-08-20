Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7093DC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 12:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118D310E778;
	Tue, 20 Aug 2024 12:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWBVjm03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D8A10E778
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724158200; x=1755694200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KLP2pcxToLWiQC/7NEOQnG7ami70bmdqiL6sQ4zrnNQ=;
 b=dWBVjm03eeAlataTBlorqCjDwQCRHmDkNn/sBC8s7uNuxAoo+Vzywce8
 Klw8xZhkV/hDZpW4EMLR8Jqt+GXSMf8D+38sBytlvIefHcekUk89IP9mF
 vz7r9IUv8wle0SdZ6Z/FU3k5ELy0H4nWK4zmAB9k+Fykzvrna3buDkYAV
 3pBCWInnbuF3xLHHjssWZ/qXh2XX/Nfqzs4IIlI1qGIMaeapKaAoEtoNf
 4P83jl0gu8qARzO0Zhh5zZHtkazZNrweCyv6oUeNt56DvgYjDEUeNqLPY
 wTE8gSh/QreCmvhInoknfl9KLkcijeyiTwbmWV8+ST2CvLln1j0uXUam5 g==;
X-CSE-ConnectionGUID: /uiPndoYTZ6a6ybbelhtqA==
X-CSE-MsgGUID: rJTYs43BTJOgtwXXiOB/DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33609187"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33609187"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 05:50:00 -0700
X-CSE-ConnectionGUID: sGpTpAYmQL2VByGJmEQLag==
X-CSE-MsgGUID: bD9tyoQATKmHErxW1QIE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60377802"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:49:58 -0700
Date: Tue, 20 Aug 2024 14:49:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH] tests/dumb_buffer: Fix invalid bpp subtest
Message-ID: <20240820124926.3mgms4zxye2g4zj5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240819202642.111559-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819202642.111559-1-robdclark@gmail.com>
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
On 2024-08-19 at 13:26:42 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Only zero is actually considered an invalid value by the kernel.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Thank you for fixing this, driver later can add more checks
but at drm layer you are right, so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/dumb_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 1d4bf296c53e..e1c18c70b09b 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -143,7 +143,7 @@ static void invalid_dimensions_test(int fd)
>  	memset(&create, 0, sizeof(create));
>  	create.width = 4032;
>  	create.height = 2016;
> -	create.bpp = 24;
> +	create.bpp = 0;
>  	igt_assert_eq(__dumb_create(fd, &create), -EINVAL);
>  
>  	create.bpp = 32;
> -- 
> 2.46.0
> 
