Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01B1C54E60
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 13:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4372310E398;
	Tue, 19 Mar 2024 13:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rt7BcBHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D8B10E935
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710853743; x=1742389743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UUW2lCWfoqoBeoOJCxPSmpmfNn/SvCpbGcp9tzqIpsU=;
 b=Rt7BcBHZxhQu87dnQdg66fxpxlMrJ79zj1GK/TRMCO6f39csD7q9P9tI
 H0w7RvHThabONgtFV1LIKGq6IfxT3HtjoZwb74a2+7NVNOuB7Xope0IgP
 eriyzkU7RPbkkjXdcvXe5KkBhCsfuD/YSQqq6tLpStehwlXQAhm2M9sDE
 W0cD4uUGnasm+eR2mSgA832dzYlfmw44NeFhJIzxshrohlEMOOOqv4aHy
 YbAQmrO5Fm2ebtTffgdSNmLnZxjd7WvxGzLVLTZHKZsr4r9YW3E2FKbn+
 XO2fO5J+2FzvZDiu4cfcP5OmSJcrnIH+AdU2xHVJIL4WX6DxoTuKiWSK9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5898714"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5898714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13851862"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:09:01 -0700
Date: Tue, 19 Mar 2024 14:08:58 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: igt-dev@lists.freedesktop.org, bhanuprakash.modem@intel.com
Subject: Re: [PATCH i-g-t 0/3] Add support to paint already mmaped buffer
Message-ID: <20240319130858.e27waxlgbg4kzawd@zkempczy-mobl2>
References: <20240315061142.6591-1-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315061142.6591-1-vandita.kulkarni@intel.com>
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

On Fri, Mar 15, 2024 at 11:41:39AM +0530, Vandita Kulkarni wrote:
> From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
> 
> On some of the platforms first write after mmap takes longer time,
> hence provide and option to just update the fb incase we are resuing
> the mmaped fb.
> 
> Vandita Kulkarni (3):
>   lib/igt_draw: Dont mmap, if the buffer is already mmapped
>   tests/kms_async_flips: Reuse the already mmapped buffer
>   tests/kms_frontbuffer_tracking: Align to new igt_draw_rect usage
> 
>  lib/igt_draw.c                         | 57 +++++++++++++++-----------
>  lib/igt_draw.h                         |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c |  2 +-
>  tests/kms_async_flips.c                | 16 ++++++--
>  4 files changed, 47 insertions(+), 30 deletions(-)
> 
> -- 
> 2.34.1
> 

First of all, try to not break compilation chain with each patch.

You may check this using:

git rebase -i origin/master --exec ./meson.sh

--
Zbigniew
