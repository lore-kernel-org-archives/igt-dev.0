Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D4D12692
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 11:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F88510E05B;
	Tue,  5 Nov 2024 11:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BO/9veyc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA8210E05B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730807819; x=1762343819;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+RrP1D5HsI1RFpZ4BCfI1Ngl0B1mrxF4gBKasrXHmrk=;
 b=BO/9veycv3HqYBTVDUIH45TzNbjI/THzqNrZkpf0e3XqC3jauX9ihUoV
 kYZe68GSnxETvJfVbdruTMKPSh97gdOYi3v0xVgHTjm08LY+KhGXtYmFC
 Tdcg3u9AQxrXQK3SAAJUnF3wUVRxGSZVAG2Ks9RRzMeWCW9L16fTR2g0X
 JPgcgNBViXAnMR7UzQzz82jVjRtR3fBdZgQlwTZqXKievC3MVSZdmz+0s
 q+qq22scyoLaygzXoFElPU6cJBE9QjiFNnx0H2MI2YjntNDfCW3BGrJpm
 7hgpRjALceoUY6KtD8H1xdyl0fFCpPZl+2WRhgypwJWW99R0uoiYi3wg1 w==;
X-CSE-ConnectionGUID: /YZJth5NSISfx+ZGODh5iA==
X-CSE-MsgGUID: 8A06ucgrRwKis2kmtjoWdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34334178"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="34334178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:56:59 -0800
X-CSE-ConnectionGUID: 9IoTzgC8QSG7PZfaCxK0ew==
X-CSE-MsgGUID: eWH5shEKR6q5CsurCyl7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="121472664"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:56:57 -0800
Date: Tue, 5 Nov 2024 12:56:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH i-g-t] lib/igt_profiling: add include for PATH_MAX constant
Message-ID: <20241105115639.63dow6etsht7q4k6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petr =?utf-8?B?VmFuxJtr?= <arkamar@atlas.cz>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
References: <20241103171806.10248-1-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103171806.10248-1-arkamar@atlas.cz>
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

Hi Petr,
On 2024-11-03 at 18:18:06 +0100, Petr Vaněk wrote:
> PATH_MAX constant is defined in limits.h header file. It needs to be
> explicitly included in musl environment as it is not transitively
> available for any of available includes.
> 
> Fixes: 9366bee04d16 ("lib: Add DRM driver sysfs profiling knob toggling functions")
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Signed-off-by: Petr Vaněk <arkamar@atlas.cz>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_profiling.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
> index b61506742..e1526ad98 100644
> --- a/lib/igt_profiling.c
> +++ b/lib/igt_profiling.c
> @@ -10,6 +10,7 @@
>  #include <assert.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> +#include <limits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -- 
> 2.45.2
> 
