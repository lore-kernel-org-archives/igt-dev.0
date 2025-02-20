Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12A4C021AD
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 08:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6C610E181;
	Thu, 20 Feb 2025 08:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxI+xy0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894B210E181
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 08:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740038998; x=1771574998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zna/saEHQnTC37tZY95l8KBXSU3CWE0EXvJiTHuj/D0=;
 b=BxI+xy0tlrrhETAM0k/FKN6R+0KtMLWtKQmJ+DwyKueP8T+32bjQfupo
 /BMdZv2+d7u43RQokTYmtHzvPmE81EW0l8UzYcJibtZ2UGXVGqnvXPcvF
 AqTGd6EQPciC7NuMOByS6aVE+d/n/pI7sHWZEqdX70WHvmLEV57Tlpcyk
 tBr2oV70xMI1GOpUdN26koky+G3a7nUOv6QMz7lXhWl7AQk75oaq6eNCo
 AokbZ+KATIP48u0f5cPp77BAtzLIzkk6r8stNMve9yNKMt4NN1Cwr/fqb
 RNZuFMY7Wtjm6YcHpe5gYtD4qxcIiWCFkg2dVbDSpPd3sAMZ9vPFctAWi w==;
X-CSE-ConnectionGUID: gn7cgAR/TWirpuoUgJvISg==
X-CSE-MsgGUID: bbX6p6YiQV2rI0/C7Z/mzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40672767"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40672767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:09:57 -0800
X-CSE-ConnectionGUID: W1CM78oWTtWfKqgzookMsA==
X-CSE-MsgGUID: 6X720y0bSOqSGZkSpVxS7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="119908480"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 00:09:56 -0800
Date: Thu, 20 Feb 2025 09:09:52 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] lib/intel_chipset.h: Add macro for PTL device id
Message-ID: <20250220080952.zgwmkxxmskx5dckc@zkempczy-mobl2>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
 <20250217081854.3219791-5-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217081854.3219791-5-priyanka.dandamudi@intel.com>
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

On Mon, Feb 17, 2025 at 08:18:53AM +0000, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add macro for PTL which helps for the tests to check for the platform.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_chipset.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index c93ad9f75..2f6bf788a 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -209,6 +209,7 @@ void intel_check_pch(void);
>  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
>  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
> +#define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  
> -- 
> 2.34.1
> 
