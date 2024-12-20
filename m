Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B75E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 15:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4866D10E395;
	Fri, 20 Dec 2024 15:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NekqgWmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8204810E395
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734708249; x=1766244249;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NImsxNcoweSdfnRFtNl+30GqwjR3T8vnDSkgosZRC8U=;
 b=NekqgWmJrHMdeeS+55j0BW86XLjvbT/jkBA1kK+uxT6RqfIqpm2jeX2y
 Iua/1v46Cxw26+PT1ixgaW3Wr8fla93vOahUwKzqiEcLstNVuFwB2i8Ay
 MqrxKe5d0R6d1umgE63WGq+ligYsOA5PgGVZl1t6a+kol7uvc+JHzodvq
 w9GeS8Ts/3jMADjrPcxz9N5CPA9KPOtk2pxWg2tS2X1fZV9XbYsMxgRR+
 PJBBg4/RwaTlaU43eGjVm2AfreAo22qX6lCQgxsXGOiEzH9nolYHX8AvI
 0XziVJ1Lj3Dj4AQ21UEm8ZG6Lyz8ePdbDsZHak0rXY6O7KsKMqUEyCeFr g==;
X-CSE-ConnectionGUID: bxD0gP6nTvKWrJRGHETPLQ==
X-CSE-MsgGUID: S9Upx/fMTnmnr/om+1g3jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45749953"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="45749953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 07:24:09 -0800
X-CSE-ConnectionGUID: 85b7YJdpQ9m3bv1t+c32Ig==
X-CSE-MsgGUID: tifP3RTsQpyu1Ojz7a0AVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129500553"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.159])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 07:24:06 -0800
Date: Fri, 20 Dec 2024 16:24:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [v1] tests/intel: Remove TEST field from test documentation
Message-ID: <Z2WME8F8v5sYf2kU@kamilkon-DESK1>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20241220093914.706003-1-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220093914.706003-1-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2024-12-20 at 15:09:14 +0530, Pravalika Gurram wrote:

I would suggest changeing subject into having test name in prefix,
also shorten it into:

[i-g-t v1] tests/intel/xe_vm: Fixed documentation

> Each test should contain only one TEST field.
> 
> Add the Functionality field in the TEST section
> to fix the warnings during the addition of subtests.
> 

Here you could add Fixes: tag like

Fixes: 4d630db8b8cf ("tests/intel/xe_vm: Check negative cases for vm_create/destroy ioctl")

but imho if it is very recent it could be skipped. We also
do not have stable branches so it is not required.

Add also here:

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_vm.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index b10269191..b5519c9fc 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -8,6 +8,7 @@
>   * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: VMA
> + * Functionality: ioctl

imho this should be added at each new subtests you introduced
in your previous change. Maybe more proper name would be:

 * Functionality: input_validation
or
 * Functionality: ioctl_input_validation

What do you think about this, Kasia?

Regards,
Kamil

>   */
>  
>  #include "igt.h"
> @@ -2247,15 +2248,6 @@ static void bind_flag_invalid(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> -/**
> - * TEST: Negative test for vm create/destroy ioctl
> - * Category: Core
> - * Mega feature: General Core features
> - * Sub-category: Synchronization
> - * Functionality: vm create
> - * Test category: negative test
> - */
> -
>  /**
>   * SUBTEST: invalid-flag-%s
>   * Description:  function %arg[1] used in vm create IOCTL to make it fail
