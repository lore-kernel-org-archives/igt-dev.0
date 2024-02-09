Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D21C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 08:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8072210F265;
	Fri,  9 Feb 2024 08:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuJG0gBg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5902510F265
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707468986; x=1739004986;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BfGZa1Q/7tLhQ+8ZZ2YcFG7iFqz9Hy+88i8Zire8q+s=;
 b=EuJG0gBgfrF3Z6pWoLTKmqdaoanel2zPr8FIZZzlI4ESDFnszkMgm3wI
 wfaSLWLAuVViLfBmm8zBdyatEbvZ8bdde71liNtjFTDjON/4OSV+cd4E3
 w8wzhpHhYcMqGwZt5aIXOuOI9gKKAPK41PZrr0jjKpW1QAFN+v6y7SA2v
 97uRnBtp7HUQREjRVySkmk42tTa+Zy/nZOXnP4+C3MH+rHlfmcUMBLfa9
 XUz1YkWcJAi5xrfTPfYEx4WcoB+yXqs5XKNZd47cuRQHHzBK9XERexKmW
 /E0egvWx1CeDiPjBY03ZHiDHui3Xs3l5HaT5KuxodmCQyzr4CbVutG2Vg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18897774"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="18897774"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934373566"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="934373566"
Received: from unknown (HELO localhost) ([10.245.101.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 00:56:20 -0800
Date: Fri, 9 Feb 2024 09:56:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v8 2/8] lib/drmtest: Introduced
 drm_open_driver_another
Message-ID: <20240209085617.7hpfu6zhas7wfdj7@zkempczy-mobl2>
References: <20240208135232.54382-1-kamil.konieczny@linux.intel.com>
 <20240208135232.54382-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208135232.54382-3-kamil.konieczny@linux.intel.com>
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

On Thu, Feb 08, 2024 at 02:52:26PM +0100, Kamil Konieczny wrote:
> From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> 
> For user convenience, introduce drm_open_driver_another as
> a wrapper for __drm_open_driver_another with successful open
> assert.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> v2: rebased (Kamil)
> v6: reword description (Janusz)
> 
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 19 +++++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..73d9159af 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -563,6 +563,25 @@ int __drm_open_driver_another(int idx, int chipset)
>  	return fd;
>  }
>  
> +/*
> + * drm_open_driver_another
> + * @idx: index of the device you are opening
> + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> + *
> + * A wrapper for __drm_open_driver with successful open assert.
> + *
> + * Returns:
> + * An open DRM fd
> + */
> +int drm_open_driver_another(int idx, int chipset)
> +{
> +	int fd = __drm_open_driver_another(idx, chipset);
> +
> +	igt_assert_fd(fd);
> +
> +	return fd;
> +}
> +
>  /**
>   * __drm_open_driver:
>   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 6bc819734..856208c48 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -101,6 +101,7 @@ void __set_forced_driver(const char *name);
>  
>  int __drm_open_device(const char *name, unsigned int chipset);
>  void drm_load_module(unsigned int chipset);
> +int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
> -- 
> 2.42.0
> 
