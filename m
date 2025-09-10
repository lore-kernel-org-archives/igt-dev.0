Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B51CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 11:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DBC10E2D5;
	Wed, 10 Sep 2025 11:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHqlBL2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07710E2D5
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757502414; x=1789038414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mfH9+B4e0RCBBQYc+VmFs5/Y57ELmpw89u9OsxJjDxM=;
 b=dHqlBL2sWgx+9WYOTbGSlsLY9BSPZGbaQMIsNjpVtxx5q09pvfZ8t0T2
 Lobqi4GS422gUEsEo0vmpcHGi3WPo94KNTTzXbWKRJ1zaKGlrgPQgYO/9
 ceoAsRbYK7xbjI8UgMKeVleN6N+mzfxlKJ98fgDiBkyH40srcuAg6XvyD
 0iTlJwMv9QbOVgZZLNxlEQLFTaPi+foptLkcxZtG3Qu1v3rUcJDUxCqEQ
 MQ30tyG1qcg/E6ndoPUs50DqutQ45PgGNNGxunIVR+LoNY4xeMl1EylNl
 mGxXyutS+S7jZrfLfS+DAFBIk18Jvb3aTYXVNJsdp9uFG9gOY9ZpevjKH Q==;
X-CSE-ConnectionGUID: E2HzS4HcQdmA0xnMW7dBRw==
X-CSE-MsgGUID: Wg+IctF3ROeEeFkVkBqt7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70908274"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="70908274"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 04:06:53 -0700
X-CSE-ConnectionGUID: o3oFF4BsTBaLPaTPP+rMbw==
X-CSE-MsgGUID: 4up/Se8DS4K77sK9WkfWhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="177627596"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 04:06:52 -0700
Date: Wed, 10 Sep 2025 13:06:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/xe_ioctl: use valid type for bo
Message-ID: <20250910110636.a3mi6zmizneez57w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250910092318.117177-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250910092318.117177-2-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2025-09-10 at 11:23:19 +0200, Zbigniew Kempczyński wrote:
> Fix bo handle type as it is uint32_t, not uint16_t.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thank you for fixing it,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 62e9fe9ebf..edd36db9d3 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -514,7 +514,7 @@ uint64_t xe_bo_mmap_offset(int fd, uint32_t bo)
>  	return mmo.offset;
>  }
>  
> -static void *__xe_bo_map(int fd, uint16_t bo, size_t size, int prot)
> +static void *__xe_bo_map(int fd, uint32_t bo, size_t size, int prot)
>  {
>  	uint64_t mmo;
>  	void *map;
> -- 
> 2.43.0
> 
