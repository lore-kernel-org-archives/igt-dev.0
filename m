Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAD6C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 10:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048B310E8C7;
	Thu, 20 Jun 2024 10:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah3cx9EB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2883310E8BF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718880042; x=1750416042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wDldt1lBvVutBr9EhIS+Grqbmb6xYPXssqjGp34LR90=;
 b=ah3cx9EBoA3GpW3bp8fm6v+cs8Z+uPoj7N+zRxBr6D96/ZaByBV4kSq0
 yM+kg8q8ryfY4T536DCh5H8gVVYGuAihori7OFFsSXoCbqSpNaOvuQigJ
 Ge2goNMroPIIm3HVVQgPc0xLtCi006zeJ+atfycXrHFN2Wx3Ap7iJd/qs
 XWaaWmQlNRzsJgm60+VYVerBIA2in9m3jP92bCzmykCLpuPFR8i7DXdMP
 I6mJO4K9EHYOWuC/mYWZvXdi80JDvRJDKhuWPTJiHg9VcLKz9xQdlYCKl
 IfQG3fRxz5KeNYYXvty6FhL3hQeuFuW1/2aJJAqdvxGLF8PsWwJ6KnGWw A==;
X-CSE-ConnectionGUID: Ylfbe4wATQK2QT2T7AiDrw==
X-CSE-MsgGUID: 6Jf8opPnRYCFMbeM3RtuHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26535511"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="26535511"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:40:41 -0700
X-CSE-ConnectionGUID: dDy+Ki02Q3mU0JUpiLqlfg==
X-CSE-MsgGUID: bbTl6klKR42Xn6d0iOHj5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="46717518"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 03:40:40 -0700
Date: Thu, 20 Jun 2024 12:40:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/intel_device_info: Add blitter/render
 definition for BMG
Message-ID: <20240620104038.efpmxcriqrdxqnun@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
 <20240620094822.524239-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620094822.524239-2-zbigniew.kempczynski@intel.com>
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
On 2024-06-20 at 11:48:22 +0200, Zbigniew Kempczyński wrote:
> Xe2 definition used for LNL works either for BMG so lets use it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_device_info.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 9250abd444..298047e741 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -522,7 +522,8 @@ static const struct intel_device_info intel_battlemage_info = {
>  	.has_4tile = true,
>  	.has_flatccs = true,
>  	.is_battlemage = true,
> -	.codename = "battlemage"
> +	.codename = "battlemage",
> +	.cmds_info = &xe2_cmds_info,
>  };
>  
>  static const struct pci_id_match intel_device_match[] = {
> -- 
> 2.34.1
> 
