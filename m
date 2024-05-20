Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8C2C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 12:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F4A10E2F5;
	Mon, 20 May 2024 12:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nD0WMUQs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE6310E3F1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 12:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716208281; x=1747744281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GjsFPGZlAgMBfZhUPSLOEkWznqbQkkJn3Qz/6J/cTmY=;
 b=nD0WMUQsYy/MUyA0PjZUmhpR+iCPRSYi9cX22cLDSXfStCy7zbPiwf+/
 5rqDq9MtDDSbjsj2Y7m7yIhVLMq65PxI8QYB7YjTDqYTSobP05qV3ZpS3
 fPR7NyXXMTyHOUpQp0+TuzQQ2YFb88dNbfbFfcK3TXtYvP5C1y1m090wk
 rMP8HIEcM8gKVamh4Wf6jhl3Ec/bK3AWjvSmTJkOyLOflJAsw1HWcEUvG
 YAwu0jZcK6luutQEu3XyyOqpl5V8SDhC9rhLGZANJfzTXPuQprlM5XxXU
 +D6Ewif4X/zUKnVMQoV9aOd+H6eWwO+viEyCbUIggeLfTC3hxL7ngjMdW Q==;
X-CSE-ConnectionGUID: 1K/jqx5xTHyHFT+2mDUxww==
X-CSE-MsgGUID: WeG7Wwp/TEywRiFptMjWrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12174166"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="12174166"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 05:31:21 -0700
X-CSE-ConnectionGUID: o8buPwcHSM6JFnY3k0DGkQ==
X-CSE-MsgGUID: XUUJMyzSRrWw8USQHjaMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37281573"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.76])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 05:31:19 -0700
Date: Mon, 20 May 2024 14:31:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v1] tests/core_getversion: test all drm devices
Message-ID: <20240520123117.xxlu2rirfhsp4yy2@zkempczy-mobl2>
References: <20240517190955.83517-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240517190955.83517-1-kamil.konieczny@linux.intel.com>
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

On Fri, May 17, 2024 at 09:09:55PM +0200, Kamil Konieczny wrote:
> Check all drm devices in all-cards subtest.
> 
> v2: add define for number of max tested cards (Helen)
> v3: remove define as opening function from drmtest will
>   stop after opening all existing drm cards (Kamil)
>   changed subtest name to all-cards (Kamil)
> 
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_getversion.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index bb2e6013d..8198f5f7f 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -40,6 +40,9 @@
>   *
>   * SUBTEST: basic
>   * Description: Tests GET_VERSION ioctl of the first device.
> + *
> + * SUBTEST: all-cards
> + * Description: Tests GET_VERSION ioctl for all drm devices.
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
> @@ -62,6 +65,22 @@ static void check(int fd, char *dst, int len)
>  	drmFree(v);
>  }
>  
> +static void check_all_drm(void)
> +{
> +	char info[256];
> +	int fd2;
> +
> +	for (int i = 0; ; i++) {
> +		fd2 = __drm_open_driver_another(i, DRIVER_ANY);
> +		if (fd2 == -1)
> +			break;
> +
> +		check(fd2, info, sizeof(info));
> +		igt_info("%d: %s\n", i, info);
> +		drm_close_driver(fd2);
> +	}
> +}
> +
>  igt_main
>  {
>  	char info[256];
> @@ -78,6 +97,10 @@ igt_main
>  		igt_info("0: %s\n", info);
>  	}
>  
> +	igt_describe("Check GET_VERSION ioctl for all drm devices.");
> +	igt_subtest("all-cards")
> +		check_all_drm();
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> -- 
> 2.42.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
