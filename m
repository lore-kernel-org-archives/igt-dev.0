Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D125DC5478C
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 04:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034810F5AC;
	Tue,  5 Mar 2024 04:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mi9GCWMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB9910F5AC
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 04:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709612156; x=1741148156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z8oZ9QAFUSMswpf2Rt8oCagqasdMjK1f7XNXsgHd13E=;
 b=mi9GCWMoYh6O/LdbHglukWe93oCuK5rSz59FCDHYLKrtpkUjMkx0sQf4
 1MriOZ8+C7XgnMurQZ1NANseOAtjqGs2jUIyugIXi/bBHln35iCzWHUT6
 4+aJAeYdbXv2a/BcIOe9uT/K2WTTv3GanbXDRfc5PkS16Ah7WPjezb61n
 MJsMMqY+CV81a+SGDpxqIitl4KHEZ5kjCVXWs3MZ790DmSBtRPIHDF9Ru
 oM2DyYR9DeeK1DQud+QIOwLTIPLTQqVpO7srN83Rr/JY/3rcWR+1JDqyM
 AKxroxCXMnZy16ljGvp/02ar1G/HLYHBiwx6RaUA1xlCpD9muyp/yoU38 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4263595"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4263595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9076736"
Received: from unknown (HELO localhost) ([10.245.244.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 20:15:53 -0800
Date: Tue, 5 Mar 2024 05:15:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: =?utf-8?B?UGnDs3Jrb3dza2ks?= Piotr <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] lib/drmtest: Add IS_ALIGNED macro
Message-ID: <20240305041551.6lzxnsgzvphbnkf2@zkempczy-mobl2>
References: <20240301151541.1280595-1-piotr.piorkowski@intel.com>
 <20240301151541.1280595-2-piotr.piorkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240301151541.1280595-2-piotr.piorkowski@intel.com>
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

On Fri, Mar 01, 2024 at 04:15:39PM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Let's add a new macro that will be used to verify whether one value is
> aligned to the other.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  lib/drmtest.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 6bc819734..588d7da17 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -99,6 +99,15 @@ void __set_forced_driver(const char *name);
>   */
>  #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
>  
> +/**
> + * IS_ALIGNED:
> + * @v: value to check
> + * @a: alignment unit in bytes
> + *
> + * Macro to check if value @v is aligned to @a
> + */
> +#define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) == 0)
> +
>  int __drm_open_device(const char *name, unsigned int chipset);
>  void drm_load_module(unsigned int chipset);
>  int drm_open_driver(int chipset);
> -- 
> 2.34.1
>

There's no current user but code looks good to me, so:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
